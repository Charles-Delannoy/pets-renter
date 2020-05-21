# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroy bookings"
Booking.destroy_all
puts "Destroy pets"
Pet.destroy_all
puts "Destroy users"
User.destroy_all

base_url = "https://source.unsplash.com/400x300/?"
hm = ["men", "woman"]
types = ["Chien", "Chat"]
races_chien = ["labrador", "golden retriever", "bouvier", "bouledog"]
races_chat = ["bengal", "burmilla", "korat", "munchkin"]
noms = ["Riesling", "Tigger", "Max", "Charlie", "Rox", "Roukie", "Oliver", "Oreo", "Fluffy", "Jake", "Nurmi", "Bourgueil", "Catty", "Steve", "Leo"]


i = 1
j = 1
10.times do
  first = "firstname#{i}"
  last = "lastname#{i}"
  email = "mail#{i}@pet.com"
  password = "lewagon"
  sex = hm.sample
  profile_url = base_url + sex
  p_img = URI.open(profile_url)
  @user = User.new(first_name: first, last_name: last, email: email, password: password)
  @user.photo.attach(io: p_img, filename: "#{first}.png", content_type: 'image/png')
  @user.save
  i += 1
  5.times do
    type = types.sample
    if type == "Chien"
      race = races_chien.sample
    else
      race = races_chat.sample
    end
    pet_url = base_url + race
    pet_img = URI.open(pet_url)
    nom = noms.sample
    birth = "2019-05-20"
    address = "3 rue guynemer, Paris"
    descr = "C'est un #{type} de race #{race} super mignon. Parfait pour chopper ;)"
    @pet = Pet.new(name: nom, description: descr, birthdate: birth, pet_type: type, race: race, address: address)
    @pet.user = @user
    @pet.photo.attach(io: pet_img, filename: "#{nom}#{j}.png", content_type: 'image/png')
    @pet.save
    j += 1
  end
end

puts "SUCCESS"
