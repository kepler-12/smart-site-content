const gql = require("graphql-tag")
const resourceNameById = require('./resourceNameById')
const _ = require('lodash')

module.exports = async ({apolloClient, resourceName, fieldSet, jsonArray}) => {
  return await createResource({apolloClient,fieldSet, resourceName, jsonArray, n: 0})
}

async function createResource({apolloClient, resourceName, fieldSet, jsonArray, n}){
  console.log(jsonArray.length, n, jsonArray)
  if (jsonArray.length <= n ) return false
  const name = _.startCase(resourceName) + '_' +fieldSet
  name.replace(/\s+/g, '')
  console.log(name)
  if (!jsonArray[n].name && !jsonArray[n].Name) {
    delete jsonArray[n].Name
    jsonArray[n].name = jsonArray[n].title || "NO NAME PROVIDED"
  }
 const mutation = `mutation {
    ${_.camelCase('create'+
    name)}(input: {
      ${Object.keys(jsonArray[n]).map(
        key => _.camelCase(key) + ':' + '"' + graphqlString(jsonArray[n][key]) + '"'
      )}
    })
    {
      clientMutationId
    }
  }`
  console.log(mutation)


  try {
    const test = await apolloClient.mutate({
      mutation: gql`${mutation}`
    })
  } catch(e) {
    console.log(e.networkError.result.errors)
  } finally {
    n++
    try {
    await createResource({apolloClient, resourceName, fieldSet, jsonArray, n})
    } catch(e) {
      console.error(e)
    }
  }
}
graphqlString = (s) => {
  return s.replace(/\n/g, '\\n').replace(/"/g, '\\"')
}