module VobsHelper
## DO NOT DELETE this condition...
# ONE day I need to create join conditions in ruby
  def hosts_dropdown_selection
    Host.find(:all, :order => "hostname ASC")
  end

#  def hosts_dropdown_selection
#    Vob.find(:all, :include => [{:vob => :host} => :site])
#  end

# drop-down for the update/create "host_id"
  def host_id_form_column(record, id)
    collection_select("record", "host_id" , hosts_dropdown_selection, "id", "hostname")
  end

end
