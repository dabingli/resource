records = [
  { id: 1,  position: 1,  name: '商品正面图',      max_count: 1  },
  { id: 2,  position: 2,  name: '主图',           max_count: 13 },
  { id: 3,  position: 3,  name: '视频',           max_count: 1  },
  { id: 4,  position: 4,  name: '产品铺贴图',      max_count: 2  },
  { id: 6,  position: 6,  name: 'PC产品情景图',    max_count: 3  },
  { id: 7,  position: 7,  name: 'PC产品实拍图',    max_count: 1  },
  { id: 8,  position: 8,  name: 'PC产品细节图',    max_count: 4  },
  { id: 9,  position: 9,  name: '手机版产品情景图', max_count: 1  },
  { id: 10, position: 10, name: '手机版产品实拍图', max_count: 1  },
  { id: 11, position: 11, name: '手机版产品细节图', max_count: 1  },
  { id: 12, position: 12, name: '外贸版PC情景图',  max_count: 3  },
  { id: 13, position: 13, name: '外贸版PC实拍图',  max_count: 1  },
  { id: 14, position: 14, name: '外贸版PC细节图',  max_count: 4  },
  { id: 15, position: 15, name: '外贸版手机情景图', max_count: 1  },
  { id: 16, position: 16, name: '外贸版手机实拍图', max_count: 1  },
  { id: 17, position: 17, name: '外贸版手机细节图', max_count: 1  },
]

ProductImageCategory.seed(:id, *records)

ProductImageCategory.where.not(id: records.map {|r| r[:id]}).delete_all
