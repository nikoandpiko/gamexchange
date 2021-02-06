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
request1.body = 'fields artworks,cover.*,category,screenshots.*, genres.name,name,rating, platforms; where platforms = (48,49,130) & rating > 80; limit 500;'

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
    if game[:cover].nil? || game[:platforms].nil? || game[:genres].nil? || game[:name].nil? || game[:cover][:url].nil? || game[:screenshots].nil?
        puts "passed"
    else
        puts "saved"
        game_genre = game[:genres][0][:name]
        game_image_small = game[:cover][:url]
        game_platforms = game[:platforms]
        game_name = game[:name]
        game_screenshot_small = game[:screenshots][0][:url]

        game_image_small = game_image_small.split("/")
        game_image_small[6] = "t_cover_big"
        game_image = game_image_small.join("/")

        game_screenshot_small = game_screenshot_small.split("/")
        game_screenshot_small[6] = "t_screenshot_huge"
        game_screenshot = game_screenshot_small.join("/")
        


        Game.create(
            title: game_name,
            genre: game_genre,
            image: game_image,
            platforms: game_platforms,
            screenshot: game_screenshot
        )
    end
end


puts "Seeded"




puts "Creating users"

User.create(
username: Faker::Games::Witcher.monster,
email: "1@1.com",
password: "123456",
avatar: Faker::Avatar.image
)

User.create(
username: Faker::Games::Witcher.monster,
email: "2@2.com",
password: "123456",
avatar: Faker::Avatar.image
)

User.create(
username: Faker::Games::Witcher.monster,
email: "3@3.com",
password: "123456",
avatar: Faker::Avatar.image
)

User.create(
username: Faker::Games::Witcher.monster,
email: "4@4.com",
password: "123456",
avatar: Faker::Avatar.image
)

User.create(
username: Faker::Games::Witcher.monster,
email: "5@5.com",
password: "123456",
avatar: Faker::Avatar.image
)

User.create(
username: Faker::Games::Witcher.monster,
email: "6@6.com",
password: "123456",
avatar: Faker::Avatar.image
)

User.create(
username: Faker::Games::Witcher.monster,
email: "7@7.com",
password: "123456",
avatar: Faker::Avatar.image
)

User.create(
username: Faker::Games::Witcher.monster,
email: "8@8.com",
password: "123456",
avatar: Faker::Avatar.image
)

User.create(
username: Faker::Games::Witcher.monster,
email: "9@9.com",
password: "123456",
avatar: Faker::Avatar.image
)

User.create(
username: Faker::Games::Witcher.monster,
email: "10@10.com",
password: "123456",
avatar: Faker::Avatar.image
)

User.create(
username: Faker::Games::Witcher.monster,
email: "11@11.com",
password: "123456",
avatar: Faker::Avatar.image
)

User.create(
username: Faker::Games::Witcher.monster,
email: "12@12.com",
password: "123456",
avatar: Faker::Avatar.image
)

User.create(
username: Faker::Games::Witcher.monster,
email: "13@13.com",
password: "123456",
avatar: Faker::Avatar.image
)

User.create(
username: Faker::Games::Witcher.monster,
email: "14@14.com",
password: "123456",
avatar: Faker::Avatar.image
)

User.create(
username: Faker::Games::Witcher.monster,
email: "15@15.com",
password: "123456",
avatar: Faker::Avatar.image
)


User.create(
username: Faker::Games::Witcher.monster,
email: "16@16.com",
password: "123456",
avatar: Faker::Avatar.image
)


User.create(
username: Faker::Games::Witcher.monster,
email: "17@17.com",
password: "123456",
avatar: Faker::Avatar.image
)

User.create(
username: Faker::Games::Witcher.monster,
email: "18@18.com",
password: "123456",
avatar: Faker::Avatar.image
)

User.create(
username: Faker::Games::Witcher.monster,
email: "19@19.com",
password: "123456",
avatar: Faker::Avatar.image
)

User.create(
username: Faker::Games::Witcher.monster,
email: "20@20.com",
password: "123456",
avatar: Faker::Avatar.image
)

User.create(
username: Faker::Games::Witcher.monster,
email: "21@21.com",
password: "123456",
avatar: Faker::Avatar.image
)

User.create(
username: Faker::Games::Witcher.monster,
email: "22@22.com",
password: "123456",
avatar: Faker::Avatar.image
)

User.create(
username: Faker::Games::Witcher.monster,
email: "23@23.com",
password: "123456",
avatar: Faker::Avatar.image
)

User.create(
username: Faker::Games::Witcher.monster,
email: "24@24.com",
password: "123456",
avatar: Faker::Avatar.image
)


users_for_seed = User.all 
games_for_seed = Game.all

500.times do
    game = games_for_seed.sample
    user = users_for_seed.sample
    if game.platforms.include?("130") && !game.platforms.include?("49") && !game.platforms.include?("48")
        Offer.create(
        user_id: user.id,
        game_id: game.id,
        platform: "Nintendo Switch"
        )
    elsif game.platforms.include?("48") && game.platforms.include?("49") && game.platforms.include?("130")
        Offer.create(
        user_id: user.id,
        game_id: game.id,
        platform: ["Xbox One", "Playstation 4", "Nintendo Switch"].sample
        )
    elsif game.platforms.include?("48") && game.platforms.include?("49") && !game.platforms.include?("130")
        Offer.create(
        user_id: user.id,
        game_id: game.id,
        platform: ["Xbox One", "Playstation 4"].sample
        )
    elsif game.platforms.include?("48") && !game.platforms.include?("49")
        Offer.create(
        user_id: user.id,
        game_id: game.id,
        platform: "Playstation 4"
        )
    elsif !game.platforms.include?("48") && game.platforms.include?("49")
        Offer.create(
        user_id: user.id,
        game_id: game.id,
        platform: "Xbox One"
        )
    end
end

puts "All done"