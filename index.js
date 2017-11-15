require('dotenv').config()
console.log(typeof process.env.CONTENT)

module.exports = {
  migrations: require('./migrations/resource_structures')
}
