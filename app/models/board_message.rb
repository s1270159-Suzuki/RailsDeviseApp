class BoardMessage < ApplicationRecord
  belongs_to :board_user

  validates :content, presence: {message:'は、必須項目です。'}
end
