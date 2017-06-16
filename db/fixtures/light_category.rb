records = [
  { id: 1,   position: 1,   name: "白光",   en_name: "White light" },
  { id: 2,   position: 2,   name: "黄光",   en_name: "Yellow light" },
  { id: 3,   position: 3,   name: "暖光",   en_name: "Warm light" },
  { id: 4,   position: 4,   name: "暖黄",   en_name: "Warm yellow" },
  { id: 5,   position: 5,   name: "暖白",   en_name: "Warm white"  },
  { id: 6,   position: 6,   name: "蓝光",   en_name: "Blue" },
  { id: 7,   position: 7,   name: "绿",     en_name: "Green" },
  { id: 8,   position: 8,   name: "红",     en_name: "Red" },
  { id: 9,   position: 9,   name: "组合光",  en_name: "Combination light" },
  { id: 10,  position: 10,  name: "七彩",   en_name: "Colorful" },
  { id: 11,  position: 11,  name: "单色",   en_name: "Monochrome" },
  { id: 12,  position: 12,  name: "三色",   en_name: "Three-colour" },
  { id: 13,  position: 13,  name: "无极调光", en_name: "Electrodeless dimming" },
  { id: 14,  position: 14,  name: "中性光",  en_name: "Neutral light" },
  { id: 15,  position: 15,  name: "其它",   en_name: "Other" },
  { id: 16,  position: 16,  name: "紫",   en_name: "Purple" },
  { id: 17,  position: 17,  name: "双色",   en_name: "Double color" },
]
LightCategory.seed(:id, *records)
LightCategory.where.not(id: records.map { |r| r[:id] }).delete_all