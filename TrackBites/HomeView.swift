//
//  HomeView.swift
//  TrackBites
//
//  Created by Sebastian-Alexandru Popa on 23.11.2024.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Order.date, order: .reverse) var orders: [Order]
    var body: some View {
        NavigationView {
            List {
                ForEach(orders) { order in
                    NavigationLink(destination: OrderView(order: order)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(order.restaurantName)
                                    .font(.headline)
                                Text(order.onlinePlatform.name)
                                    .font(.subheadline)
                                Text("\(order.date.formatted(.dateTime.year().month().day()))")
                                    .font(.caption)
                            }
                            Spacer()
                            VStack(alignment: .trailing) {
                                Text(order.totalCost.formatted())
                            }
                        }
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            deleteOrder(order)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
            .navigationTitle("Orders")
            .navigationBarTitleDisplayMode(.large)
        }
        .foregroundStyle(.primary)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: saveData) {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    func saveData() {
        Order.mockOrders.forEach { order in
            modelContext.insert(order)
            do {
                try modelContext.save()
            } catch {
                print("Failed to save insertion")
            }
        }
    }
    
    func deleteOrder(_ order: Order) {
        modelContext.delete(order)
        do {
            try modelContext.save()
        } catch {
            print("Failed to delete order")
        }
    }
}

#Preview {
    HomeView()
}
