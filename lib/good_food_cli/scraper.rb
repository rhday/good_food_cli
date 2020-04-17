class GoodFoodCli::Scraper
    def self.scrape
        doc = Nokogiri::HTML(open("https://www.bbcgoodfood.com/search/recipes?query=vegetarian+dishes"))     
    end 
end