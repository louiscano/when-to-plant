class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy, :edit_comment, :update_comment]

  def index
    @comments = Comment.all
    if params[:query].present?
      @comments = Comment.search_by_titre_and_contenu(params[:query])
    else
      @comments = Comment.all
    end
  end

  def show
  end

  def edit
  end

  def create
    @post = Post.friendly.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    @comment.status = "En attente"
    if @comment.save
      redirect_to @post
    else
      @comments = @post.comments # Ajouté pour s'assurer que les commentaires sont chargés en cas d'erreur
      render 'posts/show', status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Votre commentaire a été modifié !'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@comment.post), notice: 'Votre commentaire a été supprimé !'
  end

  def edit_comment
    @post = Post.friendly.find(params[:post_id])
    @edit_comment_id = @comment.id
    render 'posts/show'
  end

  def update_comment
    @post = Post.friendly.find(params[:post_id])
    if @comment.update(comment_params)
      redirect_to @post, notice: 'Votre commentaire a été modifié !'
    else
      @edit_comment_id = @comment.id
      render 'posts/show'
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:titre, :contenu, :status)
  end
end
