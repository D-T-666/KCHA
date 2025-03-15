public static void main(String[] args) {
    List<String> el = new EmployeeManagementPrototype().generateInitialEmployeeList();
    el.add("Martina Mustermann");
}
public interface IEmployeeManagement {
    /**
    * Generates the initial list of employees. Each employee is represented as a String
    * (Given Name(s), Last Name). New employees (Strings) may be added or removed from
    * this List.
    * @return the initial list of employees
    */
    List<String> generateInitialEmployeeList();
}
public class EmployeeManagementPrototype implements IEmployeeManagement {
    @Override
    public List<String> generateInitialEmployeeList() {
        return List.of("Martin S. Pinnér", "Marvin Bertsch", "Max Power");
    }
}