class Orange < ActiveRecord::Base
has_many :apples
validates :message,:presence=>true
end
