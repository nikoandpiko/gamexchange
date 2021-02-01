# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# puts "Cleaning statuses"
# Rental.destroy_all
# puts "ピカピカ"
# puts "Creating statuses"
# statuses.each do |v|
#   Rental.create(status: v)
# end
# puts "Finish 1st part"


require 'net/https'
http1 = Net::HTTP.new('api.igdb.com', 443)
http1.use_ssl = true
request1 = Net::HTTP::Post.new(URI('https://api.igdb.com/v4/games'), {'Client-ID' => '9nu16mxtee9islxz909mkmudl8minu', 'Authorization' => 'Bearer sgbs6fxnj0thm1op0dzog9n5if0ygx'})
request1.body = 'fields artworks,cover.*,category,genres.name,name,rating, platforms; where platforms = (48,49,130) & rating > 80; limit 500;'

hash_as_string1 = http1.request(request1).body
games_data_array = eval(hash_as_string1)




puts "Cleaning up database"

Rental.destroy_all
Offer.destroy_all
User.destroy_all
Game.destroy_all
puts "All clean"

puts "Seeding games"


games_data_array.each do |game|
    if game[:cover].nil? || game[:platforms].nil? || game[:genres].nil? || game[:name].nil? || game[:cover][:url].nil?
        puts "passed"
    else
        puts "saved"
        game_genre = game[:genres][0][:name]
        game_image_small = game[:cover][:url]
        game_platforms = game[:platforms]
        game_name = game[:name]

        game_image_small = game_image_small.split("/")
        game_image_small[6] = "t_cover_big"
        game_image = game_image_small.join("/")
        


        Game.create(
            title: game_name,
            genre: game_genre,
            image: game_image,
            platforms: game_platforms
        )
    end
end


puts "Seeded"




puts "Creating users"

User.create(
username: Faker::Games::Witcher.monster,
email: "1@1.com",
password: "123456"
)

User.create(
username: Faker::Games::Witcher.monster,
email: "2@2.com",
password: "123456"
)

User.create(
username: Faker::Games::Witcher.monster,
email: "3@3.com",
password: "123456"
)

User.create(
username: Faker::Games::Witcher.monster,
email: "4@4.com",
password: "123456"
)

User.create(
username: Faker::Games::Witcher.monster,
email: "5@5.com",
password: "123456"
)

User.create(
username: Faker::Games::Witcher.monster,
email: "6@6.com",
password: "123456"
)

User.create(
username: Faker::Games::Witcher.monster,
email: "7@7.com",
password: "123456"
)

User.create(
username: Faker::Games::Witcher.monster,
email: "8@8.com",
password: "123456"
)

User.create(
username: Faker::Games::Witcher.monster,
email: "9@9.com",
password: "123456"
)

User.create(
username: Faker::Games::Witcher.monster,
email: "10@10.com",
password: "123456"
)

User.create(
username: Faker::Games::Witcher.monster,
email: "11@11.com",
password: "123456"
)

User.create(
username: Faker::Games::Witcher.monster,
email: "12@12.com",
password: "123456"
)

users_for_seed = User.all 
user_ids_for_seed = []
users_for_seed.each do |user|
    user_ids_for_seed << user.id
end

games_for_seed = Game.all
game_ids_for_seed = []
games_for_seed.each do |game|
    game_ids_for_seed << game.id
end

200.times do
    Offer.create(
    user_id: user_ids_for_seed.sample,
    game_id: game_ids_for_seed.sample,
)
end