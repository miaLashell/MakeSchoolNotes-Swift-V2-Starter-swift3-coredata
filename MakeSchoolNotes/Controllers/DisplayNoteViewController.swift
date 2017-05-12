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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBOutlet weak var noteContentTextView: UITextView!
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let listNotesTableViewController = segue.destination as! ListNotesTableViewController
            if segue.identifier == "Save"{
                
                if let note = self.note ?? Note() {
                    
                    note.title = noteTitleTextField.text ?? ""
                    note.content = noteContentTextView.text ?? ""
                    note.modificationTime = Date()
                    CoreDataHelper.saveNote()
                    
                }
                else{
                    
                    let newNote = Note()
                    
                    newNote.title = noteTitleTextField.text ?? ""
                    newNote.content = noteContentTextView.text
                    
                    newNote.modificationTime = Date()
                    
                    let listNotesTableViewController = segue.destination as! ListNotesTableViewController
                    
                    listNotesTableViewController.notes.append(newNote)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let note = note {
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
        } else{
        
        noteTitleTextField.text = ""
        noteContentTextView.text = ""
        }
        
    }
}
