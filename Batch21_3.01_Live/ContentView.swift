//
//  ContentView.swift
//  Batch21_3.01_Live
//
//  Created by Till Hemmerich on 28.10.24.
//

import SwiftUI


struct Item : Identifiable{
    
    let id = UUID()
    let imageName : String
    let description : String
}

struct ContentView: View {
    
    @State var items = [
         Item(imageName: "star", description: "Das ist ein Stern."),
         Item(imageName: "circle", description: "Das ist ein Kreis."),
         Item(imageName: "heart", description: "Das ist ein Herz."),
         Item(imageName: "book", description: "Das ist ein Buch."),
         Item(imageName: "gear", description: "Das ist ein Zahnrad.")
    ]
    
    var body: some View {
        
        VStack {
            //statisch
            List{
                Section("Numbers"){
                    Text("1")
                    Text("2")
                    Text("3")
                }
                Section("Chars"){
                    Text("a")
                    Text("B")
                }
            }
            .listStyle(.inset)
            //dynamisch
            List{
                Section("Test"){
                    ForEach(items){ item in
                        ListItem(item: item)
                    }
                    .onDelete{ offset in
                        items.remove(atOffsets: offset)
                    }
                }
            }
            Text("\(items.count)")
            
        }
        
    }
}



#Preview {
    ContentView()
}

struct ListItem: View {
    var item : Item
    
    var body: some View {
        HStack{
            Image(systemName: item.imageName)
                .resizable()
                .frame(width: 45, height: 45)
                .padding()
            Text(item.description)
                .font(.headline)
            Spacer()
        }
        
    }
}
