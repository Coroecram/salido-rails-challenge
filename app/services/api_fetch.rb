class APIFetch
  attr_reader :wines, :errors

  def initialize(search_query)
    @wines = []
    @errors = ""
    @types = search_query[:kind].gsub(" ", "+")
    @search_params = search_query[:query]
    @price_min =  search_query[:price_min]
    @price_max =  search_query[:price_max]
    debugger

    validate
    query = parse_query
    fetch_wines(query)
  end

  def validate
    if @price_max.to_i >= price_min.to_i
      @errors = "Max price must be greater than min price"
    elsif @price_max == 0 && @price_min == 0

    end
  end

  def parse_query
    types = @types != ? "search=#{@types}&" : ""
    if @price_min || @price_max
      min = @price_min != "" ? @price_min : "0"
      max = @price_max != "" ? @price_max : "9999"
      filter = "filter="
    return "#{types}"
  end

  def fetch_wines
    wines = JSON.parse(RestClient.get "http://services.wine.com/api/beta2/service.svc/json/catalog?offset=5&size=5&state=NY&apikey=#{ENV['WINE_API_KEY']}")["Products"]["List"]
    debugger
    # wines = json_wines
    # json_wines.each { |wine| Wine.create!({name: wine["Name"],
    #                                        url: wine["Url"],
    #                                        min_price: wine["PriceMin"],
    #                                        max_price: wine["PriceMax"],
    #                                        retail_price: wine["PriceRetail"],
    #                                        kind: wine["Type"],
    #                                        api_id: wine["Id"] }) }
  end


end
