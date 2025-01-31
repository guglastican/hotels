# Place Types
puts "Started Seeding Place Types..."

palce_types = [
  { title: "Beach", key: "beach" },
  { title: "Town", key: "town" }
]

palce_types.each do |place_type|
  PlaceType.find_or_create_by(key: place_type[:key]) do |r|
    r.title = place_type[:title]
  end
end

puts "Finished Seeding Place Types!"
