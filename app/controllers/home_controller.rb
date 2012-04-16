class HomeController < ApplicationController
	before_filter :requer_login 
	
	def index
		@chamados = Chamado.all(:conditions => ["chamado_status_id = ?", 1])
	end
end
