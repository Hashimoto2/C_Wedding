class  Admins::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @article = Article.all
  end
end
