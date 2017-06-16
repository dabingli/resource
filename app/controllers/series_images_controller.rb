class SeriesImagesController < ApplicationController
  # 系列图分类
  SERIES_CATEGORIES = {
    '瓷砖' => 1,
    '马赛克' => 101,
    '辅助材料' => 401,
    '家具' => nil,
    '电工材料' => nil,
    '管材' => nil,
    '板材' => nil,
    '墙纸' => nil,
    '木地板' => nil,
    '灯饰' => nil,
    '门窗' => nil,
    '天花吊顶' => nil,
    '电器' => nil,
    '橱柜' => nil,
    '油漆涂料' => nil,
    '订制衣柜' => nil,
    '石材' => nil,
    '座便器' => 210,
    '蹲便器' => 211,
    '小便器' => 212,
    '陶瓷盆' => 213,
    '浴室柜' => 214,
    '淋浴房' => 215,
    '水箱' => 216,
    '蒸汽房' => 217,
    '智能坐便器' => 218,
    '花洒' => 310,
    '水龙头' => 311,
    '水槽' => 312,
    '地漏' => 313,
    '水下器' => 314,
    '五金挂件' => 315,
  }

  def index
    records = SeriesImage.includes(:image).where({
      product_category_id: SERIES_CATEGORIES.values.reject(&:nil?),
    })

    @series_images = records.inject({}) do |h, record|
      h[record.product_category_id] = record
      h
    end
    @categories = SERIES_CATEGORIES
  end

  def create
    product_category_id = params.require(:series_images).require(:product_category_id).to_i
    image_file = params.require(:series_images).require(:image_file)

    unless SERIES_CATEGORIES.values.include? product_category_id
      return render json: {
        code: 1,
        msg: 'product_category_id 错误'
      }
    end

    record = SeriesImage.find_or_initialize_by(product_category_id: product_category_id)
    record.image_file = image_file

    if record.save
      render json: {
        code: 0,
        image_url: record.image.image_url,
      }
    else
      render json: {
        code: 1,
        msg: record.errors.full_messages.first,
      }
    end
  end

end
