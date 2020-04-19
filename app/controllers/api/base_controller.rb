class Api::BaseController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :check_login
    private
    
    def check_login
        unless user_signed_in?
            render json: {status: 'sign_in_first'}
            return
        end    
    end
end