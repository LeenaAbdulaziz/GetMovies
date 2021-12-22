//
//  ViewController.swift
//  GetMovies
//
//  Created by Linah abdulaziz on 17/05/1443 AH.
//

import UIKit

class PeopleViewController: UITableViewController {

    let peopleApi = "https://swapi.dev/api/people/?format=json"
    
    var people: People?

    override func viewDidLoad() {
        super.viewDidLoad()

      
        
        getallpeopl()
            }
            
    
    
    
    
            func  getallpeopl() {
                ApiManager.getApiResponse(urlPath: peopleApi) { data, error in
                    if error != nil {
                        print(error?.localizedDescription)
                    } else {
                        if let data = data {
                            self.people = self.parseLogic(data: data)
                            
                            
                            DispatchQueue.main.async {
                                // main thread
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
            
            private func parseLogic(data:Data) -> People? {
                do {
                    let people = try JSONDecoder().decode(People.self, from: data)

                    return people
                } catch {
                    print(error.localizedDescription)
                    return nil
                }
            }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.people?.results.count ?? 0
        }

        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)

        cell.textLabel?.text = self.people?.results[indexPath.row].name

            return cell
        }

}
