SimpleCov.start 'rails' do
  add_filter '/app/channels/'
  add_filter '/app/mailers'
  add_filter '/app/jobs'
  add_filter '/app/models/application_record.rb'
  enable_coverage :branch
end
