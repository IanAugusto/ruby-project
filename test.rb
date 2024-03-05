require 'webrick'

server = WEBrick::HTTPServer.new(Port: 8080)

server.mount_proc '/' do |req, res|
  res.body = 'Hello, World! primeira vez em ruby'
end

trap('INT') { server.shutdown }

server.start
    