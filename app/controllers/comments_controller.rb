class CommentsController < ApplicationController
  before_action :check_for_comment_owner, :only => [:edit, :destroy]



  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.create(comment_params)
    @current_user.comments << @comment
    redirect_to photo_path(@photo)
  end

  def edit
  @photo = Photo.find(params[:photo_id])
  @comment = Comment.find params[:id]

  end

  def update
  photo = Photo.find(params[:photo_id])
  comment = Comment.find params[:id]
  comment.update comment_params
  redirect_to photo_path(photo.id)
  end

  def show
  end

  def destroy
    comment = Comment.find params[:id]
    photo = comment.photo
    comment.destroy
    redirect_to photo_path(photo.id)
  end

private
def comment_params
  params.require(:comment).permit(:content)
end

end
