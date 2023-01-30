FactoryBot.define do
  factory :employee do
    id { 1 }
    number { "1" }
    last_name { "山田" }
    first_name { "太郎" }
    account { "yamada" }
    password { "hogehoge" }
    email { "yamada@example.co.jp" }
    date_of_joining { "1991/4/1" }
    department { FactoryBot.create(:department) }
    office { FactoryBot.create(:office) }
  end
end
