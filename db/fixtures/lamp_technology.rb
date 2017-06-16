records = [
  { id: 1,  position: 1,  name: "电镀",   en_name: "Electroplate" },
  { id: 2,  position: 2,  name: "烤漆",   en_name: "Paint" },
  { id: 3,  position: 3,  name: "磨砂",   en_name: "Scrub" },
  { id: 4,  position: 4,  name: "编织",   en_name: "Weave" },
  { id: 5,  position: 5,  name: "喷粉",   en_name: "Dusting"  },
  { id: 6,  position: 6,  name: "其它", en_name: "Other" },
]
LampTechnology.seed(:id, *records)
LampTechnology.where.not(id: records.map { |r| r[:id] }).delete_all