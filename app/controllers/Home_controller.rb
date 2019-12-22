class HomeController < ApplicationController
    before_action :authenticate_user! , except: :index
    def index
        @user = current_user
        @issues = Issue.all
    end


end