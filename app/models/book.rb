class Book < ApplicationRecord
  
  belongs_to :user
  
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy


  
#投稿画像に付けられた「いいね」に、自分（ログインしているユーザ）が含まれているかをfavorited_by?
#user_idはいいねしたユーザのID
  def favorited_by?(user_id:)
   favorites.exists?(user_id: user_id)
  end
  
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
end

 def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @book = Book.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?","%#{word}%")
    else
      @book = Book.all
    end
  end
  
