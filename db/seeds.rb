# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Van.destroy_all
User.destroy_all

user = User.create!(first_name: "Beryl", last_name:"Armand", email: "beryl.armand@gmail.com", password: "password")
user2 = User.create!(first_name: "Tanguy", last_name:"Leveque", email: "leveque.tanguy@outlook.fr", password: "password")
user3 = User.create!(first_name: "Sophie", last_name:"Crenet", email: "sophie.crenet@gmail.com", password: "password")

puts "Creating vans..."
file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615970962/Van1_thug49.jpg')
Van1 = Van.new(user: user, van_type: vintage, name: "1975 Mitsubishi L300 Sportpac", passengers: 2, description:"Replongez dans les années 70 avec ce modèle L300 Sportpac, aménagé pour un confort à 2 personnes. Vous apprécierez ses vitres tintées qui vous permettrons de profiter des paysages tout en respectant votre intimité depuis l'extèrieur. Lit 2 places, rangements, kitchenette, et douchette à placer à l'extèrieur.", price_per_night: 62)
Van1.photos.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615970962/Van2_kosuwi.jpg')
Van2 = Van.new(user: user, van_type: vintage, name: "1976 Volkswagen T2B", passengers: 4, description:"Evadez-vous à bord d'un mythique combi T2 qui a été entièrement modelé pour un confort de voyage pour 4 personnes, avec son toît dépliable qui permet d'avoir deux couchages supplémentaires. 2 lits de 2 places, rangements, kitchenette, et douchette à placer à l'exterieur.", price_per_night: 95)
Van2.photos.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615970962/Van3_emmzp3.jpg')
Van3 = Van.new(user: user, van_type: vintage, name: "1981 Volkswagen Transporter T1", passengers: 6, description:"Edition limitée - Vivez une experience innoubliable dans cet ancien combi des années 80, totalement remmodelé sur-mesure pour un voyage à 6 personnes avec de l'espace. 6 places assises pour les déplacements. 6 couchages, rangements, kitchenette, toilettes et douchettes à l'intérieur.", price_per_night: 240)
Van3.photos.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615970962/Van4_wr5ypz.jpg')
Van4 = Van.new(user: user, van_type: moderne, name: "2018 Volkswagen California T5", passengers: 2, description:"A la pointe de la modernité, le VW T5 California vous accompagnera dans votre voyage de courte ou longue durée avec 2 sièges seulement qui nous ont permis de libérer de l'espace à l'arrière pour intégrer une vraie kitchenette, un frigo, un couchage 2 places. Climatisation de cabine, toilettes portatives et douche extérieure.", price_per_night: 150)
Van4.photos.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615970962/Van5_yygqw6.jpg')
Van5 = Van.new(user: user, van_type: moderne, name: "2018 Volkswagen Transporter T5", passengers: 4, description:"Le VW Transporte T5 vous apportera un grand confort pour un voyage à 4 grâce à son toît dépliable qui vous permet de rester debout à l'intèrieur et de vous garantir 2 couchages supplémentaires. Kitchenette, un frigo, climatisation de cabine, toilettes portatives et douche extérieure.", price_per_night: 200)
Van5.photos.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615970962/Van6_dbntf1.jpg')
Van6 = Van.new(user: user, van_type: moderne, name: "2019 Volkswagen Transporter T6", passengers: 6, description:"Le VW Transporter T6 vous apportera un grand confort pour un voyage à 6 grâce à son toît dépliable qui vous permet de rester debout à l'interieur et de vous garantir 2 couchages supplémentaires en haut. 2 couchages en bas. Kitchenette, un frigo, climatisation de cabine, toilettes portatives et douche extérieure.", price_per_night: 240)
Van6.photos.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615970963/Van7_glljzq.jpg')
Van7 = Van.new(user: user, van_type: luxe, name: "2019 Mercedes-Benz Marco Polo", passengers: 2, description:"Un compagnon de vacances qui facilitera votre quotidien avec un intérieur qui vous apportera toutes les dernières fonctionnalités tendances. Télévision, kitchenette, un frigo, un congélateur, climatisation de cabine, toilettes portatives et douche extérieure.", price_per_night: 220)
Van7.photos.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615970963/Van8_ef02lk.jpg')
Van8 = Van.new(user: user, van_type: luxe, name: "2020 Mercedes-Benz Marco Polo HORIZON", passengers: 4, description:"Libérez-vous et partez à l'aventure dans le nouveau modèle spécial ArtVenture. La Marco Polo facilitera votre quotidien grâce à son toît dépliable qui donne accès à un lit 2 places spacieux. L'intérieur du véhicule vous apportera toutes les dernières fonctionnalités tendances. Télévision, kitchenette, un frigo, un congélateur, climatisation de cabine, toilettes portatives et douche extérieure.", price_per_night: 280)
Van8.photos.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615970963/Van9_tfc7pc.jpg')
Van9 = Van.new(user: user, van_type: luxe, name: "1982 Combi Volkswagen California", passengers: 6, description:"Edition limitée - Grâce à notre petite pépite, vous vivrez une experience innoubliable dans cet ancien combi des années 80, totalement imaginé pour un voyage à 6 personnes avec de l'espace pour voyager confortablement. 6 places assises pour les déplacements. 6 couchages, télévision, rangements, kitchenette, toilettes et douchettes à l'intérieur.", price_per_night: 480)
Van9.photos.attach(io: file, filename: 'nes', content_type: 'image/jpg')

[Van1, Van2, Van3, Van4, Van5, Van6, Van7, Van8, Van9].each do |van_instance|
  van_instance.save

  puts "Created #{van_instance.name}"
  end
  puts "Finished!
