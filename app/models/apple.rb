class Apple < ActiveRecord::Base
has_many :oranges
validates :name,:logid,:pwd,:contact,:presence=>true
end
