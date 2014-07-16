# encoding: utf-8
require 'uri'
require 'open-uri'
require 'net/http'

class WeaSearch 
  attr_reader :name, :code, :data
  def initialize(name, code)
    @name = name
    @code = code
  end

  def getData
    @data = Hash.new
    @url = "http://m.weather.com.cn/data/" + @code + ".html"
    @urlCurrent = "http://www.weather.com.cn/data/sk/" + @code + ".html"
    @data['input'] = @name
    @optionArr = Array.new
    open(@urlCurrent) do |page|
      page.read.each_line do |line|
        line.split(',').each do |option|
          @optionArr.push(option)
        end
      end
    end
    open(@url) do |page|
      page.read.each_line do |line|
        line.split(',').each do |option|
          @optionArr.push(option)
        end
      end
    end
    @optionArr.uniq!
    @data['city'] = @optionArr[0].split(':')[2]
    @optionArr.each { |option| @data[option.split(':')[0]] = option.split(':')[1] }
    #		@data.each { |data| puts data }
    return @data
  end
end
