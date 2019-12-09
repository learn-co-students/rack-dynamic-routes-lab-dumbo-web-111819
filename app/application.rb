require 'pry'
class Application


  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match("/items/")
      path_array = req.path.split("/items/")
      item_name = path_array.last

        if !path_array.empty?
          item = Item.all.find{|item|
            item.name == item_name
          }

          if item == nil
            resp.status = 400
            resp.write "Item not found"
          else
            resp.write item.price
          end

        end
    else
        resp.status = 404
        resp.write "Route not found"
      end  #end of first if
    resp.finish
  end #end of call
end #end of Application
