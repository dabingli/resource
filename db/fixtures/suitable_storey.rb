records = [
  { id: 1,  position: 1,  name: "2.5以下",   en_name: "2.5 following" },
  { id: 2,  position: 2,  name: "2.5-3米",   en_name: "2.5-3 meter" },
  { id: 3,  position: 3,  name: "3-4米",   en_name: "3-4 meter" },
  { id: 4,  position: 4,  name: "4-5米",   en_name: "4-5 meter" },
  { id: 5,  position: 5,  name: "6-8米",   en_name: "6-8 meter"  },
  { id: 6,  position: 6,  name: "8米以上", en_name: "More than 8 meters" },
]
SuitableStorey.seed(:id, *records)
SuitableStorey.where.not(id: records.map { |r| r[:id] }).delete_all