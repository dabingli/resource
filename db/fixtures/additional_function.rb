records = [
  { id: 1,   position: 1,   name: "龙头五件套",    en_name: "Faucet five piece" },
  { id: 2,   position: 2,   name: "冲浪",         en_name: "Surfing" },
  { id: 3,   position: 3,   name: "泡泡浴",       en_name: "Bubble bath" },
  { id: 4,   position: 4,   name: "彩灯",         en_name: "Coloured lights" },
  { id: 5,   position: 5,   name: "电脑板",        en_name: "Computer board" },
  { id: 6,   position: 6,   name: "显示器",        en_name: "Monitor" },
  { id: 7,   position: 7,   name: "其他",          en_name: "Other" },
  { id: 8,   position: 8,   name: "单控开关",       en_name: "Single control switch" },
  { id: 9,   position: 9,   name: "多控开关",       en_name: "Multiple control switch" },
  { id: 10,  position: 10,  name: "触摸/感应开关",   en_name: "Touch inductive switch" },
  { id: 11,  position: 11,  name: "定时开关",       en_name: "Timing switch" },
  { id: 12,  position: 12,  name: "遥控开关",       en_name: "Remote switch" },
  { id: 13,  position: 13,  name: "插卡开关",       en_name: "Card switch" },
  { id: 14,  position: 14,  name: "转换功能开关",    en_name: "Switch function" },
  { id: 15,  position: 15,  name: "稳压开关",       en_name: "Voltage regulator switch" },
  { id: 16,  position: 16,  name: "调光开关",       en_name: "Dimmer switch" },
  { id: 17,  position: 17,  name: "调速开关",       en_name: "Speed switch" },
  { id: 18,  position: 18,  name: "波动开关",       en_name: "Wave switch" },
  { id: 19,  position: 19,  name: "录放开关",       en_name: "Record switch" },
  { id: 20,  position: 20,  name: "限位开关",       en_name: "Limit switch" },
  { id: 21,  position: 21,  name: "隔离开关",       en_name: "Isolating switch" },
  { id: 22,  position: 22,  name: "智能开关",       en_name: "Intelligent switch" },
  { id: 23,  position: 23,  name: "闸刀开关",       en_name: "Knife switch" },
]

AdditionalFunction.seed(:id, *records)
AdditionalFunction.where.not(id: records.map { |r| r[:id] }).delete_all