class Site < ActiveRecord::Base
# avoid cascading delete - it would not work with the current association
# has_many :hosts, :dependent => :delete_all
  has_many :hosts
  has_many :oplogs, :through => :hosts

  validates_presence_of :sitename

  def to_label
    sitename
  end

 class << self

 ##############################################################################################
 #
 # lsvob_scan(lsvob)
 #
 ##############################################################################################
  
 def lsvob_scan(params)
# CAREFUL - params[:file] is an IO object
  _rules = Hash[    :tag => "Tag:", 
                    :gpath => "Global path:",
                    :host_id => "Server host:",
                    :access => "Access:",
                    :region => "Region:",
                    :lpath => "Vob server access path:",
                    :family_uuid => "Vob family uuid: ",
                    :replica_uuid => "Vob replica uuid:",
                    :attribute => "Vob registry attributes:",
                    :description => "blah, blak mxk"]
  _hvob = Hash.new
  uploaded_file_IO = params[:lslog]
  until (_line = uploaded_file_IO.gets).nil? do 
# scanning the "columns" (hash' keys) for each line
    _rules.each_key do |hkey|
# is the hash value in the _line?
       if _line.index(_rules[hkey].to_s)
# the :tag key requires special treatment -
# it should have the description (if ever)
         if hkey == :tag
# is it the first record?
           if !_hvob[:tag].nil?
             lsvob_save_vobs_record(_rules, _hvob, params)
             _hvob.clear
           end #!_hvob[:tag].nil?
           lsvob_fill_tag_and_description(_line, _hvob)
            
         else
#one key per line for any line except the vob's tag
           _hvob[hkey] = (_line.gsub(_rules[hkey],'').rstrip).lstrip
         end #hkey == :tag 
      
       end #line.index(_rules[hkey].to_s)
      
    end #_rules.each_key do |hkey|
   end #uploaded_file_IO.each do |_line|
 
  uploaded_file_IO.close
#flush the last record
  lsvob_save_vobs_record(_rules, _hvob, params)

end

 ##############################################################################################
 #
 # lsepoch_scan(lsepoch)
 #
 ##############################################################################################
 
 def lsepoch_scan(params)

# row_replica field should also match the "Actual" epoch list...
# we let site_id to exist for tagging purposes, but will not be part of the record
   rules = Hash[ :tag => "For VOB replica ",
                  :row_replica => "plog IDs for row ",
                  :host_id => "",
                  :site_id => "",
                  :process => "",
                  :column_replica => "",
                  :opnumber => 0,
                  :oid => " oid:"]


   _epoch = Hash.new
   _esave = Hash.new
   lsepoch = params[:lslog]
# testing the log files
# used only while debugging
   if _debug
      if File::exists?("tepoch.log"); File.delete("tepoch.log"); end
      file = File.new("tepoch.log", "w")
   end
# Reading the lsreplica file will not create new entries in the 'vobs' and 'hosts' tables
# it will update entries where tag and hostname are matching
   until (_line = lsepoch.gets).nil? do
# scanning the "columns" (hash' keys) for each line
    if _line.match(rules[:tag].to_s)
# clear the _epoch hash
      if !_epoch[:tag].nil?; _epoch.clear; end
      _epoch[:site_id] = params[:id].to_i
      m = /(.+)\"(.+)\"/.match(_line)
      _epoch[:tag] = m[2]

      elsif _line.match(rules[:row_replica].to_s)
# :row_column_id and :host_id are not yet the IDs!!! - they represent now only the string value
        m = /(.+)\"(.+)\"(.+)\@.(.+)\)/.match(_line)
        _epoch[:row_replica] = m[2]
        _epoch[:host_id] = m[4]
      elsif _line.match(rules[:oid].to_s)
          m = /(.+)oid:(.+)=(\d+)(.+)\((.+)\)/.match(_line)
# skip the deleted replicas !!!!
          if /.deleted/.match(_line).nil?
            _epoch[:oid] = m[2]
            _epoch[:opnumber] = m[3]
            _epoch[:column_replica] = m[5]
# save & restore the literals for the next iteration
            _epoch.each_key { |skey|;  _esave[skey] = _epoch[skey] }
            lsepoch_identify_ids(params, _epoch)
# write the record if not deleted
            lsepoch_update_epoch_table(_epoch, params)
            if _debug
              file.puts _epoch.to_a
              file.puts "++++++++++++++++++++++++++"
            end
# restore the _epoch hash
            _epoch.each_key { |skey| ; _epoch[skey] = _esave[skey] }
          end
     end
  end
  lsepoch.close
  if _debug ; file.close ; end
# a leap of faith - delete all the :process => "Info"
  Oplog.delete_all(:process => "Info")
# assigning stray cats (hosts) to newly created "sites"
  lost_and_finally_found(params)
 end

 ##############################################################################################
 #
 # lsreplica_scan(lsreplica)
 #
 ##############################################################################################
 
 def lsreplica_scan(params)
# _rules contains the Regexp
    _rules = Hash[:tag => "For VOB replica ",
                  :replica_name => "^replica ",
                  :replica_type => " replica type: ",
                  :master_replica => " master replica:",
                  :owner => "owner: ",
                  :group => "group: ",
                  :identities => "identities: ",
                  :host => "host:",
                  :permissions => "permissions: ",
                  :feature_level => "feature level: ",
                  :connectivity => "connectivity: "]
   _hrep = Hash.new
  lsreplica = params[:lslog]
# Reading the lsreplica file will not create new entries in the 'vobs' and 'hosts' tables
# it will update entries where tag and hostname are matching
   until (_line = lsreplica.gets).nil? do
# scanning the "columns" (hash' keys) for each line
    i = 0
    bfound = false
    while i < _rules.size && !bfound
      hkey = _rules.keys[i]
      _reg = Regexp.new(_rules[hkey])
      if _reg.match(_line)
         if (hkey == :tag || hkey == :replica_name) && !_hrep[:owner].nil?
# save and restore the tag (it's going to survive all the replicas list)
            _hname = _hrep[:replica_name]
            _htag = _hrep[:tag]
# we have a complete replica record - time to save it
            lsreplica_update_replica_record(params, _hrep)
            _hrep.clear
            _hrep[:tag] = _htag
            _hrep[:replica_name] = _hname
#one key per line for any line except the vob's tag
         end
         _hrep[hkey] = (_line.gsub(_reg,'').rstrip).lstrip
# force exit from the hash loop
         bfound = true
      end
      i += 1
    end

  end
#flush the last record
  lsreplica_update_replica_record(params, _hrep)
  lsreplica.close
# assigning stray cats (hosts) to newly created "sites"
  lost_and_finally_found(params)
 end


private

 def _debug; false; end   # debug flag

##############################################################################################
#
# lsvob_fill_tag_and_description(line, hvob)
#
##############################################################################################

 def lsvob_fill_tag_and_description(line, hvob)
# the second position is the VOB's tag
   hvob[:tag] = '\\' + line.scan(/\w+/)[1]
# check for the description
    if line.index('"')
       _description = line
# get rid of the leading and trailing '"' and white spaces
       _description = _description.sub(/Tag: \\\w+./,'').lstrip
       _description = (_description.gsub(/\"/,'').rstrip).lstrip
       hvob[:description] = _description 
    end
end

##############################################################################################
#
# lsvob_save_vobs_record(rules, hvob)
#
##############################################################################################

 def lsvob_save_vobs_record(rules, hvob, params)
# save it if it doesn't exist! - replica_uuid is unique
# the replica might have been imported before by lsreplica import
  if Vob.find_by_replica_uuid(hvob[:replica_uuid]).nil?
# verify the RI: vob.host_id = host_id
# get the hostname
     _hostname = hvob[:gpath]
     _parse = _hostname.gsub(/\\/,' ').split(' ')
     _hostname = _parse[0]
     _host = Host.find_by_hostname(_hostname)
     if _host.nil?
        _host = Host.new(params[:host])
        _host[:hostname] = _hostname
        _host[:site_id] = params[:id].to_i
        _host[:os] = "Unknown"
        _host[:description] = "Imported from lsvob"
        _host.save
     end
# another check tag + host_id should be unique
     if (_vob = Vob.find_by_tag_and_host_id(hvob[:tag], _host[:id])).nil?
# we add a new entry
       _vob = Vob.new(params[:vob])
     end
# update the current entry
     rules.each_key { |skey|
        _vob[skey] = hvob[skey]                  
     }
     _vob[:host_id] = _host[:id]     
     _vob.save 
  end
 end
##############################################################################################
#
# lost_and_finally_found
#
# the final "touch" after a full round "discovery"
# this method scans all the hosts belonging to lost+found, creates a "temporary" site = hostname
#
##############################################################################################

  def lost_and_finally_found(params)
    _site = Site.find_by_sitename("lost+found")
    if _site.nil? 
      flash[:notice] = "lost+found record SHOULD have been created..."
    end
    _host = Host.find_all_by_site_id(_site[:id].to_s)
##debugger
# Create phony sites by host names - release "lost+found"
    _host.each do |_rhost|
      _site = Site.new(params[:site])
      _site[:sitename] = _rhost[:hostname]
      _site[:description] = _rhost[:hostname]
      _site.save
      _rhost[:site_id] = _site[:id]
      _rhost.save
    end
  end

##############################################################################################
#
# lsepoch_identify_ids(params, record)
#
# replace literal (:host_id, : :row.. :column) with references and fill :type
# "discovery" is done when filling Host and Vob tables when references are not found!!!
#
##############################################################################################


 def lsepoch_identify_ids(params, record)
# right now, record[:host_id] contains the hostname - immediately after parsing
   _host = Host.find_by_hostname(record[:host_id])
# "discovery" in case the Host was not found, create it with scavenger data that is available!
   if _host.nil?
     _host = lsepoch_create_host_record(params, record, _host)
   end
# now "exchange" the hostname with the "true" id 
    record[:host_id] = _host[:id]
  
   _row = Vob.find_by_tag_and_replica_name(record[:tag], record[:row_replica])
# "discovery" in case the Vob (replica) was not found, create it with scavenger data that is available!
   if _row.nil?
      lsepoch_create_replica_record(params, record)
   else
      record[:row_replica] = _row[:id]
   end

# fill the replica_uuid for the empty references in Vob table
   _col = lsepoch_fill_stray_replica_uuid(record)

   record[:column_replica] = (_col.nil?) ? 0 : _col[:id]
# local, true oplogs are tagged with Resident/Imported
# they represent true results of Export and Import operations
   if _host[:site_id] == record[:site_id]
     if record[:row_replica] == record[:column_replica]
       record[:process] = "Resident"
     else
       record[:process] = "Imported"
     end
   else
# apply "Info" tag to "best guesses" - Info are mostly useless pieces of information
# apply "Export" tag to rows that represent exported packets
      record[:process] = "Info"       # "default"
# find the column_replica's site ID to check if "Exported" (identified) was performed
      if record[:column_replica] != 0
        _vob = Vob.find(record[:column_replica])
        if !_vob.nil?
          _host = Host.find(_vob[:host_id])
          record[:process] = "Exported" if !_host.nil? && (_host[:site_id] == record[:site_id])
        end
      end
   end
 end
 
##############################################################################################
#
# lsepoch_create_host_record(params, record, _host)
#
# create a host "orphaned" in a epoch table
#
##############################################################################################

 def lsepoch_create_host_record(params, record, _host)
# site_id is valid, since the operation is invoked from the "Site" screen - inherited!!!
     _host = Host.new(params[:host])
     _host[:site_id] = record[:site_id]
# ironically record[:host_id] holds the hostname value parsed from the epoch table (at this time)
     _host[:hostname] = record[:host_id]  
     _host[:os] = "Unknown"
     _host[:description] = "Orphaned from the epoch table"
     _host.save
     return _host
 end
 
##############################################################################################
#
# lsepoch_create_replica_record(params, record)
#
# create a vob (replica) record  "orphaned" in a epoch table
#
##############################################################################################

 def lsepoch_create_replica_record(params, record)
      _replica = Vob.new(params[:vob])
      _replica[:tag] = record[:tag]
      _replica[:host_id] = record[:host_id]
      _replica[:replica_name] = record[:row_replica] # "fresh" value from parsing
      _replica[:replica_uuid] = record[:oid]
      _replica[:description] = "Orphaned from the epoch table..."
      _replica.save
      record[:row_replica] = _replica[:id]
 end
 
##############################################################################################
#
# lsepoch_update_epoch_table(record, params)
#
##############################################################################################

 def lsepoch_update_epoch_table(record, params)
 # update or save only for "known" epoch lines (bullet proof!!)
  if (record[:host_id] != 0) && (record[:row_replica] != 0) && (record[:column_replica] != 0)
    _epoch = Oplog.find_by_site_id_and_host_id_and_row_replica_and_column_replica_and_oid(
    record[:site_id], record[:host_id], record[:row_replica], record[:column_replica], record[:oid])
    _epoch = Oplog.new(params[:oplog]) if _epoch.nil?
    record.each_key { |skey| 
      _epoch[skey] = record[skey] if skey != :tag
    }
    _epoch.save
  end
 end

##############################################################################################
#
# lsepoch_fill_stray_replica_uuid(record)
#
##############################################################################################

 def lsepoch_fill_stray_replica_uuid(record)
   _col = Vob.find_by_tag_and_replica_name(record[:tag], record[:column_replica])
# fill the replica_uuid, if the found replica is remote (the extra step in "discovery")
   if !_col.nil?
     if _col[:replica_uuid].nil?
      _col[:replica_uuid] = record[:oid]
      _col.save
     end
   end
   return _col
 end

##############################################################################################
#
# lsreplica_update_replica_record(params, record)
#
##############################################################################################

 def lsreplica_update_replica_record(params, record)
# clean up some parsed info (from "multitool lsreplica -l -invob...")
   record[:tag] = record[:tag].gsub(/\"/,'')
   record[:tag] = record[:tag].gsub(/:/,'')
   record[:replica_name] = record[:replica_name].gsub(/\"/,'')
   record[:host] = record[:host].gsub(/\"/,'')
  
# I'm appending OR creating new records in 'vobs' table
  _vob = Vob.find_by_sql 'SELECT v.* FROM vobs v, hosts h ' +
          'WHERE v.host_id = h.id AND v.tag = "\\' + record[:tag] + 
          '" AND h.hostname = "' + record[:host] + '"'
  if _vob.size > 0
# skip the :host key 
# update.attributes take the whole hash....      
    record.delete(:host)
    _vob[0].update_attributes(record)
  else
# find the host_id
    _host = Host.find_by_hostname(record[:host])
    if _host.nil?
# add the "host" to the site "lost+found"
    _site = Site.find_by_sitename("lost+found")
# place for "orphaned" replicas, hosts and sites - it should ALWAYS exist (it's been created!!)
      if _site.nil?
# create the lost+found "Site" record type 
        _site = Site.new(params[:site])
        _site[:sitename] = "lost+found"
        _site[:description] = "Orphaned - lsreplica_update_replica_record"
        _site.save
      end
# add a new host to the "lost+found" site
      _host = Host.new(params[:host])
      _host[:site_id] = _site[:id]
      _host[:hostname] = record[:host]
      _host[:description] = "Orphaned - lsreplica_update_replica_record"
      _host[:os] = "N/A"
      _host.save
    end
    _vob = Vob.new(params[:vob])
    record.delete(:host)
 # add the host_id key
    _vob[:host_id] = _host[:id]     
    record.each_key { |skey|
      _vob[skey] = record[skey]
    }
    _vob.save
  end
 end

 end  # class << self

end
