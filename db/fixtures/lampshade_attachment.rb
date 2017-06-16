records = [
  { id: 1,  position: 1,  name: "铁",    en_name: "Iron" },
  { id: 2,  position: 2,  name: "玻璃",   en_name: "Glass" },
  { id: 3,  position: 3,  name: "PC",    en_name: "PC" },
  { id: 4,  position: 4,  name: "PVC",   en_name: "PVC"  },
  { id: 5,  position: 5,  name: "PU",    en_name: "PU" },
  { id: 6,  position: 6,  name: "布料",   en_name: "Cloth" },
  { id: 7,  position: 7,  name: "其它",   en_name: "Other" },
]
LampshadeAttachment.seed(:id, *records)
LampshadeAttachment.where.not(id: records.map { |r| r[:id] }).delete_all