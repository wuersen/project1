User.destroy_all
u1 = User.create :name => 'user1', :email => 'user1@gmail.com', :password => 'chicken'
u2 = User.create :name => 'user2', :email => 'user2@gmail.com', :password => 'chicken'
puts "#{User.count} users"

Photo.destroy_all
p1 = Photo.create :image => 'https://cdn.naturettl.com/wp-content/uploads/2020/04/25152036/how-to-find-great-locations-for-landscape-photography-11-600x315-cropped.jpg', :description => 'Ocean Sunset'

p2 = Photo.create :image => 'https://www.photoblog.com/learn/wp-content/uploads/2018/12/erin-babnik-photography-990x556.jpg', :description => 'Desert Flower'

p3 = Photo.create :image => 'https://cdn.theatlantic.com/thumbor/SqC3OHn5MBkdxUpYMSMKmddbD_w=/600x444/media/img/photo/2020/11/top-shots-2020-international-landsc/a01_Yuen_MagicalNight/original.jpg', :description => 'Magic Night'

p4 = Photo.create :image => 'https://photographylife.com/wp-content/uploads/2018/05/Hot-Air-Balloons-in-a-line.jpg', :description => 'Hotair Balloon'
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
