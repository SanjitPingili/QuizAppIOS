//
//  DataLoader.swift
//  newApp
//
//  Created by Zhen Hong Tan on 11/6/22.
//


import Foundation
import Firebase

public class DataLoader: ObservableObject {
    @Published var userData = [UserData]()
    @Published var firebaseData = [firebaseDB]()
    @Published var userD = [firebaseDB]()
    @Published var seen = [UserData]()

    
    init() {
        load()
        sort()
        removeUnknown()
        getData {
            self.loadData {
                print("Firebase is loaded")
            }
        }
        write()
    }
    
    func write() {
        print("in writing")
        let db = Firestore.firestore()
        for item in seen {
            // Get the document reference for the current user
            let userRef = db.collection("UserData").document("YDe6sFkZZC4BJVYoSXq6")
            
            // Create a new collection of questions and answers for this user
            let qaCollectionRef = userRef.collection("QuestionsAndAnswers")
            
            print("writing to firebase")
            // Write the data to the collection
            let data = ["Question": item.Question, "Answer": item.Answer]
            qaCollectionRef.addDocument(data: data)
        }
    }
    
    func convertFirebaseDBObjectToFirebaseDB() {
        self.firebaseData = self.firebaseData.compactMap { firebaseDBObject in
            firebaseDB(id: firebaseDBObject.id ?? "", UserName: firebaseDBObject.UserName ?? "", Password: firebaseDBObject.Password ?? "")
        }
    }
    
    func loadingData() {
        let myFirebaseData = self.firebaseData
        for firebaseDBObject in myFirebaseData {
            print(firebaseDBObject.UserName)
            print(firebaseDBObject.Password)
        }
    }
    
    func loadData(completion: @escaping () -> Void) {
        // Read the documents at a specific path
        Firestore.firestore().collection("UserData").getDocuments { snapshot, error in
            if error == nil, let snapshot = snapshot {
                // Update the list property in the main thread
                DispatchQueue.main.async {
                    // Get all the documents and create firebaseDB objects
                    self.firebaseData = snapshot.documents.compactMap { d in
                        guard let name = d["UserName"] as? String, let password = d["Password"] as? String else {
                            return nil
                        }
                        return firebaseDB(id: d.documentID, UserName: name, Password: password)
                    }
                    completion()
                }
            }
            else {
                // Handle the error
            }
        }
    }
    
    func getData(completion: @escaping () -> Void) {
        // Call the completion handler after firebaseData is fully populated
        doSomethingWithFirebaseData {
            completion()
        }
    }
    
    func doSomethingWithFirebaseData(completion: @escaping () -> Void) {
        Firestore.firestore().collection("UserData").getDocuments { snapshot, error in
            if error == nil, let snapshot = snapshot {
                // Get all the documents and create firebaseDB objects
                self.firebaseData = snapshot.documents.compactMap { d in
                    guard let name = d["UserName"] as? String, let password = d["Password"] as? String else {
                        return nil
                    }
                    return firebaseDB(id: d.documentID, UserName: name, Password: password)
                }
                
                // Initialize userD after firebaseData is loaded
                self.userD = self.firebaseData.map { firebaseDBObject in
                    let n = firebaseDBObject.UserName
                    let p = firebaseDBObject.Password
                    print(n)
                    print(p)
                    return firebaseDB(id: "random", UserName: n, Password: p)
                }
                
                completion()
            }
        }
    }
    
    func load() {
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
    
    func removeUnknown() {
        var num = 0
        var bck = self.userData.count - 1
        while(num < self.userData.count && num < bck) {
            if(userData[num].Answer == "unknown") {
                let st = userData[num]
                userData[num] = userData[bck]
                userData[bck] = st
                bck -= 1
            } else {
                num += 1
            }
        }
        print(num)
    }
}
