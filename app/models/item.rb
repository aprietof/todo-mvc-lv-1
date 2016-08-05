class Item < ActiveRecord::Base
  validates_presence_of :description
  belongs_to :list
end
