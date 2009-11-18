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
    
    order = Order.from_web @from_url # example on how to read it straight from the web!!!
    value = params['parameter_value']
    
    options = {}
    options [:data] = value if value
    puts "Options are #{options[:data]}"
    
    # dynamic invoke
    @response = order.send(params["command"], options ) do |response|
      response
    end

    # refreshes it
    order = Order.from_web @from_url
    @possible_states = order._possible_states.keys
    
  end
end
