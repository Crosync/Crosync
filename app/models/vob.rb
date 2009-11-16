class Vob < ActiveRecord::Base
  belongs_to :host, :include => :site
#  belongs_to :host
  has_many :oplogs, :foreign_key => "row_replica"
#  belongs_to :host 

#  validates_associated :host

  def to_label
    tag
  end
  
  def site
    host.site.sitename
#   Site.find_by_id(host.site_id).sitename
  end

end
