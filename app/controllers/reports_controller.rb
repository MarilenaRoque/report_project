class ReportsController < ApplicationController
  def index
    @reports = Dir['public/reports/*']
  end

  def create
    sleep 8

    reports_folder = "#{Rails.root.join('public')}/reports"

    unless File.directory?(reports_folder)
      Dir.mkdir reports_folder
    end

    out_file = File.new("#{reports_folder}/report#{uuid}.html", 'w')
    out_file.puts('<p> New Report </p1>')
    out_file.close

    flash[:notice] = 'Estamos processando seu relatório! \0/'
    redirect_to reports_path
  end


  private

  def uuid
    UUID.new.generate
  end
end
