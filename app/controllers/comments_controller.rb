class CommentsController < ApplicationController
  before_action :authenticate
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  def index
    @comments = Comment.all

    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.new()
    @comment.body=params[:body]
    if @currentU.role=="Admin"
    @comment.status=0
      else
    @comment.status=1
    end
  
    @comment.user_id=@curentS.user_id
    @comment.bill_id=params[:bill_id]

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def authenticate
        @curentS=Session.find_by(auth_token: request.headers['token'])
        @currentU=User.find_by(id:@curentS.user_id)
    end
    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.permit(:body)
    end
end
