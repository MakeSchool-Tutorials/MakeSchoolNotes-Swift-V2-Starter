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
    if let note = note {
      noteTitleTextField.text = note.title
      noteContentTextView.text = note.content
    } else {
      noteTitleTextField.text = ""
      noteContentTextView.text = ""
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let destinationViewController = segue.destinationViewController as! ListNotesTableViewController
    if segue.identifier == "Save" {
      if let note = note {
        note.title = noteTitleTextField.text ?? ""
        note.content = noteContentTextView.text ?? ""
      } else {
        let note = Note()
        note.title = noteTitleTextField.text ?? ""
        note.content = noteContentTextView.text ?? ""
        note.modificationTime = NSDate()
        destinationViewController.notes.append(note)
      }
      destinationViewController.tableView.reloadData()
    }
  }
  
}
