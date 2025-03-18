class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, only: [:edit, :update, :destroy]

  def index
    if params[:query].present?
      @posts = Post.search_by_titre_and_contenu_and_categorie(params[:query])
    else
      @posts = Post.all
    end
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "L'article a bien été ajouté !"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "L'article a bien été modifié !"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: "L'article a bien été supprimé !"
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to posts_url, alert: 'Post not found.' # Gérer le cas où le post n'existe pas
  rescue ArgumentError
    redirect_to posts_url, alert: 'Invalid post ID.' # Gérer le cas où l'ID est invalide
  end

  def authorize_admin
    redirect_to posts_url, alert: 'Access denied.' unless current_user&.admin?
  end

  def post_params
    params.require(:post).permit(:titre, :contenu, :rich_body, :categorie, :date_publication, :note, :photo)
  end
end
