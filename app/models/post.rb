class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :photos
  # 今回投稿する際にPostモデルの子に値するPhotoモデルを通して、photosテーブルに写真を保存します。accepts_nested_attributes_forメソッドを親のモデル（Postモデル）に追加する必要があります。
end
