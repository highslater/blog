class PostsController < ApplicationController

    def index
        @posts = Post.all.order('created_at DESC')
    end

    def new
    end

    def create
        # First create the post
        @post = Post.new(post_params) # post_params defined below
        # Save the post
        @post.save

        redirect_to @post
    end

    def show
        @post = Post.find(params[:id])
    end

    private
        def post_params
            params.require(:post).permit(:title, :body)
        end

end
