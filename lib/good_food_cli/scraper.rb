class GoodFoodCli::Scraper

    def self.scrape_recipe
        site = "https://www.bbcgoodfood.com/search/recipes?query=vegetarian+dishes"
        doc = Nokogiri::HTML(open(site))    
        recipes = doc.css("h3.teaser-item__title")
        
        recipes.each do |r|
            name = r.text.strip
            GoodFoodCli::Recipe.new(name)
        end 
    end 
    
    def self.scrape_ingredients(recipe)
        site = "https://www.bbcgoodfood.com/recipes/vegetarian-club"
        doc = Nokogiri::HTML(open(site))
        results = doc.css("ul.ingredients-list__group")

        ingredients = results.css("li.ingredients-list__item").map do |r|
            ptext = r.css('p').text
            alltext = r.text
            prtext = r.css('.fonetic').text
            ings = alltext.gsub(ptext, '').gsub(prtext, '').strip
            GoodFoodCli::Ingredient.new(ings, recipe)
         end 
        #GoodFoodCli::Ingredient.new("ing1", recipe)
        #GoodFoodCli::Ingredient.new("ing2", recipe)
    end 
end