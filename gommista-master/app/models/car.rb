class Car < ActiveRecord::Base
	has_attached_file :libretto, :default_url => "/bin/local/missing.pdf"
	validates_attachment :libretto, content_type: { content_type: "application/pdf" }
	has_attached_file :libretto, :styles => { :medium => "800x800>", :thumb => "300x300>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :libretto, :content_type => /\Aimage\/.*\Z/
	validates_with AttachmentSizeValidator, :attributes => :libretto, :less_than => 10.megabytes


	validates :owner_id, :presence => true
	validates :targa, :presence => true

  belongs_to :owner
  has_many :tyres, :dependent => :destroy
  has_many :works, :dependent => :destroy
  has_many :worktypologies, through: :work

	validates_presence_of :targa
	validates_uniqueness_of :targa

	before_save :upper_targa

	#accepts_nested_attributes_for :tyres, reject_if: lambda {|t| t[:modello].blank?} 

  def selecttarga
    "#{owner.denominazione} -  #{targa}  -  #{marca} #{modello}"
  end

	def upper_targa
		self.targa.upcase! if self.targa
	end
end
