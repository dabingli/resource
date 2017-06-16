records = [
  { id: 1,  position: 1,  name: "0个",    en_name: "0" },
  { id: 2,  position: 2,  name: "1个",    en_name: "1" },
  { id: 3,  position: 3,  name: "2个",    en_name: "2" },
  { id: 4,  position: 4,  name: "3个",    en_name: "3" },
  { id: 5,  position: 5,  name: "4个",    en_name: "4"  },
  { id: 6,  position: 6,  name: "5个",    en_name: "5" },
  { id: 7,  position: 7,  name: "100个",  en_name: "100" },
  { id: 8,  position: 8,  name: "其它",   en_name: "Other"  },
]
LightQuantity.seed(:id, *records)
LightQuantity.where.not(id: records.map { |r| r[:id] }).delete_all