records = [
  { id: 1,  position: 1,  name: "LED光源",   en_name: "LED light source" },
  { id: 2,  position: 2,  name: "日光灯管",   en_name: "Fluorescent lamp" },
  { id: 3,  position: 3,  name: "石英灯光源",   en_name: "Quartz lamp source" },
  { id: 4,  position: 4,  name: "节能灯",   en_name: "Energy saving light" },
  { id: 5,  position: 5,  name: "白织灯",   en_name: "White light"  },
  { id: 6,  position: 6,  name: "其它", en_name: "Other" },
]
SourceCategory.seed(:id, *records)
SourceCategory.where.not(id: records.map { |r| r[:id] }).delete_all