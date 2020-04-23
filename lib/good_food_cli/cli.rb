class GoodFoodCli::Cli
    def call
        puts "\nWelcome to Good Food. Here are all of our vegetarian recipes:\n"
        #binding.pry
        get_recipes
        list_recipes
        get_user_recipe
        
        #get_ingredients
        #show_method_for
    end

    def get_recipes
        #to be scraped
        #GoodFoodCli::Recipe.new("veg")
        #GoodFoodCli::Recipe.new("more veg")
        @recipes = GoodFoodCli::Recipe.all
    end 

    def list_recipes
        #list recipes
        
        @recipes.each.with_index(1) do |recipe, index|
            puts "#{index}. #{recipe.name}"
        end 
        puts "\nPlease type the number of the recipe you like the sound of:\n"
    end 

    def get_user_recipe
        chosen_recipe = gets.strip.to_i
        show_ingredients_for(chosen_recipe) if valid_input?(chosen_recipe, @recipes)
        show_method_for(chosen_recipe)
        #binding.pry
    end 

    def valid_input?(input, data)
        input.to_i <= data.length && input.to_i > 0
    end 

    def show_ingredients_for(chosen_recipe)
        recipe = @recipes[chosen_recipe - 1]
        #GoodFoodCli::Ingredient.new("ing1", recipe)
        #GoodFoodCli::Ingredient.new("ing2", recipe)
        recipe.get_ingredients
        puts "\nHere are the ingredients for #{recipe.name}:\n"
        recipe.ingredients.each.with_index(1) do |ingredient, index|
            puts "#{index}. #{ingredient.name}."
        end
        #binding.pry
    end 

    def show_method_for(chosen_recipe)
        recipe = @recipes[chosen_recipe - 1]

        chosen_method = recipe.get_method 
        puts "\nWould you like to see the method? Please enter 'Y' or 'N'.\n"

        user_input = gets.strip.downcase

        if user_input == "y"
            puts "Here it is:"
            chosen_method
        elsif user_input == "n"
            puts "Oh, we're sorry, here's the list again!"
            list_recipes
        else 
            puts "Invalid response"
            list_recipes
        end 
    end 

end 

### ./bin/good_food_cli