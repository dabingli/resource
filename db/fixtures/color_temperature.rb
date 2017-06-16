records = [
  { id: 1,   position: 1,   name: "2700K以下",      en_name: "Below 2700K" },
  { id: 2,   position: 2,   name: "2700K-3200K",   en_name: "2700K-3200K" },
  { id: 3,   position: 3,   name: "3200K-4000K",   en_name: "3200K-4000K" },
  { id: 4,   position: 4,   name: "4000K-4500K",   en_name: "4000K-4500K" },
  { id: 5,   position: 5,   name: "4500K-6000K",   en_name: "4500K-6000K"  },
  { id: 6,   position: 6,   name: "6000K-6500K",   en_name: "6000K-6500K" },
  { id: 7,   position: 7,   name: "6500K以上",      en_name: "More than 6500K" },
]
ColorTemperature.seed(:id, *records)
ColorTemperature.where.not(id: records.map { |r| r[:id] }).delete_all