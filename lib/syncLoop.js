/*
* Executes a given function over the provided array.
* Waiting for the previous function to execute before moving to the next
*/
module.exports = (ƒ) => {
  return (array) => {
    return new Promise((resolve, reject) => {
      runNextFunc(0)
      /*
      * Runs the function recursivly over the array until there are no more items in the array
      */
      function runNextFunc (count) {
        console.log(count, array.length, count <= array.length - 1)
        if (count <= array.length - 1) {
          ƒ(array[count])
            .then(r => {
              count++
              runNextFunc(count)
            })
            .catch(console.log)
        } else {
          resolve(true)
        }
      }
    })
  }
}
