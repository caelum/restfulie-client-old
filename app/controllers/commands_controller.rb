class CommandsController < ApplicationController
  def new
    
  end
  
  def show_rels
    @from_url = params['url']
    # example on how to use it via xml content
    @xml = Net::HTTP.get(URI.parse(params['url']))
    order = Order.from_xml(@xml)
    @possible_states = order._possible_states.keys
  end
  
  def execute
    
    @from_url = params['url']
    # example on how to read it straight from the web!!!
    order = Order.from_web @from_url
    @response = order.send(params["command"])

    # refreshes it
    order = Order.from_web @from_url
    @possible_states = order._possible_states.keys
    
  end
end
