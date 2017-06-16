records = [
  { id: 1, position: 1, name: "200Lm以下",      en_name: "Below 200Lm" },
  { id: 2, position: 2, name: "200-500Lm",     en_name: "200-500Lm" },
  { id: 3, position: 3, name: "500-1000Lm",    en_name: "500-1000Lm" },
  { id: 4, position: 4, name: "1000-2000Lm",   en_name: "1000-2000Lm" },
  { id: 5, position: 5, name: "2000-3000Lm",   en_name: "2000-3000Lm"  },
  { id: 6, position: 6, name: "3000-5000Lm",   en_name: "3000-5000Lm" },
  { id: 7, position: 7, name: "5000-8000Lm",   en_name: "5000-8000Lm" },
  { id: 8, position: 8, name: "8000-10000Lm",  en_name: "8000-10000Lm" },
  { id: 9, position: 9, name: "10000Lm以上",    en_name: "More than 10000Lm" },
]
Lumen.seed(:id, *records)
Lumen.where.not(id: records.map { |r| r[:id] }).delete_all