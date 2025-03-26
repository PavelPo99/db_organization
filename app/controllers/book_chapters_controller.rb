# app/controllers/book_chapters_controller.rb
class BookChaptersController < ApplicationController
  before_action :set_book_chapter, only: [ :show, :edit, :update, :destroy ]
  before_action :load_authors, only: [ :new, :edit ]

  def index
    @book_chapters = BookChapter.includes(:authors).all
  end

  def show
  end

  def new
    @book_chapter = BookChapter.new
  end

  def create
    @book_chapter = BookChapter.new(book_chapter_params)
    @book_chapter.authors = Author.where(id: params[:book_chapter][:author_ids])

    if @book_chapter.save
      redirect_to @book_chapter, notice: "Глава книги успешно создана"
    else
      load_authors
      render :new
    end
  end

  def edit
  end

  def update
    @book_chapter.authors = Author.where(id: params[:book_chapter][:author_ids])

    if @book_chapter.update(book_chapter_params)
      redirect_to @book_chapter, notice: "Глава книги успешно обновлена"
    else
      load_authors
      render :edit
    end
  end

  def destroy
    @book_chapter.destroy
    redirect_to book_chapters_url, notice: "Глава книги удалена"
  end

  private

  def set_book_chapter
    @book_chapter = BookChapter.find(params[:id])
  end

  def load_authors
    @authors = Author.all
  end

  def book_chapter_params
    params.require(:book_chapter).permit(:original_title, :english_title, :publication_date, :publisher, :isbn, :number_pages)
  end
end
