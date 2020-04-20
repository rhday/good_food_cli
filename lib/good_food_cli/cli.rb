class GoodFoodCli::Cli
    def call
        puts "\nWelcome to Good Food. Here are all of our vegetarian recipes:\n"
        #binding.pry
        get_recipes
        list_recipes
        get_user_recipe
        #get_method_for(recipe)
        #show_ingredients_for
        #show_method_for
    end

    def get_recipes
        #to be scraped
        GoodFoodCli::Recipe.new("veg")
        GoodFoodCli::Recipe.new("more veg")
        @recipes = GoodFoodCli::Recipe.all
    end 

    def list_recipes
        #list recipes
        
        @recipes.each.with_index(1) do |recipe, index|
            puts "#{index}. #{recipe.name}"
        end 
        puts "Please type the number of the recipe you like the sound of:"
    end 

    def get_user_recipe
        chosen_recipe = gets.strip.to_i
        show_ingredients_for(chosen_recipe) if valid_input?(chosen_recipe, @recipes)
        #binding.pry
    end 

    def valid_input?(input, data)
        input.to_i <= data.length && input.to_i > 0
    end 

    def show_ingredients_for(chosen_recipe)
        recipe = @recipes[chosen_recipe - 1]
        puts "Here are the ingredients for #{recipe.name}:"
        #binding.pry
    end 

end 

### ./bin/good_food_cli