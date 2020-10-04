class Pezzo < ActiveRecord::Base

  has_attached_file :immagine, :styles => { :medium => "800x800>", :thumb => "300x300>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :immagine, :content_type => /\Aimage\/.*\Z/

  belongs_to :azienda
  has_many :lavoraziones
  accepts_nested_attributes_for :lavoraziones, :reject_if => :all_blank, :allow_destroy => true
end
