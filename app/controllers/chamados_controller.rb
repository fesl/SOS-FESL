class ChamadosController < ApplicationController
	before_filter :requer_login
	
	def index
		@chamados = Chamado.all(:conditions => ["chamado_status_id = ?", 1])
	end
	
	def show
		@chamado = Chamado.find(params[:id])
		@chamado_tipo = ChamadoTipos.find(@chamado.chamado_tipos_id)
		@chamado_status = ChamadoStatus.find(@chamado.chamado_status_id)
		@responsabilidade = Responsabilidade.first(:conditions => ["chamado_id = ?", @chamado.id])
	end
	
	def new
    	@chamado = Chamado.new
    	@chamado_tipos = ChamadoTipos.all
  	end
  	
  	def create
  		@chamado = Chamado.new(params[:chamado])
  		
		if @chamado.save
    		redirect_to(@chamado, :notice => 'Chamado criado com sucesso!')
  		else
    		render :action => "new"
    	end
  	end
  	
  	def edit
  		@chamado = Chamado.find(params[:id])
  		@chamado_tipos = ChamadoTipos.all
  	end
  	
  	def update
  		@chamado = Chamado.find(params[:id])

    	if @chamado.update_attributes(params[:chamado])
        	redirect_to(@chamado, :notice => 'Chamado atualizado com sucesso!')
      	else
        	render :action => "edit"
      	end
  	end
  	
  	def destroy
	    @chamado = Chamado.find(params[:id])
	    @responsabilidade = Responsabilidade.first(:conditions => ["chamado_id = ?", @chamado.id])
	    @responsabilidade.destroy
	    @chamado.destroy
	    redirect_to(chamados_path)
	end
end