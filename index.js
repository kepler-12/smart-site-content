require('dotenv').config()
console.log(typeof process.env.CONTENT)

module.exports = {
  migration_structures: require('./migrations/resource_structures'),
  migration_functions: require('./migrations/resource_functions'),
  migration_data: require('./migrations/resource_data')
}
