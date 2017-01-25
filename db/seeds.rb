user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

20.times do |n|
  name = Faker::GameOfThrones.character
  email = "example-#{n+1}@example.org"
  password = "password"
  User.create!(
                name:                  name,
                email:                 email,
                password:              password,
                password_confirmation: password
  )
end

4.times do |n|
  name = Faker::GameOfThrones.character
  email = "testing-#{n+1}@example.org"
  password = "password"
  role = :admin
  User.create!(
                name:                  name,
                email:                 email,
                password:              password,
                password_confirmation: password,
                role:                  role
  )
end

75.times do |n|
  title =   Faker::Company.bs[3..40]
  user_id = Faker::Number.between(1, 25)

  Gallery.create!(
                  title:               title,
                  user_id:             user_id
  )
end

50.times do |n|
  name =    Faker::Company.bs[3..40]
  user_id = Faker::Number.between(1, 25)

  Category.create!(
                  name:                name,
                  user_id:             user_id
  )
end


  Image.create!(
    file: File.new("/home/reed/Pictures/creativity.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/latebloomers.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/latebloomers2.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/latebloomers3.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/red_potatoes_redskins.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/orangutan_1600x1000_279157.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/f10323nchristine blogspot in_1419330367.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/photobombing-stock-images-fb4.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/No-Im-too-Sexy-For-You_o_144476.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/i-feel-so-sexy.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/Vh-Funny-Pictures-Im-sexy-and-i-know-it-MEME.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/romantic_sexy_funny_gifts.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/giphy.gif"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/funny-pics_BonjourLife.com1_.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/51090ab4324d2bb829000047.gif"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/funny-pictures-auto-876123.jpeg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/Funny Stuff (10).jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/clean-funny-pictures-3.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/Daredevil-TV-Logo.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/daredevil-costume-punisher-elektra.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/punisher1.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/punisher_skull.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/Oklahoma_City_Thunder.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/Golden-State-Warriors.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/0079151001432373413_filepicker.png"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/Free Interesting Wallpaper for Desktop.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/crazy_jump_701.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/Left_Right_Brain.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
  file: File.new("/home/reed/Pictures/Funny-Memes-122.jpg"),
  user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
  file: File.new("/home/reed/Pictures/55MiEk4 - Imgur.gif"),
  user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
  file: File.new("/home/reed/Pictures/zwDWbYq.jpg"),
  user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
  file: File.new("/home/reed/Pictures/078.jpg"),
  user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
  file: File.new("/home/reed/Pictures/First-rule-to-being-a-man---meme.jpg"),
  user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
  file: File.new("/home/reed/Pictures/yourdiet_1024x1024.jpg"),
  user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
  file: File.new("/home/reed/Pictures/c8f98ef4b2acc1754bab905ee8d61afe.jpg"),
  user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
  file: File.new("/home/reed/Pictures/0080ffd95b3b00acbba904ecb6480afa.jpg"),
  user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/dd531d1d0bb2d536884f1d80958ca274.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/94e3e6189f47a9fb9605ed1d2a363f57.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
  file: File.new("/home/reed/Pictures/94e3e6189f47a9fb9605ed1d2a363f57.jpg"),
  user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
  file: File.new("/home/reed/Pictures/780.jpg"),
  user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/b04.png"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/ec375964f2d512312b0c841dfb76da80.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/17e124b061653f53a1ac3af1e06e3b5f.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/nwa.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/NWA1.png"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/nwa (1).jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/lwblog-junk1.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/Is our genome mostly made out of junk.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/A_load_of_old_junk_or_hidden_treasures-_Encants_market_in_Barcelona.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/smart-brain-10236251.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/th.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/01-usersthink-stock-image.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/02-usersthink-stock-image.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/03-usersthink-stock-image-small.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/04-usersthink-stock-image.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/05-usersthink-stock-image-small.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/06-usersthink-stock-image.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/07-usersthink-stock-image-small.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/08-usersthink-stock-image-small.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/09-usersthink-stock-image-small.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/10-usersthink-stock-image-small.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/11-usersthink-stock-image-small.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/12-usersthink-stock-image.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/13-usersthink-stock-image-small.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/14-usersthink-stock-image-small.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/72-usersthink-stock-image-small.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/73-usersthink-stock-image-small.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/76-usersthink-stock-image.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/82-usersthink-stock-image.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
  Image.create!(
    file: File.new("/home/reed/Pictures/91-usersthink-stock-image-small.jpg"),
    user_id: Faker::Number.between(1, 25)
  )
