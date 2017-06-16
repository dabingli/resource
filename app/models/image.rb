# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  md5        :string
#  file_size  :integer
#  filename   :string
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :product_images

  # 只有文件名允许为空
  validates :md5, :file_size, :image, presence: true

  before_validation :set_file_info
  before_save :mark_image_changed
  after_save :save_url

  def set_file_info
    if self.image.file.is_a?(CarrierWave::SanitizedFile)
      file = self.image.file
      self.md5 = Digest::MD5.hexdigest(file.read)
      self.filename = file.filename
      self.file_size = file.size
    end
  end

  # 标记文件是否改变，用于在 after_save 中使用
  def mark_image_changed
    @_image_changed = self.image_changed?
  end

  # 图片上传后，保存完成 URL
  # 依赖于在图片上传完成后触发，因此只有图片上传后 self.image.url 才会返回 URL 而非本地临时文件路径
  def save_url
    # 只有图片上传后才保存，避免更新记录但未重新上传文件时执行
    if @_image_changed
      url = self.image.url
      if url.blank? || url !~ %r{^https?://}
        self.errors.add :base, '图片 URL 错误'
        raise ActiveRecord::Rollback
      else
        # update_columns 会跳过 callback（也不会自动更新 updated_at），避免死循环
        self.update_columns url: url, updated_at: Time.current
        @_image_changed = false
      end
    end
  end

  # 覆盖 CarrierWave 增加的辅助函数
  def image_url
    self.url
  end

  # 根据文件的 md5 哈希检测 images 表是否已存在该文件
  # 若存在，直接返回相应记录；否则上传文件并返回新记录
  # 参数须为表单上传文件
  def self.find_or_create(file)
    unless file.respond_to? :tempfile
      raise ArgumentError, 'file 须为表单上传文件'
    end

    md5 = Digest::MD5.file(file.tempfile.path).hexdigest
    record = Image.find_by md5: md5
    if record
      record
      # carrierwave-qiniu 提供的方法
      # 检查七牛上是否有图片
      # if record.image.file.exists?
      #   record
      # else
      #   record.update image: file
      # end
    else
      Image.create(image: file)
    end
  end
end
