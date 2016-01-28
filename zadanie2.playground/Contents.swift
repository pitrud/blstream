//: Playground - noun: a place where people can play

import UIKit


class fiszki: CustomStringConvertible, CustomDebugStringConvertible {
    var strona1:String
    var strona2:String
    var czySieDa:Bool = false
    var podpowiedzi = [Int:Any]()
    var tmp_tekst:Any?
    
    init(strona1:String, strona2:String, podpowiedzi:[Int:Any]) {
        self.strona1 = strona1
        self.strona2 = strona2
        self.podpowiedzi = podpowiedzi
    }
    
    
    /*
    UWAGA:  W PONIŻSZEJ WERSJI ENUMERATOR ZWRACAŁ RÓŻNE TYPY
            POTRZEBUJEMY JEDNAK INFORAMCJI PRZEKAZANEJ W KONSTRUKTORZE (tablica z odpowiedziami)
    */
    /*
    enum typOdpowiedzi {
        case tekst
        case obrazek
        case cyferki
        
        func description() -> Any {
            switch(self) {
                case .cyferki: return 1235
                case .tekst: return "podpowiedz1"
                case .obrazek: return "img1"
            }
        }
    }
    */
    
    /*
        W TEJ WERSJI ODWOŁUJEMY SIĘ DO KONKRETNEGO ELEMENTU TABLICY
    */
    enum typOdpowiedzi {
        case tekst
        case obrazek
        case cyferki
        
        func description() -> Int {
            switch(self) {
            case .tekst:    return 0
            case .obrazek:  return 1
            case .cyferki:  return 2
            }
        }
    }
    
    func wybierzTypOdpowiedzi(rodzaj: typOdpowiedzi)
    {
        tmp_tekst = podpowiedzi[rodzaj.description()]
    }
    

    
    //CustomStringConvertible
    var description:String {
        return "\(tmp_tekst)"
    }
    //CustomDebugStringConvertible
    var debugDescription: String {
        return "\(tmp_tekst)"
    }

    
    
    
    
}

let jfiszka = fiszki(strona1: "a", strona2: "b", podpowiedzi: [0:"podpowiedź 1", 1:"podpowiedź 2", 2:12345])

jfiszka.wybierzTypOdpowiedzi(.cyferki)
jfiszka.debugDescription
jfiszka.description
jfiszka

