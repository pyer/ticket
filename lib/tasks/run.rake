desc "Run Rails server"
task :run do
  #sh "bin/rails server -e development -p 8080"
  APP_PATH = File.expand_path('config/application')
  args = ['-e', 'development', '-p', '8080']
  Rails::Command.invoke 'server', args
end
