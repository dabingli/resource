records = [
  { id: 1,  position: 1,  name: "U",   en_name: "U" },
  { id: 2,  position: 2,  name: "V",   en_name: "V" },
  { id: 3,  position: 3,  name: "直角", en_name: "right angle" },
]
ChamferingProcess.seed(:id, *records)
ChamferingProcess.where.not(id: records.map { |r| r[:id] }).delete_all
