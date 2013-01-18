App= module.exports= require 'express'
app= App()

#
# Конфигурация для работы в штатном режиме
#
app.configure ->

    # статические файлы
    app.use App.static __dirname+'/assets'

    # шаблоны вида
    app.set 'view engine', 'jade'
    app.set 'view options',
        layout:false

    # обработка входящих данных
    app.use App.bodyParser()
    app.use App.cookieParser()

    app.locals.title= 'Angular on Express Application'

#
# Конфигурация для разработки и тестирования
#
app.configure 'development', ->

    app.use App.logger 'dev'

    app.use App.errorHandler
        dumpExceptions: true
        showStack     : true

#
# Сервер приложения
#
port= process.env.npm_package_config_port
app.listen port, -> console.log 'Listening on '+port+'\nPress CTRL-C to stop server.'+ Date Date.now()

#
# Эйпиай
#
app.get '/', (req, res) ->
    res.render 'pages/index'

app.get '/index.html', (req, res) ->
    res.render 'pages/partials/index'