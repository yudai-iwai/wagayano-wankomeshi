class Admin::ReportsController < ApplicationController
  def index
    @reports = Report.order("id DESC").page(params[:page]).per(10)
  end

  def show
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      flash[:notice] = "対応ステータスを更新しました。"
      redirect_to admin_reports_path
    end
  end
  
  private
  
  def report_params
    params.require(:report).permit(:status)
  end
end
