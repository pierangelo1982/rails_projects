class Invoice < ActiveRecord::Base
  belongs_to :custumer
  belongs_to :payment_type
  belongs_to :tax

  has_many :invoice_articles, :dependent => :destroy
  accepts_nested_attributes_for :invoice_articles, :reject_if => :all_blank, :allow_destroy => true

  has_many :payment_deadlines, :dependent=> :destroy
  accepts_nested_attributes_for :payment_deadlines, :reject_if => :all_blank, :allow_destroy => true

  has_one :address, through: :custumer



  before_save :imponibile
  before_save :totale_iva
  before_save :totale

  def imponibile
  	self.imponibile = self.invoice_articles.sum(:importo)
  end

  def totale
  	self.totale = self.invoice_articles.sum(:totale_ivato)
  end

  def totale_iva
  	self.totale_iva = self.totale - self.imponibile
  end


  scope :year, lambda{|year|
    where(" EXTRACT(YEAR FROM data) = ? ", year ) if year.present?  
  }


end
