class Guest < ApplicationRecord
	validates :name,		presence: true,		length:{minimum: 1,  maximum: 48}
	has_secure_password
	validates :password,	presence: true,		length:{minimum: 1,  maximum: 48}
end
