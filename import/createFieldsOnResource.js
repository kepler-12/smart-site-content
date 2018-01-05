const gql = require('graphql-tag')
const _ = require('lodash')

module.exports = async ({apolloClient, resourceId, fieldSet, fields, allFields}) => {
  const newFields = _.uniqWith(allFields, fields)
  console.log(newFields)
  return await addFieldFromArray({
    n: 0,
    fieldSet,
    resourceId,
    apolloClient,
    fields: newFields
  })
}

async function addFieldFromArray({fields, n, apolloClient, resourceId, fieldSet}) {
  console.log(fields.length, n)
  if (fields.length < n) return true
  await apolloClient.mutate({
    mutation: gql`
      mutation{
        createField(input:{
          field: {
            name: "${fields[n]}",
            resourceId: ${resourceId},
            fieldSet: "${fieldSet}",
            type: "text",
            inputTemplate: "text"
          }
        })
        { clientMutationId }
      }
    `
  })
  n++
  await addFieldFromArray({fields, n, apolloClient, resourceId, fieldSet})
}