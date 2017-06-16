records = [
  { id: 1, position: 1, name: "台玻",         en_name: "Glass" },
  { id: 2, position: 2, name: "优质浮法玻璃", en_name: "High quality float glass" },
  { id: 3, position: 3, name: "其它",         en_name: "Other" },
]

WholeMaterial.seed(:id, *records) 
WholeMaterial.where.not(id: records.map { |r| r[:id] }).delete_all
