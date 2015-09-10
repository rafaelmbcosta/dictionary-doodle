class Entry < ActiveRecord::Base
  belongs_to :search
  has_many :examples, class_name: 'Example'
end
