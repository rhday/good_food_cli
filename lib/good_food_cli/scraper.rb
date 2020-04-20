class GoodFoodCli::Scraper
    def self.scrape
        site = "https://www.bbcgoodfood.com/search/recipes?query=vegetarian+dishes"
        doc = Nokogiri::HTML(open(site))    
        recipes = doc.css("h3.teaser-item__title")
        
        recipes.each do |r|
            name = r.text.strip
            GoodFoodCli::Recipe.new(name)
        end 
    end 
end