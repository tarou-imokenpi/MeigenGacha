//
//  ContentView.swift
//  MeigenGacha
//
//  Created by tarou-imokenpi on 2025/04/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = MeigenViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            if vm.isLoading {
                ProgressView()
            } else if let err = vm.errorMessage {
                Text("エラー： \(err)")
                    .foregroundColor(.red)
            } else {
                Text(vm.currentMeigen?.meigen ?? "ボタンを押して名言を取得")
                    .font(.title)
                Text(vm.currentMeigen?.author ?? "")
                    .font(.title)
                
            }
            
            Button("名言をガチャる") {
                Task {
                    await vm.fetchMeigen()
                }
            }
            .padding()
        }
        .padding()
    }
}

    
    
#Preview {
    ContentView()
}
