class IssuesController < ApplicationController
    before_action :authenticate_user! , except: [:show]
    def index
        # filter
        # initialize_search
        # handle_search_name
        # handle_filters
        # filter
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
        if(Issue.exists? @issue.id )
        redirect_to issue_path(@issue)
        else
        redirect_to root_path
        end
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

# filter
    # def initialize_search
    #     # @issues = Issue.alphabetical
    #     session[:search_name] ||= params[:search_name]
    #     session[:filter] = params[:filter]
    #     params[:filter_option] = nil if params[:filter_option] == ""
    #     session[:filter_option] = params[:filter_option]
    #   end
      
    #   def handle_search_name
    #     if session[:search_name]
    #       @issues = Issue.where("title LIKE ?", "%#{session[:search_name]}%")
    #       @issues = @issues.where(title: @issues.pluck(:title))
    #     # else
    #     #   @issues = Issue.all
    #     end
    #   end
    
    #   def handle_filters
    #     if session[:filter_option] && session[:filter] == "issue_type"
    #       @issues = @issues.where(issue_type: session[:filter_option])
    #     #   @issues = @issues.where(title: @issues.pluck(:title))
    #     # elsif session[:filter_option] && session[:filter] == "title"
    #     #   @issues = @issues.where(title: session[:filter_option])
    #     end
    #   end

    private
    def issue_params
    params.require(:issue).permit(:user_id,:title,:description,:img,:issue_type,:os,:device_make,:pl,:pl_version,:text_editor,:no_users)
    end
end