class Slave < ActiveRecord::Base
  belongs_to :remote_lab
  has_many :commands
  has_many :data_values
end
