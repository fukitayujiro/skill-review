class Medium < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '書籍' },
    { id: 3, name: '動画' },
    { id: 4, name: 'Udemy' },
    { id: 5, name: 'MENTA' },
    { id: 6, name: 'ウェブサービス(無料)' },
    { id: 7, name: 'ウェブサービス(有料)' },
    { id: 8, name: 'その他' },
  ]
end
