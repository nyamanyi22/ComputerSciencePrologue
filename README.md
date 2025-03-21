# Chuka University Computer Science Knowledge Base

This is a **Prolog-based Knowledge Base** for the **Chuka University Computer Science Department**. It contains structured facts and rules about courses, units, lecturers, prerequisites, and graduation requirements.

## Features
- Retrieve unit details (name, credits, prerequisites, lecturer, etc.)
- Find out who teaches a specific unit
- Get prerequisites for a unit
- List all units offered in a specific semester
- Fetch lecturer details (office hours, specialization, contact, etc.)
- Display graduation requirements

## Getting Started
### Prerequisites
- SWI-Prolog (or any Prolog interpreter)

### Running the Knowledge Base
1. **Install SWI-Prolog** (if not already installed). You can download it from [SWI-Prolog Website](https://www.swi-prolog.org/).
2. **Load the knowledge base** in SWI-Prolog:
   ```prolog
   ?- consult('cs4.pl').
   ```
3. **Run queries** using the query interface:
   ```prolog
   ?- query('prerequisites for CSC201').
   ```

## Example Queries
- **Check prerequisites for a unit:**
  ```prolog
  ?- prerequisites('CSC201', Prerequisites).
  ```
- **Find the lecturer for Database Systems:**
  ```prolog
  ?- unit_lecturer('CSC301', Lecturer).
  ```
- **Get details of a unit:**
  ```prolog
  ?- unit_details('CSC401', Name, Credits, Prerequisites, Semester, Lecturer).
  ```
- **List units offered in Semester 3:**
  ```prolog
  ?- units_by_semester(3, Units).
  ```
- **Find office hours for Dr. Kamau:**
  ```prolog
  ?- course_details('Dr. Kamau', _, _, _, _, OfficeHours).
  ```
- **Check graduation requirements:**
  ```prolog
  ?- query('graduation requirements').
  ```

## Extending the Knowledge Base
You can expand this knowledge base by adding more units, courses, lecturers, or new rules. To modify the knowledge base:
- Open `cs4.pl`
- Add new facts or rules
- Reload the file in Prolog (`consult/1`)



