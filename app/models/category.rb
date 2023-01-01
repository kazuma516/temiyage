class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '洋菓子（甘い）' },
    { id: 2, name: '洋菓子（しょっぱい）' },
    { id: 3, name: '和菓子（甘い）' },
    { id: 4, name: '和菓子（しょっぱい）' },
    { id: 5, name: 'その他' },
  ]
  
    include ActiveHash::Associations
    has_many :items
end