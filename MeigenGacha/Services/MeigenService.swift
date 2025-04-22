//
//  MeigenService.swift
//  MeigenGacha
//
//  Created by tarou-imokenpi on 2025/04/22.
//

import Foundation

protocol MeigenServiceProtocol {
    func fetchMeigen() async throws -> [Meigen]
}


struct MeigenService: MeigenServiceProtocol {
    private let apiURL = URL(string: "https://meigen.doodlenote.net/api/json.php")!
    
    func fetchMeigen() async throws -> [Meigen] {
        let (data, response) = try await URLSession.shared.data(from: apiURL)
        
        if let http = response as? HTTPURLResponse, http.statusCode != 200 {
            throw URLError(.badServerResponse)
        }
        
        let Meigens = try JSONDecoder().decode([Meigen].self, from: data)
        return Meigens
    }
}

