puts "🌱 Seeding production (safe mode)..."

# ---- Genres (minimum 2 required) ----
genres = [
  { genre_id: 4, name: "Fighting", search_name: "fighting" },
  { genre_id: 5, name: "Shooter", search_name: "shooter" },
  { genre_id: 10, name: "Racing", search_name: "racing" }
]

genres.each do |g|
  Genre.find_or_create_by!(genre_id: g[:genre_id]) do |genre|
    genre.name = g[:name]
    genre.search_name = g[:search_name]
  end
end

puts "✅ Genres ready: #{Genre.count}"

# ---- Platforms ----
platforms = [
  { platform_id: 167, name: "PlayStation 5", search_name: "playstation5" },
  { platform_id: 169, name: "Xbox Series X|S", search_name: "xboxseriesxs" },
  { platform_id: 130, name: "Nintendo Switch", search_name: "nintendoswitch" }
]

platforms.each do |p|
  Platform.find_or_create_by!(platform_id: p[:platform_id]) do |platform|
    platform.name = p[:name]
    platform.search_name = p[:search_name]
  end
end

puts "✅ Platforms ready: #{Platform.count}"

# ---- Location ----
# location = Location.first || Location.create!(address: "Tokyo, Japan", latitude: 35.6762, longitude: 139.6503)

puts "✅ Location ready"

# ---- Ensure games ----
games_data = [
  {
    igdb_id: 11198,
    name: "The Legend of Zelda: Breath of the Wild",
    search_name: "thelegendofzeldabreathofthewild",
    genres: "[31]",  # Adventure
    platforms: "[130]",  # Nintendo Switch
    summary: "An open-world action-adventure game set in the kingdom of Hyrule.",
    url: "https://www.nintendo.com/games/detail/the-legend-of-zelda-breath-of-the-wild-switch",
    total_rating: 97,
    total_rating_count: 5000,
    cover_id: 11198,
    cover_url: "https://images.igdb.com/igdb/image/upload/t_thumb/co1uqy.jpg"
  },
  {
    igdb_id: 26192,
    name: "The Last of Us Part II",
    search_name: "thelastofuspartii",
    genres: "[31]",  # Adventure
    platforms: "[167]",  # PlayStation 5 (close enough for PS4)
    summary: "A narrative-driven action-adventure game set in a post-apocalyptic world.",
    url: "https://www.playstation.com/en-us/games/the-last-of-us-part-ii/",
    total_rating: 93,
    total_rating_count: 4000,
    cover_id: 26192,
    cover_url: "https://images.igdb.com/igdb/image/upload/t_thumb/co1lbd.jpg"
  },
  {
    igdb_id: 19560,
    name: "God of War (2018)",
    search_name: "godofwar2018",
    genres: "[31]",  # Adventure
    platforms: "[167]",  # PlayStation 5
    summary: "Kratos and Atreus embark on a journey through Norse mythology.",
    url: "https://www.playstation.com/en-us/games/god-of-war/",
    total_rating: 94,
    total_rating_count: 4500,
    cover_id: 19560,
    cover_url: "https://images.igdb.com/igdb/image/upload/t_thumb/co1tmu.jpg"
  },
  {
    igdb_id: 25076,
    name: "Red Dead Redemption 2",
    search_name: "reddeadredemption2",
    genres: "[31]",  # Adventure
    platforms: "[167,169]",  # PS5, Xbox Series
    summary: "An open-world action-adventure game set in the American Wild West.",
    url: "https://www.rockstargames.com/reddeadredemption2/",
    total_rating: 96,
    total_rating_count: 6000,
    cover_id: 25076,
    cover_url: "https://images.igdb.com/igdb/image/upload/t_thumb/co1q1f.jpg"
  },
  {
    igdb_id: 1942,
    name: "The Witcher 3: Wild Hunt",
    search_name: "thewitcher3wildhunt",
    genres: "[12,31]",  # Role-playing, Adventure
    platforms: "[6,167,169]",  # PC, PS5, Xbox Series
    summary: "A fantasy RPG following Geralt of Rivia on a quest to find his adopted daughter.",
    url: "https://www.thewitcher.com/en/witcher3",
    total_rating: 95,
    total_rating_count: 5500,
    cover_id: 1942,
    cover_url: "https://images.igdb.com/igdb/image/upload/t_thumb/co1wyy.jpg"
  },
  {
    igdb_id: 11194,
    name: "Super Mario Odyssey",
    search_name: "supermarioodyssey",
    genres: "[8,31]",  # Platform, Adventure
    platforms: "[130]",  # Nintendo Switch
    summary: "Mario embarks on a globe-trotting adventure with Cappy.",
    url: "https://www.nintendo.com/games/detail/super-mario-odyssey-switch",
    total_rating: 97,
    total_rating_count: 4800,
    cover_id: 11194,
    cover_url: "https://images.igdb.com/igdb/image/upload/t_thumb/co1tvi.jpg"
  },
  {
    igdb_id: 1020,
    name: "Grand Theft Auto V",
    search_name: "grandtheftautov",
    genres: "[5,31]",  # Shooter, Adventure
    platforms: "[6,167,169]",  # PC, PS5, Xbox Series
    summary: "An open-world action game set in Los Santos.",
    url: "https://www.rockstargames.com/gta-v",
    total_rating: 96,
    total_rating_count: 7000,
    cover_id: 1020,
    cover_url: "https://images.igdb.com/igdb/image/upload/t_thumb/co1uq1.jpg"
  },
  {
    igdb_id: 1905,
    name: "Fortnite",
    search_name: "fortnite",
    genres: "[5]",  # Shooter
    platforms: "[6,167,169,130]",  # PC, PS5, Xbox, Switch
    summary: "A battle royale game with building and shooting mechanics.",
    url: "https://www.epicgames.com/fortnite/en-US/home",
    total_rating: 78,
    total_rating_count: 10000,
    cover_id: 1905,
    cover_url: "https://images.igdb.com/igdb/image/upload/t_thumb/co1w7l.jpg"
  },
  {
    igdb_id: 121,
    name: "Minecraft",
    search_name: "minecraft",
    genres: "[9,31]",  # Puzzle, Adventure (approx)
    platforms: "[6,167,169,130]",  # PC, PS5, Xbox, Switch
    summary: "A sandbox game where players can build and explore.",
    url: "https://www.minecraft.net/en-us",
    total_rating: 93,
    total_rating_count: 8000,
    cover_id: 121,
    cover_url: "https://images.igdb.com/igdb/image/upload/t_thumb/co1x7n.jpg"
  },
  {
    igdb_id: 24794,
    name: "Call of Duty: Modern Warfare",
    search_name: "callofdutymodernwarfare",
    genres: "[5]",  # Shooter
    platforms: "[6,167,169]",  # PC, PS5, Xbox
    summary: "A first-person shooter with multiplayer and campaign modes.",
    url: "https://www.callofduty.com/modernwarfare",
    total_rating: 80,
    total_rating_count: 3000,
    cover_id: 24794,
    cover_url: "https://images.igdb.com/igdb/image/upload/t_thumb/co1rba.jpg"
  }
]

games = []
games_data.each do |data|
  game = Game.find_or_create_by!(igdb_id: data[:igdb_id]) do |g|
    g.name = data[:name]
    g.search_name = data[:search_name]
    g.genres = data[:genres]
    g.platforms = data[:platforms]
    g.summary = data[:summary]
    g.url = data[:url]
    g.total_rating = data[:total_rating]
    g.total_rating_count = data[:total_rating_count]
  end
  games << game

  Cover.find_or_create_by!(cover_id: data[:cover_id]) do |cover|
    cover.url = data[:cover_url]
    cover.game = game
  end
end

puts "✅ Games and covers ready: #{Game.count}"

# ---- Ensure user ----
user = User.first || User.create!(
  first_name: "Demo",
  last_name: "User",
  email: "demo@demo.com",
  username: "demo_user",
  password: "123456",
  password_confirmation: "123456",
  # location_id: location.id
)
puts "✅ User ready"

# ---- Ensure listing ----
Listing.find_or_create_by!(game: games.first, user: user) do |listing|
  listing.price = 1000
  listing.description = "Production seed listing"
  listing.max = 7
  listing.platform = Platform.first
end

puts "🎉 Production seed complete"
