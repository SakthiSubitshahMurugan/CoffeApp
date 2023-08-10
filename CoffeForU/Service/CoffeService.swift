//
//  CoffeService.swift
//  CoffeForU
//
//  Created by Sakthi Subitshah Murugan on 8/9/23.
//

import Foundation
import Alamofire


struct Coffee:Identifiable,Decodable{
    var title:String
    var description:String
    var ingredients:[String]
    var image:String
    var id :Int
}
    
class CoffeeViewModel1: ObservableObject {
    @Published var coffee: [Coffee] = []

    
    init(){
        coffee.append( Coffee(title: "Black", description: "Black coffee is as simple as it gets with ground coffee beans steeped in hot water, served warm. And if you want to sound fancy, you can call black coffee by its proper name: cafe noir.", ingredients: ["Coffee"], image: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/A_small_cup_of_coffee.JPG/640px-A_small_cup_of_coffee.JPG", id: 1))
    }
    
    func fetchItems() {
        AF.request("https://api.sampleapis.com/coffee/hot")
            .responseDecodable(of: [Coffee].self) { response in
                switch response.result {
                case .success(let result):
                    self.coffee = result
                    debugPrint(self.coffee)
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
    }
}
