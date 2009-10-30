class CommandsController < ApplicationController
  def new
    
  end
  
  def execute
    xml = Net::HTTP.get(URI.parse(params['url']))
    order = Order.from_xml(xml)
    @response = order.send(params["command"])
    puts @response
    render :text => @response
  end
end
