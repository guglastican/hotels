# Geo Regions
puts "Started Seeding Geo Regions..."

nsw_state = GeoState.find_by(key: "nsw_au")

geo_regions = [
  { title: "Byron Bay", key: "byron_bay_nsw_au", geo_state: nsw_state },
  { title: "South Coast", key: "south_coast_nsw_au", geo_state: nsw_state }
]

geo_regions.each do |geo_region|
  GeoRegion.find_or_create_by(key: geo_region[:key]) do |r|
    r.geo_state = geo_region[:geo_state]
    r.title = geo_region[:title]
  end
end

puts "Finished Seeding Geo Regions!"
