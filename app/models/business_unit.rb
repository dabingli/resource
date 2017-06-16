# == Schema Information
#
# Table name: business_units
#
#  id         :integer          not null, primary key
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BusinessUnit < ActiveRecord::Base
end
