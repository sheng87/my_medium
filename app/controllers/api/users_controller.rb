class Api::UsersController < Api::BaseController
before_action :find_user
    def follow
        render json: {status: current_user.follow!(@user)}
    end

    
    private
    def find_user
        @user = User.find(params[:id])
    end    

end
