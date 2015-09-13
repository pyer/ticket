task :clean do
  Rake::Task["assets:clobber"].invoke
  Rake::Task["tmp:clear"].invoke
  Rake::Task["log:clear"].invoke
#  sh "find ./ -name '*~' -delete"
end
