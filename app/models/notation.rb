class Notation < ApplicationRecord
  validates :compound, presence: false
  validates :can_handle, presence: false
  validates :can_produce, presence: false
  validates :dependencies, presence: false

  belongs_to :diagram
  belongs_to :compound
  belongs_to :can_handle, :class_name => 'Information', :foreign_key => 'can_handle_id'
  belongs_to :can_produce, :class_name => 'Information', :foreign_key => 'can_produce_id'

  has_one :dependencies, :class_name => 'Notation', :foreign_key => 'dependencies_id'
  
  accepts_nested_attributes_for :can_handle, :allow_destroy => true
  accepts_nested_attributes_for :can_produce, :allow_destroy => true
  accepts_nested_attributes_for :compound, :allow_destroy => true

  def as_json(options = {})
    super(
        :include =>
            { :compound => {
                :only => [
                  :id,
                  :name
                ]
            },
              :can_produce => {
                :only => [
                    :id, 
                    :quantity, 
                    :time,
                    :include =>
                    {:resource => {
                      :only => [
                        :id, 
                        :name
                      ]
                    }
                  }
                ]
            },
            :can_handle => {
              :only => [
                  :id, 
                  :quantity, 
                  :time,
                  :include =>
                  {:resource => {
                    :only => [
                      :id, 
                      :name
                    ]
                  }
                }
              ]
          }
        }
    )
end
end
