class Letter < ApplicationRecord
	validates :sender,		presence: true,		length:{ maximum: 48}
	validates :receiver,	presence: true,		length:{ maximum: 48}
	validates :content,		presence: true,		length:{ maximum: 1024}
	validates :state,		presence: true
	validates :authority,	presence: true
end
