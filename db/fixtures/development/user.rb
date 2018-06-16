User.seed do |s|
  s.id = 1
  s.family_name_kanji = "太郎"
  s.given_name_kanji = "東西"
  s.family_name_kana = "タロウ"
  s.given_name_kana = "トウザイ"
  s.phone_number = "08012345678"
  s.email = "tarou@tozai.com"
  s.password = "password"
  s.post_code = "1234567"
  s.address = "鹿児島県"
  s.member_status = 0
end

User.seed do |s|
  s.id = 2
  s.family_name_kanji = "次郎"
  s.given_name_kanji = "東西"
  s.family_name_kana = "タロウ"
  s.given_name_kana = "ジロウ"
  s.phone_number = "08012345678"
  s.email = "jirou@tozai.com"
  s.password = "password"
  s.post_code = "1234567"
  s.address = "宮崎県"
  s.member_status = 0
end

User.seed do |s|
  s.id = 3
  s.family_name_kanji = "三郎"
  s.given_name_kanji = "東西"
  s.family_name_kana = "サブロウ"
  s.given_name_kana = "トウザイ"
  s.phone_number = "08012345678"
  s.email = "saburou@tozai.com"
  s.password = "password"
  s.post_code = "1234567"
  s.address = "大分県"
  s.member_status = 1
end

User.seed do |s|
  s.id = 4
  s.family_name_kanji = "四郎"
  s.given_name_kanji = "東西"
  s.family_name_kana = "シロウ"
  s.given_name_kana = "トウザイ"
  s.phone_number = "08012345678"
  s.email = "shirou@tozai.com"
  s.password = "password"
  s.post_code = "1234567"
  s.address = "長崎県"
  s.member_status = 2
end