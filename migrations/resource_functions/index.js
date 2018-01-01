'use strict'
const path = require('path')
const upFolder = path.join(__dirname, './resource_functions_up')
const downFolder = path.join(__dirname, './resource_functions_down')
console.log()
const upLoop = require('../../lib/folderLoopSync.js')(upFolder)
const downLoop = require('../../lib/folderLoopSync.js')(downFolder)
const execSqlFile = require('../../lib/executeSequelFile')

module.exports = {
  up: (queryInterface, Sequelize) => {
    return upLoop(execSqlFile(queryInterface.sequelize))
  },
  down: (queryInterface, Sequelize) => {
    console.log('resource down')
    return downLoop(execSqlFile(queryInterface.sequelize))
  }

}
