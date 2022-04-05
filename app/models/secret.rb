class Secret < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '出身中学校は' },
    { id: 3, name: '好きな動物は' },
    { id: 4, name: '子供時代を過ごした町の名前は' },
    { id: 5, name: '飼っているペットの名前は' },
    { id: 6, name: '初めて作った料理は' },
    { id: 7, name: '憧れの職業は' },
    { id: 8, name: '中学生時代の所属クラブは' },
    { id: 9, name: '苦手な食べ物は' }
  ]

  include ActiveHash::Associations
  has_many :users
end
