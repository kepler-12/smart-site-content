const fs = require('fs')
const syncLoop = require('./syncLoop')
module.exports = (sequelize) => {
  return (file) => {
    return new Promise((resolve, reject) => {
      if (file.split('.')[1] === 'sql') {
        const sql = fs.readFileSync(file, 'utf8').split('\n\n')
        const q = query(sequelize)
        syncLoop(q)(sql)
      .then(resolve)
      .catch(reject)
      } else {
        console.log(file, 'IS NOT A SQL FILE')
        resolve('Not a sql file')
      }
    })
  }
}

function query (sequelize) {
  return (sql) => {
    return new Promise((resolve, reject) => {
      sequelize.query(sql)
        .then(resolve)
        .catch(reject)
    })
  }
}
