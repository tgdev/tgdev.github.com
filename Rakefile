# bundle exec rake deploy
desc "deploy build directory to github"
task :deploy do
  puts "## Deploying build files to Github master branch"
  cd "build" do
    system "git add ."
    system "git add -u"
    puts "\n## Commiting: Site updated at #{Time.now.utc}"
    message = "Site updated at #{Time.now.utc}"
    system "git commit -m \"#{message}\""
    puts "\n## Pushing generated website"
    system "git push origin master"
    puts "\n## Github master branch deployment complete"
  end
end