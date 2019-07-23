require 'mechanize'
require 'csv'

class Movie < Struct.new(:title, :year, :rating, :director); end

movies = []

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

  movie  = Movie.new(title, rating, year, director)
  movies << movie

end

CSV.open("top10.csv", "w", col_sep: ";") do |csv|
  csv << ["Title", "Year", "Rating", "Director"]
  movies.each do |movie|
    csv << [movie.title, movie.rating, movie.year, movie.director]
  end
end
