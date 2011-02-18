task :environment

namespace :gem do
  
  desc "bump patch, push to github, & publish gem"
  task :publish => :environment do
    Rake::Task['version:bump:patch'].invoke
    Rake::Task['gemspec'].invoke 
    # Rake::Task['build'].invoke
    gem_version = `cat VERSION`
    `git add .; git commit -a -m "#{gem_version} published"`
    Rake::Task['git:release'].invoke
  end # task
  
  
end  # namespace
