#! /usr/bin/env node

const chalk = require('chalk')
const program = require('commander')
const csvToDatabse = require('./addCsvToDatabase')
program
.version('0.0,1')
.option('-f, --file [path]', 'CSV file to import')
.option('-r, --resource [name]', 'Resource to import into')
.option('-c --createFields', 'Create New fields for columns that are not present in the DB')
.parse(process.argv)

console.log(program.file)
console.log(program.resource)
console.log(program.createFields)
csvToDatabse({csvFile: program.file})
