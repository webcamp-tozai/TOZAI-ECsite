#商品1 (在庫残り100個の4曲入りシングル)
DiscNumber.seed(:id,
  { id: 1, item_id: 1, number: 1 }
)

#商品2 (在庫残り20個のディスク2枚組、各ディスク5曲入りのアルバム)
DiscNumber.seed(:id,
  { id: 2, item_id: 2, number: 1 },
  { id: 3, item_id: 2, number: 2 }
)

#商品3 (在庫切れの4曲入りレコード)
DiscNumber.seed(:id,
  { id: 4, item_id: 3, number: 1 }
)

#商品4 (取扱終了済のディスク4枚組、各ディスク1曲入りのアルバム)
DiscNumber.seed(:id,
  { id: 5, item_id: 4, number: 1 },
  { id: 6, item_id: 4, number: 2 },
  { id: 7, item_id: 4, number: 3 },
  { id: 8, item_id: 4, number: 4 }
)