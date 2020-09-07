class Medium < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '書籍' },
    { id: 3, name: '動画' },
    { id: 4, name: 'Udemy' },
    { id: 5, name: '無料ウェブサービス' }
  ]
end
