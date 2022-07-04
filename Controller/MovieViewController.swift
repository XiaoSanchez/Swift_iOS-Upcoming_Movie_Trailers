//
//  ViewController.swift
//  UpcommingMovies
//
//  Created by USER on 19/11/2564 BE.
//

import UIKit

class MovieViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = MovieViewModel()
    
    
    var apiService = ApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPopularMoviesData()
        tableView.delegate = self
        tableView.dataSource
         = self
    }
    private func loadPopularMoviesData()
    {
        viewModel.fetchPopularMoviesData {[weak self] in
            self?.tableView.dataSource = self
            self?.tableView.reloadData()
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailsegue" {
            guard let detailVC = segue.destination as? SecondViewController else {return}
            guard let selectedMovieCell = sender as? UITableViewCell else {
                    return
            }
            if let indexPath = tableView.indexPath(for: selectedMovieCell)
            {
                let selectedMovie = viewModel.cellForRowAt(indexPath: indexPath)
                
            }
        }
        
    }


}
// MARK: TableView
extension MovieViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)as! MovieTableViewCell
        let movie = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    

}
extension MovieViewController:UITableViewDelegate
{
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // tableView.deselectRow(at: indexPath, animated: true)
        //performSegue(withIdentifier: "detailsegue", sender: self )
        print(indexPath.row)
            
        
        

    }
}
