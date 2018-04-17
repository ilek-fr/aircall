
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "aircall/version"

Gem::Specification.new do |spec|
  spec.name          = "aircall"
  spec.version       = Aircall::VERSION
  spec.licenses = ['MIT']
  spec.authors       = ["Ilek", "Jerome"]
  spec.email         = ["jerome@ilek.fr", "jeromearsene@gmail.com"]

  spec.summary       = "Ruby Gem for Aircall"
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/ilek-fr/aircall"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
=begin
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end
=end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]


  spec.add_runtime_dependency "httparty", "~> 0.16.2"

  spec.add_development_dependency "minitest", "~> 5.11"
  spec.add_development_dependency "hashie", "~> 3.5"
  spec.add_development_dependency "dotenv", "~> 2.2"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end