require 'rubygems'
require 'mysql'

class ApplicationController < ActionController::Base
  before_filter :requer_login
  before_filter :cria_usuario_atual
  before_filter :set_locale
  helper :all 
  protect_from_forgery 
  
  private
  def autorizado?
    session[:usuario_id] || controller_name == "sessions"
  end
  
  def requer_login
    autorizado? || acesso_negado
  end
  
  def acesso_negado
    respond_to do |format|
      format.html do
        session[:return_to] = request.request_uri
        redirect_to new_session_path
      end
    end
  end
  
  def cria_usuario_atual
    if session[:usuario_id]
      @usuario_atual = Usuario.find(session[:usuario_id])
    end
    
    true
  end
  
  def set_locale 
  	# se params[:locale] for nulo, então deve-se utilizar I18n.default_locale 
  	I18n.locale = params[:locale] || I18n.default_locale
  end
end
