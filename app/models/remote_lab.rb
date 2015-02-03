class RemoteLab < ActiveRecord::Base
  belongs_to :user
  has_many :slaves
end
