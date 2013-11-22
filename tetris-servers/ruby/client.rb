# encoding: utf-8

require 'faye/websocket'
require 'eventmachine'
require File.expand_path('../player', __FILE__)
require File.expand_path('../board', __FILE__)

host_ip = 'localhost' # ip of host with running tetris-server
port = '8080' # this port is used for communication between your client and tetris-server
user = 'ss' # your username, use the same for registration on tetris-server

url = "ws://#{host_ip}:#{port}/codenjoy-contest/ws?user=#{user}"

# Initialize player's environment
player = Player.new

EM.run do
  ws = Faye::WebSocket::Client.new(url)
  ws.on :message do |event|
    player.process(event.data)
    ws.send(player.step)
  end
end
