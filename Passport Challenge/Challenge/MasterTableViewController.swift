//
//  MasterTableViewController.swift
//  Challenge
//
//  Created by Ariela Cohen on 12/14/16.
//  Copyright © 2016 Ariela Cohen. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class MasterTableViewController: UITableViewController {
    
    var profileArray: [Profile] = []
    
    var ref = FIRDatabase.database().reference()
    
    let nameTextField: UITextField = UITextField()
    let ageTextField: UITextField = UITextField()
    let genderTextField: UITextField = UITextField()
    let submitButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile List"
        setupAddButton()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = profileArray[indexPath.row].name
        cell.backgroundColor = profileArray[indexPath.row].cellBackgroundColor
        

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //Navigation Controller View
    
    func setupAddButton(){

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self , action: #selector(addButtonTapped))
        self.navigationItem.setRightBarButton(addButton, animated: true)
    }

    func addButtonTapped(){
        print("add button tapped")
        setupOverlayView()
    }
    
    func submitButtonTapped(sender: UIButton!) {
        //add info to firebase
        guard let name = nameTextField.text, let age = ageTextField.text, let gender = genderTextField.text else { return }
        
        
        let profile = Profile(name: name, age: age, gender: gender)
        let profileRef = FIRDatabase.database().reference(withPath: "Profile")
        let profilePath = profileRef.childByAutoId()
        profilePath.setValue(profile.dataIntoAny())

        sender.superview?.removeFromSuperview()
    }
    
    func setupOverlayView(){
        let overLay: UIView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        overLay.backgroundColor = UIColor.red
        self.view.addSubview(overLay)
      
        overLay.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        nameTextField.centerXAnchor.constraint(equalTo: overLay.centerXAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: overLay.topAnchor, constant: 100).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: overLay.widthAnchor, multiplier: 0.5).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameTextField.placeholder = "Name"
        nameTextField.textAlignment = .center
        nameTextField.backgroundColor = UIColor.gray
        
        
        overLay.addSubview(ageTextField)
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        
        ageTextField.centerXAnchor.constraint(equalTo: overLay.centerXAnchor).isActive = true
        ageTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20).isActive = true
        ageTextField.widthAnchor.constraint(equalTo: overLay.widthAnchor, multiplier: 0.5).isActive = true
        ageTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        ageTextField.placeholder = "Age"
        ageTextField.textAlignment = .center
        ageTextField.backgroundColor = UIColor.gray
        
        
        overLay.addSubview(genderTextField)
        genderTextField.translatesAutoresizingMaskIntoConstraints = false
        
        genderTextField.centerXAnchor.constraint(equalTo: overLay.centerXAnchor).isActive = true
        genderTextField.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 20).isActive = true
        genderTextField.widthAnchor.constraint(equalTo: overLay.widthAnchor, multiplier: 0.5).isActive = true
        genderTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        genderTextField.placeholder = "Gender"
        genderTextField.textAlignment = .center
        genderTextField.backgroundColor = UIColor.gray
        
        
        submitButton.setTitle("Submit", for: .normal)
        submitButton.addTarget(self, action: #selector(submitButtonTapped(sender:)), for: .touchUpInside)
        overLay.addSubview(submitButton)
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        submitButton.centerXAnchor.constraint(equalTo: overLay.centerXAnchor).isActive = true
        submitButton.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 20).isActive = true
        submitButton.widthAnchor.constraint(equalTo: overLay.widthAnchor, multiplier: 0.25).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        submitButton.backgroundColor = UIColor.gray
        
    }
}
