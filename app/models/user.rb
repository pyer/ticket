class User < ActiveRecord::Base

  # Login must contain letters only
  validates_format_of :login, :with => /\A[a-z]*\z/i
  # Login are usually a three letters code, but admin
  validates_length_of :login, :maximum => 5


  STATUS_LOCKED = 'locked'
  STATUS_LOGGED = 'logged'
  STATUS_OFF    = 'off'

  def css_classes
    "user #{self.status}"
  end

  def locked?
    self.status == STATUS_LOCKED
  end

  def logged?
    self.status == STATUS_LOGGED
  end


  # Returns true if +clear_password+ is the correct user's password, otherwise false
  def check_password?(clear_password)
    #  User.hash_password("#{salt}#{User.hash_password clear_password}") == hashed_password
    # TODO: encrypt password
    self.password == clear_password
  end

  # Returns the user that matches provided login and password, or nil
  def self.try_to_login(login, password)
    login = login.to_s
    password = password.to_s

    # Make sure no one can sign in with an empty login or password
    return nil if login.empty? || password.empty?
    # Find a user account by matching the exact login
    #user = where(:login => login).detect {|u| u.login == login}
    user = User.find_by(login: login)
    return nil if user.nil?
    return nil if user.locked?
    return nil unless user.check_password?(password)
    user.update_column(:last_login_on, Time.now)
    user.update_column(:status, STATUS_LOGGED)
    user.save
    @current_user = user
    user
  end  

  def self.logoff
    @current_user.update_attribute(:status, STATUS_OFF) unless @current_user.nil?
    @current_user = nil
  end  

  def self.current
    @current_user
  end

  private 
  @current_user = nil
  
end
