class HomeController < ApplicationController
  def index
  end 

  def post_calculate
  end 

  def nlp_transfer
    @postData = jieba_text("我爱北京天安门")
    #binding.pry
  end 

  def parse_texts
    @data = jieba_text(request.body.read.force_encoding("utf-8"))
    respond_to do |f|
      f.json{ render :json => @data }
    end 
  end 

  private 

  def jieba_text(text)
    require 'net/http'
    require 'json'
    uri = URI('http://localhost:5000/')
    http = Net::HTTP.new(uri.host, uri.port)
    request_to = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json'})
    request_to.body = text.to_json
    JSON.parse(http.request(request_to).body)
  end 

end 
