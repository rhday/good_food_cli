class GoodFoodCli::Ingredient

    @@all = []

    attr_accessor :name, :recipe, :ingredients 

    def initialize(name, recipe)
        @name = name
        @recipe = recipe 
        save
    end 

    def save
        @@all << self
    end 


end 