class SchoolsController < ApplicationController
    def index
        render_response_success(School.all)
    end
    
    def show
        render_response_success(SchoolSerializer.new(School.find_by!(id: params[:id])))

    end

    def item_params
        params.permit(:name, :address)
      end
end
