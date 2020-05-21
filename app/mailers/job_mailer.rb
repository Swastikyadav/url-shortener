class JobMailer < ApplicationMailer
  def send_csv
    @email = params[:email]
    attachments['reports.xls'] = File.read(Rails.root.join('public/reports.xls'))
    mail(to: @email, subject: "My Subject")
  end
end
