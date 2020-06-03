require 'faker'

Item.destroy_all
Order.destroy_all
User.destroy_all

i = 0
20.times do
    item = Item.new(
    title: Faker::Creature::Cat.name,
    description: Faker::Creature::Cat.registry,
    price: rand(1000))
    # image_url: "chatonUrl"
    item.picture.attach(io: File.open("db/cat/cat#{i+=1}.jpg"), filename: 'cat.jpg', content_type: 'image/jpeg')
    item.save
end
