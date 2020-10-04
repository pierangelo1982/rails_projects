class Extrawork < ActiveRecord::Base
  belongs_to :car
  has_many :extralavoroworks, :dependent => :destroy
  has_many :scriviworks, :dependent => :destroy
  has_many :catextrawork, through: :extralavorowork
  accepts_nested_attributes_for :extralavoroworks, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :scriviworks, allow_destroy: true, reject_if: :all_blank

end
