//
//  ViewController.swift
//  IlyaCoreData
//
//  Created by Admin on 23.12.2019.
//  Copyright © 2019 Ilya Ilushenko. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fillDataBase()
        showDatabase()
    }
    fileprivate func deleteData() {
        let context = CoreDataManager.shared.getContext()
        let deleteStudentsFetch = NSFetchRequest <NSFetchRequestResult>(entityName: "Student")
        let deleteTeachersFetch = NSFetchRequest <NSFetchRequestResult>(entityName: "Teacher")
        let deleteGroupFetch = NSFetchRequest <NSFetchRequestResult>(entityName: "Group")
        let deleteProjectsFetch = NSFetchRequest <NSFetchRequestResult>(entityName: "Project")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteStudentsFetch)
        let deleteRequest1 = NSBatchDeleteRequest(fetchRequest: deleteTeachersFetch)
        let deleteRequest2 = NSBatchDeleteRequest(fetchRequest: deleteGroupFetch)
        let deleteRequest3 = NSBatchDeleteRequest(fetchRequest: deleteProjectsFetch)
        do {
            try context.execute(deleteRequest)
            try context.execute(deleteRequest1)
            try context.execute(deleteRequest2)
            try context.execute(deleteRequest3)
            try context.save()
        } catch {
            print(error)
        }
    }

    func fillDataBase () {
        deleteData()

        guard let teacher1 = EntityManager.shared.createTeacher(name: "Teacher1", birthday: Date()),
            let teacher2 = EntityManager.shared.createTeacher(name: "Teacher2", birthday: Date()) else {
                return
        }
        guard let student1 = EntityManager.shared.createStudent(name: "student1", birthday: Date()),
        let student2 = EntityManager.shared.createStudent(name: "student2", birthday: Date()),
        let student3 = EntityManager.shared.createStudent(name: "student3", birthday: Date()),
        let student4 = EntityManager.shared.createStudent(name: "student4", birthday: Date()) else {
            return
        }
        guard   let project1 = EntityManager.shared.createProject(topic: "project1"),
            let project2 = EntityManager.shared.createProject(topic: "project2"),
            let project3 = EntityManager.shared.createProject(topic: "project3"),
            let project4 = EntityManager.shared.createProject(topic: "project4") else {
                return
        }
        guard   let group1 = EntityManager.shared.createGroup(name: "group1"),
            let group2 = EntityManager.shared.createGroup(name: "group2") else {
                return
        }
        group1.addToTeachers(teacher1)
        group1.addToStudents(student1)
        group1.addToStudents(student2)
        student1.project = project1
        student2.project = project2
        student3.project = project3
        student4.project = project4
        group2.addToTeachers(teacher2)
        group2.addToStudents(student3)
        group2.addToStudents(student4)
        CoreDataManager.shared.saveContext()
    }
}

func showDatabase () {
    let context = CoreDataManager.shared.getContext()
    let studentsFetch = NSFetchRequest <NSFetchRequestResult>(entityName: "Student")

    if let students = try? context.fetch(studentsFetch) as? [Student] {
        for student in students {
            print(student.name ?? "")
        }
    }
}

func showTeachers () {
    let context = CoreDataManager.shared.getContext()
    let teachersFetch = NSFetchRequest <NSFetchRequestResult>(entityName: "Teacher")

    if let teachers = try? context.fetch(teachersFetch) as? [Teacher] {
        for teacher in teachers {
            print(teacher.name ?? "")
        }
    }
}
