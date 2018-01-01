const csv = require('csvtojson')
module.exports = ({csvFile, resource, createFIelds, apollo, fieldSet = 'items'}) => {
  csv().fromFile(csvFile)
    .on('json', (jsonObj) => {
      console.log(jsonObj)
    })
    .on('done', (e) => {
      console.log('finished', e)
    })
}
