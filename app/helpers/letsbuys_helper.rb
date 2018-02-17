module LetsbuysHelper
  # letsbuyテーブルにあるpay_amountの合計を算出する
  def sum_amount(item_id)
    @sum_amount = Letsbuy.where(item_id: item_id).sum(:pay_amount)
  end
end
