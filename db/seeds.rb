# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Beer.destroy_all
User.destroy_all

Beer.create(name: "London Pale Ale", abv: 4.3, description: "British and American hops unite to make a sessionable pale ale that’s packed with citrus flavour. Now that’s a special relationship.")
Beer.create(name: "London Lager", abv: 4.5, description: "East Anglian malt and Goldings hops combine for a crisp, refreshing lager that’s full of flavour. A modern classic, straight from London’s back garden.")
Beer.create(name: "Yakima Red Ale", abv: 4.1, description: "British and German malts team up with five Yakima Valley American hops to create a vibrant and fruity red ale. As lively and colourful as the people that brew it.")

User.create(name: "Pat Santucci", mod_id: 2)
User.create(name: "Ines Guerrero", mod_id: 2)
User.create(name: "Aiden Leeming", mod_id: 2)
User.create(name: "Katherine Wren", mod_id: 2)
User.create(name: "Lauren Carne", mod_id: 2)
User.create(name: "Marcus Mellor", mod_id: 2)
User.create(name: "Amari Ellington", mod_id: 2)
User.create(name: "Ayleen Nazario", mod_id: 2)
User.create(name: "Ross Mawdsley", mod_id: 2)
User.create(name: "Zubair Maqsood", mod_id: 2)
User.create(name: "Anthea Merton", mod_id: 2)
User.create(name: "Marco Miranda", mod_id: 2)
User.create(name: "Miao Shan", mod_id: 2)
User.create(name: "Daniel Kaczmarczyk", mod_id: 0)
User.create(name: "Sam Barker", mod_id: 0)
User.create(name: "Ian Harrison", mod_id: 0)


