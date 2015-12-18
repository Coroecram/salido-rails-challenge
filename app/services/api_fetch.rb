class APIFetch
  attr_reader :wines, :errors

  def initialize(search_query)
    @wines = []
    @errors = []
    @search_params = search_query[:query].gsub(" ", "+")
    @types = search_query[:kind]
    @price_min =  search_query[:price_min]
    @price_max =  search_query[:price_max]
    debugger

    validate
    @query_string = parse_query
    fetch_wines
  end

  def validate
    if @price_max >= @price_min && @price_max != "" || @price_min != ""
      @errors.push("Max price must be greater than min price")
    end
  end

  def parse_query
    types = @types != "" ? "search=#{@search_params}&" : ""
    min = @price_min != "" ? @price_min : 0
    max = @price_max != "" ? @price_max : 9999
    filter = "filter=#{min}|#{max}&"
    return "#{types}#{filter}"
  end

  def fetch_wines
    wines = JSON.parse(RestClient.get "http://services.wine.com/api/beta2/service.svc/json/catalog?#{@query_string}offset=0&size=5&state=NY&apikey=#{ENV['WINE_API_KEY']}")["Products"]["List"]
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
