class ExitEntratum < ActiveRecord::Base
  belongs_to :exit
  belongs_to :entratum
end
