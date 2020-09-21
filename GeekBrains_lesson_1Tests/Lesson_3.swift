//
//  Lesson_3.swift
//  GeekBrains_lesson_1Tests
//
//  Created by Константин Суслов on 17.09.2020.
//  Copyright © 2020 Константин Суслов. All rights reserved.
//

import Foundation

/*
 1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
 6. Вывести значения свойств экземпляров в консоль.
 */



enum engineState{
    case start, stop
}

enum AreWindowsOpen {
    case open, close
}

enum trunkState {
    case full, empty
}

struct car {
    
    let brandAuto : String
    
    var color : String
    
    let yearOfManufacture : Int
    
    var trunkState : trunkState
    
    var trunkVolume : Double {
        willSet {
            if (trunkState == .empty) && (trunkVolume > 0) && (newValue < trunkVolume) {
                let space = trunkVolume - newValue
                print ("\(brandAuto) свободное место в багажнике: \(space)")
            } else { print("Багажник \(brandAuto) заполнен.")}
        }
    }
    
    var engineState : engineState {
        willSet {
            if newValue == .start {
                print ("\(brandAuto) заведена")
            } else {print("\(brandAuto) заглушена")}
        }
    }
    
    var AreWindowsOpen : AreWindowsOpen {
        willSet {
            if newValue == .open {
                print("\(brandAuto) окна открыты")
            } else { print("\(brandAuto) окна закрыты") }
        }
    }
    
    mutating func changeColor(col:String) {
        switch col {
        case "green":
            self.color = "green"
        case "yellow":
            self.color = "yellow"
        case "gray":
            self.color = "gray"
        case "blue":
            self.color = "blue"
        default:
            print("Нет такого цвета")
        }
    }
    
    
    mutating func emptyTrunck() {
        self.trunkState = .empty
        print ("\(brandAuto) багажник пуст")
    }
}

struct truck {
    
    let brandTruck : String
    
    var color : String
    
    let yearOfManufacture : Int
    
    var trunkState : trunkState
    
    var truckVolume : Double {
        willSet {
            if (trunkState == .empty) && (truckVolume > 0) && (newValue < truckVolume) {
                let space = truckVolume - newValue
                print ("\(brandTruck) trunk free: \(space)")
            } else { print("Input error or \(brandTruck) trunk is full.")}
        }
    }
    
    var engineState : engineState {
        willSet {
            if newValue == .start {
                print ("\(brandTruck) engine is on")
            } else {print("\(brandTruck) engine is off")}
        }
    }
    
    var AreWindowsOpen : AreWindowsOpen {
        willSet {
            if newValue == .open {
                print("\(brandTruck) windows are open")
            } else { print("\(brandTruck) windows are close") }
        }
    }
    
    mutating func changeColor(col:String) {
        switch col {
        case "green":
            self.color = "green"
        case "yellow":
            self.color = "yellow"
        case "gray":
            self.color = "gray"
        case "blue":
            self.color = "blue"
        default:
            print("Нет такого цвета")
        }
    }
    
    mutating func emptyTrunck() {
        self.trunkState = .empty
        print ("\(brandTruck) багажник пустой")
    }
    
}

class Toyota {
    
    func getSportCarToyota() -> car{
        
        
        return car(
            brandAuto: "Toyota",
            color: "white",
            yearOfManufacture: 2016,
            trunkState: .empty,
            trunkVolume: 580.0 ,
            engineState: .stop,
            AreWindowsOpen: .open)
        
    }
}

class Ford  {
    
    func getTruckFord() -> truck{
        
        
        return truck(
            brandTruck: "Ford",
            color: "green",
            yearOfManufacture: 2012,
            trunkState: .empty,
            truckVolume: 140000.0,
            engineState: .start,
            AreWindowsOpen: .close)
        
    }
}



class characterCar{
    
    func setCharacterSportCar(){
        let toyota = Toyota()
        
        var sportCar = toyota.getSportCarToyota()
        
        sportCar.engineState = .start
        sportCar.trunkVolume = 340.0
        sportCar.changeColor(col: "red")
        
        print("модель: " + sportCar.brandAuto,
              "цвет: " + sportCar.color,
              "год выпуска: " + String(sportCar.yearOfManufacture))
        
    }
    
    
    func setCharacterTruck(){
        let ford = Ford()
        
        var truckFord = ford.getTruckFord()
        
        
        truckFord.engineState = .stop
        truckFord.AreWindowsOpen = .close
        truckFord.AreWindowsOpen = .open
        truckFord.engineState = .stop
        truckFord.truckVolume = 5678908
        truckFord.changeColor(col: "white")
        truckFord.color = "grey"
        
        
        print("модель: " + truckFord.brandTruck,
                     "цвет: " + truckFord.color,
                     "год выпуска: " + String(truckFord.yearOfManufacture))
               
    }
}


