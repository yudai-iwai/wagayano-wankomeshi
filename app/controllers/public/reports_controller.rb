class Public::ReportsController < ApplicationController
  def new
    @report = Report.new
    @member = Member.find(params[:member_id])
  end
  
  def create
    @member = Member.find(params[:member_id])
    @report = Report.new(report_params)
    @report.reporter_id = current_member.id
    @report.reported_id = @member.id
    if @report.save
      flash[:notice] = "通報が完了しました。ご報告ありがとうございます。"
      redirect_to member_path(@member)
    else
      render :new
    end
  end
  
  private
  
  def report_params
    params.require(:report).permit(:reason, :url)
  end
end
