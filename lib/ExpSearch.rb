require 'watir-webdriver'
require 'nokogiri'
require 'open-uri'
require 'uri'

class ExpSearch
  attr_reader :company, :expcode
  def initialize(company, expcode)
    @company = company == '申通快递' ? 'shentong' : 'yunda'
    @expcode = expcode
  end

  def getData
    @data = Array.new
    browser = Watir::Browser.new :phantomjs
    browser.goto 'http://q.ckd.cn/' + @company + '-' + @expcode + '.html'
    doc = Nokogiri::HTML(browser.html)
    doc.css('td').each do |progress|
      @data.push(progress.content)
    end
    2.times { @data.pop }
    browser.close
    return @data
  end
end
