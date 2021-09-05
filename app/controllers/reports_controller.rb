class ReportsController < ApplicationController
  def index
    @reports = Dir['public/reports/*']
  end

  def create
    GenerateReportJob.perform_later

    flash[:notice] = 'Estamos processando seu relatório! \0/'
    redirect_to reports_path
  end
end
