express = require 'express'
bodyparser = require 'body-parser'
swig = require 'swig'

app = module.exports = express()

app.use (bodyparser.urlencoded { extended: false })

# require and setup routes
routes = require './routes'
routes.forEach (path) ->
  route = require './routes' + path
  app.post path, route
  app.get path, (req, res) ->
    res.sendFile __dirname + '/form.html'

# render links to routes on root page
app.get '/', (req, res) ->
  res.send (swig.renderFile __dirname + '/index.html', {routes: routes})

# boot it up
server = app.listen 3000, () ->
  host = server.address().address;
  port = server.address().port;

  console.log 'words listening on port %s', port
