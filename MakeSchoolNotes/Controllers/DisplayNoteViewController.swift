//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {

  var note: Note?

  @IBOutlet weak var noteTitleTextField: UITextField!
  @IBOutlet weak var noteContentTextView: UITextView!
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    noteTitleTextField.text = ""
    noteContentTextView.text = ""
  }
  

  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let identifier = segue.identifier {
      if identifier == "Cancel" {
        print("Cancel button tapped")
      } else if identifier == "Save" {
        print("Save button tapped")
        let note = Note()
        note.title = noteTitleTextField.text ?? ""
        note.content = noteContentTextView.text
        note.modificationTime = NSDate()
        
        let destinationViewController = segue.destinationViewController as! ListNotesTableViewController
        destinationViewController.notes.append(note)
        destinationViewController.tableView.reloadData()
      }
    }
  }
  
}
