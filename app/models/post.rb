class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :photos
    # 今回投稿する際にPostモデルの子に値するPhotoモデルを通して、photosテーブルに写真を保存します。accepts_nested_attributes_forメソッドを親のモデル（Postモデル）に追加する必要があります。
  def liked_by(user)
     # user_idとpost_idが一致するlikeを検索する
    Like.find_by(user_id: user.id, post_id: id)
  end

end
