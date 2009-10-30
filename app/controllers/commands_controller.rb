class CommandsController < ApplicationController
  def new
    
  end
  
  def execute
    @from_url = params['url']
    xml = Net::HTTP.get(URI.parse(params['url']))
    order = Order.from_xml(xml)
    @response = order.send(params["command"])
  end
end
