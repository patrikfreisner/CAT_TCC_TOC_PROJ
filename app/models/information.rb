class Information < ApplicationRecord
  belongs_to :resource, optional: true

  has_many :can_produce, :class_name => 'Notation', :foreign_key => 'can_produce_id'
  has_many :can_handle, :class_name => 'Notation', :foreign_key => 'can_handle_id'
  
end
