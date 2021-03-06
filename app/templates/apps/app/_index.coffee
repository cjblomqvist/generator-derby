derby = require 'derby'

app = module.exports = derby.createApp '<%= app %>', __filename

<% if (bootstrap) { %>
app.use require 'd-bootstrap'<% } %><% if (login) { %>
app.use require 'derby-login/components'<% } %><% if (router) { %>
app.use require 'derby-router'<% } %>
app.use require 'derby-debug'<% if (jade) { %>
app.serverUse module, 'derby-jade'<% } %><% if (stylus) { %>
app.serverUse module, 'derby-stylus'<% } %><% if (md) { %>
app.serverUse module, 'derby-markdown'<% } %>

app.loadViews __dirname + '/views'
app.loadStyles __dirname + '/styles'
<% if (router) { %>
app.get 'home', '/'
<% } else { %>
app.get '/', (page, model) ->
  page.render 'home'
<% } %>
<% if (login) { %>
<% if (router) { %>
app.get 'login', '/login'
app.get 'register', '/register'
<% } else { %>
app.get '/login', (page) ->
  page.render 'login'

app.get '/register', (page) ->
  page.render 'register'
<% } %>
<% } %>