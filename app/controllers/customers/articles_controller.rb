class Customers::ArticlesController < ApplicationController

  def top
    @categories = Category.all
    # note = Note.all
    # [1,2,3,4,5,6]
    # params = {
    #   id: 1,

    # }
    # params[:id] # => 1
    # notes = [
    #   {
    #     id: 1,
    #     name: 'name',
    #     user_id: 2
    #   },
    #   {
    #     id: 2,
    #     name: 'name2',
    #     user_id: 3
    #   }
    # ]
    # # notes.pluck(:user_id) # => [2, 3]
    #@rankings = Note.find([1, 2, 3])
    #Note.find(1)
    #@rankings = Note.find(Like.group(:note_id).order('count(note_id) desc').limit(3).pluck(:note_id))
    @article_rannkings = Article.find(Favorite.group(:article_id).order('count(article_id) desc').limit(3).pluck(:article_id))
  end

  def about
  end

  def thanx
  end

  def new
    @article = Article.new
  end

  def index
    @articles = Article.order('created_at desc').limit(3)
    @article = Article.all
    @categories = Category.all
  end

  def create
    @article = Article.new(article_params)
    if @article.save!
       redirect_to thanx_path
    else
       render "new"
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @categories = Category.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to customers_articles_path
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.all
    @article.destroy(params[:id])
    redirect_to mypage_path(current_customer)
  end

  private
  def article_params
    params.require(:article).permit(:title, :introduction, :image, :category_id)
  end
end

# Hash - key/value
# {"article" => {"title" => "hoge", "introduction" => "hogehogehoge", "image" => "lfsjdalfjlsdfjalf"}}
