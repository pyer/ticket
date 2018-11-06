require 'rake/clean'

desc "Clean up the project"
task :cleanup do
  Rake::Task["clean"].invoke
  Rake::Task["assets:clobber"].invoke
  Rake::Task["tmp:clear"].invoke
  Rake::Task["log:clear"].invoke
end
