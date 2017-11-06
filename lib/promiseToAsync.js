module.exports = (ƒ, ƒallback) => {
  ƒallback = ƒallback || console.error
  return async(args) => {
    let returnValue
    console.log('arguments', args)
    try {
      returnValue = await ƒ.apply(this, [args])
    } catch (e) {
      console.log('ERROR ERRR ERROR')
      console.log(e)
      returnValue = await ƒallback.apply(this, [args])
    }
    return returnValue
  }
}
