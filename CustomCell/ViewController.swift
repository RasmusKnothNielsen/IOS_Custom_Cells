//
//  ViewController.swift
//  CustomCell
//
//  Created by Rasmus Knoth Nielsen on 13/03/2020.
//  Copyright © 2020 Rasmus Knoth Nielsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // UITableViewDelegate controls the height of the cells

    var stories = [Story]()
    
    var chosenStory = Story()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stories.append(Story(txt: "Hi there", img: ""))
        stories.append(Story(txt: "How you doin'", img: ""))
        stories.append(Story(txt: "Nice car there", img: "car0"))
        stories.append(Story(txt: "Another nice car", img: "car1"))
        stories.append(Story(txt: "Yet another one", img: "car2"))
        
        // Set the delegate
        tableView.dataSource = self     // Assign this class to handle data for the table view
        tableView.delegate = self
    }
    
    // Function that handles when we press the individual row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Transfer the text and image to the detailedViewController
        print(stories[indexPath.row].text)
        let text = stories[indexPath.row].text
        print(text)
        chosenStory = stories[indexPath.row]
        performSegue(withIdentifier: "showDetailsTextImage", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
    
    // Determine how the cells should be displayed
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if stories[indexPath.row].hasImage() {
            // Handle case where there is an image
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as? TableViewCellTextAndImage {
                cell.myLabel.text = stories[indexPath.row].text
                cell.myImageView.image = UIImage(named: stories[indexPath.row].image)
                return cell
            }
        }
        else {
            // Handle the case where there is no image
            
            // If the following works, we get a cell of the type TableViewCellTextOnly
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as? TableViewCellTextOnly
{
                // Set the label text to the respective story text
                cell.myLabel.text = stories[indexPath.row].text
                print(stories[indexPath.row].text)
                return cell
            }
            
        }
        // If everything fails, return an empty cell
        return UITableViewCell()
    }
    
    // Control the height of the cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // If the story has an image, return 250, else return 80
        return stories[indexPath.row].hasImage() ? 250 : 80
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! DetailedViewController
        vc.text = chosenStory.text
        if chosenStory.hasImage() {
            vc.image = chosenStory.image
        }
    }



}

