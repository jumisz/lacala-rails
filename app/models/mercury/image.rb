class Mercury::Image < ActiveRecord::Base

  self.table_name = :mercury_images
  

  has_attached_file :image, :styles => { :medium => "600x400>", :thumb => "100x100>" }, :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {environment: ENV["RACK_ENV"]}
       

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  delegate :url, :to => :image

  def serializable_hash(options = nil)
    options ||= {}
    options[:methods] ||= []
    options[:methods] << :url
    super(options)
  end

end
