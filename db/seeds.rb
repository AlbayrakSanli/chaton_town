require 'faker'

Item.destroy_all
Cart.destroy_all
User.destroy_all
JoinCartItem.destroy_all


20.times do
  Item.create(
    title: Faker::Creature::Cat.name,
    description: Faker::Creature::Cat.registry,
    price: rand(1000),
    image_url: "ok"
  )
end
