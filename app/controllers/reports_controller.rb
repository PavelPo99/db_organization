class ReportsController < ApplicationController
  before_action :set_report, only: [ :show, :edit, :update, :destroy ]
  before_action :load_authors, only: [ :new, :edit ]

  def index
    @reports = Report.includes(:authors).all
  end

  def show
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.authors = Author.where(id: params[:report][:author_ids])

    if @report.save
      redirect_to @report, notice: "Доклад успешно создан"
    else
      load_authors
      render :new
    end
  end

  def edit
  end

  def update
    @report.authors = Author.where(id: params[:report][:author_ids])

    if @report.update(report_params)
      redirect_to @report, notice: "Глава книги успешно обновлена"
    else
      load_authors
      render :edit
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_path, notice: "Глава книги удалена"
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def load_authors
    @authors = Author.all
  end

  def report_params
    params.require(:report).permit(:original_title, :english_title, :publication_date, :speaker_id, :conference_name, :conference_venue)
  end
end
