Address.seed do |s|
  s.id = 1
  s.user_id = 1
  s.name = "東西"
  s.post_code = "1234567"
  s.address = "長崎県"
end

Address.seed do |s|
  s.id = 2
  s.user_id = 3
  s.name = "太郎"
  s.post_code = "1234567"
  s.address = "鹿児島"
end

Address.seed do |s|
  s.id = 3
  s.user_id = 3
  s.name = "二郎"
  s.post_code = "1234567"
  s.address = "北海道"
end

Address.seed do |s|
  s.id = 4
  s.user_id = 4
  s.name = "本社"
  s.post_code = "1234567"
  s.address = "東京都"
end
