const gql = require("graphql-tag")

module.exports = async ({apolloClient, resourceId}) => {
  const r = await apolloClient.query({
    query: gql`
      {
        resourceById(id: ${resourceId}) {
          name
        }
      }
    `
  })
  console.log(r.data.resourceById)
  const name = r.data.resourceById.name;
  console.log('name', name)
  return name
}