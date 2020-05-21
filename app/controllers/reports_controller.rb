class ReportsController < ApplicationController
  def generate_report
    ReportWorker.perform_async()
    email = "swastikyadav.dev@gmail.com"
    JobMailer.with(email: email).send_csv.deliver_now
    render json: { msg: "Email sent!" }
  end
end