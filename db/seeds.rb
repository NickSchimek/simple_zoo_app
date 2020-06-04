# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Zoo.create! name: 'Oregon Zoo', address: '4001 SW Canyon Rd, Portland, OR 97221'
Zoo.create! name: 'Gaia Lion Zoo', address: '53-51 111th St, Corona, NY 11368'
Zoo.create! name: 'Moon Turtle Zoo', address: '9-８３ Uenokoen, Taito City, Tokyo 110-8711, Japan'

Zoo.all.each do |zoo|
  Animal.create! name: 'Giraffe', bio: 'giraffe bio', zoo: zoo
  Animal.create! name: 'Monkey', bio: 'monkey bio', zoo: zoo
  Animal.create! name: 'Hippo', bio: 'hippo bio', zoo: zoo
end
