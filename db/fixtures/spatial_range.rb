records = [
  { id: 1,  position: 1,  name: "1-5㎡",     en_name: "1-5㎡" },
  { id: 2,  position: 2,  name: "5-10㎡",    en_name: "5-10㎡" },
  { id: 3,  position: 3,  name: "10-18㎡",   en_name: "10-18㎡" },
  { id: 4,  position: 4,  name: "18-25㎡",   en_name: "18-25㎡" },
  { id: 5,  position: 5,  name: "25-35㎡",   en_name: "25-35㎡"  },
  { id: 6,  position: 6,  name: "35-45㎡",   en_name: "35-45㎡" },
  { id: 7,  position: 7,  name: "其它",      en_name: "Other" },
]
SpatialRange.seed(:id, *records)
SpatialRange.where.not(id: records.map { |r| r[:id] }).delete_all