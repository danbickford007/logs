require_dependency "logs/application_controller"

module Logs
  class ErrorsController < ApplicationController
    before_action :set_error, only: [:show, :edit, :update, :destroy]

    # GET /errors
    def index
      @errors = Error.order('created_at DESC').page(params[:page]).per(15)
    end

    # GET /errors/1
    def show
    end

    # GET /errors/new
    def new
      @error = Error.new
    end

    # GET /errors/1/edit
    def edit
    end

    # POST /errors
    def create
      @error = Error.new(error_params)

      if @error.save
        redirect_to @error, notice: 'Error was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /errors/1
    def update
      if @error.update(error_params)
        redirect_to @error, notice: 'Error was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /errors/1
    def destroy
      @error.destroy
      redirect_to errors_url, notice: 'Error was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_error
        @error = Error.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def error_params
        params.require(:error).permit(:content)
      end
  end
end
