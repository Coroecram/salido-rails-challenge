class APIFetch
  attr_reader :wines, :errors

  def initialize(search_query)
    @wines = []
    @errors = []
    search_params = search_query[:query].gsub(" ", "+")
    types = search_query[:kind]
    price_min =  search_query[:price_min] != "" ? search_query[:price_min] : 0
    price_max =  search_query[:price_max] != "" ? search_query[:price_max] : 9999
    size = search_query[:size] != "" ? search_query[:size] : 5
    offset = search_query[:offset] != "" ? search_query[:offset] : 0
    @query_string = "search=#{search_params}&filter=price(#{price_min}|#{price_max})&offset=#{offset}&size=#{size}&state=NY&#{ENV['WINE_API_KEY']}"

    validate(price_min, price_max)
    fetch_wines if @errors.empty?
  end

  def validate(min, max)
    if min > max
      @errors.push("Max price must be greater than min price")
    end
  end

  def fetch_wines
    wines = JSON.parse(RestClient.get "http://services.wine.com/api/beta2/service.svc/json/catalog?#{@query_string}")["Products"]["List"]

    wines.each do |wine|
        new_wine = Wine.find_or_create_by({name: wine["Name"],
                                           url: wine["Url"],
                                           min_price: wine["PriceMin"],
                                           max_price: wine["PriceMax"],
                                           retail_price: wine["PriceRetail"],
                                           kind: wine["Type"],
                                           api_id: wine["Id"] })
      if new_wine.valid?
        new_wine.save!
        @wines.push(new_wine)
      else
        new_wine.max_price = new_wine.max_price.to_f
        new_wine.min_price = new_wine.min_price.to_f - 0.01
        new_wine.save!
        @wines.push(new_wine)
      end
    end

  end


end
