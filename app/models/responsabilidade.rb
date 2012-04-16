class Responsabilidade < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :chamado
end
