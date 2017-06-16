# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  employee_number :string
#  name            :string
#  mobile          :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  admin           :boolean          default(FALSE)
#

class User < ApplicationRecord
  has_secure_password validations: false

  validates :name, presence: true, uniqueness: true
  validates_presence_of :employee_number, :message => "员工编号不能为空"
  validates_uniqueness_of :employee_number, :message => "员工编号不能重复"

  # 是否是价格管理员
  # 只有价格管理员能管理价格
  def price_manager?
    self.employee_number == '0200361'
  end
end
