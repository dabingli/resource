Language.seed(:id,
  { id: 1,  position: 1,  foreign: "zh-CN", name: "中文" },
  { id: 2,  position: 2,  foreign: "en", name: "English" },
)

Language.where('id > ?', 2).delete_all
