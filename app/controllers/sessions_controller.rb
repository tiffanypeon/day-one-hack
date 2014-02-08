class Devise::SessionsController < Devise::SessionsController 
  before_filter :authenticate_member!



end