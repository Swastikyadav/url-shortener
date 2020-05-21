class ReportWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(options = {})
    puts "Inside Report worker"
    links = Link.order(updated_at: :desc)
    CSV.open("public/reports.xls", "wb", { col_sep: "\t" }) do |csv|
      csv << ["Original Link", "Shortened Link", "Clicked Count"]
      links.each do |link|
        csv << [
          "#{link.url}",
          "links/#{link.slug}",
          "#{link.clicked}"
        ]
      end
    end
    JobMailer.with(email: "swastikyadav.dev@gmail.com").send_csv.deliver_now
  end
end