class GoodFoodCli::Recipe

    def self.all 
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