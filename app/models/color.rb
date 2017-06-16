# == Schema Information
#
# Table name: colors
#
#  id           :integer          not null, primary key
#  name         :string
#  position     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  english_name :string
#

class Color < ActiveRecord::Base
end
