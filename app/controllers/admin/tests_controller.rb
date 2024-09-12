class Admin::TestsController < ApplicationController
  before_action :authenticate_admin! # 管理者のみアクセス可能にする

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to admin_tests_path, notice: 'テストが作成されました。'
    else
      render :new
    end
  end

  def edit
    @test = Test.find(params[:id])
  end

  def update
    @test = Test.find(params[:id])
    if @test.update(test_params)
      redirect_to admin_tests_path, notice: 'テストが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @test = Test.find(params[:id])
    @test.destroy
    redirect_to admin_tests_path, notice: 'テストが削除されました。'
  end

  private

  def test_params
    params.require(:test).permit(:title, :description, :min_score, :max_score, :avg_score)
  end
end
