class ChatController < ApplicationController

	require 'json'

	# Fetch all chats 
	def index
		@chats = Archive.chats 0, 10

		user_ids = []
		if @chats.present? then 

			@chats.each do |chat|
				txt = chat["txt"]
				obj = JSON.parse(txt)

				from = obj['iFromUserId'].to_i
				to = obj['iToUserId'].to_i

				user_ids << from
				user_ids << to
			end
		end

		users = User.get_by_ids user_ids
		@users_hash = {}
		if users.present? then 
			users.each do |u|
				id = u["user_id"]
				@users_hash[id] = u
			end
		end

		#render json: @users_hash
	end

end
