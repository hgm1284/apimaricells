class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :update, :destroy]

  # GET /sessions
  def index
    @sessions = Session.all

    render json: @sessions
  end

  # GET /sessions/1
  def show
    render json: @session
  end

  # POST /sessions
  def create
    user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])

          @session = Session.new(session_params(user))
          if @session.present?
            @session.save
            response.headers['token'] = @session.auth_token
            response.headers['role'] = user.role
            response.headers['name'] = user.name
            response.headers['id'] = user.id

            render(json: @session.auth_token)
          else
  
          render json: 'Invalid Username or password', status:422
        end
    end
  end

  # PATCH/PUT /sessions/1
  def update
    if @session.update(session_params)
      render json: @session
    else
      render json: @session.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sessions/1
  def destroy
  session = Session.find_by(auth_token: params[:token])
  session.destroy
  render json: 'Session deleted', status:200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

     def generate_auth_token
       SecureRandom.uuid.gsub(/\-/,'') #Genera el token
     end
    #
    # # Use callbacks to share common setup or constraints between actions.
    # def set_session
    #   @session = Session.find(params[:id])
    # end

    # Only allow a trusted parameter "white list" through. #Set session
    def session_params(user)
       { user_id: user.id,
       auth_token: generate_auth_token
       }
    end
end
