require_relative "good_food_cli/version"
require_relative "good_food_cli/cli"
require_relative "good_food_cli/recipe"
require_relative "good_food_cli/scraper"

require 'pry'
require 'nokogiri'

module GoodFoodCli
  class Error < StandardError; end
  # Your code goes here...
end
