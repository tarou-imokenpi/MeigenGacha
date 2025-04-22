//
//  MeigenViewModel.swift
//  MeigenGacha
//
//  Created by tarou-imokenpi on 2025/04/22.
//

import Foundation

class MeigenViewModel: ObservableObject {
    @Published var currentMeigen: Meigen?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let service: MeigenServiceProtocol
    
    init(service: MeigenServiceProtocol = MeigenService()) {
        self.service = service
    }
    
    func fetchMeigen() async {
        isLoading = true
        errorMessage = nil
        defer {isLoading = false}
        
        do {
            let meigens = try await service.fetchMeigen()
            currentMeigen = meigens.first
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
}
