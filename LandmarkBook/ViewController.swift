//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Sinan on 9.03.2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //uygulma baslamadan delgate ve datasource a yetki verme
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        
        landmarkNames.append("Coloseum")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stonhenge")
        landmarkNames.append("Taj Mahal")
        
        
        landmarkImages.append(UIImage(named: "coloseum.jpeg")!)
        landmarkImages.append(UIImage(named: "greatWal.jpeg")!)
        landmarkImages.append(UIImage(named: "Kremlintowers.jpeg")!)
        landmarkImages.append(UIImage(named: "stonhenge.jpeg")!)
        landmarkImages.append(UIImage(named: "tajMahal.jpeg")!)
    }
    
    /* bu iki fonksyion yukarda eklenen protokollerin mecbur override edilmesi gereken
    fonksiyonlar
     */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()

        //cell.textLabel?.text = "text"
        /*Yukaridaki kullanim kisa kullanim fakat ilerleyen donemde kalkicak bunun
        icin altaki kullanim daha doru bir kulanim
         */
        
        content.text = landmarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    // tableView den bir hucere secildiginde ne yapilmasi gerektigini soyleyen kisim
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        // diger ekrena gidilcek kisim
        performSegue(withIdentifier: "toDeatilsVC", sender: nil)
        
    }
    //diger VC de olan Verablelara erismek icin gerekli kisim
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDeatilsVC"{
            let destinationVs = segue.destination as! DetailsVC
            destinationVs.selectedLandmarkName = chosenLandmarkName
            destinationVs.selectedLandmarkImage = chosenLandmarkImage
        }
    }
    //
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

