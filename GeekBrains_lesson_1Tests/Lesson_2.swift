//
//  Lesson_2.swift
//  GeekBrains_lesson_1Tests
//
//  Created by Константин Суслов on 05.10.2020.
//  Copyright © 2020 Константин Суслов. All rights reserved.
//

import Foundation
import UIKit


class Lesson2{
    
    
    func HomeWork(){
        
        //1. Написать функцию, которая определяет, четное число или нет.
        var a = 5
        
        func even() {
            if a % 2 == 0{
                
                print(a, "is even number")
            } else{
                
                print(a, "is odd number")
            }
        }
        
        even()
        
        
        //2. Написать функцию, которая определяет, делится ли число без остатка на 3.
        var b = 3
        
        func multiple3() {
            
            if b % 3 == 0{
                
                print(b, "is multiple 3")
            } else{
                
                print(b, "is not multiple 3")
            }
        }
        
        multiple3()
        
        //3. Создать возрастающий массив из 100 чисел.
        
        //4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
        
        var arr: [Int] = []
        
        for i in 0...100{
            
            if i % 3 != 0 && i % 2 != 0{
                
                arr.append(i)
            }
        }
        
        print(arr)
    }
    
    
    
}
