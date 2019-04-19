class WorkCategory < ApplicationRecord
  belong_to :work
  belong_to :category
end
