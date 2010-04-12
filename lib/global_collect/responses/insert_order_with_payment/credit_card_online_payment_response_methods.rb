module GlobalCollect::Responses::InsertOrderWithPayment
  # WDL §5.28.2 TABLE 115 specifies the possible return keys
  module CreditCardOnlinePaymentResponseMethods
    [
      "PAYMENT REFERENCE"    ,
      "ADDITIONAL REFERENCE" ,
      "EXTERNAL REFERENCE"   ,
      "ORDER ID"             ,
      "STATUS ID"            ,
      "EFFORT ID"            ,
      "MERCHANT ID"          ,
      "ATTEMPT ID"           ,
      "STATUS DATE"          ,
      "AVS RESULT"           ,
      "CVV RESULT"           ,
      "FRAUD RESULT"         ,
      "FRAUD CODE"           ,
      "FRAUD NEURAL"         ,
      "FRAUD RCF"            ,
      "AUTHORISATION CODE"
    ].each do |meth|
      define_method meth.downcase.gsub(/\s+/, "_") do
        success_data[meth.gsub(/\s+/, "")]
      end
    end
    
    def payment_status
      GlobalCollect::Const::PaymentStatus.status(success_data['STATUSID'])
    end
  end
end