module SitesHelper
  def hosts_form_column(record,id)
    file_field_tag 'lslog', :accept => 'text/html', :class => 'upload', :value => 'index.html'
  end
end
