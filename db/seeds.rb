require 'faker'

chatonUrl = [
  "www.chaton.fr/1",
  "www.chaton.fr/2",
  "www.chaton.fr/3",
  "www.chaton.fr/4",
  "www.chaton.fr/5",
  "www.chaton.fr/6",
  "www.chaton.fr/7",
  "www.chaton.fr/8",
  "www.chaton.fr/9",
  "www.chaton.fr/10",
  "www.chaton.fr/11",
  "www.chaton.fr/12",
  "www.chaton.fr/13",
  "www.chaton.fr/14",
  "www.chaton.fr/15",
  "www.chaton.fr/16",
  "www.chaton.fr/17",
  "www.chaton.fr/18",
  "www.chaton.fr/19",
  "www.chaton.fr/20",
]

Item.destroy_all

20.times do
  Item.create(
    title: Faker::Creature::Cat.name,
    description: Faker::Creature::Cat.registry,
    price: rand(1000),
    image_url: "ok"
  )
end
