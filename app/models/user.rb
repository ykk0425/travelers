class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :plans, inverse_of: :user,dependent: :destroy
  has_one_attached :profile_image

  def guest_user?
    email == GUEST_USER_EMAIL
  end
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

  def self.looks(search, word) #self.looks クラス全体にlooksメソッド使うためにself.使ってる。
    if search == "perfect_match" #完全一致の場合
      User.where("name LIKE?", "#{word}")
    elsif search == "forward_match" #前方一致
      User.where("name LIKE?","#{word}%")
    elsif search == "backward_match" #後方一致
      User.where("name LIKE?","%#{word}")
    elsif search == "partial_match" #部分一致
      User.where("name LIKE?","%#{word}%")
    else
      User.all #上の検索条件に当てはまらなかったら、全ユーザ取得する
    end
  end

end
