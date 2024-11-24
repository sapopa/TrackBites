//
//  OrderView.swift
//  TrackBites
//
//  Created by Sebastian-Alexandru Popa on 24.11.2024.
//

import SwiftUI

struct OrderView: View {
    var order: Order
    var body: some View {
        VStack(alignment: .leading) {
            Text(order.onlinePlatform.name)
                .font(.largeTitle)
                .padding()
            Text(order.restaurantName)
                .font(.title)
            
            Text("Total cost: \(order.totalCost.formatted())")
            
            List(order.items) { item in
                Text("\(item.name) - \(item.portionSize?.formatted() ?? "N/A") - \(item.price.formatted())")
            }
        }
    }
}

#Preview {
    OrderView(order: Order.mockOrders[0])
}
