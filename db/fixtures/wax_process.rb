records = [
  { id: 1,  position: 1,  name: "是",     en_name: "Yes" },
  { id: 2,  position: 2,  name: "其他",   en_name: "Other" },
]
WaxProcess.seed(:id, *records)
WaxProcess.where.not(id: records.map { |r| r[:id] }).delete_all
