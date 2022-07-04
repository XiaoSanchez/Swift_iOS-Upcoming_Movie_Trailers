//
//  ApiService.swift
//  UpcommingMovies
//
//  Created by Shawn on 07/04/2022 ET.
//

import Foundation
class ApiService
{
    private var dataTask: URLSessionDataTask?
    var movies = [Movie]()
    func getPopularMoviesData(completion: @escaping (Result<MoviesData,Error>) -> Void)
    {
        let popularMoviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=4e0be2c22f7268edffde97481d49064a&language=en-US&page-1"
//        "https://api.themoviedb.org/3/movie/550?api_key=7ed158cb2c00e9dc0dfaf626e33db187&language=en-US&page-1"
        guard let url = URL(string: popularMoviesURL) else {
            return
        }
        
        // Create URL session - work on the background
        
        dataTask =  URLSession.shared.dataTask(with:url){
            (data,response,error)in
            if let error = error
            {
                completion(.failure(error))
                print("DataTask error:\(error.localizedDescription)")
                return
                
            }
            guard let response = response as? HTTPURLResponse else
            {
                print("Empty Response")
                return
                
            }
            print("Response status code:\(response.statusCode)")
            guard let data = data else
            {
                print("Empty Data")
                return
            }
            do {
               // Parse the data
                print("within do ")
                let decoder = JSONDecoder()
                let jsonData  = try decoder.decode(MoviesData.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(jsonData))

                }
                
                ///////////
                
            
            }
            catch let error
            {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
}
