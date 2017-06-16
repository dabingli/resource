records = [
  { id: 1,  position: 1,  name: "E14",           en_name: "E14" },
  { id: 2,  position: 2,  name: "E27",           en_name: "E27" },
  { id: 3,  position: 3,  name: "PAR(螺纹型)",    en_name: "PAR(Thread type)" },
  { id: 4,  position: 4,  name: "E40",           en_name: "E40" },
  { id: 5,  position: 5,  name: "G9",            en_name: "G9"  },
  { id: 6,  position: 6,  name: "R7S",           en_name: "R7S" },
  { id: 7,  position: 7,  name: "RX7S",          en_name: "RX7S" },
  { id: 8,  position: 8,  name: "AR111(双插)",    en_name: "AR111(Double plug)"  },
  { id: 9,  position: 9,  name: "其它",           en_name: "Other" },
  { id: 10,  position: 10,  name: "E10",    en_name: "E10" },
  { id: 11,  position: 11,  name: "E12",    en_name: "E12" },
  { id: 12,  position: 12,  name: "B22",    en_name: "B22" },
  { id: 13,  position: 13,  name: "PB22D",  en_name: "PB22D" },
  { id: 14,  position: 14,  name: "P27",    en_name: "P27"  },
  { id: 15,  position: 15,  name: "P32",    en_name: "P32" },
  { id: 16,  position: 16,  name: "G4",     en_name: "G4" },
]
BaseType.seed(:id, *records)
BaseType.where.not(id: records.map { |r| r[:id] }).delete_all