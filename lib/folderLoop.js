const fs = require('fs')
const path = require('path')

module.exports = (folder) => {
  return (ƒ) => {
    fs
      .readdirSync(folder)
      .forEach(file => {
        if (file[0] !== '.') {
          console.log('file path:', path.resolve(folder, file))
          const contents = require(path.resolve(folder, file))
          contents.forEach(ƒ)
        }
      })
  }
}
