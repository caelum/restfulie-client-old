class CommandsController < ApplicationController
  def new
    
  end
  
  def execute
    xml = Net::HTTP.get(URI.parse(params['url']))
    puts "i have got this cute #{xml}"
    order = Order.from_xml(xml)
    
    for command in %w(command_1 command_2 command_3 command_4 command_5) do
      case params[command]
        when 'refresh' 
          order.refresh
        when 'update' 
          order.update
        when 'pay' 
          order.pay
        when 'destroy' 
          order.destroy
        else
          raise "invalid command"
      end
    end
    
    render :text => 'response'
  end
end
