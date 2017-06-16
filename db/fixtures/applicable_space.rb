records = [
  { id: 1,  position: 1,  name: "客厅",   en_name: "Living room" },
  { id: 2,  position: 2,  name: "餐厅",   en_name: "Restaurant" },
  { id: 3,  position: 3,  name: "卧室",   en_name: "Bedroom" },
  { id: 4,  position: 4,  name: "书房",   en_name: "Study" },
  { id: 5,  position: 5,  name: "客房",   en_name: "Guest Room"  },
  { id: 6,  position: 6,  name: "儿童房", en_name: "Children room" },
  { id: 7,  position: 7,  name: "过道",   en_name: "Aisle" },
  { id: 8,  position: 8,  name: "厨房",   en_name: "Kitchen" },
  { id: 9,  position: 9,  name: "卫生间",  en_name: "TOILET" },
  { id: 10, position: 10, name: "阳台",   en_name: "Balcony" },
  { id: 11, position: 11, name: "会议室",  en_name: "Conference Room" },
  { id: 12, position: 12, name: "办公室",  en_name: "Office" },
  { id: 13, position: 13, name: "吧台",   en_name: "Bar counter" },
  { id: 14, position: 14, name: "收银台",  en_name: "Cashier" },
  { id: 15, position: 15, name: "咖啡厅",  en_name: "Cafe" },
  { id: 16, position: 16, name: "多媒体间", en_name: "Multimedia room" },
  { id: 17, position: 17, name: "其它",    en_name: "Other" },
]
ApplicableSpace.seed(:id, *records)
ApplicableSpace.where.not(id: records.map { |r| r[:id] }).delete_all