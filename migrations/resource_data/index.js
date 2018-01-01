'use strict'
const path = require('path')
const upFolder = path.join(__dirname, './resource_data_up')

console.log()
const upLoop = require('../../lib/folderLoopSync.js')(upFolder)
const execSqlFile = require('../../lib/executeSequelFile')

module.exports = {
  up: (queryInterface, Sequelize) => {
    return upLoop(execSqlFile(queryInterface.sequelize))
  },
  down: (queryInterface, Sequelize) => {
    return new Promise((resolve, reject) => {
      resolve(true)
    })
  }

}
