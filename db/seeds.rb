User.destroy_all
u1 = User.create :name => 'user1', :email => 'user1@gmail.com', :password => 'chicken', :image => 'rl0tqjkkidfbrjxxtdxu'
u2 = User.create :name => 'user2', :email => 'user2@gmail.com', :password => 'chicken', :image => 'rl0tqjkkidfbrjxxtdxu'
puts "#{User.count} users"

Photo.destroy_all
p1 = Photo.create :image => 'bf0auxd2cqywjnz6pcpb', :description => 'Ocean Sunset'

p2 = Photo.create :image => 'bf0auxd2cqywjnz6pcpb', :description => 'Desert Flower'

p3 = Photo.create :image => 'bf0auxd2cqywjnz6pcpb', :description => 'Magic Night'

p4 = Photo.create :image => 'bf0auxd2cqywjnz6pcpb', :description => 'Hotair Balloon'
puts "#{Photo.count} photos"

Comment.destroy_all
c1 = Comment.create :content => 'Great photo nice ocean sunset'
c2 = Comment.create :content => 'Great photo amazing desert'
c3 = Comment.create :content => 'Great photo nice northern light'
c4 = Comment.create :content => 'beautiful hotair ballloons'
puts "#{Comment.count} comments"

puts "Users and photos."
u1.photos << p1 << p2
u2.photos << p3 << p4

puts "Users and comments"
u1.comments << c3 << c4
u1.comments << c1 << c2

puts "Photos and comments"
p1.comments << c1
p2.comments << c2
p3.comments << c3
p4.comments << c4
