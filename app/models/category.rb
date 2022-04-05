class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '米類' },
    { id: 3, name: '麺類' },
    { id: 4, name: '肉類' },
    { id: 5, name: '野菜' },
    { id: 6, name: '海鮮' },
    { id: 7, name: '卵・乳製品' },
    { id: 8, name: '果物' },
    { id: 9, name: '飲料' },
    { id: 10, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :refrigerators
end
