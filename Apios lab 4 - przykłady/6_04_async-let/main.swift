//
//  Created by Adam Wojtasik on 26/10/2021.
//  Last modifications on 21/04/2022.
//

import Foundation


func doSomething(tekst text: String, first kMax: Int64, sec iMax: Int64, third jMax: Int64) -> Double {
    print("\(text) - start");
    var x = 0.0
    for k in 0...kMax {
        print("\(text) - report: \(k)")
        for i in 0...iMax {
            for j in 0...jMax{
                x = Double(j) * Double(i);
            }
        }
    }
    print("\(text) - stop \(x)");
    return x
}

var flag = true
Task {
    // Definiujemy i uruchamiamy zadania asynchroniczne (zadania zwracają jakąś wartość - tu typu Double)
    async let a = doSomething(tekst: "Moje zadanie A", first: Int64.random(in: 1...5), sec:Int64.random(in: 500...1200), third: Int64.random(in: 8000...12000))
    async let b = doSomething(tekst: "Moje zadanie B", first: Int64.random(in: 1...5), sec:Int64.random(in: 300...800), third: Int64.random(in: 2000...8000))
    async let c = doSomething(tekst: "Moje zadanie C", first: Int64.random(in: 1...5), sec:Int64.random(in: 600...1500), third: Int64.random(in: 10000...20000))
    async let d = doSomething(tekst: "Moje zadanie D", first: Int64.random(in: 4...7), sec:Int64.random(in: 800...1500), third: Int64.random(in: 15000...20000))

    // Umieszczmy w tablicy wartości zwracane przez zadania
    // i synchrozujemy wykonanie zadań, czekając aż wszystkie zakończą działanie (await)
    
    let result: [Double] = await [a, b, c]

    // Wszystko jest obliczone, więc można wydrukować zawartość tablicy
    print(result)
    
    // Uwaga: zadanie D nie jest synchronizowane z pozostałymi –
    // może nawet nie wyykonać się do końca przed końcem działania programu
    // Trzeba poczekać na d

    print(await d)

    flag = false
}


while(flag) {}

print("koniec")
