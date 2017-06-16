records = [
  { id: 1,  position: 1,  name: "片",   en_name: "Piece" },
  { id: 2,  position: 2,  name: "条",   en_name: "Strip" },
  { id: 3,  position: 3,  name: "个",   en_name: "Entry Piece" },
  { id: 4,  position: 4,  name: "贴",   en_name: "Piece" },
  { id: 5,  position: 5,  name: "套",   en_name: "Suit"  },
  { id: 6,  position: 6,  name: "其他", en_name: "Other" },
  { id: 7,  position: 7,  name: "件",   en_name: "Piece" },
  { id: 8,  position: 8,  name: "袋",   en_name: "Pack" },
  { id: 9,  position: 9,  name: "支",   en_name: "Piece" },
  { id: 10, position: 10, name: "桶",   en_name: "Barrel" },
  { id: 11, position: 11, name: "盒",   en_name: "Box" },
  { id: 12, position: 12, name: "米",   en_name: "Meter" },
  { id: 13, position: 13, name: "方",   en_name: "Square" },
  { id: 14, position: 14, name: "把",   en_name: "Hold" },
  { id: 15, position: 15, name: "张",   en_name: "Sheet" },
  { id: 16, position: 16, name: "箱",   en_name: "Box" },
  { id: 17, position: 17, name: "幅",   en_name: "Picture" },
  { id: 18, position: 18, name: "本",   en_name: "Original" },
  { id: 19, position: 19, name: "平方", en_name: "Square" },
  { id: 20, position: 20, name: "页",   en_name: "page" },
  { id: 21, position: 21, name: "卷",   en_name: "volume" },
]
BaseUnit.seed(:id, *records)
BaseUnit.where.not(id: records.map { |r| r[:id] }).delete_all

