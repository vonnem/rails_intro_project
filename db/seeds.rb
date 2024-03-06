require "csv"

Anime.delete_all
Studio.delete_all

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
      score: a["Score"]
    )
    if anime && anime.valid?
      puts a["Title"]
    else
      puts "Invalid anime: #{a["Title"]}"
    end
  else
    puts "invalid studio: #{a["Studio"]}"
  end
end
puts "Created #{Studio.count} studios."
puts "Created #{Anime.count} animes."

