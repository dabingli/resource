# == Schema Information
#
# Table name: product_fields
#
#  id         :integer          not null, primary key
#  tabtype    :string
#  field      :string
#  title      :string
#  datetype   :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductField < ActiveRecord::Base
end
