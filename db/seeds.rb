# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'net/https'
http1 = Net::HTTP.new('api.igdb.com', 443)
http1.use_ssl = true
request1 = Net::HTTP::Post.new(URI('https://api.igdb.com/v4/games'), {'Client-ID' => '9nu16mxtee9islxz909mkmudl8minu', 'Authorization' => 'Bearer sgbs6fxnj0thm1op0dzog9n5if0ygx'})
request1.body = 'fields artworks,cover.*,category,genres.name,name,rating, platforms; where platforms = 48  & rating > 70; limit 75;'

hash_as_string1 = http1.request(request1).body
playstation_games_data_array = eval(hash_as_string1)


http2 = Net::HTTP.new('api.igdb.com', 443)
http2.use_ssl = true
request2 = Net::HTTP::Post.new(URI('https://api.igdb.com/v4/games'), {'Client-ID' => '9nu16mxtee9islxz909mkmudl8minu', 'Authorization' => 'Bearer sgbs6fxnj0thm1op0dzog9n5if0ygx'})
request2.body = 'fields artworks,cover.*,category,genres.name,name,rating, platforms; where platforms = 130 & rating > 70; limit 75;'

hash_as_string2 = http2.request(request2).body
switch_games_data_array = eval(hash_as_string2)


http3 = Net::HTTP.new('api.igdb.com', 443)
http3.use_ssl = true
request3 = Net::HTTP::Post.new(URI('https://api.igdb.com/v4/games'), {'Client-ID' => '9nu16mxtee9islxz909mkmudl8minu', 'Authorization' => 'Bearer sgbs6fxnj0thm1op0dzog9n5if0ygx'})
request3.body = 'fields artworks,cover.*,category,genres.name,name,rating, platforms; where platforms = 49; limit 25;'

hash_as_string3 = http3.request(request3).body
xbox_games_data_array = eval(hash_as_string3)









puts "Cleaning up database"
Game.destroy_all
puts "All clean"

puts "Seeding playstation games"

100.times do 
    playstation_game = playstation_games_data_array.sample
    playstation_game_name = playstation_game[:name]
    playstation_game[:genres].nil? ? playstation_game_genre = "" : playstation_game_genre = playstation_game[:genres][0][:name]
    playstation_game_image_small = playstation_game[:cover][:url]

    playstation_game_image_small = playstation_game_image_small.split("/")
    playstation_game_image_small[6] = "t_cover_big"
    playstation_game_image = playstation_game_image_small.join("/")






    Game.create(
        title: playstation_game_name,
        platform: "Playstation 4",
        genre: playstation_game_genre,
        image: playstation_game_image
)
end
puts "Seeded"



puts "Seeding nintendo games"

100.times do 
    switch_game = switch_games_data_array.sample
    switch_game_name = switch_game[:name]
    switch_game[:genres].nil? ? switch_game_genre = "" : switch_game_genre = switch_game[:genres][0][:name]
    switch_game_image_small = switch_game[:cover][:url]

    switch_game_image_small = switch_game_image_small.split("/") 
    switch_game_image_small[6] = "t_cover_big"
    switch_game_image = switch_game_image_small.join("/")

    Game.create(
        title: switch_game_name,
        platform: "Nintendo Switch",
        genre: switch_game_genre,
        image: switch_game_image
)
end
puts "Seeded"


puts "Seeding xbox one games"

50.times do 
    xbox_game = xbox_games_data_array.sample
    xbox_game_name = xbox_game[:name]
    xbox_game[:genres].nil? ? xbox_game_genre = "" : xbox_game_genre = xbox_game[:genres][0][:name]
    xbox_game[:cover][:url].nil? ? xbox_game_image_small = "" : xbox_game_image_small = xbox_game[:cover][:url]

    xbox_game_image_small = xbox_game_image_small.split("/")
    xbox_game_image_small[6] = "t_cover_big"
    xbox_game_image = xbox_game_image_small.join("/")


    Game.create(
        title: xbox_game_name,
        platform: "Xbox One",
        genre: xbox_game_genre,
        image: xbox_game_image
)
end
puts "Seeded"