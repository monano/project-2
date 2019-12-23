class IssuesController < ApplicationController

    def index
        @issues = current_user.issues
    end

    def show
        @back_path = request.referer 
        @issue = Issue.find(params[:id])  
    end

    def new
        @issue = current_user.issues.new
    end

    def create
        @issue = current_user.issues.create(issue_params)
        redirect_to issue_path(@issue)
    end

    def edit
        @issue = current_user.issues.find(params[:id])
    end

    def update
        @issue = current_user.issues.find(params[:id])
        @issue.update(issue_params)
        redirect_to issue_path(@issue)
    end

    def destroy
        @issue = current_user.issues.find(params[:id])
        @issue.destroy
        redirect_to issues_path
    end

    private
    def issue_params
    params.require(:issue).permit(:user_id,:title,:description,:img,:issue_type,:os,:device_make,:pl,:pl_version,:text_editor,:no_users)
    end
end