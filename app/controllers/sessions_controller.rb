class SessionsController < ApplicationController    
  def index
    session[:adm] = session[:usuario_id] = nil
    redirect_to(new_session_path)
  end
  
  def new
  end

  def create
    @usuario = Usuario.logon(params[:login], params[:senha])
    
    if @usuario
      session[:usuario_id] = @usuario.id
      session[:adm] = @usuario.adm
      redirect_to root_path
    else
      flash[:notice] = "O login falhou, verifique o nome de usuário e senha informados."
      render :action => "new"
    end
  end

  def destroy 
    session[:usuario_id] = session[:return_to] = session[:adm] = nil
    redirect_to new_session_path
  end

end
