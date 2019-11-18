class Diagram < ApplicationRecord
    has_many :notation

    def as_json(options = {})
        super(
            :include =>
                {:notation => {
                    :only => [
                        :id, 
                        :name, 
                        :resource,
                        :is_constraint,
                        :can_handle_id,
                        :can_produce_id,
                        :bpm_notation_code,
                    ]
                }
            }
        )
    end
end
