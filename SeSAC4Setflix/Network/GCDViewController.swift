//
//  GCDViewController.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 1/31/24.
//

import UIKit

class GCDViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let group = DispatchGroup()
        
        DispatchQueue.global().async(group: group) {
            for i in 1...100 {
                print(i, terminator: " ")
            }
        }
        DispatchQueue.global().async(group: group) {
            for i in 101...200 {
                print(i, terminator: " ")
            }
        }
        DispatchQueue.global().async(group: group) {
            for i in 201...300 {
                print(i, terminator: " ")
            }
        }
        DispatchQueue.global().async(group: group) {
            for i in 301...400 {
                print(i, terminator: " ")
            }
        }

        group.notify(queue: .main) {
            print(" 다 끝남 ! 🎉🎉🎉🎉🎉🎉🎉🎉 ")
        }
    }
    
    func callback() {
        DispatchQueue.global().async {
            
            // 이 반복문이 네트워크 통신이라고 생각ㄱ해보자
            for i in 1...100 {
                print(i, terminator: " ")
            }
            
            DispatchQueue.global().async {
                
                // 이 반복문이 네트워크 통신이라고 생각ㄱ해보자
                for i in 101...200 {
                    print(i, terminator: " ")
                }
                
                DispatchQueue.global().async {
                    
                    // 이 반복문이 네트워크 통신이라고 생각ㄱ해보자
                    for i in 201...300 {
                        print(i, terminator: " ")
                    }
                    
                    DispatchQueue.global().async {
                        
                        // 이 반복문이 네트워크 통신이라고 생각ㄱ해보자
                        for i in 301...400 {
                            print(i, terminator: " ")
                        }
                    }
                }
            }
        }
    }
}
