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
