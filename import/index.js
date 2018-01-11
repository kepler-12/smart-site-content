#! /usr/bin/env node

const chalk = require('chalk')
var program = require('commander');
const csvToDatabse = require('./addCsvToDatabase')

program
.version('0.0,2')
.option('-f, --file [path]', 'CSV file to import')
.option('-r, --resourceId [int]', 'Resource to import into')
.option('-u, --uri [uri]', 'the uri for the apollo connection')
.option('-s, --fieldset [name]', 'the field set')
//.option('-c, --createfields', 'Create New fields for columns that are not present in the DB')
.parse(process.argv)


csvToDatabse({
  file: program.file, 
  resourceId: program.resourceId, 
  uri: program.uri, 
  fieldSet: program.fieldset
  //createFields: program.createfields
})
