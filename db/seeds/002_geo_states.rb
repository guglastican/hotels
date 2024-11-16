# Geo States
puts "Started Seeding Geo States..."

geo_states = [
  { title: "New South Wales", key: "nsw_au", code: "NSW" },
]

geo_states.each do |geo_state|
  GeoState.find_or_create_by(key: geo_state[:key]) do |r|
    r.code = geo_state[:code]
    r.title = geo_state[:title]
  end
end

puts "Finished Seeding Geo States!"
