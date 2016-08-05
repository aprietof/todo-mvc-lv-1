class Item < ActiveRecord::Base
  validates_presence_of :description
  belongs_to :list

  STATUS = {
    :complete => 1,
    :incomplete => 0
  }

  def complete?
    self.status == STATUS[:complete]
  end

  def incomplete?
    self.status == STATUS[:incomplete]
  end

end
