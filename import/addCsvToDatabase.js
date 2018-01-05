const csv = require('csvtojson')
const ApolloClient = require('apollo-client').ApolloClient
const HttpLink = require('apollo-link-http').HttpLink
const InMemoryCache = require('apollo-cache-inmemory').InMemoryCache
const addJsonToResource = require('./addJsonToResources')
const getFields = require('./getFields')
const createFieldsOnResource = require('./createFieldsOnResource')
const resourceNameById = require('./resourceNameById')
fetch = require('node-fetch')

module.exports = async ({file, resourceId, createFields, uri, fieldSet = 'items'}) => {
  //Why not promise csvtojson????
  const apolloClient = new ApolloClient({
    link: new HttpLink({ uri }),
    cache: new InMemoryCache()
  });
  const resourceName = await resourceNameById({apolloClient, resourceId})
  csv().fromFile(file)
    .on('json', async (jsonObj) => {
      const fields = await getFields({apolloClient, fieldSet, resourceId})
      if(createFields) await createFieldsOnResource({
        fields,
        allFields: Object.keys(jsonObj),
        apolloClient,
        resourceId,
        fieldSet
      })
      await addJsonToResource({apolloClient, resourceName, fieldSet, jsonArray: [jsonObj]})
    })
    .on('done', (e) => {
      console.log('finished', e)
    })
}
