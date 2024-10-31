desc "Run Rails server"
task :run => [:cleanup ] do
  system "rackup -p 8080"
end
