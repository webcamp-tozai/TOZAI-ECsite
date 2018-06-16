#商品1 (在庫残り100個の4曲入りシングル)
Item.seed do |s|
  s.id = 1
  s.label_id = 1
  s.genre_id = 1
  s.item_introduction = "待望のニューシングル"
  s.title = "Rails音頭"
  s.image_id = 1
  s.stock = 100
  s.price_without_tax = 1200
  s.content_type = "シングル"
  s.is_deleted = false
end

#商品2 (在庫残り20個のディスク2枚組、各ディスク5曲入りのアルバム)
Item.seed do |s|
  s.id = 2
  s.label_id = 2
  s.genre_id = 2
  s.item_introduction = "10年ぶりのベストアルバム"
  s.title = "Rails The Best Ⅲ"
  s.image_id = 2
  s.stock = 20
  s.price_without_tax = 3500
  s.content_type = "アルバム"
  s.is_deleted = false
end

#商品3 (在庫切れの4曲入りレコード)
Item.seed do |s|
  s.id = 3
  s.label_id = 3
  s.genre_id = 3
  s.item_introduction = "伝説のレコードがついに復刻"
  s.title = "Ra Ra Rails"
  s.image_id = 3
  s.stock = 0
  s.price_without_tax = 2500
  s.content_type = "レコード"
  s.is_deleted = false
end

#商品4 (取扱終了済のディスク4枚組、各ディスク1曲入りのアルバム)
Item.seed do |s|
  s.id = 4
  s.label_id = 4
  s.genre_id = 4
  s.item_introduction = "本ガイドは、ゼロからRailsアプリケーションを構築したいと考えている初心者を対象にしています。読者がRailsの経験がないことを前提としています。ただし、このドキュメントを最大限に活用するために、以下のソフトウェアがインストールされ、利用可能な状態になっていることを前提としています。"
  s.title = "~RAILS GUIDES~ Railsをはじめよう"
  s.image_id = 4
  s.stock = 0
  s.price_without_tax = 15000
  s.content_type = "アルバム"
  s.is_deleted = true
end