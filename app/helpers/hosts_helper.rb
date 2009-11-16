module HostsHelper

# it seems kinda redundant - the collection's rules are already in controller  
  def sites_dropdown_selection
    Site.find(:all, :order => "sitename ASC")
  end

  def site_id_form_column(record, id)
    collection_select("record", "site_id" , sites_dropdown_selection, "id", "sitename")
  end
  
end
