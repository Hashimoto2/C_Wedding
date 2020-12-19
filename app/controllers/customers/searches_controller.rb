class Customers::SearchesController < ApplicationController
  def search
    @value = params["search"]["value"]         #データを代入
    @how = params["search"]["how"]             #データを代入
    @datas = search_for(@how, @value)          #def search_forを実行(引数に検索ワードと検索方法)
  end

   private

  def match(value)
    #.orを使用することで、valueに一致するカラムのデータをtitleカラムとcategory_idカラムから探してきます。
    Article.where(title: value).or(Article.where(category_id: value))
  end

  def forward(value)                              #forward以降は商品名検索の定義しかしてません。
    Article.where("title LIKE ?", "#{value}%")
  end

  def backward(value)
    Article.where("title LIKE ?", "%#{value}")
  end

  def partical(value)
    Article.where("title LIKE ?", "%#{value}%")
  end


  def search_for(how, value)
    case how                     #引数のhowと一致する処理に進むように定義しています。
    when 'match'                 #ジャンル検索の場合はmatchで固定してるので、必ず'match'の処理に進みます。
      match(value)
    when 'forward'
      forward(value)
    when 'backward'
      backward(value)
    when 'partical'
      partical(value)
    end
  end
end
