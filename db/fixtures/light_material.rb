records = [
  { id: 1,  position: 1,  name: "铁材",   en_name: "Iron" },
  { id: 2,  position: 2,  name: "铝材",   en_name: "Aluminum" },
  { id: 3,  position: 3,  name: "锌合金",   en_name: "Kirsite" },
  { id: 4,  position: 4,  name: "不锈钢",   en_name: "Stainless steel" },
  { id: 5,  position: 5,  name: "铜材",   en_name: "Copper"  },
  { id: 6,  position: 6,  name: "陶瓷", en_name: "Ceramics" },
  { id: 7,  position: 7,  name: "玻璃",   en_name: "Glass" },
  { id: 8,  position: 8,  name: "树脂",   en_name: "Resin" },
  { id: 9,  position: 9,  name: "木质",  en_name: "Woodiness" },
  { id: 10, position: 10, name: "竹质",   en_name: "Bamboo" },
  { id: 11, position: 11, name: "PC",  en_name: "PC" },
  { id: 12, position: 12, name: "其它",  en_name: "Other" },
]
LightMaterial.seed(:id, *records)
LightMaterial.where.not(id: records.map { |r| r[:id] }).delete_all