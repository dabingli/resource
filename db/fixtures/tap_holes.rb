records = [
  { id: 1, position: 1, name: "双",   en_name: "Double handle"  },
  { id: 2, position: 2, name: "单",   en_name: "Single handles" },
  { id: 3, position: 3, name: "无",   en_name: "No"             },
  { id: 4, position: 4, name: "其他", en_name: "Other"          }
]

TapHole.seed(:id, *records)   
TapHole.where.not(id: records.map { |r| r[:id] }).delete_all
