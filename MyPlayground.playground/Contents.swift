import Foundation

var intA = 1
var intB = 2
let maiorInt = maior(intA, intB)

var doubleA = Double.pi
var doubleB = 3.14
let maiorDouble =  maior(doubleA, doubleB)

var tratorA = AgriculturalMachinery(size: 12)
var tratorB = AgriculturalMachinery(size: 783)
let maiorTrator = maior(tratorA, tratorB)

var pilha = Pilha<Int>()

pilha.push(intA)
pilha.push(intB)

//TODO: Fazer um método que recebe um Array e um elemento, retorna um Bool dizendo se o elemento se encontra no Array

func isOnList<T: Equatable>(_ array: [T], element: T) -> Bool {
    
    return array.contains(element)
}

isOnList([1,2,3,4], element: 3)
isOnList(["a", "b", "c"], element: "d")


//TODO: Extensão de Array contendo uma função que retorna a soma de todos os elementos, independente de qual o valor numérico

extension Array where Element: Numeric {
    
    func sum() -> Element {
        var sum = Element.zero
        for element in self {
            sum += element
        }
        return sum
    }
}

let array = [1, 2, 3, 4, 5]
array.sum()


//TODO: Fazer um método que recebe 2 Arrays e retorna um Int referente a quantidade de elementos presentes em ambos os Arrays
//BONUS TODO: Fazer o método acima receber N arrays

func intersectedElements<T: Equatable>(in arrays: [[T]]) -> [T] {
    
    var commomElements: [T] = []
    
    var presentIn: Int = arrays.count
    
    for element in 0..<arrays[0].count {
        
        for i in 1..<arrays.count {
            
            if !isOnList(arrays[i], element: arrays[0][element]) {
                presentIn -= 1
            }
        }
        
        if presentIn == arrays.count {
            commomElements.append(arrays[0][element])
        }
        presentIn = arrays.count
    }
    
    return commomElements
}

let array1 = [1, 2, 3, 4, 5, 6, 7]
let array2 = [1, 2, 3, 4]
let array3 = [1, 3]
let array4 = [1, 3, 7]

intersectedElements(in: [array1, array2, array3, array4])
