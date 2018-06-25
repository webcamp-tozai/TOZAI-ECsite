Admin.seed do |s|
  s.id = 1
  s.family_name_kanji = "東西"
  s.given_name_kanji = "太郎"
  s.family_name_kana = "トウザイ"
  s.given_name_kana = "タロウ"
  s.email = "tozai@tarou.com"
  s.password = "password"
  s.is_main_administer = "true"
  s.is_deleted = "false"
end

Admin.seed do |s|
  s.id = 2
  s.family_name_kanji = "東西"
  s.given_name_kanji = "次郎"
  s.family_name_kana = "トウザイ"
  s.given_name_kana = "ジロウ"
  s.email = "tozai@jirou.com"
  s.password = "password"
  s.is_main_administer = "false"
  s.is_deleted = "false"
end

Admin.seed do |s|
  s.id = 3
  s.family_name_kanji = "東西"
  s.given_name_kanji = "三郎"
  s.family_name_kana = "トウザイ"
  s.given_name_kana = "サブロウ"
  s.email = "tozai@saburou.com"
  s.password = "password"
  s.is_main_administer = "false"
  s.is_deleted = "true"
end