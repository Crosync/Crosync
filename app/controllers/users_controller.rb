class UsersController < ApplicationController

# this controller/model are redundant - it's here to preserve the layout of the activescaffold
# no need for filters - this controller is accessed solely by admins!

active_scaffold :user do | config |
    config.columns = [:id, :name, :role]
    config.actions.exclude :update, :delete, :show, :create, :search
  end
end
