records = [
  { id: 1,  position: 1,  name: "低/高压直流",   en_name: "Low high voltage DC" },
  { id: 2,  position: 2,  name: "低/高压交流",   en_name: "Low high voltage AC" },
  { id: 3,  position: 3,  name: "其它",         en_name: "Other" },
]
VoltageLevel.seed(:id, *records)
VoltageLevel.where.not(id: records.map { |r| r[:id] }).delete_all