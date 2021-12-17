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

  10.times do |n|
    Genre.create!(
      name: "ケーキ#{n + 1}"
      )
  end

  9.times do |n|
    Item.create!(
      genre_id: n + 1,
      name: "チーズケーキ#{n + 1}",
      explanation: "甘くて美味しい#{n + 1}",
      price: 1000 + (n * 1000),
      is_active: true,
      image: open("./app/assets/images/cake.jpg")
    )
  end

  9.times do |n|
    Ship.create!(
      customer_id: n + 1,
      name: "test#{n + 1}",
      zipcode: "123456#{n + 1}",
      address: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
    )
  end

  6.times do |n|
    Order.create!(
      customer_id: n + 1,
      shipping_cost: 800,
      address: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
      zipcode: "123456#{n + 1}",
      name: "test#{n + 1}",
      payment: 1000 + (n * 1000) +800,
      payment_method: 0,
      status: 0
    )
  end

  5.times do |n|
    OrderDetail.create!(
      item_id: n + 1,
      order_id: n + 1,
      quantity: n + 3,
      amount_price: 1000 + (n * 1000),
      making_status: 0
    )
  end


