class ChatController < ApplicationController

	require 'json'

	# Fetch all chats 
	def index
		#@chats = Archive.chats 0, 10
		#@chats = Archive.paginate 1
		if params[:username].present? && params[:password].present? then 
			if params[:username] == "admin-sawerly" && params[:password] == "01Hello$awerly.123" then 
				## proceed normal
			else
				render text: "Not authenticated"
			end
		else
			render text: "Invalid login credentials"
		end

		if params.present? && params[:page].present? then 
		else
			params[:page] = 1
		end

		@chats = Archive.get_chats params

		user_ids = []
		if @chats.present? then 

			@chats.each do |chat|
				txt = chat["txt"]

				obj = nil
				begin
					obj = JSON.parse(txt)
				rescue
					next 
				end

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
