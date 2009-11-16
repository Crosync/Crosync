class HostsController < ApplicationController
  
# there is no need if:login_required - the filter is prepended - ::goldberg_security_up
# before_filter :login_required

  active_scaffold :host do | config |
#    config.nested.add_link("Replicas",[:vobs])
    config.columns = [:id, :hostname, :site, :site_id, :vobs, :os, :description]
    config.columns[:site].label = "Parent Site Name"
    config.columns[:site_id].label = "Parent Site Name's ID"
    config.columns[:vobs].label = "VOB tag"
    config.update.columns.exclude :id, :site, :vobs
    config.create.columns.exclude :id, :site, :vobs
    config.list.columns.exclude :site_id
    config.show.columns.exclude :vobs
  end

end
