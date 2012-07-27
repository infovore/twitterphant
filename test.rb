require 'rubygems'
require 'twitter'

Twitter.search('"tiny games"', :rpp => 100, :result_type => "recent").results.map do |status|
  puts "#{status.from_user}: #{status.text}"
end

