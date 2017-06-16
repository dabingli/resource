records = [
  { id: 1,  position: 1,   name: "简约现代", en_name: "Simple"            },
  { id: 2,  position: 2,   name: "欧式",     en_name: "European Style"    },
  { id: 3,  position: 3,   name: "美式",     en_name: "American Style"    },
  { id: 4,  position: 4,   name: "新中式",   en_name: "New Chinese Style" },
  { id: 5,  position: 5,   name: "其他",     en_name: "Other"             },
  { id: 6,  position: 6,   name: "法式",     en_name: "French"            },
  { id: 7,  position: 7,   name: "中式",     en_name: "Chinese style"     },
  { id: 8,  position: 8,   name: "韩式",     en_name: "Korean"            },
  { id: 9,  position: 9,   name: "现代",     en_name: "Modern"            },
  { id: 10, position: 10,  name: "地中海",   en_name: "Mediterranean Sea" },
  { id: 11, position: 11,  name: "北欧",     en_name: "Northern Europe"   },
  { id: 12, position: 12,  name: "乡村",     en_name: "Rural"             },
  { id: 13, position: 13,  name: "田园",     en_name: "Countryside"       },
  { id: 14, position: 14,  name: "新古典",   en_name: "Neo Classical"     },
  { id: 15, position: 15,  name: "简约",     en_name: "Simple"            },
  { id: 16, position: 16,  name: "日式",     en_name: "Japanese"          },
  { id: 17, position: 17,  name: "仿古",    en_name: "To fake something antique"   },
  { id: 18, position: 18,  name: "田园风格", en_name: "Pastoral style"             },
  { id: 19, position: 19,  name: "后现代",   en_name: "Postmodern"       },
  { id: 20, position: 20,  name: "工业风",   en_name: "Industrial wind"     },
  { id: 21, position: 21,  name: "个性创意", en_name: "Creative personality"            },
  { id: 22, position: 22,  name: "设计师灯", en_name: "Designer lamp"          },
]

ProductStyle.seed(:id, *records)
ProductStyle.where.not(id: records.map { |r| r[:id] }).delete_all
