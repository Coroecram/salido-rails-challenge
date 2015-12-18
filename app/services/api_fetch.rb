class APIFetch
  attr_reader :wines, :errors

  def initialize(query_options)
    @wines = []
    @search_params =
    @price_min =
    @price_max =
    @retail_price_min =
    @retail_price_max =



    fetch_wines()
  end


  def fetch_wines
    wines = RestClient.get 'http://services.wine.com/api/beta2/service.svc/json/catalog?offset=offset&size=size&'
    json_wines = JSON.parse(wines)
    json_wines = json_wines["Products"]["List"]
    json_wines.each { |wine| Wine.create!({name: wine["Name"],
                                           url: wine["Url"],
                                           min_price: wine["PriceMin"],
                                           max_price: wine["PriceMax"],
                                           retail_price: wine["PriceRetail"],
                                           kind: wine["Type"],
                                           api_id: wine["Id"] })
  end

end
