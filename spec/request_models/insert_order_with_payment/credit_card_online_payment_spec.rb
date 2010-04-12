require File.join(File.dirname(__FILE__), '..', '..', 'spec_helper')

describe "the credit card online payment model" do
  it "should return the proper suggested mixins" do
    model = GlobalCollect::RequestModels::InsertOrderWithPayment::CreditCardOnlinePayment.new({})
    model.suggested_response_mixins.should == [
      GlobalCollect::Responses::SuccessRow,
      GlobalCollect::Responses::InsertOrderWithPayment::CreditCardOnlinePaymentResponseMethods
    ]
  end
end