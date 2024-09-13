class ApplicationRecord < ActiveRecord::Base
  include IdGenerateModule

  primary_abstract_class
end
