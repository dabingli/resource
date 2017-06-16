records = [
  # 每个平台独占一个 ID 区间，以便维护

  # E选材
  { id: 1, site_id: 1, position: 1, name: '低等级' },
  { id: 2, site_id: 1, position: 2, name: '限量抢购' },

  # E找砖
  { id: 101, site_id: 2, position: 1, name: '本地特惠' },
  { id: 102, site_id: 2, position: 2, name: '新品上线' },
  { id: 103, site_id: 2, position: 3, name: '合格品' },

  # E分销
  { id: 201, site_id: 3, position: 1, name: '特卖馆' },

  # E采购
  { id: 301, site_id: 4, position: 1, name: '新品馆' },

  # E直供
  { id: 401, site_id: 5, position: 1, name: '公共馆' },
  { id: 402, site_id: 5, position: 2, name: '特供馆' },

  # E出口
  # { id: 501, site_id: 6, position: 1, name: '' },

  # 家居网
  # { id: 601, site_id: 7, position: 1, name: '' },

  # chinahome
  { id: 701, site_id: 8, position: 1, name: '新品馆' },
  { id: 702, site_id: 8, position: 2, name: '特卖馆' },

  # lolatiles
  { id: 801, site_id: 9, position: 1, name: '新品馆' },
  { id: 801, site_id: 9, position: 1, name: '折扣陶瓷' },
]

ProductHall.seed(:id, *records)

ProductHall.where.not(id: records.map {|r| r[:id]}).delete_all
