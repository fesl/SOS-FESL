class ResponsabilidadesController < ApplicationController
  def new
  	@responsabilidade = Responsabilidade.new
  	@responsabilidade.chamado = Chamado.find(params[:chamado_id]) 
  	@responsabilidade.usuario = @usuario_atual
  	@responsabilidade.inicio = Date.today
  	
  	if @responsabilidade.save
  		redirect_to(chamado_path(@responsabilidade.chamado), :notice => "Vínculo criado com sucesso!")
  	else
  		redirect_to(root_path, :notice => "Vínculo não criado!")
  	end
  end
end
