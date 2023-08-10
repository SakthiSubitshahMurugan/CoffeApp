//
//  ContentView.swift
//  CoffeForU
//
//  Created by Sakthi Subitshah Murugan on 8/9/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = CoffeeViewModel1()


    var body: some View {
        NavigationView {
            List(viewModel.coffee) { item in
                HStack{
                    AsyncImage(url: URL(string: item.image)){image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                         }placeholder: {
                                Color.gray.frame(width: 100, height: 100)
                            }
                    VStack{
                        Text(item.title)
                        Text(item.ingredients.description)
                        
                    }
                  
            
                }
                    
                }
                .navigationBarTitle("Coffee List")
                .onAppear {
                    viewModel.fetchItems()
                    print("****************")
                    print(viewModel.coffee)
                }
            }
        }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let coffee_preview = Coffee(title: "title", description: "Black coffee is as simple as it gets with ground coffee beans steeped in hot water, served warm. And if you want to sound fancy, you can call black coffee by its proper name: cafe noir.", ingredients: ["Coffee"], image: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/A_small_cup_of_coffee.JPG/640px-A_small_cup_of_coffee.JPG", id: 1)
        let viewModel = CoffeeViewModel1()
        viewModel.coffee = [coffee_preview]
        
        return ContentView(viewModel: viewModel)
    }
}


 
