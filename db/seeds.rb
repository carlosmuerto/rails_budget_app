# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def create_group(name, icon, author)
  Group.create(
    name:,
    icon:,
    author:
  )
end

def create_entity(name, amount, author, groups)
  Entity.create(
    name:,
    amount:,
    author:,
    groups:
  )
end


users = User.create(
  [
    {
      name: 'Ruth Bradley',
      email: 'ruth_bradley@testmail.com',
      password: 'ruth_bradley_pass'
    },
    {
      name: 'Leticia Barrett',
      email: 'leticia_barrett@testmail.com',
      password: 'leticia_barrett_pass'
    },
    {
      name: 'Kaiden Carlson',
      email: 'kaiden_carlson@testmail.com',
      password: 'kaiden_carlson_pass'
    },
    {
      name: 'Aubree Rojas',
      email: 'aubree_rojas@testmail.com',
      password: 'aubree_rojas_pass'
    },
    {
      name: 'Trevon Rich',
      email: 'trevon_rich@testmail.com',
      password: 'trevon_rich_pass'
    }
  ]
)

puts "#{users.count} users created"

users.each_with_index do |user, index|
  puts "for user #{user.name} : #{user.id}"

  groups = [
    create_group("group_#{index}", 'group_a_icon', user),
    create_group("group_#{index}", 'group_a_icon', user),
    create_group("group_#{index}", 'group_a_icon', user),
    create_group("group_#{index}", 'group_a_icon', user),
    create_group("group_#{index}", 'group_a_icon', user),
    create_group("group_#{index}", 'group_a_icon', user),
    create_group("group_#{index}", 'group_a_icon', user),
    create_group("group_#{index}", 'group_a_icon', user),
    create_group("group_#{index}", 'group_a_icon', user),
    create_group("group_#{index}", 'group_a_icon', user),
    create_group("group_#{index}", 'group_a_icon', user),
    create_group("group_#{index}", 'group_a_icon', user),
    create_group("group_#{index}", 'group_a_icon', user)
  ]

  puts "  #{groups.count} groups created"

  entities = [
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups[0..1]),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups[0..1]),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups[1..2]),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups[0..2]),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups[0..2]),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups[0..2]),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups[0..2]),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups[0..2]),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups[0..2]),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups[0..2]),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups),
    create_entity("entity N.#{Entity.all.count}", index + Entity.all.count, user, groups)
  ]

  puts "  #{entities.count} entities created"
  
end
