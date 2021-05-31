require 'open-uri'

class FlatsController < ApplicationController
  # We are coming to the INDEX method from the route file, by the root route, which is pointing to "flats#index" Controller-Action
  def index
    url = 'https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json'
    # Fetching all the necesary data which will be received as a JSON file, which we need to parse
    # Using open-uri, we are opening the website, reading the info getting a JSON file and parsing(reading) over it.
    # We then save all this information in a instace variable called @FLATS (plural, because it has ALL our flats info)
    @flats = JSON.parse(open(url).read)
    #Our INDEX method is linked to a VIEW file (view/flats/index.html.erb) and in there we can use every instance variable we declase in our method
  end

  def show
    url = 'https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json'
    flats = JSON.parse(open(url).read)
    # The same proccess as in INDEX happens here, but the main difference is we are using PARAMS to actually get information from the URL
    # which in this case would be /flats/:id  which in our case the piece of information we are interedted in, is the ID of the flat
    # We compare it to out flats array and find the matching one, and save it in the @flat (singular) instance variable
    @flat = flats.find { |flat| flat["id"] == params[:id].to_i }
  end
end




#REFACTORED VERSION

# To keep it as DRY as possible (Dont Repeat yourself) we can move our URL variable outside of the methods, 
# and use a built-in filter in rails called BEFORE_ACTION, which, as the name says, gets run before any action takes place in the controller


# class FlatsController < ApplicationController
#   URL = 'https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json'
#   before_action :set_flats

#   def index
#   end

#   def show
#     @flat = @flats.find {|flat| flat['id'] == params[:id].to_i}
#   end

#   def set_flats
#     @flats = JSON.parse(open(URL).read)
#   end
# end