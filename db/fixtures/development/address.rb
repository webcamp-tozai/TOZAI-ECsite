Address.seed do |s|
  s.id = 1
  s.user_id = 1
  s.family_name_kanji = "太郎"
  s.given_name_kanji = "東西"
  s.post_code = "1234567"
  s.address = "長崎県"
end

Address.seed do |s|
  s.id = 2
  s.user_id = 3
  s.family_name_kanji = "次郎"
  s.given_name_kanji = "東西"
  s.post_code = "1234567"
  s.address = "鹿児島"
end

Address.seed do |s|
  s.id = 3
  s.user_id = 3
  s.family_name_kanji = "三郎"
  s.given_name_kanji = "東西"
  s.post_code = "1234567"
  s.address = "北海道"
end

Address.seed do |s|
  s.id = 4
  s.user_id = 4
  s.family_name_kanji = "四郎"
  s.given_name_kanji = "東西"
  s.post_code = "1234567"
  s.address = "東京都"
end
