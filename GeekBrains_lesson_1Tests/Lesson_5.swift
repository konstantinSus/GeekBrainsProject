//
//  Lesson_5.swift
//  GeekBrains_lesson_1Tests
//
//  Created by Константин Суслов on 24.09.2020.
//  Copyright © 2020 Константин Суслов. All rights reserved.
//

import Foundation

/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
 
 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 
 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 
 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
 
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 
 6. Вывести сами объекты в консоль.
 */

protocol CarMy{
    func canDrive() -> Bool
}

class MySportCar: CarMy {
    
    var wheels: Int = 0
    
    var stateEngine: Bool = true
    
    var myBrand: String = ""
    
    
    
    init(wheels: Int, stateEngine: Bool, brand: String) {
        self.wheels = wheels
        self.stateEngine = stateEngine
        self.myBrand = brand
    }
    
    func canDrive() -> Bool {
        
        if wheels != 4{
            print("Не тот радиус колес")
            return false
        } else {
            print("Поехали!!!")
            return true
        }
    }
}




class MyTruck: CarMy {
    
    var maxFillTrunk: Int
    
    var fillTrunk: Int
    
    
    init(maxFillTrunk: Int, fillTrunk: Int) {
        
        self.fillTrunk = fillTrunk
        self.maxFillTrunk = maxFillTrunk
    }
    
    
    func differenceFill(){
        
        let dif = maxFillTrunk - fillTrunk
        print ("У тебя нет \(dif) вес. Багажник")
    }
    
    func canDrive() -> Bool {
        
        if fillTrunk <= maxFillTrunk {
            print("Можешь водить")
            return true
        } else {
            print("У тебя слишком большой багаж")
            return false
        }
    }
}

extension MySportCar{
    
    func doesWorkCar() -> Bool {
        
        if stateEngine == true{
            print("Машина работает!!!")
            return true
        } else {
            print("Завведи двигатель!!")
            return false
        }
    }
}

extension MySportCar: CustomStringConvertible{
    
    var description: String {
        return String(describing: myBrand)
    }
    
}

class Run {
    
    let toyota = MySportCar(wheels: 4, stateEngine: true, brand: "Toyota")
    
    let astonMartin = MySportCar(wheels: 3, stateEngine: false, brand: "Aston Martin")
    
    
    func StartCar(){
        
        toyota.canDrive()
        toyota.stateEngine = true
        toyota.myBrand = "Toyota"
        toyota.wheels = 1
        astonMartin.myBrand = "Aston"
        astonMartin.stateEngine = true
        astonMartin.doesWorkCar()
        astonMartin.wheels = 100
        
        
        print("модель toyota  :" + toyota.myBrand, "модель aston :" + astonMartin.myBrand)
        
        
        
        let kamaz = MyTruck(maxFillTrunk: 250, fillTrunk: 180)
        
        let Man = MyTruck(maxFillTrunk: 150, fillTrunk: 200)
        
        kamaz.differenceFill()
        kamaz.canDrive()
        Man.canDrive()
    }
}



