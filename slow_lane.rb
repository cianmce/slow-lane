require 'sinatra'
require 'pry'

# port = ARGV[0].nil? ? 3001 : ARGV[0]

# set :port, port
# set :bind, '0.0.0.0'
set :server, :thin

before do
  headers 'Server' => " "
end

get "/" do
  "Hello world!"
end

get '/stream*' do
  pp params
  content = params[:ct] || params[:content_type] || "text/plain"
  content_type content

  cycles = params[:c] || params[:cycles] || 10
  cycles = cycles.to_i
  delay = params[:d] || params[:delay] || 0.4
  delay = delay.to_f

  stream do |out|
    cycles.times do
      text = params[:text] || SecureRandom.hex(32)
      out << "#{text}\n"
      puts "sleeping for #{delay}"
      sleep delay
    end
  end
end
