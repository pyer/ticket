require 'rake/clean'

desc "Clean up the project"
task :clean do
  Rake::Task["clobber"].invoke
  Rake::Task["assets:clobber"].invoke
  Rake::Task["tmp:clear"].invoke
  Rake::Task["log:clear"].invoke
end
