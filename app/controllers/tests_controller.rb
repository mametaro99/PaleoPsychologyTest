class TestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tests = Test.all
    @past_tests = current_user.test_answers.includes(:test).order(created_at: :desc)
  end  

  def show
    @test = Test.find(params[:id])
    @test_answers = current_user.test_answers.where(test: @test).order(created_at: :desc)

    # 各日の平均点を計算する
    @averages = @test_answers.map do |test_answer|
      total = test_answer.test_answer_details.sum(&:score)
      average = total.to_f / @test.questions.count
      [test_answer.created_at.strftime("%Y年%m月%d日"), average.round(2)]
    end
  end
end
