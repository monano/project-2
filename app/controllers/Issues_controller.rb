class IssuesController < ApplicationController

    def index
        @issues = current_user.issues
    end

    def show
        @issue = Issue.find(params[:id])
    end

    def new
        @issue = current_user.issues.new
    end

    def create
    end

    def edit
    end

    def update
    end


end