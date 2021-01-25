class CommentsController < ApplicationController
  def index
  end

  def new

  end

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
