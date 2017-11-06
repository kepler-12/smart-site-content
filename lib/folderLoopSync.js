const fs = require('fs')
const path = require('path')
const promiseToAsync = require('../lib/promiseToAsync.js')
const syncLoop = require('./syncLoop')

module.exports = (folder) => {
  return (ƒ) => {
    return new Promise((resolve, reject) => {
      const func = promiseToAsync(ƒ)
      const files = fs.readdirSync(folder)
      syncLoop(func)(files.map((file) => path.resolve(folder, file)))
      .then(r => resolve(r))
      .catch(e => console.log(e))
    })
  }
}
