class Admin::QuestionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_test

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to edit_admin_test_path(@test), notice: '質問が追加されました。'
    else
      render :new
    end
  end

  def edit
    @question = @test.questions.find(params[:id])
  end

  def update
    @question = @test.questions.find(params[:id])
    if @question.update(question_params)
      redirect_to edit_admin_test_path(@test), notice: '質問が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @question = @test.questions.find(params[:id])
    @question.destroy
    redirect_to edit_admin_test_path(@test), notice: '質問が削除されました。'
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:question_text,:reverse_score)
  end
end
