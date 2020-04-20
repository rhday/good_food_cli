class GoodFoodCli::Ingredient

    @@all = []

    def self.all
        @@all
    end 

    attr_accessor :name, :recipe, :ingredients 

    def initialize(name, recipe)
        @name = name
        @recipe = recipe 
        add_to_recipe
        save
    end 

    def save
        @@all << self
    end 

    def add_to_recipe
        @recipe.ingredients << self 
    end 


end 