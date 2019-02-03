class Archive < ApplicationRecord

	self.table_name = "archive"
	self.primary_key = "id"
	self.per_page = 10

	def self.chats offset, limit
		Archive.order(id: :desc).limit(limit).offset(offset)
	end

	def self.get_chats params
		Archive.paginate(:page => params[:page]).order('id DESC')
	end

end
