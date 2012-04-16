class Usuario < ActiveRecord::Base  
  validates_presence_of :login, :senha, :nome, :email
  validates_length_of :login, :in => 5..100
  validates_length_of :senha, :in => 5..50
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  validates_uniqueness_of :login
  validates_uniqueness_of :email  
  has_one :usuario_tipos
  has_many :responsabilidades, :conditions => "leaved is null"
  
  def self.logon(username_or_email, password)
    usuario = Usuario.first :conditions => ["(login = ? or email = ?) AND senha = ?", username_or_email, username_or_email, password]
    usuario
  end
end
