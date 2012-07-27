require 'rubygems'
require 'twitter'

Twitter.search('"tiny games"', :rpp => 100, :result_type => "recent").results.map do |status|
  p status
  exit
end

