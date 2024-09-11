class QuestionsController < ApplicationController
  before_action :set_test

  def new
    @questions = @test.questions
    @test_answer = TestAnswer.new
  end

  def create
    @test_answer = TestAnswer.new(test_answer_params)
    @test_answer.user = current_user
    @test_answer.test = @test
    @test_answer.timestamp = Time.now

    if @test_answer.save
      @test.questions.each do |question|
        score = params[:scores][question.id.to_s].to_i
        # 反転スコアの処理
        if question.reverse_score
          score = @test.max_score - score + @test.min_score
        end
        TestAnswerDetail.create!(test_answer: @test_answer, question: question, score: score)
      end
      redirect_to test_path(@test), notice: "テストを受験しました。"
    else
      render :new
    end
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def test_answer_params
    params.permit(:user_id, :test_id, :timestamp)
  end
end
