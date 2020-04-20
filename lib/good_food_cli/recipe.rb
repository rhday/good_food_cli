class GoodFoodCli::Recipe

    def self.all 
        GoodFoodCli::Scraper.scrape if @@all.empty?
        @@all
    end

    @@all = []

    attr_accessor :name 

    def initialize(name)
        @name = name
        save
    end 
    
    def save
        @@all << self
    end 

end