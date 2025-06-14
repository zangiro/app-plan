class Admin::PostsController < ApplicationController
  before_action :require_login
  before_action :admin_user

  def index
    @posts = Post.includes(:user)
                 .where.not(users: { account_status: 1 })
                 .order(id: :asc)
                 .page(params[:page]).per(50)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:success] = t("flash_message.delete")
    redirect_to admin_posts_path, status: :see_other
  end
end
