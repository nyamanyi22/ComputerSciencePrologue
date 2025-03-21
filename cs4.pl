% Knowledge Base for Chuka University Computer Science Department
% ===============================================================

% Unit Facts
unit('CSC101', 'Introduction to Computer Science', 3, [], 1, 'Dr. Mwangi').
unit('CSC102', 'Introduction to Programming', 4, [], 1, 'Prof. Omondi').
unit('CSC103', 'Discrete Mathematics', 3, [], 1, 'Dr. Wangari').
unit('CSC201', 'Data Structures and Algorithms', 4, ['CSC102'], 2, 'Dr. Kamau').
unit('CSC202', 'Object-Oriented Programming', 3, ['CSC102'], 2, 'Prof. Omondi').
unit('CSC203', 'Computer Organization', 3, ['CSC101'], 2, 'Dr. Mwangi').
unit('CSC301', 'Database Systems', 4, ['CSC201'], 3, 'Dr. Otieno').
unit('CSC302', 'Software Engineering', 3, ['CSC202'], 3, 'Prof. Ndungu').
unit('CSC303', 'Computer Networks', 3, ['CSC203'], 3, 'Dr. Kamau').
unit('CSC401', 'Artificial Intelligence', 4, ['CSC201', 'CSC103'], 4, 'Prof. Ndungu').
unit('CSC402', 'Operating Systems', 3, ['CSC203', 'CSC201'], 4, 'Dr. Otieno').
unit('CSC403', 'Web Development', 3, ['CSC301', 'CSC302'], 4, 'Dr. Wangari').
unit('CSC404', 'Machine Learning', 4, ['CSC401', 'CSC103'], 5, 'Prof. Ndungu').
unit('CSC405', 'Cybersecurity', 3, ['CSC303', 'CSC402'], 5, 'Dr. Kamau').
unit('CSC406', 'Mobile Application Development', 3, ['CSC202', 'CSC403'], 5, 'Prof. Omondi').
unit('CSC407', 'Cloud Computing', 3, ['CSC303', 'CSC402'], 6, 'Dr. Otieno').
unit('CSC408', 'Final Year Project', 6, ['CSC302', 'CSC301'], 6, 'All Faculty').

% Course Facts
course('Dr. Mwangi', 'Senior Lecturer', 'Computer Architecture', 'CS-101', 'mwangi@chuka.ac.ke', 'Mon/Wed 10AM-12PM').
course('Prof. Omondi', 'Professor', 'Programming Languages', 'CS-102', 'omondi@chuka.ac.ke', 'Tue/Thu 2PM-4PM').
course('Dr. Wangari', 'Lecturer', 'Theoretical Computer Science', 'CS-103', 'wangari@chuka.ac.ke', 'Mon/Fri 1PM-3PM').
course('Dr. Kamau', 'Associate Professor', 'Computer Networks & Security', 'CS-104', 'kamau@chuka.ac.ke', 'Wed/Fri 9AM-11AM').
course('Dr. Otieno', 'Senior Lecturer', 'Distributed Systems', 'CS-105', 'otieno@chuka.ac.ke', 'Tue/Thu 11AM-1PM').
course('Prof. Ndungu', 'Professor', 'Artificial Intelligence', 'CS-106', 'ndungu@chuka.ac.ke', 'Mon/Thu 3PM-5PM').

% Graduation Requirements
graduation_requirement('Total Credits Required', 120).
graduation_requirement('Minimum CGPA', 2.0).
core_unit('CSC101').
core_unit('CSC102').
core_unit('CSC103').
core_unit('CSC201').
core_unit('CSC202').
core_unit('CSC203').
core_unit('CSC301').
core_unit('CSC302').
core_unit('CSC303').
core_unit('CSC401').
core_unit('CSC402').
core_unit('CSC408').
elective_requirement('At least 3 from CSC403, CSC404, CSC405, CSC406, CSC407').

% Rules for querying the knowledge base
prerequisites(UnitCode, Prerequisites) :-
   unit(UnitCode, _, _, Prerequisites, _, _).

unit_lecturer(UnitCode, Lecturer) :-
   unit(UnitCode, _, _, _, _, Lecturer).

unit_details(UnitCode, Name, Credits, Prerequisites, Semester, Lecturer) :-
   unit(UnitCode, Name, Credits, Prerequisites, Semester, Lecturer).

units_by_semester(Semester, Units) :-
   findall(UnitCode, unit(UnitCode, _, _, _, Semester, _), Units).

course_details(Name, Position, Specialization, Office, Contact, OfficeHours) :-
   course(Name, Position, Specialization, Office, Contact, OfficeHours).

units_taught_by(CourseName, Units) :-
   findall(UnitCode, unit(UnitCode, _, _, _, _, CourseName), Units).

core_units(CoreUnits) :-
   findall(UnitCode, core_unit(UnitCode), CoreUnits).

% Query Interface
query(Input) :-
   process_query(Input).

process_query('prerequisites for CSC201') :-
   prerequisites('CSC201', Prerequisites),
   format('Prerequisites for CSC201: ~w~n', [Prerequisites]).

process_query('who teaches Database Systems') :-
   unit_lecturer('CSC301', Lecturer),
   format('Database Systems (CSC301) is taught by ~w.~n', [Lecturer]).

process_query('information about CSC401') :-
   unit_details('CSC401', Name, Credits, Prerequisites, Semester, Lecturer),
   format('Unit Details for CSC401:~n  Name: ~w~n  Credits: ~w~n  Semester: ~w~n  Lecturer: ~w~n  Prerequisites: ~w~n',
          [Name, Credits, Semester, Lecturer, Prerequisites]).

process_query('units offered in semester 3') :-
   units_by_semester(3, Units),
   format('Units offered in Semester 3: ~w~n', [Units]).

process_query('Dr. Kamau office hours') :-
   course_details('Dr. Kamau', _, _, _, _, OfficeHours),
   format('Office hours for Dr. Kamau: ~w~n', [OfficeHours]).

process_query('information about Prof. Ndungu') :-
   course_details('Prof. Ndungu', Position, Specialization, Office, Contact, OfficeHours),
   format('Course Details for Prof. Ndungu:~n  Position: ~w~n  Specialization: ~w~n  Office: ~w~n  Contact: ~w~n  Office Hours: ~w~n',
          [Position, Specialization, Office, Contact, OfficeHours]).

process_query('graduation requirements') :-
   graduation_requirement('Total Credits Required', Credits),
   graduation_requirement('Minimum CGPA', CGPA),
   core_units(CoreUnits),
   elective_requirement(ElectiveReq),
   format('Graduation Requirements:~n  Total Credits Required: ~w~n  Minimum CGPA: ~w~n  Core Units: ~w~n  Elective Requirements: ~w~n',
          [Credits, CGPA, CoreUnits, ElectiveReq]).

process_query(_) :-
   format('Query not recognized. Type "help" for example queries.~n').