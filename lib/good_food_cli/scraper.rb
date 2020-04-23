class GoodFoodCli::Scraper

    def self.scrape_recipe
        site = "https://www.bbcgoodfood.com/search/recipes?query=vegetarian+dishes"
        doc = Nokogiri::HTML(open(site))    
        recipes = doc.css("h3.teaser-item__title a")
        
        recipes.each do |r|
            name = r.text.strip
            url = r["href"]
            GoodFoodCli::Recipe.new(name,url)
        end 
    end 
    
    def self.scrape_ingredients(recipe)
        site = "https://www.bbcgoodfood.com/#{recipe.url}"
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

    def self.scrape_method(recipe)
        site = "https://www.bbcgoodfood.com/#{recipe.url}"
        doc = Nokogiri::HTML(open(site))
        results = doc.css("div.method p")
        #binding.pry 
        met = results.text
        GoodFoodCli::Method.new(met,recipe)
        #results.each do |r|
        #    name = r.text.strip
        #    GoodFoodCli::Method.new(name,recipe)
        #    #binding.pry
        #end 

        #GoodFoodCli::Method.new(#results)
        #GoodFoodCli::Method.new("met2", recipe)
    end 

end