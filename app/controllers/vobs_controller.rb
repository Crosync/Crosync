class VobsController < ApplicationController
  
# there is no need if:login_required - the filter is prepended - ::goldberg_security_up
# before_filter :login_required

 
# finally placed the "includes" where is belongs - it failed in the scaffold!!!!  
  def active_scaffold_joins
    [{:host => :site}]   
  end
  
  
  active_scaffold :vob do | config |
    config.nested.add_link("lsepoch",[:oplogs])
    config.label = "Replicas Table"
    config.columns[:oplogs].label = "Epoch"
#    config.columns[:site].includes = [{'host' => 'site'}]
    config.columns = [:id, :tag, :host, :host_id, :replica_name, :site, :gpath, :lpath, :region, :description, :replica_uuid, :family_uuid, 
        :access, :attribute, :replica_type, :master_replica, :owner, :group,
        :identities, :permissions, :feature_level, :connectivity]
    config.list.columns = [:site, :tag, :host, :replica_name, :master_replica, :gpath, :family_uuid, :replica_uuid, :attribute]
    config.update.columns.exclude :id, :host, :attribute,
          :replica_type, :master_replica, :owner, :group, :identities, :permissions, :feature_level, :connectivity
    config.create.columns.exclude :id, :host, :attribute,
          :replica_type, :master_replica, :owner, :group, :identities, :permissions, :feature_level, :connectivity
    config.columns[:host].label = "Host's Name"
    config.columns[:site].label = "Parent's Site Name"
#   config.actions.exclude :update, :delete
#   config.action_links.add 'lost_FOUND', :label => 'Solve lost+found'
#   config.columns[:family_uuid].link
#   config.columns[:family_uuid].action :blue
  end
  
# override the "nested" method and _nested partial
  def nested
      _record = find_if_allowed(params[:id], :read)
      @site_id = Host.find(_record.host_id).site_id
      respond_to do |type|
        type.html { render :partial => 'oplogs/op_nested_lsepoch', :layout => true }
        type.js { render :partial => 'oplogs/op_nested_lsepoch', :layout => false }
      end
  end
  
### intercepting CRUD actions are done after post, before refresh

end
