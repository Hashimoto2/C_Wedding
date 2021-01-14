class Customers::ArticlesController < ApplicationController

  def top
    @categories = Category.where(is_active: true)

    # それぞれの変数memo(例)
    # note = Note.all
    # [1,2,3,4,5,6]
    # params = {id: 1,}
    # params[:id] # => 1
    # notes = [{ id: 1, name: 'name', user_id: 2 }, {id: 2, name: 'name2', user_id: 3}]
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
    @categories = Category.where(is_active: true)
  end

  def create
    @article = Article.new(article_params)
    @article.customer = current_customer

    if @article.save
       redirect_to thanx_path
    else
       render "new"
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments
    @categories = Category.where(is_active: true)
     # 参照先のS3オブジェクトURLを作成
    @article_url = "https://c-wedding-s3.s3-us-east-1.amazonaws.com/store/" + @article.image_id + "-thumbnail."
  end

  def edit
    @article = Article.find(params[:id])
    if @article.customer != current_customer
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
       sleep(3) # S3への画像反映のタイムラグを考慮して3秒待機
      redirect_to customers_articles_path, notice: "記事が更新されました。"
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.customer != current_customer
      @articles = Article.order('created_at desc').limit(3)
      @categories = Category.where(is_active: true)
      @article = Article.all
      render "index"
    else
      @article.destroy
    redirect_to mypage_path(current_customer)
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :introduction, :image, :category_id, :image2, :introduction2 )
  end

  def ensure_correct_customer
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
      redirect_to root_path
    end
  end
end
