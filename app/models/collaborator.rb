class Collaborator < ActiveRecord::Base
  has_one :wiki
  has_one :user
end
