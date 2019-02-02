class Archive < ApplicationRecord

	self.table_name = "archive"
	self.primary_key = "id"

	def self.chats offset, limit
		Archive.order(id: :desc).limit(limit).offset(offset)
	end

end
