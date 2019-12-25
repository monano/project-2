class AnswersController < ApplicationController
    before_action :authenticate_user! , except: [:index]
    def index
        @answers = Answer.where(issue_id: params[:issue_id])
        # @answers = Product.where(nil) # creates an anonymous scope
        # @answers = @answers.starts_with(params[:starts_with]) if params[:starts_with].present?
     
    end

    def show

    end

    def new
        @issue = Issue.find(params[:issue_id])
        @answer = current_user.answers.new
        # use hedden field in view
    end

    def create
        @issue = Issue.find(params[:issue_id])
        @answer = current_user.answers.create(answer_params)
        redirect_to issue_path(@issue)
    end

    def edit
        @issue = Issue.find(params[:issue_id])
        @answer = current_user.answers.find(params[:id])
    end

    def update
        @issue = Issue.find(params[:issue_id])
        @answer = current_user.answers.find(params[:id])
        @answer.update(answer_params)
        redirect_to issue_answers_path(@issue)
    end

    def destroy
        @issue = Issue.find(params[:issue_id])
        @answer = current_user.answers.find(params[:id])
        @answer.destroy
        redirect_to issue_answers_path(@issue)
    end

    private
        def answer_params
            params.require(:answer).permit(:user_id,:issue_id,:description,:working,:not_working)
        end


end