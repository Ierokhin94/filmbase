class Answer < ActiveRecord::Base
  has_and_belongs_to_many :user_answers
  belongs_to :question

  def self.edit_by?(u)
    u.try(:admin?)
  end

end
