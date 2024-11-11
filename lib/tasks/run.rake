desc "Run Rails server"
task :run => [:cleanup] do
  system "rails server"
end
