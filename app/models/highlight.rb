class Highlight < ApplicationRecord
    validates :text, :cfi_range, presence: true
    
end