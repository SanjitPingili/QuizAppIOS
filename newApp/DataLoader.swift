//
//  DataLoader.swift
//  newApp
//
//  Created by Zhen Hong Tan on 11/6/22.
//

import Foundation

public class DataLoader {
    @Published var userData = [UserData]()
    
    init() {
        load()
        sort()
    }
    func load() {
        print("Here")
        if let fileLocation = Bundle.main.url(forResource: "Data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([UserData].self, from: data)
                self.userData = dataFromJson
            } catch {

                print(error)
            }
        }
    }
    
    func sort() {
        self.userData = self.userData.sorted(by: { $0.Chapter < $1.Chapter})
    }
}
