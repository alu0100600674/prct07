$:.unshift File.dirname(__FILE__) + 'lib'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :default => :spec

desc "Expectativas de la clase Fraccion"
task :spec do
	sh "rspec -I. spec/frac_spec.rb"
end

desc "Ejecutar con documentacion"
task :doc do
	sh "rspec -I. spec/frac_spec.rb --format documentation"
end
