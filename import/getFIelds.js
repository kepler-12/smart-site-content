const gql = require('graphql-tag')
const _ = require('lodash')

module.exports = async ({apolloClient, resourceId, fieldSet}) => {
  let fields;
  try {
    fields = apolloClient.query({
       query: $gql`{
            fieldSetAsArray(fieldSetTable: "${fieldset}", resourceIdValue: ${resourceId}){
              nodes{
                name
                id
                type
                inputTemplate
              }
            }
          }`
    })
  }
  catch(e) {
    fields = false
  } finally {
    return fields
  }
}