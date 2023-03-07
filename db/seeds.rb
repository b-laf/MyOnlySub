require 'uri'
require 'net/http'
require 'openssl'
require "open-uri"
require "nokogiri"
require "json"

# Récupérer les ids des +/- 1000 films et séries avec le plus de votes/ratings d'imdb

ids_array = []

url_top1 = "https://www.imdb.com/search/title/?title_type=feature,tv_movie,tv_series&release_date=2015-01-01,2023-03-07&user_rating=6.0,10.0&num_votes=40000,&languages=en&view=simple&count=250"
# url_top2 = "https://www.imdb.com/search/title/?title_type=feature,tv_movie,tv_series&release_date=2015-01-01,2023-03-07&user_rating=6.0,10.0&num_votes=40000,&languages=en&view=simple&count=250&start=251&ref_=adv_nxt"
# url_top3 = "https://www.imdb.com/search/title/?title_type=feature,tv_movie,tv_series&release_date=2015-01-01,2023-03-07&user_rating=6.0,10.0&num_votes=40000,&languages=en&view=simple&count=250&start=501&ref_=adv_nxt"

html_file1 = URI.open(url_top1).read
html_doc1 = Nokogiri::HTML.parse(html_file1)

html_doc1.search(".lister-item-header a").each do |element|
  ids_array.push(element.attribute("href").value.split('/')[2])
end

# html_file2 = URI.open(url_top2).read
# html_doc2 = Nokogiri::HTML.parse(html_file2)

# html_doc2.search(".lister-item-header a").each do |element|
#   ids_array.push(element.attribute("href").value.split('/')[2])
# end

# html_file3 = URI.open(url_top3).read
# html_doc3 = Nokogiri::HTML.parse(html_file3)

# html_doc3.search(".lister-item-header a").each do |element|
#   ids_array.push(element.attribute("href").value.split('/')[2])
# end


filepath = "http://www.omdbapi.com/?i=#{odbm_id}&apikey=d965a803"
serialized_movies = URI.open(filepath).read
movies = JSON.parse(serialized_movies)

p movies


# imdb_id = "tt13833688" # to be modified
# url = URI("https://utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com/idlookup?source_id=#{imdb_id}&source=imdb&country=us")

# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# request = Net::HTTP::Get.new(url) # regarder comment cacher la clé
# request["X-RapidAPI-Key"] = "82d8dab17dmsh75488d0be2edb34p1a6c3djsn1146de99fad4"
# request["X-RapidAPI-Host"] = 'utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com'

# response = http.request(request)
# parsed_JSON = JSON.parse(response.body)






# platform = parsed_JSON["collection"]["locations"][0]["display_name"]
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.all.each do |user|
  user.photo.purge
end

User.destroy_all

user1 = User.new(
  first_name: "Julie",
  last_name: "Brunet",
  age: 26,
  email: "julieb@lewagon.org",
  password: "123456"
)
user1.photo.attach(
  io: File.open('public/images/julie.jpg'),
  filename: 'anyname.jpg', # use the extension of the attached file here
  content_type: 'image/jpg' # use the mime type of the attached file here
)
user1.save!

user2 = User.new(
  first_name: "Maxime",
  last_name: "Coquerelle",
  age: 31,
  email: "maximec@lewagon.org",
  password: "123456"
)
user2.photo.attach(
  io: File.open('public/images/max.jpg'),
  filename: 'anyname.jpg', # use the extension of the attached file here
  content_type: 'image/jpg' # use the mime type of the attached file here
)
user2.save!

user3 = User.new(
  first_name: "Amélie",
  last_name: "Berthier",
  age: 24,
  email: "amélieb@lewagon.org",
  password: "123456"
)
user3.photo.attach(
  io: File.open('public/images/amelie.jpg'),
  filename: 'anyname.jpg', # use the extension of the attached file here
  content_type: 'image/jpg' # use the mime type of the attached file here
)
user3.save!

user4 = User.new(
  first_name: "Bastien",
  last_name: "Lafont",
  age: 29,
  email: "bastienl@lewagon.org",
  password: "123456"
)
user4.photo.attach(
  io: File.open('public/images/bastien.jpg'),
  filename: 'anyname.jpg', # use the extension of the attached file here
  content_type: 'image/jpg' # use the mime type of the attached file here
)
user4.save!
