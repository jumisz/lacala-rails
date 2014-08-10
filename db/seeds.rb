# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'forgery'

home = Page.create( 
 title: "Home", 
 text: "<p>  Run by one of the <a href=\"http://www.bbc.co.uk/programmes/b006t1k5\">Masterchef</a> 2011 finalists.  
 Click <a href=\"http://www.bbc.co.uk/food/recipes/entremes_of_empanadilla_10734\" >here</a> for my recipe. 
 La Cala Catering is based in Romsey, Hampshire. We cater for parties and special events.  
 We provide a range of sharing dishes as well as restaurant type food for dinner parties. 
 We specialise in Spanish food. We can propose a variety of dishes depending on your tastes, 
 requirements and budget or prepare your favourite dishes (should they not appear on our site)
       Please contact us for an informal chat regarding your requirements and we will provide you with a quote.</p>
	<p id=\'contact\'>Email: info@lacalacatering.co.uk</p>
	<p id=\'contact\'>Tel: 01794 516997</p>")

home.save!

about = Page.create(	
 title: "About", 
 text: "<h1>Masterchef</h1>
	<!--Insert photos of the book, recipes and synopsis. -->
	<p>I applied in 2009 and after various telephone interviews and visits to the primrose
	Hill studio in London with samples of my food, I got in!! It was great fun, although
	the filming itself was pretty stressful as I was pregnant. Right place wrong time. I
	met some good and not so good cooks and am certain of two things: one that I love
	cooking and two that I do not want a career on TV.</p>
	<h1>Markets and Festivals</h1>
	<p align=\"center\"><img src=\"/img/stall-food-panorama.jpg\" alt=\"My Market Stall\" width=\"900\" /></p>
	<p>When I can fit it in I have a stall on the Winchester Market (<a href=\"http://
	www.visitwinchester.co.uk/site/whats-on/markets\">http://
	www.visitwinchester.co.uk/site/whats-on/markets</a>) I started in September 2011 just
	for fun. It has been great fun and has also led to some interesting business for La
	Cala Catering.</p>
	<p>I have a Microwave, a griddle a fryer and a slow cooker so I can prepare lovely
	lunches fro people on the go or provide a delicatessen take-away service for those
	having dinner parties and wanting to offer something different to their guests. I also
	have regular customers to whom I deliver fortnightly meals to stock up their freezers.</p>")

about.save!
	
contact = Page.create(	
  title: 'Contact', 
  text: '<p id=\'contact\' style=\'text-align: center;\'>Contact us for more information on our menus and services.</p>
    <p id=\'contact\' style=\'text-align: center;\'>01794516997</p>
    <p id=\'contact\' style=\'text-align: center;\'>Mobile: 07975995753</p>
    <p id=\'contact\' style=\'text-align: center;\'>info@lacalacatering.com</p>')

contact.save!

food = Page.create( title: 'Food',   text: '<p> This is the food page </p>')

food.save!

# Add Dishes
images = { "Empanada" => "empanada", "Jamon" => "jamon", "Salmorejo" => "salmorejo", "Torta de Santiago" => "santiago" }

images.each do |dish_name, img_name|
  dish = Dish.create(name: dish_name, text: Forgery(:lorem_ipsum).words(30), image: "img/dishes/#{img_name}.jpg")
  dish.save!
end 

# Admin password encryption
salt = BCrypt::Engine.generate_salt
encrypted_password = BCrypt::Engine.hash_secret("test", salt)

user = User.create(username: 'admin', encrypted_password: encrypted_password, salt: salt)
user.save!

