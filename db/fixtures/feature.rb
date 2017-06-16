records = [
  { id: 1,  position: 1,  name: "隐形叶",   en_name: "Invisible leaves" },
  { id: 2,  position: 2,  name: "半吊",     en_name: "Half hanging" },
  { id: 3,  position: 3,  name: "隔离",     en_name: "Quarantine" },
  { id: 4,  position: 4,  name: "非隔离",   en_name: "Non isolation" },
  { id: 5,  position: 5,  name: "恒流",     en_name: "Constant current"  },
  { id: 6,  position: 6,  name: "无频闪",   en_name: "Flicker free" },
  { id: 7,  position: 7,  name: "其它",     en_name: "Other" },
  { id: 8,   position: 8,   name: "IP65",   en_name: "IP65" },
  { id: 9,   position: 9,   name: "IP66",   en_name: "IP66" },
  { id: 10,  position: 10,  name: "IP67",   en_name: "IP67" },
  { id: 11,  position: 11,  name: "IP68",   en_name: "IP68" },
  { id: 12,  position: 12,  name: "抗腐蚀",  en_name: "Corrosion resistance"  },
  { id: 13,  position: 13,  name: "无噪音",  en_name: "No noise" },
  { id: 14,  position: 14,  name: "伸缩功能", en_name: "Telescopic function" },

]
Feature.seed(:id, *records)
Feature.where.not(id: records.map { |r| r[:id] }).delete_all