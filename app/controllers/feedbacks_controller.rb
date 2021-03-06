class FeedbacksController < ApplicationController

	def index
	end
	
	def new
		@feedback = Feedback.new
	end

	def create
		@feedback = Feedback.new(feedback_params)
		if @feedback.save
			redirect_to @feedback, notice: "Thank you for the feedback!"
		else
			render 'new'
		end

		head :ok
	end

	private

	def feedback_params
		params.require(:feedback).permit(:name, :email, :comment)
	end

end
