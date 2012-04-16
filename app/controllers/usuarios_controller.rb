class UsuariosController < ApplicationController
  skip_before_filter :requer_login, :only => ['new', 'create']
  
  def index
    @usuarios = Usuario.all(:order => 'nome')
  end

  def show
    @usuario = Usuario.find(params[:id])
  end

  def new
    @usuario = Usuario.new
  end

  def edit
    @usuario = Usuario.find(params[:id])
  end

  def create
    @usuario = Usuario.new(params[:usuario])

    if @usuario.save
        redirect_to(@usuario, :notice => 'Usuário criado com sucesso!')
    else
        render :action => "new"
    end
  end

  def update
    @usuario = Usuario.find(params[:id])

    if @usuario.update_attributes(params[:usuario])
        redirect_to(@usuario, :notice => 'Usuário atualizado com sucesso!')
    else
        render :action => "edit"
    end
  end

  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy
  end
end
