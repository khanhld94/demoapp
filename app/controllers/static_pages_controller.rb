class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @entry  = current_user.entries.build
      @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 10)
    
    end
  end
  def feed
  	@feed_items  = Entry.all.order('created_at DESC').paginate(page: params[:page], :per_page => 10)
  end
end
