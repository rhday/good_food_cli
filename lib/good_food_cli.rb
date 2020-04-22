require_relative "good_food_cli/version"
require_relative "good_food_cli/cli"
require_relative "good_food_cli/recipe"
require_relative "good_food_cli/ingredient"
require_relative "good_food_cli/method"
require_relative "good_food_cli/scraper"

require 'pry'
require 'nokogiri'
require 'open-uri'

module GoodFoodCli
  class Error < StandardError; end
  # Your code goes here...
end
