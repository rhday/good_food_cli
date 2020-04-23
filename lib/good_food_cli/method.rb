class GoodFoodCli::Method

    @@all = []

    def self.all
        @@all
    end 

    attr_accessor :name, :recipe, :method 

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
        @recipe.method << self 
        #binding.pry
    end 


end 