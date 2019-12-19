const CosmosClient = require('@azure/cosmos').CosmosClient
const config = require('./config')
const MyReadings = require('./routes/myReadings')
const Readings = require('./models/readings')

const express = require('express')
const path = require('path')
const logger = require('morgan')
const cookieParser = require('cookie-parser')
const bodyParser = require('body-parser')
const cors = require('cors')

const app = express()

// View engine setup
// app.set('views', path.join(__dirname, 'views'));
// app.set('view engine', 'jade');

app.use(cors())
app.use(logger('dev'))
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: false}))
app.use(cookieParser())
app.use(express.static(path.join(__dirname, 'public')))

// Readings app
const cosmosClient = new CosmosClient({
    endpoint: config.host,
    key: config.authKey
})
const readings = new Readings(cosmosClient, config.databaseId, config.containerId)
const myReadings = new MyReadings(readings)
readings
  .init(err => {
      console.error(err)
  })
  .catch(err => {
      console.error(err)
      console.error(
          'Shutting down because there was an error setting up the database'
      )
  })
app.get('/', (req, res, next) => myReadings.showReadings(req, res).catch(next))

// catch 404 and forward to error handler
app.use(function(req, res, next) {
    const err = new Error('Not Found')
    err.status = 404
    next(err)
})
 
// error handler
app.use(function(err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message
    res.locals.error = req.app.get('env') === 'development' ? err : {}
 
    // render the error page
    res.status(err.status || 500)
    res.send('error')
})
 
module.exports = app