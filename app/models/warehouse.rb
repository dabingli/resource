# == Schema Information
#
# Table name: warehouses
#
#  id         :integer          not null, primary key
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Warehouse < ActiveRecord::Base
	
end
