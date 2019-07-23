require 'mechanize'

agent = Mechanize.new

main_page = agent.get 'http://imdb.com'

list_page = main_page.link_with(:text => 'Top Rated Movies').click

rows = list_page.root.css(".lister-list tr")

rows.take(10).each do |row|
  title = row.at_css(".titleColumn a").text.strip
  rating = row.at_css(".ratingColumn strong").text.strip

  movie_page = list_page.link_with( text: title ).click
  year = movie_page.at_css("#titleYear a").text.strip
  director = movie_page.at_css(".credit_summary_item a").text.strip

  puts "#{title}: #{rating} #{year} #{director}"

end
