# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

users = [
  {
    email: "beryl.armand@gmail.com",
    password: "password"
  },
  {
    email: "leveque.tanguy@outlook.fr",
    password: "password"
  },
  {
    email: "sophie.crenet@gmail.com",
    password: "password"
  }
]

vans = [
  {
    van_type: "vintage",
    name: "1975 Mitsubishi L300 Sportpac",
    passengers: 2,
    description:"Replongez dans les années 70 avec ce modèle L300 Sportpac, aménagé pour un confort à 2 personnes. Vous apprécierez ses vitres tintées qui vous permettrons de profiter des paysages tout en respectant votre intimité depuis l'extèrieur. Lit 2 places, rangements, kitchenette, et douchette à placer à l'extèrieur.",
    price_per_night: 62,
    file: 'https://res.cloudinary.com/dskkiywgj/image/upload/v1615970962/Van1_thug49.jpg'
  }

  {
    van_type: "vintage",
    name: "1976 Volkswagen T2B",
    passengers: 4,
    description:"Evadez-vous à bord d'un mythique combi T2 qui a été entièrement modelé pour un confort de voyage pour 4 personnes, avec son toît dépliable qui permet d'avoir deux couchages supplémentaires. 2 lits de 2 places, rangements, kitchenette, et douchette à placer à l'exterieur.",
    price_per_night: 95,
    file: 'https://res.cloudinary.com/dskkiywgj/image/upload/v1615970962/Van2_kosuwi.jpg'
  }

  {
    van_type: "vintage",
    name: "1981 Volkswagen Transporter T1",
    passengers: 6,
    description:"Edition limitée - Vivez une experience innoubliable dans cet ancien combi des années 80, totalement remmodelé sur-mesure pour un voyage à 6 personnes avec de l'espace. 6 places assises pour les déplacements. 6 couchages, rangements, kitchenette, toilettes et douchettes à l'intérieur.",
    price_per_night: 240,
    file: 'https://res.cloudinary.com/dskkiywgj/image/upload/v1615970962/Van3_emmzp3.jpg'
  }

  {
    van_type: "moderne",
    name: "2018 Volkswagen California T5",
    passengers: 2,
    description:"A la pointe de la modernité, le VW T5 California vous accompagnera dans votre voyage de courte ou longue durée avec 2 sièges seulement qui nous ont permis de libérer de l'espace à l'arrière pour intégrer une vraie kitchenette, un frigo, un couchage 2 places. Climatisation de cabine, toilettes portatives et douche extérieure.",
    price_per_night: 150,
    file: 'https://res.cloudinary.com/dskkiywgj/image/upload/v1615970962/Van4_wr5ypz.jpg'
  }

  {
    van_type: "moderne",
    name: "2018 Volkswagen Transporter T5",
    passengers: 4,
    description:"Le VW Transporte T5 vous apportera un grand confort pour un voyage à 4 grâce à son toît dépliable qui vous permet de rester debout à l'intèrieur et de vous garantir 2 couchages supplémentaires. Kitchenette, un frigo, climatisation de cabine, toilettes portatives et douche extérieure.",
    price_per_night: 200,
    file: 'https://res.cloudinary.com/dskkiywgj/image/upload/v1615970962/Van5_yygqw6.jpg'
  }

  {
    van_type: "moderne",
    name: "2019 Volkswagen Transporter T6",
    passengers: 6,
    description:"Le VW Transporter T6 vous apportera un grand confort pour un voyage à 6 grâce à son toît dépliable qui vous permet de rester debout à l'interieur et de vous garantir 2 couchages supplémentaires en haut. 2 couchages en bas. Kitchenette, un frigo, climatisation de cabine, toilettes portatives et douche extérieure.",
    price_per_night: 240,
    file: 'https://res.cloudinary.com/dskkiywgj/image/upload/v1615970962/Van6_dbntf1.jpg'
  }

  {
    van_type: "luxe",
    name: "2019 Mercedes-Benz Marco Polo",
    passengers: 2,
    description:"Un compagnon de vacances qui facilitera votre quotidien avec un intérieur qui vous apportera toutes les dernières fonctionnalités tendances. Télévision, kitchenette, un frigo, un congélateur, climatisation de cabine, toilettes portatives et douche extérieure.",
    price_per_night: 220,
    file: 'https://res.cloudinary.com/dskkiywgj/image/upload/v1615970963/Van7_glljzq.jpg'
  }

  {
    van_type: "luxe",
    name: "2020 Mercedes-Benz Marco Polo HORIZON",
    passengers: 4,
    description:"Libérez-vous et partez à l'aventure dans le nouveau modèle spécial ArtVenture. La Marco Polo facilitera votre quotidien grâce à son toît dépliable qui donne accès à un lit 2 places spacieux. L'intérieur du véhicule vous apportera toutes les dernières fonctionnalités tendances. Télévision, kitchenette, un frigo, un congélateur, climatisation de cabine, toilettes portatives et douche extérieure.",
    price_per_night: 280,
    file: 'https://res.cloudinary.com/dskkiywgj/image/upload/v1615970963/Van8_ef02lk.jpg'
  }

  {
    van_type: "luxe",
    name: "1982 Combi Volkswagen California",
    passengers: 6,
    description:"Edition limitée - Grâce à notre petite pépite, vous vivrez une experience innoubliable dans cet ancien combi des années 80, totalement imaginé pour un voyage à 6 personnes avec de l'espace pour voyager confortablement. 6 places assises pour les déplacements. 6 couchages, télévision, rangements, kitchenette, toilettes et douchettes à l'intérieur.",
    price_per_night: 480,
    file: 'https://res.cloudinary.com/dskkiywgj/image/upload/v1615970963/Van9_tfc7pc.jpg'
  }

]

Van.destroy_all
User.destroy_all
Place.destroy_all
Activity.destroy_all

users.each do |user_hash|
  User.create!(user_hash)
end

vans.each do |van_hash|
  file = URI.open(van_hash[:file])
  van = Van.create!(van_hash.except(:file))
  van.photo.attach(io: file, filename: van.name + " photo", content_type: 'image/jpg')
  if van.save
    puts "Created #{van.name}"
  end
end

puts "Creating places..."
file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615989555/Place1_udwxxf.png')
place1 = Place.new(name: "Camping de Cassis Les Cigales **", address:"43 Avenue de la Marne 13260 Cassis", sleeping_type:"confort", description:"Camping situé dans les hauteurs de Cassis à 20min à pied du centre ville et à 1h des calanques. Vous pourrez profitez des sanitaires et douches, très propres, de la piscine et d'emplacements privilégiés où poser votre van avec une vue mer.")
place1.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('')
place19 = Place.new(name: "Camping du Garlaban", address:"1914 Chemin de la Thuilière, 13400 Aubagne", sleeping_type:"confort", description:"L​e Camping est idéalement situé pour visiter la Provence à votre rythme. Partez à la découverte de Marseille, du Parc National des Calanques ou du massif du Garlaban. Découvrez également les authentiques villes et villages provençaux situés aux alentours: Aubagne, Cassis, La Ciotat et les fameux villages de Pagnol à Marseille.")
place19.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

# file = URI.open('')
# place20 = Place.new(name: "", address:"", sleeping_type:"confort", description:"")
# place20.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615989555/Place2_rm34kz.jpg')
place2 = Place.new(name: "Camping Les Pouverels", address:"3070 Les Pouverels 83570 Cotignac", sleeping_type:"confort", description:"Accueil très sympa, prix raisonnable. Calme. A quelques minutes de la cascade de Sillans. Très joli village provençal à visiter avec habitations troglodytes. Sanitaires et douches.")
place2.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615989555/Place3_yqyqdj.jpg')
place3 = Place.new(name: "Camping Provence Vallée ***", address:"1124-1150 Avenue de la Repasse 04100 Manosque", sleeping_type:"confort", description:"Camping avec piscine et aire de jeux, bien ombragé au calme à proximité de la ville. Très bon accueil et chaleureux, Charlene et Clément sont adorables et disponibles, grands emplacements pour les camping-cars, séparés par des haies et ombragés.")
place3.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615989555/Place4_v7osjo.jpg')
place4 = Place.new(name: "Camping La sorguette", address:"Chemin de la Petite Isle 84800 L'Isle-sur-la-Sorgue", sleeping_type:"confort", description:"Le camping dispose d'un emplacement charmant au bord d'une rivière, les emplacements sont bien ombragé et au calme. Vous pourrez profitez de la piscine du camping et des animations sont organisées le soir si vous le souhaitez. Douches et sanitaires très propres.")
place4.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615989555/Place5_wy8qnx.jpg')
place5 = Place.new(name: "Camping Fontvieille ***", address:"114 Rue Michelet 13990 Fontvieille", sleeping_type:"confort", description:"Personnel, chaleureux et accueillant, vous conseille pour les idées de sorties. Accès au village par un sentier derrière le camping. Camping très propre, bien entretenu.")
place5.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615990627/camping6_g8pgs0.jpg')
place6 = Place.new(name: "Camping Municipal Bottaïe ***", address:"30 Avenue Frédéric Mistral, 13110 Port-de-Bouc", sleeping_type:"confort", description:"Le Bottai est classé 3 étoiles. Camping familial de 80 emplacements avec des hébergements se situant à 10 m d'une petite plage. Piscine avec tobbogans, animations le soir, plage privative, emplacments spacieux.")
place6.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615995045/chezgg_pkc8ds.jpg')
place7 = Place.new(name: "Chez Annette & Gérard", address:"4 Avenue de la Marne 13260 Cassis", sleeping_type:"authentique", description:"Bonjour! Nous sommes ravis de vous accueillir aux portes de Marseille! Vous profiterez du calme de la campagne aux portes de la ville! Le terrain est plat et ombragé car arboré, orienté Nord. L'accès est facile et indépendant. Une petite piscine pour vous rafraichir.")
place7.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615992255/chezlaurent_ckrmtn.jpg')
place8 = Place.new(name: "Chez Laurent", address:"Chemin de Salernes, 83570 Cotignac", sleeping_type:"authentique", description:"Le site est situé à flanc de colline, entièrement agencé en terrasses, au sein d’un écrin forestier. Il s’agit d’une très ancienne oliveraie, longtemps abandonnée, et que je restaure petit à petit. L'objectif à terme, hormis la culture d'oliviers et de figuiers, est de trouver, dans un lieu où la nature est préservée, différentes formes d'art et de bien-être. Pour l'instant bien sûr, le lieu est encore en grand chantier, et beaucoup reste à faire... A part ça, vous serez ici au calme et la nuit venue, préservé de toute pollution lumineuse donc sous un superbe ciel étoilé. :)")
place8.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615996605/ChezBera_nlf1bx.jpg')
place9 = Place.new(name: "Chez Bérangère", address:"59 Rue Paul Cézanne, 04100 Manosque", sleeping_type:"authentique", description:"Au milieu de la campagne provençale, à 3 km du village, pleine nature, vue imprenable, calme assuré....Parfait pour les amoureux de la nature ! Vous serez au milieu des champs de lavande, dans un cadre exceptionnel, avec la tranquillité et le bon air de Provence, à 100 mètres de la route départementale.")
place9.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615997037/chezjojo_pbdikz.jpg')
place10 = Place.new(name: "Chez Joseph et Irène", address:"56 Rue Paul Arène, 84800 L'Isle-sur-la-Sorgue", sleeping_type:"authentique", description:"Bienvenue chez nous! Nous vous recevrons au chant des cigales en pleine campagne, au calme et en pleine nature, à quelques kilomètres de l'Isle sur la sorgue.")
place10.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615997582/chezlauriane_agfwja.jpg')
place11 = Place.new(name: "Chez Henri et Lauriane", address:"1 Chemin des Muraillettes, 13200 Arles", sleeping_type:"authentique", description:"Entouré de nature, bordé de platanes, au calme entre vignes-prairies et chevaux.Le Domaine étant vaste, le choix de l'endroit de l'installation est grand : à l'ombre ou non, éloigné ou non des sanitaires et des équipements de détente.Dans le Domaine : piscine, beach volley, pétanque, ping-pong, trampoline, balançoire, de ballons, trampoline.")
place11.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615998250/claire_mvlemh.jpg')
place12 = Place.new(name: "Chez Claire et Maxime", address:"2-20 Rue des Cordonniers, 13500 Martigues", sleeping_type:"authentique", description:"Cadre idyllique sous les pins méditerranéens, à deux pas de la mer turquoise de la côte bleue.Emplacements à l'ombre de grands pins centenaires.Accès permanent aux sanitaires de la maison.")
place12.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615993390/routeok_vgw5au.jpg')
place13 = Place.new(name: "Aire de repos Cassis", address:"Chemin du Passage d'Oullier, 13260 Cassis", sleeping_type:"nature", description:"Aire de repos magique avec cette vue époustouflante, du côté gauche , la route des crêtes reliant La ciotat à Cassis, au milieu, vous surplombez Cassis et de l'autre côté, vous avez une vue sur les calanques. Sanitaires très propres.")
place13.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615995756/repos_khyxh7.jpg')
place14 = Place.new(name: "Air de repos 511", address:"511 Route des Quatre Chemins 83690 Salernes", sleeping_type:"nature", description:"Endroit calme, au bord de la rivière, avec équipements gratuit : vidange eaux noires, eaux grises et remplissage d’eau. L'air de repos est agréable et proche de la route à emprunter pour accéder à la cascade de Sillans.")
place14.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615999084/leclosdaubert_hmbr66.jpg')
place15 = Place.new(name: "Air de stationnement Le Clos d'Aubert", address:"Le Clos d'Aubert 04180 Villeneuve", sleeping_type:"nature", description:"Au coeur du village, très calme. Aire de service gratuite avec possibilité de parking la nuit, accès par le chemin des Oliviers, 5 emplacements maximum 48h.")
place15.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1615999526/montventoux_vzevrb.jpg')
place16 = Place.new(name: "Aire de stationnement Mormoiron", address:"411 Le Fournet 84570 Mormoiron", sleeping_type:"nature", description:"Grands emplacements stabilisés disponibles avec une très belle vue sur le Mont Ventoux. Calme, dans un quartier résidentiel à coté du Pumtrack et d'un parcours santé. L'aire est sous vidéo surveillance.")
place16.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1616001321/aire_jnteqd.jpg')
place17 = Place.new(name: "Aire de stationnement Route d'Aramon", address:"Route d'Aramon 30300 Vallabrègues", sleeping_type:"nature", description:"Petit parc ombragé, table de pique-nique, à proximité du village. Borne Euro Relais 2 €, endroit sympa")
place17.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

file = URI.open('https://res.cloudinary.com/dskkiywgj/image/upload/v1616001823/martigues_grvcag.jpg')
place18 = Place.create!(
  name: "Air de stationnement Saint-Martin-de-Crau",
  address:"Place François Mitterrand 13310 Saint-Martin-de-Crau",
  sleeping_type:"nature",
  description:"Petit parc ombragé, table de pique-nique, à proximité du village. Borne Euro Relais 2 €, endroit sympa"
)
place18.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

[place1, place2, place3, place4, place5, place6, place7, place8, place9, place10, place11, place12, place13, place14, place15, place16, place17, place18].each do |place_instance|
  if place_instance.save
    puts "Created #{place_instance.name}"
  end
end

# puts "Creating activities..."
# file = URI.open('')
# Activity1 = Activity.new(name: "", address:"", category:"randonnée", description:"")
# Activity1.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

# file = URI.open('')
# Activity2 = Activity.new(name: "", address:"", category:"culture", description:"")
# Activity2.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

# file = URI.open('')
# Activity2 = Activity.new(name: "", address:"", category:"baignade", description:"")
# Activity2.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

# file = URI.open('')
# Activity3 = Activity.new(name: "", address:"", category:"détente", description:"")
# Activity3.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

# file = URI.open('')
# Activity4 = Activity.new(name: "", address:"", category:"animaux", description:"")
# Activity4.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

# file = URI.open('')
# Activity5 = Activity.new(name: "", address:"", category:"", description:"")
# Activity5.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

# file = URI.open('')
# Activity6 = Activity.new(name: "", address:"", category:"", description:"")
# Activity6.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

# file = URI.open('')
# Activity7 = Activity.new(name: "", address:"", category:"", description:"")
# Activity7.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

# file = URI.open('')
# Activity8 = Activity.new(name: "", address:"", category:"", description:"")
# Activity8.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

# file = URI.open('')
# Activity9 = Activity.new(name: "", address:"", category:"", description:"")
# Activity9.photo.attach(io: file, filename: 'nes', content_type: 'image/jpg')

# [Activity1, Activity2, Activity3, Activity4, Activity5, Activity6, Activity7, Activity8, Activity9].each do |activity_instance|
#   if activity_instance.save
#     puts "Created #{activity_instance.name}"
#   end
# end

#   puts "Finished!"


