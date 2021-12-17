20.times do |n|
    Customer.create!(
      email: "test#{n + 1}@test.com",
      first_name: "名#{n + 1}",
      last_name: "姓#{n + 1}",
      first_name_kana: "セイ",
      last_name_kana: "メイ",
      password: "123456",
      zipcode: "1234567",
      address: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
      phone_number: "09012345678",
      is_deleted: false,
    )
end

 Admin.create!(
    email: "test@test.com",
    password: "aaaaaa"
  )