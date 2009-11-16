class Oplog < ActiveRecord::Base
  belongs_to :host, :include => :site
  belongs_to :vob, :foreign_key => "row_replica"
  belongs_to :site
  
  def row
    vob.replica_name
  end
  
  def column
    _col = Vob.find(self[:column_replica])
#    _col = Vob.find_by_id(self[:column_replica])
    if !_col.nil?
      _col.replica_name
    else
      "Not Found !??.. - check RI"
    end
  end
  
  def to_label
    "...on site = \"" + site.sitename + "\"... on host = \"" + host.hostname + "\""
  end

    class << self

# returns 0 if no exception is claimed and otherwise for the exception value
# when both exports and imports incidents occur - there must be a transport and info update issue
  def incidents_tagging(record)
    _exports = epoch_export_issue(record)
    _imports = epoch_import_issue(record)
    if _exports && _imports
      return "transport-record"
    end
    if _exports;  return "export-record"
    elsif _imports; return "import-record"
    end
    return 0
  end  

#########################################################################
#
# epoch_export_issue(record)
# Export issues are when packets are not generated from the "Resident" entry
# to "Exported"
# also check if a connection exists between sites.
# if the sites are not connected "Exported"s oplog is irrelevant
#
#########################################################################

  def epoch_export_issue(record)
    if record[:process] != "Exported"; return false; end

    _op_resident = self.find_by_oid_and_process(record[:oid], "Resident")

    if _op_resident.nil?; return false; end   # not enough data - can not report an error!
    
    _site1 = Site.find(_op_resident[:site_id])
    if _site1.nil?; return false; end;     # not enough data - can not report an error!
    
# find the resident's entry site_id of the column_replica - if it doesn't exist, raise an error!!!
##    _res_vob = Vob.find(record[:column_replica])
##   _res_host = Host.find(_res_vob[:host_id])
    if (_op_resident[:opnumber] > record[:opnumber])
        return true     # we are behind!
    end
    return false
  end
  
#########################################################################
#
# epoch_import_issue(record)
# Import issues are when packets are not generated from the "Resident" entry
# to "Imported" are not received
# also check if a connection exists between sites.
# if the sites are not connected "Imported"s oplog is irrelevant
#
#########################################################################
  def epoch_import_issue(record)
    if  record[:process] != "Imported"; return false; end
# find the resident with the same OID
    _op_resident = Oplog.find_by_oid_and_process(record[:oid], "Resident")
    if  _op_resident.nil?; return false; end

    if _op_resident[:opnumber] > record[:opnumber]
        return true     # we are behind
    end
    return false
  end
  
  def epoch_transport_issue(record)
    
  end

 end  #class << self

end
