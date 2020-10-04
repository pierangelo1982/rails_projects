class Magazzino < ActiveRecord::Base
  belongs_to :azienda
  has_many :entrata, :through => :azienda

end
