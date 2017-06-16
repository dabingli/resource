records = [
  { id: 1,  position: 1,  name: "平扣",   en_name: "Flat buckle" },
  { id: 2,  position: 2,  name: "锁扣",   en_name: "Lock" },
]
BuckleType.seed(:id, *records)
BuckleType.where.not(id: records.map { |r| r[:id] }).delete_all
