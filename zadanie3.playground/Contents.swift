//: Playground - noun: a place where people can play

import UIKit

//tablica z danymi różnych fiszek
var tablica_danych = [[Any]]()
tablica_danych.append(["s1_strona1","s1_strona2","c","d",123])
tablica_danych.append(["s2_strona1","s2_strona2","c","d",123])
tablica_danych.append(["s3_strona1","s3_strona2","c","d",123])
tablica_danych.append(["s4_strona1","s4_strona2","c","d",123])




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


protocol roz:SequenceType {
    
}



class ogarnijFiszki:SequenceType {
    var tab_fiszek = [fiszki]()
    
    
    var fileArr:[String] = ["a.swift","b.swift","c.swift"]
    
    //pamiętaj:
    //func generate() -> GeneratorType
    func generate() -> AnyGenerator<Any> {
        var iloscElementow = self.tab_fiszek.count
        //http://swiftdoc.org/v2.1/func/anyGenerator/#func-anygenerator-element_-element

        return anyGenerator {
                return iloscElementow>0&&self.tab_fiszek[--iloscElementow].czyUmie() ? self.tab_fiszek[iloscElementow] : nil
        }

    }


    func pokaz() {
        print(tab_fiszek[0].czyUmie())
    }
    
    func dodajFiszke(fiszka: fiszki) {
        tab_fiszek.append(fiszka)
    }
    
    func nauczLosowe() {
        for fiszka in tab_fiszek {
            if arc4random_uniform(2)==1 {
                fiszka.nauczMnie()
            }
        }
    }
    
    func wyswietlNienauczone() {
        for fiszka in tab_fiszek {
            if fiszka.czyUmie() {
                print("\nmożesz się jeszcze nauczyć fiszki \(fiszka)")
                //fiszka.wybierzTypOdpowiedzi(.cyferki)
                //print("\nPodpowiedź dla tej fiszki: \(fiszka)")
            }
            
        }
    }

}

var tablica = ogarnijFiszki()

//UZUPEŁNIJ FISZKI DANYMI
for tmp in tablica_danych {
    let jfiszka = fiszki(
            strona1: String(tmp[0]),
            strona2: String(tmp[1]),
            podpowiedzi: [0:tmp[2], 1:tmp[3], 2:tmp[4]]
    )
    tablica.dodajFiszke(jfiszka)
}

tablica.pokaz()
tablica.nauczLosowe()
tablica.wyswietlNienauczone()
print("a ponizej na podstawie anygenerator;SequenceType;next()")
var oko = tablica.generate()
oko.next()
oko.next()
oko.next()
oko.next()
oko.next()
print("koniec")
