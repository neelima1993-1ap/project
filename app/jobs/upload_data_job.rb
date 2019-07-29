class UploadDataJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
    p "in perform"
    Upload.upload_data args
  end
end
