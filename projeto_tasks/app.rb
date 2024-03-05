# app.rb
require 'webrick'
require_relative 'app/router.rb'
require_relative 'app/controllers/loginController.rb'
# Certifique-se de ter os controladores necessários aqui, como 'sessions_controller' e 'users_controller'

server = WEBrick::HTTPServer.new(Port: 8080)

router = Router.new

# Descomente se quiser usar as rotas do SessionsController
# router.post('/login', &SessionsController.method(:authenticate))
# router.get('/logout', &SessionsController.method(:logout))

# Rotas para UsersController
router.get('/login', &LoginController.method(:index))   

# Exemplo de rota padrão
router.get('/') { 'Bem-vindo ao Meu Sistema de Login!' }

server.mount_proc('/') do |req, res|
  res.body = router.run(req.request_method + ' ' + req.path)
end

trap('INT') { server.shutdown }

server.start
