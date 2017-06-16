records = [
  { id: 1,  position: 1,  name: "铁",    en_name: "Iron" },
  { id: 2,  position: 2,  name: "铜",    en_name: "Copper" },
  { id: 3,  position: 3,  name: "玻璃",   en_name: "Glass" },
  { id: 4,  position: 4,  name: "PC",    en_name: "PC" },
  { id: 5,  position: 5,  name: "PVC",   en_name: "PVC"  },
  { id: 6,  position: 6,  name: "PU",    en_name: "PU" },
  { id: 7,  position: 7,  name: "云石",   en_name: "Marble" },
  { id: 8,  position: 8,  name: "布料",   en_name: "Cloth" },
  { id: 9,  position: 9,  name: "陶瓷",   en_name: "Ceramics" },
  { id: 10, position: 10, name: "其它",   en_name: "Other" },
]
LampshadeMaterial.seed(:id, *records)
LampshadeMaterial.where.not(id: records.map { |r| r[:id] }).delete_all