class APIFetch
  attr_reader :wines, :errors

  def initialize(search_query)
    @wines = []
    @errors = []
    @search_params = search_query[:query].gsub(" ", "+")
    @types = search_query[:kind]
    @price_min =  search_query[:price_min] != "" ? @price_min : 0
    @price_max =  search_query[:price_max] != "" ? @price_max : 9999
    @size = search_query[:size] != "" ? search_query[:size] : 5
    @query_string = "search=#{@search_params}&filter=#{@price_min}|#{@price_max}&offset=0&size=#{@size}&state=NY&apikey=#{ENV['WINE_API_KEY']}"

    validate
    fetch_wines
  end

  def validate
    if @price_max >= @price_min && @price_max != "" || @price_min != ""
      @errors.push("Max price must be greater than min price")
    end
  end

  def fetch_wines
    debugger
    wines = JSON.parse(RestClient.get "http://services.wine.com/api/beta2/service.svc/json/catalog?#{@query_string}")["Products"]["List"]
    wines.each { |wine| @wines.push(Wine.find_or_create_by({name: wine["Name"],
                                                            url: wine["Url"],
                                                            min_price: wine["PriceMin"],
                                                            max_price: wine["PriceMax"],
                                                            retail_price: wine["PriceRetail"],
                                                            kind: wine["Type"],
                                                            api_id: wine["Id"] })
                                                          ) }
  end


end
