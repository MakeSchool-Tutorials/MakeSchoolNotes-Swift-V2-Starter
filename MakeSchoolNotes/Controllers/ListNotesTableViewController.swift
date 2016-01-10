//
//  ListNotesTableViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class ListNotesTableViewController: UITableViewController {

  var notes = [Note]()

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return notes.count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("listNotesTableViewCell", forIndexPath: indexPath) as! ListNotesTableViewCell
    let row = indexPath.row
    let note = notes[row]
    cell.noteTitleLabel.text = note.title
    cell.noteModificationTimeLabel.text = note.modificationTime.convertToString()
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let identifier = segue.identifier {
      if identifier == "displayNote" {
        print("Table view cell tapped")
        let indexPath = tableView.indexPathForSelectedRow!
        let note = notes[indexPath.row]
        let destination = segue.destinationViewController as! DisplayNoteViewController
        destination.note = note
      } else if identifier == "addNote" {
        print("+ button tapped")
      }
    }
  }
  
  @IBAction func unwindToListNotesViewController(segue: UIStoryboardSegue){
      // for now, simply defining the method is sufficient.
      // we'll add code later
  }
  
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    notes.removeAtIndex(indexPath.row)
    tableView.reloadData()
  }
  
}