class User < ApplicationRecord

	self.table_name = "sawerly_live.sawerly_users"
	self.primary_key = "user_id"

	def self.get_by_ids ids 
		User.where(user_id: ids)
	end
	
end
