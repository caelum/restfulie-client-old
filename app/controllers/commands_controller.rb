class CommandsController < ApplicationController
  def new
    
  end
  
  def show_rels
    @from_url = params['url']
    @xml = Net::HTTP.get(URI.parse(params['url']))
    order = Order.from_xml(@xml)
    @possible_states = order._possible_states.keys
  end
  
  def execute
    @from_url = params['url']
    xml = Net::HTTP.get(URI.parse(params['url']))
    order = Order.from_xml(xml)
    @response = order.send(params["command"])
    
    xml = Net::HTTP.get(URI.parse(params['url']))
    order = Order.from_xml(xml)
    
    @possible_states = order._possible_states.keys
  end
end
