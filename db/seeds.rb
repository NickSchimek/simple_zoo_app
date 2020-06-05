# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a = Zoo.create! name: 'Oregon Zoo', address: '4001 SW Canyon Rd, Portland, OR 97221'
b = Zoo.create! name: 'Gaia Lion Zoo', address: '53-51 111th St, Corona, NY 11368'
c = Zoo.create! name: 'Moon Turtle Zoo', address: '9-８３ Uenokoen, Taito City, Tokyo 110-8711, Japan'

a.image.attach(io: File.open('app/assets/images/zoo.png'), filename: 'zoo.png')
b.image.attach(io: File.open('app/assets/images/zoo2.jpeg'), filename: 'zoo2.jpeg')
c.image.attach(io: File.open('app/assets/images/zoo3.jpeg'), filename: 'zoo3.jpeg')

Zoo.all.each do |zoo|
  a = Animal.create! name: 'Giraffe', bio: 'giraffe bio', zoo: zoo
  b = Animal.create! name: 'Monkey', bio: 'monkey bio', zoo: zoo
  c = Animal.create! name: 'Hippo', bio: 'hippo bio', zoo: zoo

  a.image.attach(io: File.open('app/assets/images/giraffe.jpg'), filename: 'giraffe.jpg')
  b.image.attach(io: File.open('app/assets/images/monkey.jpg'), filename: 'monkey.jpg')
  c.image.attach(io: File.open('app/assets/images/hippo.jpg'), filename: 'hippo.jpg')
end
