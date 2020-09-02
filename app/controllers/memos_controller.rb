class MemosController < ApplicationController
  before_action :authenticate_user_officer!
  before_action :set_memo, only: %i(edit update destroy)

  def index
    @memos = Memo.all
  end

  def new
    @memo = current_user_officer.memos.build
  end

  def create
    @memo = current_user_officer.memos.build(memo_params)
    if @memo.save
      redirect_to memos_path, notice: "Successfully saved."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @memo.update(memo_params)
      redirect_to memos_path, notice: 'Successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @memo.destroy
    redirect_to memos_path, notice: 'Successfully destroyed.'
  end

  private

  def set_memo
    @memo = Memo.find(params[:id])
  end

  def memo_params
    params.require(:memo).permit %i(content)
  end
end
