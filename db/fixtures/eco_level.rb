records = [
  { id: 1,  position: 1,  name: "E1",   en_name: "E1" },
  { id: 2,  position: 2,  name: "E0",   en_name: "E0" },
  { id: 3,  position: 3,  name: "其他",  en_name: "Other" },
]
EcoLevel.seed(:id, *records)
EcoLevel.where.not(id: records.map { |r| r[:id] }).delete_all
