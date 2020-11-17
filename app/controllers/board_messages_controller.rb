class BoardMessagesController < ApplicationController
  before_action :set_board_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_account!
  layout 'board_messages'

  # GET /board_messages
  # GET /board_messages.json
  def index
    @board_messages = BoardMessage.page(params[:page]).order('created_at desc')
    users = BoardUser.where('account_id == ?', current_account.id)[0]
    if users == nil
      user = BoardUser.new
      user.account_id = current_account.id
      user.nickname = '<<no name>>'
      user.save
      users = BoardUser.where('account_id == ?', current_account.id)[0] #original code: users = BoardUser.where 'account_id == ?', current_account.id
    end
    @board_user = users
    @board_message = BoardMessage.new
    @board_message.board_user_id = @board_user.id
  end

  # GET /board_messages/1
  # GET /board_messages/1.json
  def show
    redirect_to '/board_messages'
  end

  # GET /board_messages/new
  def new
    redirect_to '/board_messages'
  end

  # GET /board_messages/1/edit
  def edit
    redirect_to '/board_messages'
  end

  # POST /board_messages
  # POST /board_messages.json
  def create
    @board_messages = BoardMessage.page(params[:page]).order('created_at desc')
    @board_message = BoardMessage.new(board_message_params)
    @board_user = BoardUser.where('account_id == ?', current_account.id)[0]

    respond_to do |format|
      if @board_message.save
        format.html { redirect_to '/board_messages' }
        format.json { render :show, status: :created, location: @board_message }
      else
        format.html { render :index }
        format.json { render json: @board_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /board_messages/1
  # PATCH/PUT /board_messages/1.json
  def update
    redirect_to '/board_messages'
    #respond_to do |format|
    #  if @board_message.update(board_message_params)
    #    format.html { redirect_to @board_message, notice: 'Board message was successfully updated.' }
    #    format.json { render :show, status: :ok, location: @board_message }
    #  else
    #    format.html { render :edit }
    #    format.json { render json: @board_message.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # DELETE /board_messages/1
  # DELETE /board_messages/1.json
  def destroy
    redirect_to '/board_messages'
    #@board_message.destroy
    #respond_to do |format|
    #  format.html { redirect_to board_messages_url, notice: 'Board message was successfully destroyed.' }
    #  format.json { head :no_content }
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board_message
      @board_message = BoardMessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def board_message_params
      params.require(:board_message).permit(:content, :board_user_id)
    end
end
