class GoodFoodCli::Recipe

    def self.all 
        GoodFoodCli::Scraper.scrape_recipe if @@all.empty?
        @@all
    end

    @@all = []

    attr_accessor :name, :ingredients
    #attr_writer :ingredients

    def initialize(name)
        @name = name
        @ingredients = []
        save
    end 
    
    def save
        @@all << self
    end 

    def get_ingredients
        GoodFoodCli::Scraper.scrape_ingredients(self) if @ingredients.empty?
        #@ingredients
    end 

end