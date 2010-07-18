class ChatController < ApplicationController
  
  def connect
    @key = params[0][:key]
    @client = StratusKey.find(:first, :conditions=>{:key=>@key})
    if @client.blank?
      @client = StratusKey.new
      @client.key = @key
      @client.connected = false
      @client.save
    end
    @peers = StratusKey.find(:all, :conditions=>['key <> ? AND connected = ?', @key, false])
    if @peers.length > 0
      @peer = @peers[rand(@peers.length)]
      @peer.connected = true
      @client.connected = true
      @peer.save
      @message = {:peer_id => @peer.key}
    else
      @message = nil
    end
    respond_to do |format|
      format.amf {render :amf => @message }
    end
  end
  
  def pollConnection
    
  end
  
  def disconnect
    @message = {:msg1 => "HI", :msg2 => 123}
    respond_to do |format|
      format.amf {render :amf => @message }
    end
  end
end
