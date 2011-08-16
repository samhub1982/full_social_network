class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
    @micropost = Micropost.new
    @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end
  
  def news
    @title = "News"
  end
  
  def admin
    @title = "Admin"
  end
  
  private
  
  def admin_user
      @user = User.find(params[:id])
      redirect_to(root_path) if !current_user.admin? || current_user?(@user)
    end

end
