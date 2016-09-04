class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :update, :destroy]
  before_action :authenticate_with_token!
  before_action :is_authorized?, except: [:create, :index, :show]

  # GET /requests
  # GET /requests.json
  def index
    @requests = filter_ticket params
    render json: @requests
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    render json: @request
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    if @request.save
      render json: @request, status: :created, location: @request
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    @request = Request.find(params[:id])

    if @request.update(request_params)
      head :no_content
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy

    head :no_content
  end

  protected

    def filter_ticket params
      tickets = (current_user.admin? || current_user.agent?) ? Request.all : current_user.requests
      if params[:q]
        tickets = tickets.description(params[:q][:destination]) if params[:q][:destination]
        tickets = tickets.status(params[:q][:comment]) if params[:q][:comment]
      end
      tickets
    end

  private

    def set_request
      @request = Request.find(params[:id])
    end

    def request_params
      params.require(:request).permit(:request_id, :description, :status, :user_id)
    end

    def is_authorized?
      head :unauthorized unless current_user.admin? || current_user.agent?
    end
end
