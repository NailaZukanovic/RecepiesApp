//
//  RecepiesData.swift
//  Recepti
//
//  Created by MacLab6 on 22.10.22..
//

import Foundation

class RecepiesData: ObservableObject {
    static let instance = RecepiesData()
    @Published var categories : [Category] = []
    
    func handleInput(output: URLSession.DataTaskPublisher.Output) throws-> Data{
        guard let response = output.response as? HTTPURLResponse, (response.statusCode >= 200 && response.statusCode <= 300) else
        { throw URLError(.badServerResponse)}
        
        return output.data;
    }
    
    init() {
    }
    
    static let baseUrl = "www.themealdb/com/api/json/v1/1/";
    
    static let categoryUrl = baseUrl + "categories.php";
    
    func fetchCategories() {
        guard let url = URL(string: RecepiesData.categoryUrl) else {return}
        
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap(handleInput)
            .decode(type: CategoriesResponse, decoder: JSONDecoder())
            .sink{
                (comp) in
                switch (comp){
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
                    
            }
        
        
        
        
        
        
    }
}
