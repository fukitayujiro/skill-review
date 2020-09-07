class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '経営' },
    { id: 3, name: 'IT' },
    { id: 4, name: '自己啓発' },
    { id: 5, name: 'マーケティング' }
  ]
end
