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
      @message = {:peer_id => nil}
    end
    respond_to do |format|
      format.amf {render :amf => @message }
    end
  end
  
  def pollConnection
    
  end
  
  def disconnectChat
    @key = params[0][:key]
    @partner_key = params[0][:partner_key]
    if !(@key.blank?)
      @client = StratusKey.find(:first, :conditions=>{:key=>@key})
      if !(@client.blank?)
        StratusKey.destroy(@client.id)
      end
    end
    if !(@partner_key.blank?)
      @peer = StratusKey.find(:first, :conditions=>{:key=>@partner_key})
      if !(@peer.blank?)
        StratusKey.destroy(@peer.id)
      end
    end
    @message = {:success => ":D"}
    respond_to do |format|
      format.amf {render :amf => @message }
    end
  end
end
