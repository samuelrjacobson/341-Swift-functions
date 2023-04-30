// Determines whether n is prime
func isPrime(n: Int) -> Bool
{
	// handle numbers less than 3
	if n < 2 { return false }
	else if n == 2  { return true }
	
	// handle numbers 3 and greater
	else
	{
		var isPrime: Bool = true
		for i in 2...n / 2 + 1// check each number 2 to n/2
		{
			if n % i == 0 // if it's a factor of n, prime = false
			{
				isPrime = false
				break
			}
		}
		return isPrime // return true/false (prime or not)
	}
}
// Displays all prime numbers less than or equal to n
func displayPrimes(n: Int)
{
	if n > 1 // only positive numbers can be prime
	{
		for i in 2...n // check integers 2 to n
		{
			if isPrime(n: i) { print(i) } // print if prime
		}
	}
}
// Computes tax rate based on income and marital status
func tax(income: Int, mStatus: String) -> Double
{
	// convert marital status to uppercase
	let maritalStatus: String = mStatus.uppercased()
	
	var taxRate: Double = 0.0
	
	// set tax rate
    if maritalStatus == "SINGLE" // Single
    {
        if income < 30000 { taxRate = 0.20 } // Income
        else { taxRate = 0.25 }
    }
    else if maritalStatus == "MARRIED" // Married
    {
        if income < 50000 { taxRate = 0.10 } // Income
        else { taxRate = 0.15 }
    } 
	
    return taxRate
}
// Perform quadratric formula given coefficients
import Cocoa
func quadratic(a: Double, b: Double, c: Double) -> (solution1: Double, solution2: Double)
{
	// if there are no solutions, return zeroes
	var solution1: Double = 0
	var solution2: Double = 0
	
	// else calculate solutions
    let discriminant: Double = b*b - 4 * a * c // calculate discriminant
    if discriminant > 0 // check whether there are solutions
    {	// calculate real solutions
        solution1 = (-b + sqrt(discriminant)) / (2 * a)
        solution2 = (-b - sqrt(discriminant)) / (2 * a)
    }
	
	return (solution1, solution2)
}
// Returns character at index in string
func charAt(word: String, index: Int) -> Character
{
	let wordArray = Array(word) // convert string to array
	return wordArray[index] //return character at index
}
// Returns substring from startIndex (inclusive) to endIndex (exclusive) in string
func substring(word: String, startIndex: Int, endIndex: Int) -> String
{
	let wordArray = Array(word) // convert string to array
	var subArray: [Character] = [] // create subarray
	var indexToAddAt: Int = 0 // references index in subarray to add elements at
	
	// add specified elements of wordArray to subArray
	for ch in startIndex...endIndex - 1
	{
		subArray.insert(wordArray[ch], at: indexToAddAt)
		indexToAddAt += 1
	}
	
	return String(subArray)
}
// Generates an ID and password based on user's name
func createIdPassword(lName: String, fName: String) -> (id: String, password: String)
{
	// convert names to uppercase
	let lastName: String = lName.uppercased()
	let firstName: String = fName.uppercased()
	
	// generate id and password
	let id: String = String(charAt(word: firstName, index: 0)) + lastName
	var password: String = String(charAt(word: firstName, index: 0)) + String(charAt(word: firstName, index: firstName.count - 1))
	password += substring(word: lastName, startIndex: 0, endIndex: 3) + String(firstName.count) + String(lastName.count)
	
	return (id, password)
}
// Computes factorial of an integer n
func factorial(n: Int) -> Int
{
	if n == 1 { return 1 }
	return n * factorial(n: n - 1) // recursive call with n - 1
}
// Performs selection sort on an array
func sort(list: [Int]) -> [Int]
{
	// make mutable copy of array
	var myArray: [Int] = list
	
    for i in 0...myArray.count - 2 // each time through array, put smallest at top
	{
        var min: Int = i
        for j in i + 1...myArray.count - 1 // each time, find smallest remaining
        {
            if myArray[j] < myArray[min] { min = j }
        }
        if min != i // if smallest isn't next in array, swap it with next in array
		{
            let temp: Int = myArray[min]
            myArray[min] = myArray[i]
            myArray[i] = temp
		}
	}
	
    return myArray
}