//
//  Model.swift
//  ToDoList
//
//  Created by Анита Самчук on 13.01.2022.
//

import Foundation

var toDoItems: [[String: Any]] {
    set {
        UserDefaults.standard.set(newValue, forKey: "ToDoDataKey")
        UserDefaults.standard.synchronize()
    }
    get{
        if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String: Any]] {
            return array
        } else {
            return []
        }
    }
}

func addItem(nameItem: String, isCompleted: Bool = false) {
    toDoItems.append(["Name": nameItem, "isCompleted": isCompleted])

}

func removeItem(at index: Int) {
    toDoItems.remove(at: index)
}

func moveItem(fromIndex: Int, toIndex: Int) {
    let from = toDoItems[fromIndex]
    toDoItems.remove(at: fromIndex)
    toDoItems.insert(from, at: toIndex)

}

func findDublicate(newItem: String) -> Bool {
    
    for item in 0..<toDoItems.count {
        if toDoItems[item]["Name"] as? String == newItem {
            return true
        }
    }
    return false
}

func changeState(at item: Int) -> Bool {
    toDoItems[item]["isCompleted"] = !(toDoItems[item]["isCompleted"] as! Bool)    
    return toDoItems[item]["isCompleted"] as! Bool
}
