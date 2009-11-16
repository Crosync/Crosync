class Host < ActiveRecord::Base
  belongs_to :site, :include => :client
  has_many :oplogs, :dependent => :delete_all
  has_many :vobs, :dependent => :delete_all
  before_update :check_oplogs
  
  validates_presence_of :site_id, :hostname

  def to_label
    hostname
  end
  
private

# while consolidating hosts under the same site_id, I need to update the references in oplogs
# before host1.site_id = id1 and host2.site_id = id2 becomes host2.site_id = id1 and id2 becomes obsolete
# all the references in Oplogs table with id2 become id1
  def check_oplogs
# retrieve the old site_id - self contains the new site_id!
    old_site_id = Host.find(id).site_id
# we don't do anything if the site_id remains the same
    if old_site_id != site_id
      old_ops = Oplog.find_all_by_site_id(old_site_id)
      old_ops.each { |op|; op[:site_id] = site_id; op.save; }
    end
  end

end
