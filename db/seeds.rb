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
request1.body = 'fields artworks,cover,category,genres.name,name,rating, platforms; where platforms = 48  & rating > 70; limit 3;'

hash_as_string1 = http1.request(request1).body
playstation_games_data_array = eval(hash_as_string1)


http2 = Net::HTTP.new('api.igdb.com', 443)
http2.use_ssl = true
request2 = Net::HTTP::Post.new(URI('https://api.igdb.com/v4/games'), {'Client-ID' => '9nu16mxtee9islxz909mkmudl8minu', 'Authorization' => 'Bearer sgbs6fxnj0thm1op0dzog9n5if0ygx'})
request2.body = 'fields artworks,cover,category,genres.name,name,rating, platforms; where platforms = 130 & rating > 70; limit 100;'

hash_as_string2 = http2.request(request2).body
switch_games_data_array = eval(hash_as_string2)


http3 = Net::HTTP.new('api.igdb.com', 443)
http3.use_ssl = true
request3 = Net::HTTP::Post.new(URI('https://api.igdb.com/v4/games'), {'Client-ID' => '9nu16mxtee9islxz909mkmudl8minu', 'Authorization' => 'Bearer sgbs6fxnj0thm1op0dzog9n5if0ygx'})
request3.body = 'fields artworks,cover,category,genres.name,name,rating, platforms; where platforms = 49; limit 100;'

hash_as_string3 = http3.request(request3).body
xbox_games_data_array = eval(hash_as_string3)




puts "Cleaning up database"
Game.destroy_all
puts "All clean"

puts "Seeding playstation games"

300.times do 
    playstation_game = playstation_games_data_array.sample
    playstation_game_name = playstation_game[:name]
    playstation_game[:genres].nil? ? playstation_game_genre = "" : playstation_game_genre = playstation_game[:genres][0][:name]
    playstation_game_cover_id = playstation_game[:cover]

    http1 = Net::HTTP.new('api.igdb.com', 443)
    http1.use_ssl = true
    request1 = Net::HTTP::Post.new(URI('https://api.igdb.com/v4/covers'), {'Client-ID' => '9nu16mxtee9islxz909mkmudl8minu', 'Authorization' => 'Bearer sgbs6fxnj0thm1op0dzog9n5if0ygx'})
    request1.body = 'fields image_id, url, height, width; limit 5;'

    hash_as_string1 = http1.request(request1).body
    playstation_games_data_array = eval(hash_as_string1)

    Game.create(
        title: playstation_game_name,
        platform: "Playstation 4",
        genre: playstation_game_genre
)
end
puts "Seeded"



puts "Seeding nintendo games"

300.times do 
    switch_game = switch_games_data_array.sample
    switch_game_name = switch_game[:name]
    switch_game[:genres].nil? ? switch_game_genre = "" : switch_game_genre = switch_game[:genres][0][:name]

    Game.create(
        title: switch_game_name,
        platform: "Nintendo Switch",
        genre: switch_game_genre
)
end
puts "Seeded"


puts "Seeding xbox one games"

300.times do 
    xbox_game = xbox_games_data_array.sample
    xbox_game_name = xbox_game[:name]
    xbox_game[:genres].nil? ? xbox_game_genre = "" : xbox_game_genre = xbox_game[:genres][0][:name]

    Game.create(
        title: xbox_game_name,
        platform: "Xbox One",
        genre: xbox_game_genre
)
end
puts "Seeded"


