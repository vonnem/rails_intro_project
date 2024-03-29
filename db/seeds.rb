require "csv"

Anime.delete_all
Studio.delete_all
AnimeGenre.delete_all
Genre.delete_all

topanimes = Rails.root.join("db/top250_anime.csv")

# testing if file path is correct
puts topanimes

csv_data = File.read(topanimes)
animes = CSV.parse(csv_data, headers: true, encoding: "utf-8")

animes.each do |a|
  # test
  # puts a["Title"]
  studio = Studio.find_or_create_by(studio_name: a["Studio"])

  if studio && studio.valid?
    anime = studio.animes.create(
      episodes: a["Episodes"],
      title: a["Title"],
      score: a["Score"],
      popularity: a["Popularity"],
      duration: a["Duration"],
      start_date: a["Start_date"],
      end_date: a["End_date"],
      members: a["Members"]

    )
    if anime && anime.valid?
      puts a["Title"]
      genres = a["Genre"].split(",").map(&:strip)
      genres.each do |gn|
        genre = Genre.find_or_create_by(genre_name: gn)
        AnimeGenre.create(anime:anime, genre: genre)
      end
    else
      puts "Invalid anime: #{a["Title"]}"
    end
  else
    puts "invalid studio: #{a["Studio"]}"
  end
end
puts "Created #{Studio.count} studios."
puts "Created #{Anime.count} animes."
puts "Created #{Genre.count} genres"
puts "Created #{AnimeGenre.count} Anime Genres"

