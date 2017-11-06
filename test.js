require('dotenv').config()
const Sequelize = require('sequelize')
const sequelize = new Sequelize(process.env.DB_DATABASE, process.env.DB_USERNAME, process.env.DB_PASSWORD, {
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  dialect: process.env.DB_CONNECTION
})

'use strict'
const upLoop = require('./lib/folderLoopSync.js')('./migrations/resource_functions_up')
// const downLoop = require('./lib/folderLoopAsync.js')('./resource_functions_down')
const execSqlFile = require('./lib/executeSequelFile')

upLoop(execSqlFile(sequelize)).then(e => console.log('then:', e)).catch(error => console.error('error', error))
// return downLoop(execSqlFile(sequelize))
