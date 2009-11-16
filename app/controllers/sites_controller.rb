class SitesController < ApplicationController
  
# there is no need if:login_required - the filter is prepended - ::goldberg_security_up
# before_filter :login_required

  active_scaffold :site do | config |
#   config.nested.add_link("Children hosts:",[:hosts])
# I use the hosts column for log info. upload
### ????
###    config.update.columns << :hosts
    config.columns = [:id, :sitename, :description, :hosts]
    config.update.columns = [:sitename, :description, :hosts]
    config.columns[:hosts].label = "Hosts"
    config.columns[:hosts].description = "Log File Upload - (lsvob, lsreplica or lsepoch)"
# !!!!! multipart allows uploads/downloads...!!!!!!
    config.update.multipart = true
    config.show.columns.exclude :hosts
    config.update.columns.exclude :id, :oplogs, :connections
    config.create.columns.exclude :id, :hosts
  end

  def create
#create the "lost+found" site for "orphaned" entries if it does not exist!
    _site = Site.find_by_sitename("lost+found")
    if _site.nil?
      _site = Site.new(params[:site])
      _site[:description] = "WARNING - Orphaned sites from logs (insuficient information from the roaming agents) imports"
      _site[:sitename] = "lost+found"
      _site.save  
    end
    super
  end

# remove the lost+found if there are no more sites 
  def destroy
    Site.delete_all "sitename = 'lost+found'" 
    super
  end

##
# a "super" update - investigate the lsvob log and fill VOB's / hosts parameters
# find out what kind of log I'm reading:
# lsvob -l
# lsreplica -l
# lsepoch...
##
  def update
# read the first 2 lines - it should be enough
# lsvob starts with "Tag: \BARABOOM"
# both lsreplica and lsepoch start with "For VOB replica "\BARABOOM":"
# the second line in lsreplica is "replica "name""
# the second line in lsepoch is "Oplog IDs for row..." or "Actual oplog IDs for..."
# sometimes lsepcoh has multiple lines in the beginning with "For VOB replica..."
    parsed_line = Hash[ :vob => "Tag: ",
                  :lsepoch => "For VOB replica ",
                  :replica => "replica ",
                  :epoch => "Oplog IDs for row ",
                  :epoch_actual => "Actual oplog IDs for "]

    if params[:lslog].size > 0
      _line1 = params[:lslog].gets
      _line2 = params[:lslog].gets
      params[:lslog].rewind
      if !(_line1.nil? || _line2.nil?)
        if _line1.match(parsed_line[:vob].to_s)
            Site.lsvob_scan(params)
        elsif _line2.match(parsed_line[:epoch].to_s) || 
              _line2.match(parsed_line[:epoch_actual].to_s) || 
              _line2.match(parsed_line[:lsepoch].to_s)
            Site.lsepoch_scan(params)
        elsif _line2.match(parsed_line[:replica].to_s)
            Site.lsreplica_scan(params)
        else
          # error message
          flash[:notice] = "INVALID FORMAT! - check the input file!"
        end
      else
          # error message
          flash[:notice] = "INVALID FORMAT! - check the input file!"
      end
    end
    super
  end

end
