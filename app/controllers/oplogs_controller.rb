class OplogsController < ApplicationController
  
# there is no need if:login_required - the filter is prepended - ::goldberg_security_up
# before_filter :login_required
 
  active_scaffold :oplog do | config |
    config.list.columns << :row
    config.list.columns << :column
    config.list.per_page = 20;
    config.label = "Epoch Table"
    config.list.sorting = [{:process => :asc}]
#    config.list.sorting = [{:vob => :asc}, {:site => :asc}, {:host => :asc}]
#   config.list.sorting = [{:row_replica => :asc}, {:column_replica => :asc}, {:process => :asc}]
    config.columns = [:process, :site, :vob, :host, :row, :column, :row_replica, :column_replica, :opnumber, :oid]
    config.list.columns = [:process, :site, :vob, :host, :row, :column, :opnumber, :oid]
    config.update.columns = [:row_replica, :row, :column_replica, :column, :opnumber]
    config.actions.exclude :create, :delete, :update
    config.columns[:column].label = "(column)From Replica..."
    config.columns[:row].label = "(row)...To Replica"

  end
end
