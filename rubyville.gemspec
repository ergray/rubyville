# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
    spec.name           = "Rubyville"
    spec.version        = '2.0'
    spec.authors        = ["Eric Gray"]
    spec.email          = ["ericxgray@gmail.com"]
    spec.summary        = %q{A city building game}
    spec.description    = %q{A project for learning Ruby and working with classes}
    spec.homepage       = "https://github.com/ergray/rubyville"
    spec.license        = "MIT"

    spec.files          = [ 'lib/rubyville.rb',
                            'lib/city.rb',
                            'lib/clock.rb',
                            'lib/engine.rb',
                            'lib/game.rb',
                            'lib/map.rb',
                            'lib/structure.rb']
    spec.executables    << 'rubyville'
    spec.test_files     = ['tests/test_rubyville.rb']
    spec.require_paths  = ["lib"]
end

