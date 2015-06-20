module Api
	module V1
		class PostsController < ApplicationController

			def index
				@posts = Post.all
				render :json => @posts
			end

			def show
				if Post.exists?(params[:id])
					@post = Post.find(params[:id])
					render :json => @post
				else
					render :json => {'Error' => 'Couldn\'t find that post'}
				end
			end

			def new
				@post = Post.new
			end

			def create
				@post = Post.new(post_params)
				if request.remote_ip != nil
					@post.uploader_ip = request.remote_ip
				else
					return render :json => {'Error' => 'Couldn\'t access ip address'}
				end

				if @post.save
					return render :json => @post
				else
					return render :json => {'Error' => 'Post couldn\'t be saved'}
				end
			end

			def update
			end

			def destroy
			end

			private

			def post_params
				params.require(:post).permit(:title, :location, :image)
			end
		end
	end
end
