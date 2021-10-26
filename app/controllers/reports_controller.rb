class ReportsController < ApplicationController
  before_action :current_report, only: [:show, :edit, :update, :destroy]

  def index
    @reports = Report.order(:id).page(params[:page])
  end

  def show

  end

  def new
    @report = Report.new
  end

  def create
    report = Report.create(report_params)

    redirect_to report_path(report)
  end

  def edit

  end

  def update
    @report.update(report_params)

    redirect_to report_path(@report)
  end

  def destroy
    @report.destroy

    redirect_to reports_path
  end

  private

  def report_params
    params.require(:report).permit(:title, :content)
  end

  def current_report
    @report = Report.find(params[:id])
  end
end
