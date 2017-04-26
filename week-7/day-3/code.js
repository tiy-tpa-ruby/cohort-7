
// Ruby: print_score
// def print_score(score_to_print)
//   if score_to_print == 100
//     puts "is 100"
//   else
//     puts "is not 100"
//   end
// end
//
// score = 100
// print_score(score)

// Javascript printScore
// function printScore(scoreToPrint) {
//   if (scoreToPrint === 100) {
//     console.log('is 100')
//   } else {
//     console.log('is not 100')
//   }
// }
//
// score = 100000
// printScore(score)

// // Example of variable scoping
// function printSomething() {
//   let name = 'Toni'
//   console.log(name)
//   console.log(score)
// }
//
// let name = 'gavin'
// let score = 100
//
// printSomething()
// console.log(name)
// console.log(score)

// old school Javascript "classes"
//
//                         |
// this is the constructor V
let Person = function(personName) {
  //
  //                          |
  // this is like attr_reader V
  this.personName = personName

  //
  //                         |
  // this is like `def name` V
  this.name = function() {
    return this.personName
  }
}

let person = new Person('Gavin')
console.log(person.name())


class NewPerson {
  constructor(personName) {
    // this is like attr_reader
    this.personName = personName
  }

  // this is `def name`
  name() {
    return this.personName
  }
}

let newPerson = new NewPerson('Toni')
console.log(newPerson.name)





//
