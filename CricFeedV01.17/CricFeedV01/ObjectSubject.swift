//
//  ObjectSubject.swift
//  CricFeedV01
//
//  Created by BJIT on 26/2/23.
//

import Foundation
import Combine

class ObjectSubject {
    static let shared = ObjectSubject()
    private let subject = PassthroughSubject<DataClass, Never>()
    
    func sendObject(_ object: DataClass) {
        print("Sending object ID: \(object.id)")
        subject.send(object)
    }
    
    func subscribe(_ subscriber: AnySubscriber<DataClass, Never>) {
        subject.subscribe(subscriber)
    }
}
