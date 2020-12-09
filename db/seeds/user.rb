User.create!(
  [
    {
      id: 1,
      email: '1@1',
      name: 'マコ',
      profile_image: File.open('./app/assets/images/no_image.jpg'),
      password: '111111',
    created_at: '2019-07-11 02:33:34',
    updated_at: '2019-07-11 02:33:34'
    },

    {
      id: 2,
      email: '2@2',
      name: 'リク',
      profile_image: File.open('./app/assets/images/no_image.jpg'),
      password: '222222',
    created_at: '2019-07-11 02:33:34',
    updated_at: '2019-07-11 02:33:34'
    },

    {
      id: 3,
      email: '3@3',
      name: 'リマ',
      profile_image: File.open('./app/assets/images/no_image.jpg'),
      password: '333333',
    created_at: '2019-07-11 02:33:34',
    updated_at: '2019-07-11 02:33:34'
    }
  ]
)
