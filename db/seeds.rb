# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#admin = Admin.new(:family_name_kanji => "東西", :given_name_kanji => "太郎", :family_name_kana => "トウザイ", :given_name_kana => "タロウ", :email => "tozai@tarou.com", :password => "password", :is_main_administer => "true", :is_deleted => "false")
#admin.save!

#artist = Artist.new(:name => "Nickelback", :name_kana => "ニッケルバック")
#artist.save!

#genre = Genre.new(:genre_english => "Rock", :genre_kana => "ロック")
#genre.save!

#label = Label.new(:name => "ユニバーサルミュージック")
#label.save!

#item = Item.new(:label_id => 1, :genre_id => 1, :artist_id => 1, :item_introduction => "待望のニューシングル", :title => "Rails音頭", :image_id => nil, :stock => 100, :price_without_tax => 1200, :content_type => "シングル", :is_deleted => false)
#item.save!

#track = Track.new(:item_id => 1, :artist_id => 1, :disc_number => 1, :track_number => 1, :name => "a", :length_hour => 0, :length_minute => 4, :length_second => 23)
#track.save!

payment = Payment.new(:payment_method => "代引き")
payment.save!
payment = Payment.new(:payment_method => "クレジットカード")
payment.save!
payment = Payment.new(:payment_method => "口座振替")
payment.save!
payment = Payment.new(:payment_method => "請求書")
payment.save!
