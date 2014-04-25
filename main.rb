require 'sinatra'
require 'slim'
load 'lib/WeaSearch.rb'
load 'lib/ExpSearch.rb'

file = File.open('lib/citycode.txt')
cityHash = Hash.new
file.each_line do |line|
  line.split(' ').each do |part|
    tmpArr = part.split('=')
    cityHash[tmpArr[1]] = tmpArr[0]
  end
end

get '/' do
  slim :index
end

get '/wearesult/:code' do
  weasearch = WeaSearch.new(@weaname, params[:code])
  @weadata = weasearch.getData
  slim :wearesult
end

get '/expresult/:company/:expcode' do 
  @company = params[:company] == 'st' ? '申通快递' : '韵达快递'
  @expcode = params[:expcode]
  expsearch = ExpSearch.new(@company, @expcode)
  @expdata = expsearch.getData
  slim :expresult
end

get '/wea/:weaname' do 
  @weaname = params[:weaname]
  redirect '/wearesult/' + cityHash[@weaname]
end

post '/wea' do 
  @weaname = params[:weaname]
  redirect '/wearesult/' + cityHash[@weaname]
end
