//: Playground - noun: a place where people can play

import UIKit


//poniżej zamieszczam 3 kolejno stworzone klasy (każda następna w części implementuje poprzednie funkcjonalności)

/*
ZADANIE 1
*/

protocol DaSie {
    var czySieDa: Bool {get set}
}

class fiszki: CustomStringConvertible, DaSie {
    var strona1:String
    var strona2:String
    var czySieDa:Bool = false
    var podpowiedzi = [Int:Any]()//słownik
 
    var description: String {
        //taka a nie inna ze względu na użycie prototypu CustomStringConvertible [return..]
        return ("Podpowiedź to:::")
    }
    
    enum typPodpowiedzi {
        
        var oko = podpowiedzi
        /*
        towar_ue = Podpowiedz('Wyprodukowany w UE', obrazek)
        dla_dzieci = Podpowiedz('Od 1 roku zycia', obrazek)
        wz = 2
        */
        case Obrazek
        case Text, Cyfra
        
        func pokaz() {
            switch self {
            case .Obrazek:
                var jaj = oddajTab(12)
            case .Text:
                //return 1
            case .Cyfra:
                //return 2
            
            }
        }
    }
    
    init(strona1:String, strona2:String, podpowiedzi:[Int:Any]) {
        self.strona1 = strona1
        self.strona2 = strona2
        self.podpowiedzi = podpowiedzi
    }
    func oddajTab(kt:Int)->Any {
        return (podpowiedzi[0])
    }
   
    
    func description( typek: typPodpowiedzi) -> String{
       var ok = oddajTab(3)
       // print("\()")
        return String(podpowiedzi[typek.pokaz()]!)
    }
    

}

let jfiszka = fiszki(strona1: "a", strona2: "b", podpowiedzi: [0: "aasas", 1:"string123asd", 2: 43])


print("pod: \(jfiszka.description(.Cyfra))")








