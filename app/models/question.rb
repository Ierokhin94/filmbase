class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  belongs_to :interview
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: :true

  def self.edit_by?(u)
    u.try(:admin?)
  end

end
