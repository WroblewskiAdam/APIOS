//
//  main.swift
//  Adam_Wroblewski_lista_dwukierunkowa
//
//  Created by Adam Wróblrewski on 13/03/2023.
//

import Foundation

class Node{
    var next: Node?
    weak var prev: Node?
    var data: Any?
    
    init(myData: Any){
        self.data = myData
    }
    
    deinit{
        print("usunieto element \(self.data)")
    }
}


class List{
    
    var head: Node?
    var tail: Node?
    
    
    func addElement(myData: Any){
        
        let newNode = Node(myData: myData)
        
        if tail != nil{
            newNode.prev = tail
            self.tail?.next = newNode
            print("dodano element \(newNode.data)")
        }
        else{
            self.head = newNode
            print("1 element \(newNode.data)")
        }
        self.tail = newNode
    }
    
    
    func delete(){
        self.head = nil
        self.tail = nil
    }
    
    
    func printList(){
        var element = self.head
        print("--------------")
        print("element \(element?.data)")
        print("poprzedni \(element?.prev?.data)")
        print("nastepny \(element?.next?.data)")
        while element?.next != nil{
            element = element?.next
            print("--------------")
            print("element \(element?.data)")
            print("poprzedni \(element?.prev?.data)")
            print("nastepny \(element?.next?.data)")
            
        }
    }
    
    deinit{
        print("usunieto liste")
    }
    
}

var myList: List? = List()
//myList.addElement(myData: "a")
//myList.addElement(myData: "b")
//myList.addElement(myData: "c")
//myList.addElement(myData: "d")
//myList.addElement(myData: "e")

myList?.addElement(myData: 1)
myList?.addElement(myData: 2)
myList?.addElement(myData: 3)
myList?.addElement(myData: 4)
myList?.addElement(myData: 5)


print("------------")

print("head \(myList?.head?.data)")
print("tail \(myList?.tail?.data)")
myList?.printList()

print("------------")

myList?.delete()
myList = nil
