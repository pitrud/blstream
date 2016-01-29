//: Playground - noun: a place where people can play

import UIKit

protocol daSie {
    var czySieDa:Bool {get set}
}

class fiszki: CustomStringConvertible, CustomDebugStringConvertible, daSie {
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
        return "Fiszka \(strona1) -> \(strona2) \((tmp_tekst==nil ? "" : "Podpowiedzi: \(tmp_tekst)"))"
    }
    //CustomDebugStringConvertible
    var debugDescription: String {
        return "\(tmp_tekst)"
    }
    
    
    func nauczMnie() {
        self.czySieDa = true
    }
    func czyUmie() -> Bool {
        return czySieDa
    }
    
}

//tablica z danymi różnych fiszek
var tablica_danych = [[Any]]()
tablica_danych.append(["s1_strona1","s1_strona2","c","d",123])
tablica_danych.append(["s2_strona1","s2_strona2","c","d",123])
tablica_danych.append(["s3_strona1","s3_strona2","c","d",123])
tablica_danych.append(["s4_strona1","s4_strona2","c","d",123])

var tab_fiszek = [fiszki]()

//UZUPEŁNIJ FISZKI JAKIMIŚ DANYMI
for tmp in tablica_danych {
    let jfiszka = fiszki(
            strona1: String(tmp[0]),
            strona2: String(tmp[1]),
            podpowiedzi: [0:tmp[2], 1:tmp[3], 2:tmp[4]]
    )
    tab_fiszek.append(jfiszka)
}

//..i ustaw losowe fiszki jako nauczone
for fiszka in tab_fiszek {
    if arc4random_uniform(2)==1 {
        fiszka.nauczMnie()
    }
}

//wyświetl jeszcze nie nauczone
for fiszka in tab_fiszek {
    if fiszka.czyUmie() {
        print("\nmożesz się jeszcze nauczyć fiszki \(fiszka)")
        fiszka.wybierzTypOdpowiedzi(.cyferki)
        print("\nPodpowiedź dla tej fiszki: \(fiszka)")
    }
    
}

/*
func poka(el:fiszki)->SequenceType {
    
}
*/

print("koniec")
