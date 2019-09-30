class RelatedNotation < ApplicationRecord
    belongs_to :notation
    belongs_to :related_notation, :class_name => "Notation"
end
