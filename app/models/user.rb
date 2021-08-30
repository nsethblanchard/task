class User < ActiveRecord::Base
    validates :name, presence: true
    has_many :tasks
    has_secure_password
    
end
