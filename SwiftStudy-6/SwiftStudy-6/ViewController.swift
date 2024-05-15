//
//  ViewController.swift
//  SwiftStudy-6
//
//  Created by 윤강록 on 1/13/24.
//

import UIKit
import FSCalendar

class ViewController: UIViewController {
    
    var calendar: FSCalendar!
    var tableView: UITableView!
    
    var events: [Date: [String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar = FSCalendar()
        tableView = UITableView()
        
        self.calendar.dataSource = self
        self.calendar.delegate = self
        self.tableView.dataSource = self
        self.tableView.delegate = self
        setCalendarUI()
        setTableViewUI()
        
    }
    
    func setCalendarUI() {
        view.addSubview(calendar)
        view.backgroundColor = .white
        
        // setCalendar Autolayout
        calendar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            calendar.heightAnchor.constraint(equalToConstant: 400)
        ])
        
        calendar.locale = Locale(identifier: "ko_KR")
        
        calendar.appearance.headerDateFormat = "YYYY년 MM월"
        calendar.appearance.headerTitleColor = UIColor(named: "FFFFFF")?.withAlphaComponent(0.9)
        calendar.appearance.headerTitleAlignment = .center
        
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        
        //        calendar.appearance.titleDefaultColor = UIColor.white.withAlphaComponent(0.5)
        calendar.placeholderType = .none
        
    }
    
    func setTableViewUI() {
        view.addSubview(tableView)
//        view.safeAreaLayoutGuide.topAnchor, constant: 400),

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 20) ,           tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.heightAnchor.constraint(equalToConstant: 300)
        ])
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    
    //MARK: UIAlertController
    func showEventAlert(for date: Date) {
        let alert = UIAlertController(title: "일정추가", message: "", preferredStyle: .alert)
        
        alert.addTextField {(UITextField) in
            UITextField.placeholder = "일정을 입력해주세요."
        }
        
        alert.addAction(UIAlertAction(title: "취소", style: .destructive, handler: nil))
        
        alert.addAction(UIAlertAction(title: "추가", style: .default, handler: {(UIAlertAction) in
            let content = alert.textFields![0] as UITextField
            self.addEvent(content:content.text!, for: date)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func addEvent(content: String, for date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
//        let dateString = dateFormatter.string(from: date)
        
        if var existingEvents = events[date] {
            existingEvents.append(content)
            events[date] = existingEvents
        } else {
            events[date] = [content]
        }
        
        tableView.reloadData()
    }
}

//MARK: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance
extension ViewController: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        showEventAlert(for: date)
        tableView.reloadData()
//        print(events)
        
    }
    
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        print(dateFormatter.string(from: Date()))
    
        switch dateFormatter.string(from: date) {
        case dateFormatter.string(from: Date()):
                return "오늘"
                
        default:
            return nil
        }
    }
}

//MARK: UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let selectedDate = calendar.selectedDate ?? Date()
            
            if var eventsForDate = events[selectedDate] {
                eventsForDate.remove(at: indexPath.row)
                events[selectedDate] = eventsForDate
            }
            
            tableView.reloadData()
        }
    }
}

//MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let selectedDate = calendar.selectedDate ?? Date()
        if let eventsForDate = events[selectedDate] {
            return eventsForDate.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let selectedDate = calendar.selectedDate ?? Date()
//        let dateString = DateFormatter.localizedString(from: selectedDate, dateStyle: .medium, timeStyle: .none)
        
        if let eventsForDate = events[selectedDate] {
            cell.textLabel?.text = eventsForDate[indexPath.row]
        }
        return cell
    }
}
