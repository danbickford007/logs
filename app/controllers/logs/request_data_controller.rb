require_dependency "logs/application_controller"

module Logs
  class RequestDataController < ApplicationController
    before_action :set_request_datum, only: [:show, :edit, :update, :destroy]
    before_action :set_vars
    # GET /request_data
    def index
      @request_data = RequestData.order('created_at desc').page(params[:page]).per(15)
    end

    # GET /request_data/1
    def show
    end

    # GET /request_data/new
    def new
      @request_datum = RequestDatum.new
    end

    # GET /request_data/1/edit
    def edit
    end

    # POST /request_data
    def create
      @request_datum = RequestDatum.new(request_datum_params)

      if @request_datum.save
        redirect_to @request_datum, notice: 'Request datum was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /request_data/1
    def update
      if @request_datum.update(request_datum_params)
        redirect_to @request_datum, notice: 'Request datum was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /request_data/1
    def destroy
      @request_datum.destroy
      redirect_to request_data_url, notice: 'Request datum was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_request_datum
        @request_datum = RequestDatum.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def request_datum_params
        params.require(:request_datum).permit(:method, :port, :host, :user_agent)
      end

      def set_vars
        # @error = Error.find(params[:error_id])
      end
  end
end
