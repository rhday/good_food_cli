require_relative 'lib/good_food_cli/version'

Gem::Specification.new do |spec|
  spec.name          = "good_food_cli"
  spec.version       = GoodFoodCli::VERSION
  spec.authors       = ["rhday"]
  spec.email         = ["ruariday@gmail.com"]

  spec.summary       = %q{Gem offers user 18 vegetarian recipes to choose from.}
  spec.description   = %q{Users will be able to browse the recipes, ingredients and methods of each recipe and then select which one they want to make.}
  spec.homepage      = "http://www.goodfoodcli.com"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/rhday/good_food_cli"
  spec.metadata["changelog_uri"] = "https://github.com/rhday/good_food_cli/changelog"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "pry"
  spec.add_development_dependency "bundler", "~> 2.0"
  #spec.add_development_dependency "rake", "~> 12.0"
  spec.add_dependency "nokogiri"

end
