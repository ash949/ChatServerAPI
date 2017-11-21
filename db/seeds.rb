# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Subscription.delete_all
Message.delete_all
User.delete_all
Room.delete_all


user1 = User.create(email: 'test1@test1.com', nickname: 'test1', name: 'Test1 Test1', password: "12341234")
user2 = User.create(email: 'test2@test2.com', nickname: 'test2', name: 'Test2 Test2', password: "12341234")
user3 = User.create(email: 'test3@test3.com', nickname: 'test3', name: 'Test3 Test3', password: "12341234")
user4 = User.create(email: 'test4@test4.com', nickname: 'test4', name: 'Test4 Test4', password: "12341234")

room1 = Room.create(name: 'Tech')
room2 = Room.create(name: 'Food')

user1.send_message('GTX 1080 ti is really fast', room1)
user2.send_message('AMDDD IS BETTER', room1)
user1.send_message('NVIDIA IS BETTERRR', room1)
