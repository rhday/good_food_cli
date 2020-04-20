class GoodFoodCli::Cli
    def call
        puts 'Welcome to Good Food. Please browse our vegetarian recipes!'
        #binding.pry
        #get_recipes
        #list_recipes
        #get_method_for(recipe)
    end

    def get_recipes
        @recipes = ['Rec1','Rec2','Rec3','Rec4','Rec5']
    end 

    def get_user_recipe
        #list recipes
        @recipes.each.with_index(1) do |index, recipe|
            puts "#{index}. #{recipe}." 
        end 
    end 
end 

### ./bin/good_food_cli