class User < ActiveRecord::Base

# this controller/model are redundant - it's here to preserve the layout of the activescaffold

    belongs_to :client
    belongs_to :role, :class_name => "Goldberg::Role"
  def to_label
    clientname
  end
    
end
