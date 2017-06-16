records = [
  { id: 1,  position: 1,  name: "PC",   en_name: "PC" },
  { id: 2,  position: 2,  name: "玻璃",   en_name: "Glass" },
  { id: 3,  position: 3,  name: "水晶",   en_name: "Crystal" },
  { id: 4,  position: 4,  name: "遥控",   en_name: "Remote control" },
  { id: 5,  position: 5,  name: "电线",   en_name: "Wire"  },
  { id: 6,  position: 6,  name: "蓄电池", en_name: "Battery" },
  { id: 7,  position: 7,  name: "电池板",   en_name: "Battery board" },
  { id: 8,  position: 8,  name: "其它",   en_name: "Other" },
]
LightAttachment.seed(:id, *records)
LightAttachment.where.not(id: records.map { |r| r[:id] }).delete_all