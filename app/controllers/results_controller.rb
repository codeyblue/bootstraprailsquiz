class ResultsController < ApplicationController
 	def index
  		@users = User.all
  		@questions = Question.all
		@users.sort

		respond_to do |format|
			format.html # index.html.erb
			format.xml  { render :xml => @questions }
		end
  	end
end
