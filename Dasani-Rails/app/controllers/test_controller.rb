class TestController < ApplicationController
  def test
    @message1 = "HI"
    @message2 = 156
    @message = {:msg1 => "HI", :msg2 => 123}
    respond_to do |format|
      format.amf {render :amf => @message }
    end
  end
end
