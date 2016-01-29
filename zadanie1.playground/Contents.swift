//: Playground - noun: a place where people can play

import UIKit


class fiszki: CustomStringConvertible {
    var strona1:String
    var strona2:String
    var czySieDa:Bool = false
    var podpowiedzi = [String]()
    
    /*
    func description() -> String {
    var tmp  = "Podowiedzi: "
    for txt in podpowiedzi {
    tmp += ("\n \(txt)")
    }
    return tmp
    }
    */
   
   //up ->CustomStringConvertible
    var description:String {
        var tmp  = "Strona1: \(strona1) -> Strona2: \(strona2) -> Podowiedzi: "
        for txt in podpowiedzi {
            tmp += ("\n \(txt)")
        }
        return tmp
    }
    

    init(strona1:String, strona2:String, podpowiedzi:[String]) {
        self.strona1 = strona1
        self.strona2 = strona2
        self.podpowiedzi = podpowiedzi
        
    }

    
}

let jfiszka = fiszki(strona1: "a", strona2: "b", podpowiedzi: ["podpowiedź 1", "podpowiedź 2"])

print(jfiszka)
