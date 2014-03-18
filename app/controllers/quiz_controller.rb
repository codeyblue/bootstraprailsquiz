# ITESM CEM, May 11, 2011.
# Ruby Source File
# Activity::  Final Project: Design Patterns Quiz App
# Author::    1165536 Juliana Pena

class QuizController < ApplicationController

	def index
	end

	def start
		total = 8
		session[:questions] = Question.find(:all).map {|x| x.id}

		session[:user] = User.new
		session[:user].save
		session[:total]   = total
		session[:current] = 0
		session[:correct] = 0

		redirect_to :action => "question"
	end

	def question
		@current = session[:current]
		@total   = session[:total]

		if @current >= @total
			redirect_to :action => "end"
			return
		end

		@question = Question.find(session[:questions][@current])
		@choices = @question.choices

		session[:question] = @question
		session[:choices] = @choices
	end

	def answer
		@current = session[:current]
		@total   = session[:total]
		@user = session[:user]

		choiceid = params[:chosen]

		@question = session[:question]
		@choices  = session[:choices]

		@choice = choiceid ? Choice.find(choiceid) : nil
		if @choice and @choice.correct
 			flash[:notice] = 'Correct Answer!'
 			@correct = true
 			session[:correct] += 1
 		else
 			flash[:alert] = 'Incorrect Answer.'
 			@correct = false
 		end

		new = UserAnswer.create(:user_id => @user.id, :question_id => @question.id, :correct => @correct)
		session[:current] += 1
	end

	def end
		@correct = session[:correct]
		@total   = session[:total]
		@user = session[:user]

		@score = @correct * 100 / @total
		@user.number_correct = @score
		@user.save
	end

end