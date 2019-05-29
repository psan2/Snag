# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Beer.destroy_all
User.destroy_all
Mod.destroy_all
Location.destroy_all

Beer.create(name: 'London Pale Ale', abv: 4.3, description: 'British and American hops unite to make a sessionable pale ale that’s packed with citrus flavour. Now that’s a special relationship.')
Beer.create(name: 'London Lager', abv: 4.5, description: 'East Anglian malt and Goldings hops combine for a crisp, refreshing lager that’s full of flavour. A modern classic, straight from London’s back garden.')
Beer.create(name: 'Yakima Red Ale', abv: 4.1, description: 'British and German malts team up with five Yakima Valley American hops to create a vibrant and fruity red ale. As lively and colourful as the people that brew it.')
Beer.create(name: 'Aspall Draught Cyder', abv: 5.5, description: 'Lovely with sweet & sour pork, balti and bhuna mild curries, chicken with tomato & sweet red peppers, and Bramley apple pie.')

m1 = Mod.create(name: 'Mod 1')
m2 = Mod.create(name: 'Mod 2')
m3 = Mod.create(name: 'Mod 3')
m4 = Mod.create(name: 'Mod 4')
m5 = Mod.create(name: 'Mod 5')
ms = Mod.create(name: 'Staff/Instructors')

User.create(name: 'Pat Santucci', mod_id: m2.id)
User.create(name: 'Ines Guerrero', mod_id: m2.id)

Location.create(name: "Mod 1")
Location.create(name: "Mod 2")
Location.create(name: "Mod 3")
Location.create(name: "Mod 4")
Location.create(name: "Mod 5")
Location.create(name: "Instructors/Staff")
Location.create(name: "TCFs Mods 1&2")
Location.create(name: "TCFs Mods 3&4&5")
Location.create(name: "Borg")
Location.create(name: "Turing")
Location.create(name: "Fox")
Location.create(name: "Sofas Mod 2&3")
Location.create(name: "Kitchen")
Location.create(name: "Lounge")
Location.create(name: "Lovelace")
Location.create(name: "Berners-Lee")


