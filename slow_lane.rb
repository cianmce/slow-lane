require 'sinatra'

port = ARGV[0].nil? ? 3001 : ARGV[0]

set :port, port
set :bind, '0.0.0.0'
set :server, :thin


get '/stream' do
  content_type "text/event-stream"

  stream do |out|
    20.times do
      out << "#{Time.now}\n"
      puts Time.now
      sleep 0.5
    end
  end
end
