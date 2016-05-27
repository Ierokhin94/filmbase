class Interview < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions
  has_many :user_answers
  has_many :users, through: :user_answers
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: :true

  def self.edit_by?(u)
    u.try(:admin?)
  end

end
