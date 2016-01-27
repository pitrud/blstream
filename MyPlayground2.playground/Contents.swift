//: Playground - noun: a place where people can play

import UIKit

protocol DaSie {
    var czySieDa: Bool {get set}
}

class fiszki: CustomStringConvertible, DaSie {
    var strona1:String = "aaa"
    var strona2:String
    var czySieDa:Bool = false
    var podpowiedzi = [Int:Any]()//słownik
 
    var description: String {
        //taka a nie inna ze względu na użycie prototypu CustomStringConvertible [return..]
        return ("Podpowiedź to:::")
    }
    
    enum typPodpowiedzi {
        case Obrazek
        case Text, Cyfra
        
        func pokaz() -> Int {
            switch self {
            case .Obrazek:
                return 0
            case .Text:
                return 1
            case .Cyfra:
                return 2
            
            }
        }
    }
    
    init(strona1:String, strona2:String, podpowiedzi:[Int:Any]) {
        self.strona1 = strona1
        self.strona2 = strona2
        self.podpowiedzi = podpowiedzi
    }
    
    func description( typek: typPodpowiedzi) -> String{
        
       // print("\()")
        return String(podpowiedzi[typek.pokaz()]!)
    }
    

}

let jfiszka = fiszki(strona1: "a", strona2: "b", podpowiedzi: [0: "aasas", 1:"string123asd", 2: 43])


print("pod: \(jfiszka.description(.Cyfra))")
