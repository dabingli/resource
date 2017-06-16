records = [
  {id: 1, parent_id: nil, position: 1, name: '瓷砖', en_name: 'Tiles'},
  {id: 2, parent_id: 1, position: 1, name: '墙地砖', en_name: 'Floor Tiles & Wall Tiles'},
  {id: 3, parent_id: 1, position: 2, name: '内墙砖', en_name: 'Interior Wall Tiles'},
  {id: 4, parent_id: 1, position: 3, name: '外墙砖', en_name: 'Exterior Wall Tiles'},
  {id: 5, parent_id: 1, position: 4, name: '厚砖', en_name: 'Thick Tile'},
  {id: 6, parent_id: 1, position: 5, name: '陶瓷薄板', en_name: 'Slim Tile'},
  {id: 7, parent_id: 1, position: 6, name: '小型砖', en_name: 'Small Tile'},
  {id: 8, parent_id: 1, position: 7, name: '陶瓷配件', en_name: 'Ceramic accessories'},

  {id: 9,  parent_id: 2, position: 1, name: '抛光砖', en_name: 'Polished Unglazed Tiles'},
  {id: 10, parent_id: 2, position: 2, name: '全抛釉', en_name: 'Full Polished Glazed Tiles'},
  {id: 11, parent_id: 2, position: 3, name: '仿古砖', en_name: 'Rustic Tiles'},
  {id: 12, parent_id: 2, position: 4, name: '大理石', en_name: 'Marble-like Tiles'},
  {id: 13, parent_id: 2, position: 5, name: '微晶石', en_name: 'Micro Crystal Tile'},
  {id: 14, parent_id: 2, position: 6, name: '抛晶砖', en_name: 'Crystal throwing tiles'},
  {id: 15, parent_id: 2, position: 7, name: '进口砖', en_name: 'Imported Tile'},

  {id: 16, parent_id: 9, position: 1, name: '瓷抛砖', en_name: 'Porcelain Polished Tile'},
  {id: 17, parent_id: 9, position: 2, name: '3D抛光砖', en_name: '3D Polished Tile'},
  {id: 18, parent_id: 9, position: 3, name: '渗花砖', en_name: 'Soluble Salt'},

  {id: 19, parent_id: 10, position: 1, name: '金刚石', en_name: 'Jingang full polished glazed tiles'},
  {id: 20, parent_id: 10, position: 2, name: '全抛釉(新石纪)', en_name: 'Full Polished Glazed Tiles (New Stone Era)'},

  {id: 21, parent_id: 11, position: 1, name: '仿木', en_name: 'Wood-like'},
  {id: 22, parent_id: 11, position: 2, name: '仿古', en_name: 'Rustic'},
  {id: 23, parent_id: 11, position: 3, name: '仿石', en_name: 'Stone-like'},
  {id: 24, parent_id: 11, position: 4, name: '仿金属', en_name: 'Metallic'},

  {id: 25, parent_id: 12, position: 1, name: '通体大理石', en_name: 'Full Body Marble-like Tiles'},
  {id: 26, parent_id: 12, position: 2, name: '全抛大理石', en_name: 'Full Polished Glazed Marble-like Tiles'},
  {id: 27, parent_id: 12, position: 3, name: '柔光大理石', en_name: 'Soft Polished Marble-like Tiles'},

  {id: 28, parent_id: 3, position: 1, name: '瓷片', en_name: 'Wall Tiles'},
  {id: 29, parent_id: 3, position: 2, name: '抛光砖瓷片', en_name: 'Polished Wall Tiles'},

  {id: 30, parent_id: 4, position: 1, name: '通体外墙砖', en_name: 'Full Body Exterior Wall Tiles'},
  {id: 31, parent_id: 4, position: 2, name: '釉面外墙砖', en_name: 'Glazed Exterior Wall Tiles'},

  {id: 32, parent_id: 6, position: 1, name: '有光面', en_name: 'Polished'},
  {id: 33, parent_id: 6, position: 2, name: '哑光面', en_name: 'Matt'},

  {id: 34, parent_id: 8, position: 1, name: '拼花', en_name: 'Parquet'},
  {id: 35, parent_id: 8, position: 2, name: '地花', en_name: 'Floor Parquet'},
  {id: 36, parent_id: 8, position: 3, name: '梯级砖', en_name: 'Step Tiles'},
  {id: 37, parent_id: 8, position: 4, name: '波打线', en_name: 'Border Tiles'},
  {id: 38, parent_id: 8, position: 5, name: '花砖', en_name: 'Artistic Tiles'},
  {id: 39, parent_id: 8, position: 6, name: '瓦筒', en_name: 'Tile Pipe'},
  {id: 40, parent_id: 8, position: 7, name: '腰线', en_name: 'Waist'},
  {id: 41, parent_id: 12, position: 4, name: '剥开釉大理石', en_name: 'Peel Glaze Marble'},
  {id: 42, parent_id: 8, position: 8, name: '背景墻', en_name: 'Background wall'},
  {id: 43, parent_id: 8, position: 9, name: '收边线', en_name: 'Curb line'},

  {id: 101, parent_id: nil, position: 2, name: '马赛克', en_name: 'Mosaic'},
  {id: 102, parent_id: 101, position: 1, name: '马赛克', en_name: 'Mosaic'},
  {id: 103, parent_id: 101, position: 2, name: '装饰线', en_name: 'Border'},
  {id: 104, parent_id: 101, position: 3, name: '拼图', en_name: 'Jigsaws'},
  {id: 105, parent_id: 101, position: 4, name: '泳池砖', en_name: 'Swimming Pool Mosaic'},
  {id: 106, parent_id: 101, position: 5, name: '文化石', en_name: 'Cultural Stone'},

  {id: 201, parent_id: nil, position: 3, name: '卫浴', en_name: 'Bathing'},
  {id: 202, parent_id: 201, position: 1, name: '浴室柜', en_name: 'Bathroom Cabinet'},
  {id: 203, parent_id: 201, position: 2, name: '陶瓷洁具', en_name: 'Ceramic ware'},
  {id: 204, parent_id: 201, position: 3, name: '休闲浴房', en_name: 'Leisure bath room'},
  {id: 205, parent_id: 201, position: 4, name: '休闲浴缸', en_name: 'Leisure bathtub'},
  {id: 206, parent_id: 201, position: 5, name: '龙头五金', en_name: 'Faucet hardware'},

  {id: 220, parent_id: 202, position: 1, name: '现代浴室柜', en_name: 'Modern bathroom cabinet'},
  {id: 221, parent_id: 202, position: 2, name: '欧式浴室柜', en_name: 'European bathroom cabinet'},
  {id: 222, parent_id: 202, position: 3, name: '美式浴室柜', en_name: 'American bathroom cabinet'},
  {id: 223, parent_id: 202, position: 4, name: '新中式浴室柜', en_name: 'New Chinese bathroom cabinet'},

  {id: 240, parent_id: 203, position: 1, name: '智能座便器', en_name: 'Smart Seat'},
  {id: 241, parent_id: 203, position: 2, name: '普通座便器', en_name: 'Normal Sitting Toilet'},
  {id: 242, parent_id: 203, position: 3, name: '陶瓷盆', en_name: 'Ceramic Basin'},
  {id: 243, parent_id: 203, position: 4, name: '蹲便器', en_name: 'Squatting Toilet'},
  {id: 244, parent_id: 203, position: 5, name: '小便器', en_name: 'Urinal'},
  {id: 245, parent_id: 203, position: 6, name: '妇洗器', en_name: 'Women Washer'},
  {id: 246, parent_id: 203, position: 7, name: '拖布池', en_name: 'Mop Pool'},
  {id: 247, parent_id: 203, position: 8, name: '蹲便水箱', en_name: 'Squat Toilet'},

  {id: 260, parent_id: 204, position: 1, name: '淋浴房', en_name: 'Shower Room'},
  {id: 261, parent_id: 204, position: 2, name: '整体房', en_name: 'Whole Room'},
  {id: 262, parent_id: 204, position: 3, name: '蒸汽房', en_name: 'Steam Room'},
  {id: 263, parent_id: 204, position: 4, name: '光波房', en_name: 'Sauna Room'},

  {id: 280, parent_id: 205, position: 1, name: '艺术缸', en_name: 'Art cylinder'},
  {id: 281, parent_id: 205, position: 2, name: '嵌入式缸', en_name: 'Embedded cylinder'},
  {id: 282, parent_id: 205, position: 3, name: '裙边缸',     en_name: 'Skirt cylinder'},
  {id: 283, parent_id: 205, position: 4, name: '木桶缸',     en_name: 'Barrel cylinder'},
  {id: 284, parent_id: 205, position: 5, name: '功能按摩缸', en_name: 'Functional massage cylinder'},

  {id: 300, parent_id: 206, position: 1, name: '淋浴花洒', en_name: 'Shower Sprinkler Faucet'},
  {id: 301, parent_id: 206, position: 2, name: '柜盆龙头', en_name: 'Basin Faucet'},
  {id: 302, parent_id: 206, position: 3, name: '厨房龙头', en_name: 'Kitchen Faucet'},
  {id: 303, parent_id: 206, position: 4, name: '浴缸龙头', en_name: 'Bathtub Faucet'},
  {id: 304, parent_id: 206, position: 5, name: '感应龙头', en_name: 'Induction tap'},
  {id: 305, parent_id: 206, position: 6, name: '冲水阀', en_name: 'Flush valve'},
  {id: 306, parent_id: 206, position: 7, name: '厨房水槽', en_name: 'Kitchen sink'},
  {id: 307, parent_id: 206, position: 8, name: '浴室挂件', en_name: 'Bathroom Pendant'},
  {id: 308, parent_id: 206, position: 9, name: '地漏配件', en_name: 'Drain fittings'},

  {id: 401, parent_id: nil, position: 5, name: '辅助材料', en_name: 'Auxiliary_material'},
  {id: 402, parent_id: 401, position: 1, name: '填缝剂', en_name: 'Sealant'},
  {id: 403, parent_id: 401, position: 2, name: '瓷砖胶', en_name: 'Ceramic tile adhesive'},
  {id: 404, parent_id: 401, position: 3, name: '防水剂', en_name: 'Waterproof agent'},
  {id: 405, parent_id: 401, position: 4, name: '粘结剂', en_name: 'Binder'},

  {id: 406, parent_id: 402, position: 1, name: '美缝剂', en_name: 'American suture'},
  {id: 407, parent_id: 402, position: 2, name: '普通填缝剂', en_name: 'Ordinary sealant'},

  {id: 408, parent_id: 403, position: 1, name: '标准型', en_name: 'Standard type'},
  {id: 409, parent_id: 403, position: 2, name: '强力型', en_name: 'Strength type'},
  {id: 410, parent_id: 403, position: 3, name: '强韧型', en_name: 'Robust type'},

  {id: 411, parent_id: 404, position: 1, name: 'K11防水材料', en_name: 'K11 waterproof material'},

  {id: 412, parent_id: 405, position: 1, name: '粘性强', en_name: 'Strong viscosity'},
  {id: 413, parent_id: 405, position: 2, name: '耐水性', en_name: 'Water resistance'},

  {id: 501, parent_id: nil, position: 6,  name: '家具',       en_name: 'Furniture'},
  {id: 502, parent_id: 501, position: 1,  name: '普通家具',   en_name: 'Ordinary furniture'},
  {id: 503, parent_id: 501, position: 2,  name: '定制家具',   en_name: 'Custom furniture'},
  {id: 504, parent_id: 501, position: 3,  name: '办公家具',   en_name: 'Office furniture'},
  {id: 505, parent_id: 501, position: 4,  name: '门窗、楼梯', en_name: 'Doors and windows, stairs'},
  {id: 506, parent_id: 501, position: 5,  name: '家具五金',   en_name: 'Furniture hardware'},

  {id: 516, parent_id: 502, position: 1,  name: '卧室系列',     en_name: 'Bedroom series'},
  {id: 517, parent_id: 502, position: 2,  name: '客厅系列',     en_name: 'Living room series'},
  {id: 518, parent_id: 502, position: 3,  name: '餐厅系列',     en_name: 'Restaurant series'},
  {id: 519, parent_id: 502, position: 4,  name: '儿童房系列',   en_name: 'Children room series'},
  {id: 520, parent_id: 502, position: 5,  name: '书房系列',     en_name: 'Studing Room'},
  {id: 521, parent_id: 502, position: 6,  name: '入户花园系列', en_name: 'Home garden series'},
  {id: 522, parent_id: 502, position: 7,  name: '户外系列',     en_name: 'Outdoor series'},
  {id: 523, parent_id: 502, position: 8,  name: '床垫系列',     en_name: 'Mattress series'},

  {id: 533, parent_id: 503, position: 1,  name: '定制衣柜', en_name: 'Custom wardrobe'},
  {id: 534, parent_id: 503, position: 2,  name: '定制橱柜', en_name: 'Custom cabinet'},

  {id: 544, parent_id: 504, position: 1,  name: '办公桌', en_name: 'Desk'},
  {id: 545, parent_id: 504, position: 2,  name: '办公椅', en_name: 'Office chair'},
  {id: 546, parent_id: 504, position: 3,  name: '文件柜', en_name: 'File cabinet'},
  {id: 547, parent_id: 504, position: 4,  name: '保险柜', en_name: 'Safe cabinet'},

  {id: 555, parent_id: 505, position: 1,  name: '房间门',   en_name: 'Room door'},
  {id: 556, parent_id: 505, position: 2,  name: '大门',     en_name: 'Gate'},
  {id: 557, parent_id: 505, position: 3,  name: '卫生间门', en_name: 'Toilet door'},
  {id: 558, parent_id: 505, position: 4,  name: '衣柜门',   en_name: 'Wardrobe door'},
  {id: 559, parent_id: 505, position: 5,  name: '窗',   en_name: 'Doors and windows'},
  {id: 560, parent_id: 505, position: 6,  name: '楼梯',   en_name: 'stairs'},

  {id: 570, parent_id: 506, position: 1,  name: '门铰',     en_name: 'Hinge'},
  {id: 571, parent_id: 506, position: 2,  name: '滑轨',     en_name: 'Slide'},
  {id: 572, parent_id: 506, position: 3,  name: '拉手',     en_name: 'Handle'},
  {id: 573, parent_id: 506, position: 4,  name: '门锁',     en_name: 'Lock'},
  {id: 574, parent_id: 506, position: 5,  name: '磁吸',     en_name: 'Magnet'},
  {id: 575, parent_id: 506, position: 6,  name: '吊轮',     en_name: 'Hanging wheel'},
  {id: 576, parent_id: 506, position: 7,  name: '拆装螺丝', en_name: 'Assembly screw'},

  {id: 580, parent_id: 534, position: 1,  name: '橱柜五金',    en_name: 'Cabinet hardware'},
  {id: 581, parent_id: 534, position: 2,  name: '橱柜台面',    en_name: 'Cabinet table'},
  {id: 582, parent_id: 534, position: 3,  name: '橱柜柜体',    en_name: 'Cabinet cabinet'},
  {id: 583, parent_id: 534, position: 4,  name: '橱柜灯具',    en_name: 'Cabinet lamp'},
  {id: 584, parent_id: 534, position: 5,  name: '橱柜电器',    en_name: 'Cabinet appliance'},
  {id: 585, parent_id: 534, position: 6,  name: '橱柜装饰封板', en_name: 'Decorative seal board for cabinet'},

  {id: 588, parent_id: nil, position: 7,  name: '家居',     en_name: 'Home Furnishing'},
  {id: 589, parent_id: 588, position: 1,  name: '家饰家纺', en_name: 'Home furnishings'},
  {id: 590, parent_id: 588, position: 2,  name: '天花吊顶', en_name: 'Ceiling'},
  {id: 591, parent_id: 588, position: 3,  name: '厨房设施', en_name: 'Kitchen facilities'},

  {id: 701, parent_id: nil, position: 8,  name: '物料展具', en_name: 'Material exhibit'},
  {id: 702, parent_id: 701, position: 1,  name: '广告物料', en_name: 'Advertising material'},
  {id: 703, parent_id: 701, position: 2,  name: '展示展具', en_name: 'Exhibition show'},

  {id: 801, parent_id: nil, position: 9,  name: '地板',    en_name: 'Floor'},
  {id: 802, parent_id: 801, position: 1,  name: '室内',    en_name: 'Indoor'},
  {id: 803, parent_id: 801, position: 2,  name: '室外',    en_name: 'Outdoor'},

  {id: 811, parent_id: 802, position: 1,  name: '实木地板',   en_name: 'Solid wood flooring'},
  {id: 812, parent_id: 802, position: 2,  name: '复合地板', en_name: 'Composite floor'},
  {id: 813, parent_id: 802, position: 3,  name: '竹地板',     en_name: 'Bamboo flooring'},
  {id: 814, parent_id: 802, position: 4,  name: '强化地板',   en_name: 'Laminate Flooring'},

  {id: 820, parent_id: 813, position: 1,  name: '全竹',       en_name: 'Laminated Bamboo'},
  {id: 821, parent_id: 813, position: 2,  name: '重竹',       en_name: 'Strand Woven Bamboo Flooring'},

  {id: 825, parent_id: 811, position: 1,  name: '独体实木',       en_name: 'Solid Wood Veneers'},
  {id: 826, parent_id: 811, position: 2,  name: '指接实木',       en_name: 'Finger-Jointed'},

  {id: 831, parent_id: 812, position: 1,  name: '三层复合',       en_name: 'Three-layer composite'},
  {id: 832, parent_id: 812, position: 2,  name: '多层复合',       en_name: 'Multi-layer composite'},

  {id: 841, parent_id: 803, position: 1,  name: 'pvc地板',   en_name: 'pvc floor'},
  {id: 842, parent_id: 803, position: 2,  name: '木塑地板',   en_name: 'Wood plastic floor'},

  {id: 851, parent_id: 841, position: 1,  name: '多层复合型',   en_name: 'multi-layer composite'},
  {id: 852, parent_id: 841, position: 2,  name: '同质透心型',   en_name: 'Homogeneous PVC'},
  {id: 853, parent_id: 841, position: 3,  name: '半同质体型',   en_name: 'Half Homogenous PVC'},

  {id: 861, parent_id: 842, position: 1,  name: '实心',   en_name: 'Solid'},
  {id: 862, parent_id: 842, position: 2,  name: '空心',   en_name: 'Hollow'},

  {id: 901, parent_id: nil, position: 10,  name: '石材',   en_name: 'Stone'},
  {id: 902, parent_id: 901, position: 1,   name: '人造石', en_name: 'Artificial stone'},


  {id: 1000, parent_id: 516, position: 1,   name: '床',           en_name: 'Bed'},
  {id: 1001, parent_id: 516, position: 2,   name: '床头柜',        en_name: 'Bedside cupboard'},
  {id: 1002, parent_id: 516, position: 3,   name: '梳妆台、梳妆镜', en_name: 'Dressing table, dressing mirror'},
  {id: 1003, parent_id: 516, position: 4,   name: '梳妆凳',        en_name: 'Toilet stool'},
  {id: 1004, parent_id: 516, position: 5,   name: '榻榻米',        en_name: 'Tatami'},
  {id: 1005, parent_id: 516, position: 6,   name: '床尾凳',        en_name: 'Bed stool'},
  {id: 1006, parent_id: 516, position: 7,   name: '斗柜',          en_name: 'Bucket cabinet'},
  {id: 1007, parent_id: 516, position: 8,   name: '衣柜',          en_name: 'Wardrobe'},
  {id: 1008, parent_id: 516, position: 9,   name: '卧室套装',       en_name: 'Bedroom Sets'},

  {id: 1021, parent_id: 517, position: 1,   name: '沙发',         en_name: 'Sofa'},
  {id: 1022, parent_id: 517, position: 2,   name: '茶几、角几',    en_name: 'Coffee table, corner'},
  {id: 1023, parent_id: 517, position: 3,   name: '电视柜',       en_name: 'TV cabinet'},
  {id: 1024, parent_id: 517, position: 4,   name: '酒柜、装饰柜',  en_name: 'Wine cabinet, decorative cabinet'},
  {id: 1025, parent_id: 517, position: 5,   name: '玄关柜、屏风',  en_name: 'Entrance cabinet, screen'},
  {id: 1026, parent_id: 517, position: 6,   name: '边桌',        en_name: 'The edge of the table'},
  {id: 1027, parent_id: 517, position: 7,   name: '休闲椅',       en_name: 'Leisure chair'},
  {id: 1028, parent_id: 517, position: 8,   name: '吧台',         en_name: 'Bar counter'},
  {id: 1029, parent_id: 517, position: 9,   name: '吧椅',         en_name: 'Bar chair'},
  {id: 1030, parent_id: 517, position: 10,  name: '花架',         en_name: 'Pergola'},
  {id: 1031, parent_id: 517, position: 11,  name: '茶水柜',       en_name: 'Tea cabinet'},
  {id: 1032, parent_id: 517, position: 12,  name: '客厅套装',       en_name: 'Living room set'},

  {id: 1051, parent_id: 518, position: 1,   name: '餐桌',    en_name: 'Table'},
  {id: 1052, parent_id: 518, position: 2,   name: '餐椅',    en_name: 'Dining chair'},
  {id: 1053, parent_id: 518, position: 3,   name: '餐边柜',  en_name: 'Sideboard'},
  {id: 1054, parent_id: 518, position: 4,   name: '餐车',    en_name: 'Dining car'},
  {id: 1055, parent_id: 518, position: 5,   name: '餐厅套装', en_name: 'Restaurant set'},

  {id: 1071, parent_id: 520, position: 1,   name: '书桌',       en_name: 'Desk'},
  {id: 1072, parent_id: 520, position: 2,   name: '书柜、书架',  en_name: 'Bookcase, bookshelf'},
  {id: 1073, parent_id: 520, position: 3,   name: '书椅',       en_name: 'Chair'},
  {id: 1074, parent_id: 520, position: 4,   name: '书房套装',    en_name: 'Study suit'},

  {id: 1091, parent_id: 519, position: 1,   name: '儿童床',      en_name: 'Children bed'},
  {id: 1092, parent_id: 519, position: 2,   name: '儿童衣柜',    en_name: 'Children wardrobe'},
  {id: 1093, parent_id: 519, position: 3,   name: '儿童书桌',    en_name: 'Children desk'},
  {id: 1094, parent_id: 519, position: 4,   name: '儿童椅',      en_name: 'Children chair'},
  {id: 1095, parent_id: 519, position: 5,   name: '儿童床头柜',   en_name: 'Children bedside cabinet'},
  {id: 1096, parent_id: 519, position: 6,   name: '儿童房套装',   en_name: 'Children room suite'},

  {id: 1121, parent_id: 521, position: 1,   name: '鞋柜',          en_name: 'Shoe'},
  {id: 1122, parent_id: 521, position: 2,   name: '穿衣镜、衣帽架',  en_name: 'Chuanyijing, coatrack'},
  {id: 1123, parent_id: 521, position: 3,   name: '鱼缸柜',         en_name: 'Fish tank'},

  {id: 1141, parent_id: 522, position: 1,   name: '户外桌',      en_name: 'Outdoor table'},
  {id: 1142, parent_id: 522, position: 2,   name: '户外椅',      en_name: 'Outdoor chair'},
  {id: 1143, parent_id: 522, position: 3,   name: '吊篮',       en_name: 'Hanging basket'},
  {id: 1144, parent_id: 522, position: 4,   name: '躺床',       en_name: 'Children chair'},
  {id: 1145, parent_id: 522, position: 5,   name: '遮阳伞',     en_name: 'Lying in bed'},
  {id: 1146, parent_id: 522, position: 6,   name: '秋千',       en_name: 'Swing'},
  {id: 1147, parent_id: 522, position: 7,   name: '户外套装',    en_name: 'Outdoor suit'},

  {id: 1161, parent_id: 523, position: 1,   name: '乳胶床垫',    en_name: 'The latex mattress'},
  {id: 1162, parent_id: 523, position: 2,   name: '棕榈床垫',    en_name: 'Palm mattress'},
  {id: 1163, parent_id: 523, position: 3,   name: '弹簧床垫',    en_name: 'Spring mattress'},
  {id: 1164, parent_id: 523, position: 4,   name: '海绵床垫',    en_name: 'Sponge mattress'},
  {id: 1165, parent_id: 523, position: 5,   name: '进口床垫',    en_name: 'Imported mattress'},

  {id: 1301, parent_id: nil,  position: 11,  name: '灯具照明',   en_name: 'Lighting'},
  {id: 1302, parent_id: 1301, position: 1,   name: '家居灯具',   en_name: 'Household lamps'},
  {id: 1303, parent_id: 1301, position: 2,   name: '商业灯具',   en_name: 'Commercial lamps'},
  {id: 1304, parent_id: 1301, position: 3,   name: '灯具耗材',   en_name: 'Lighting supplies'},
  {id: 1305, parent_id: 1301, position: 4,   name: '开关插座',   en_name: 'Switch socket'},

  {id: 1321, parent_id: 1302, position: 1,   name: '客厅灯',       en_name: 'Living room lamps'},
  {id: 1322, parent_id: 1302, position: 2,   name: '餐厅灯',       en_name: 'Restaurant lights'},
  {id: 1323, parent_id: 1302, position: 3,   name: '卧室/书房灯',   en_name: 'Bedroom study lamp'},
  {id: 1324, parent_id: 1302, position: 4,   name: '阳台/过道灯',   en_name: 'Balcony corridor lights'},
  {id: 1325, parent_id: 1302, position: 5,   name: '厨卫灯',       en_name: 'Kitchen lamp'},
  {id: 1326, parent_id: 1302, position: 6,   name: '其它',         en_name: 'Other'},

  {id: 1341, parent_id: 1303, position: 1,   name: '支架灯/灯带',   en_name: 'Bracket lamp'},
  {id: 1342, parent_id: 1303, position: 2,   name: '户外灯',       en_name: 'outdoor light'},
  {id: 1343, parent_id: 1303, position: 3,   name: '非标定制灯',    en_name: 'Non-standard custom lamp'},
  {id: 1344, parent_id: 1303, position: 4,   name: '筒灯/射灯',     en_name: 'Downlight  Lamp'},
  {id: 1345, parent_id: 1303, position: 5,   name: '其它',         en_name: 'Other'},

  {id: 1361, parent_id: 1304, position: 1,   name: '光源耗材',      en_name: 'Light supplies'},
  {id: 1362, parent_id: 1304, position: 2,   name: '电子耗材',      en_name: 'Electronic consumables'},
  {id: 1363, parent_id: 1304, position: 3,   name: '其它',         en_name: 'Other'},

  {id: 1381, parent_id: 1305, position: 1,   name: '开关',         en_name: 'switch'},
  {id: 1382, parent_id: 1305, position: 2,   name: '插座',         en_name: 'Socket'},
  {id: 1383, parent_id: 1305, position: 3,   name: '带开关插座',    en_name: 'Switch socket'},
  {id: 1384, parent_id: 1305, position: 4,   name: '其它',         en_name: 'Other'},

]

ProductCategory.seed(:id, *records)
ProductCategory.where.not(id: records.map { |r| r[:id] }).delete_all
