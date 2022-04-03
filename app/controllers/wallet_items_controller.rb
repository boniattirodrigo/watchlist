class WalletItemsController < ApplicationController
  def create
    @wallet_item = WalletItem.new(wallet_item_params)

    respond_to do |format|
      if @wallet_item.save
        format.html { redirect_to wallet_item_url(@wallet_item), notice: "Wallet item was successfully created." }
        format.json { render :show, status: :created, location: @wallet_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wallet_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @wallet_item = WalletItem.find(params[:id])
    @wallet_item.destroy

    respond_to do |format|
      format.html { redirect_to wallet_items_url, notice: "Wallet item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def wallet_item_params
    params.require(:wallet_item).permit(:wallet_id)
  end
end
