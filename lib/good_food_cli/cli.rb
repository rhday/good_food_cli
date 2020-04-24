class GoodFoodCli::Cli
    def call
        puts "\nWelcome to Good Food. Here are all of our vegetarian recipes:\n"
        "\n\n"
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
            puts "\n#{index}. #{recipe.name}\n"
        end 
        puts "\nPlease type the number of the recipe you like the sound of:\n"
        "\n\n"
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
            puts "\n#{index}. #{ingredient.name}.\n"
        end
        #binding.pry
    end 

    def show_method_for(chosen_recipe)
        recipe = @recipes[chosen_recipe - 1]

        chosen_method = recipe.get_method 
        puts "\nWould you like to see the method? Please enter 'Y' or 'N'.\n"
        "\n\n"
        user_input = gets.strip.downcase
        "\n\n"
        if user_input == "y"
            puts "\nHere it is:\n"
            recipe.method.each do |method|
                puts "\n#{method.name}.\n"
            end 
            #chosen_method #puts "#{method.name}."
        elsif user_input == "n"
            puts "\nUh oh, that one wasn't for you!\n"
            #list_recipes
        else 
            puts "\nInvalid response\n"
            #list_recipes
        end 
    end 

end 

### ./bin/good_food_cli