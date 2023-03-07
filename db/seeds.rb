# require 'uri'
# require 'net/http'
# require 'openssl'
# require "open-uri"
# require "nokogiri"
# require "json"

# # movie seed

# ids_array = []

# url_top1 = "https://www.imdb.com/search/title/?title_type=feature,tv_movie,tv_series&release_date=2015-01-01,2023-03-07&user_rating=6.0,10.0&num_votes=40000,&languages=en&view=simple&count=250"
# # url_top2 = "https://www.imdb.com/search/title/?title_type=feature,tv_movie,tv_series&release_date=2015-01-01,2023-03-07&user_rating=6.0,10.0&num_votes=40000,&languages=en&view=simple&count=250&start=251&ref_=adv_nxt"
# # url_top3 = "https://www.imdb.com/search/title/?title_type=feature,tv_movie,tv_series&release_date=2015-01-01,2023-03-07&user_rating=6.0,10.0&num_votes=40000,&languages=en&view=simple&count=250&start=501&ref_=adv_nxt"

# html_file1 = URI.open(url_top1).read
# html_doc1 = Nokogiri::HTML.parse(html_file1)

# html_doc1.search(".lister-item-header a").each do |element|
#   ids_array.push(element.attribute("href").value.split('/')[2])
# end

# # html_file2 = URI.open(url_top2).read
# # html_doc2 = Nokogiri::HTML.parse(html_file2)

# # html_doc2.search(".lister-item-header a").each do |element|
# #   ids_array.push(element.attribute("href").value.split('/')[2])
# # end

# # html_file3 = URI.open(url_top3).read
# # html_doc3 = Nokogiri::HTML.parse(html_file3)

# # html_doc3.search(".lister-item-header a").each do |element|
# #   ids_array.push(element.attribute("href").value.split('/')[2])
# # end

# array = []

# ids_array.each do |omdb_id|
#   fp = "http://www.omdbapi.com/?i=#{omdb_id}&apikey=d965a803"
#   serialized_movie = URI.open(fp).read
#   movie = JSON.parse(serialized_movie)

#   url = URI("https://utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com/idlookup?source_id=#{omdb_id}&source=imdb&country=us")

#   http = Net::HTTP.new(url.host, url.port)
#   http.use_ssl = true
#   http.verify_mode = OpenSSL::SSL::VERIFY_NONE

#   request = Net::HTTP::Get.new(url) # regarder comment cacher la clé
#   request["X-RapidAPI-Key"] = ENV['UTELLY_KEY']
#   request["X-RapidAPI-Host"] = 'utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com'

#   response = http.request(request)
#   parsed_JSON = JSON.parse(response.body)

#   movies = { movies: array.push({
#     imbdid: movie["imdbID"],
#     title: movie["Title"],
#     synopsis: movie["Plot"],
#     picture_url: movie["Poster"],
#     year: movie["Year"],
#     duration: movie["Runtime"],
#     rating: movie["imdbRating"],
#     category: movie["Type"],
#     genre: movie["Genre"],
#     seasons: movie["totalSeasons"],
#     actors: movie["Actors"],
#     director: movie["Director"],
#     platform: (parsed_JSON["collection"]["locations"][0]["display_name"] if parsed_JSON["collection"] != {}),
#     plateform_url: (parsed_JSON["collection"]["locations"][0]["url"] if parsed_JSON["collection"] != {})
#     }
#   )}

#     # penser à retirer les films sans plateforme
#     # penser à seasons false quand à 0

#   filepath = "db/data/movies.json"
#   File.open(filepath, "wb") do |file|
#     file.write(JSON.generate(movies))
#   end
# end

# # User.all.each do |user|
# #   user.photo.purge
# # end

# # User.destroy_all

# # user1 = User.new(
# #   first_name: "Julie",
# #   last_name: "Brunet",
# #   age: 26,
# #   email: "julieb@lewagon.org",
# #   password: "123456"
# # )
# # user1.photo.attach(
# #   io: File.open('public/images/julie.jpg'),
# #   filename: 'anyname.jpg', # use the extension of the attached file here
# #   content_type: 'image/jpg' # use the mime type of the attached file here
# # )
# # user1.save!

# # user2 = User.new(
# #   first_name: "Maxime",
# #   last_name: "Coquerelle",
# #   age: 31,
# #   email: "maximec@lewagon.org",
# #   password: "123456"
# # )
# # user2.photo.attach(
# #   io: File.open('public/images/max.jpg'),
# #   filename: 'anyname.jpg', # use the extension of the attached file here
# #   content_type: 'image/jpg' # use the mime type of the attached file here
# # )
# # user2.save!

# # user3 = User.new(
# #   first_name: "Amélie",
# #   last_name: "Berthier",
# #   age: 24,
# #   email: "amélieb@lewagon.org",
# #   password: "123456"
# # )
# # user3.photo.attach(
# #   io: File.open('public/images/amelie.jpg'),
# #   filename: 'anyname.jpg', # use the extension of the attached file here
# #   content_type: 'image/jpg' # use the mime type of the attached file here
# # )
# # user3.save!

# # user4 = User.new(
# #   first_name: "Bastien",
# #   last_name: "Lafont",
# #   age: 29,
# #   email: "bastienl@lewagon.org",
# #   password: "123456"
# # )
# # user4.photo.attach(
# #   io: File.open('public/images/bastien.jpg'),
# #   filename: 'anyname.jpg', # use the extension of the attached file here
# #   content_type: 'image/jpg' # use the mime type of the attached file here
# # )
# # user4.save!
