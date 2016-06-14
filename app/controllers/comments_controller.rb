class CommentsController < ApplicationController
	before_action :logged_in_user, only: [:create]

	def create
     @comment = current_user.comments.build(comment_params)
     @entry = Entry.find_by(id: @comment.entry_id)
      if @comment.save
        #flash[:success] = "comment created!"
        respond_to do |format|
          format.html { redirect_to root_url }
          format.js
        end
      else
        flash[:alert] = "Check the comment form, something went wrong."
       	redirect_to :back
      end

	end

  def destroy
    @comment = current_user.comments.find_by(id: params[:id])
    @entry = @comment.entry
    @comment.destroy
    # flash[:success] = "Comment deleted"
    # redirect_to :back
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

	private

	def comment_params  
	  params.require(:comment).permit(:content, :entry_id)
	end

end
