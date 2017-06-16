# == Schema Information
#
# Table name: water_absrp_rates
#
#  id         :integer          not null, primary key
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WaterAbsrpRate < ActiveRecord::Base
end
