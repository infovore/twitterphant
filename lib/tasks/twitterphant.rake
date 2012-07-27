STDOUT.sync = true

namespace :phant do
  desc "Find new tweets for all searchterms."
  task :refresh_all => :environment do
    terms = Searchterm.all
    terms.each do |term|
      term.refresh!
      print "."
    end
    puts
  end
end
