class ArticlesController < ApplicationController
  before_action :set_article, only: [ :show, :edit, :update, :destroy ]
  before_action :load_resources, only: [ :new, :edit ]

  def index
    @articles = Article.includes(:authors, :journal).all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.authors = Author.where(id: params[:article][:author_ids])

    if @article.save
      redirect_to @article, notice: "Статья успешно создана"
    else
      load_resources
      render :new
    end
  end

  def update
    @article.authors = Author.where(id: params[:article][:author_ids])

    if @article.update(article_params)
      redirect_to @article, notice: "Статья обновлена"
    else
      load_resources
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: "Статья успешно удалена"
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def load_resources
    @authors = Author.all
    @journals = Journal.all
  end

  def article_params
    params.require(:article).permit(:original_title, :english_title, :publication_date, :doi, :journal_id)
  end
end
