class Book < ApplicationRecord
  belongs_to :user
  
  #has_many :favorites ,dependent: :destroy?
  has_one :favorite

  
#投稿画像に付けられた「いいね」に、自分（ログインしているユーザ）が含まれているかをfavorited_by?メソッドで判定
  def favorited_by?(user)
   favorites.exists?(user_id: user.id)
  end
  
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
end
