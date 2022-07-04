//
//  ModelViewModel.swift
//  UpcommingMovies
//
//  Created by USER on 19/11/2564 BE.
//

import Foundation

class MovieViewModel
{
    
    private var apiService = ApiService()
    private var popularMovies = [Movie]()
    func fetchPopularMoviesData (completion:@escaping()-> ())
    {
        apiService.getPopularMoviesData { [weak self](result)in
            
            switch result {
            case .success(let listOf):
                self?.popularMovies = listOf.movies
                completion()
            case .failure(let error):
                print("Error processing jsn data \(error)")
            }
        }
    }
    
    func numberOfRowsInSection(section:Int) -> Int
    {
        if popularMovies.count != 0
        {
            return popularMovies.count
        }
        return 0
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Movie{
        return popularMovies[indexPath.row]
    }
    
}