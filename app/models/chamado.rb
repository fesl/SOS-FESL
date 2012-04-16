class Chamado < ActiveRecord::Base
	has_one :chamado_tipos
	has_one :chamado_statuses
	has_many :usuarios, :through => :responsabilidades
end
