records = [
  { id: 1, position: 1, name: "600mm以下", en_name: "Less than 600mm" },
  { id: 2, position: 2, name: "600mm-800mm", en_name: "600mm-800mm" },
  { id: 3, position: 3, name: "800mm-1200mm", en_name: "800mm-1200mm" },
  { id: 4, position: 4, name: "1200mm以上", en_name: "Taller than 1200mm" },
]

MirrorCabinetRange.seed(:id, *records)
MirrorCabinetRange.where.not(id: records.map { |r| r[:id] }).delete_all