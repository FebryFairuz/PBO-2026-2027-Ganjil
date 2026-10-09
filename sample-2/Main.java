import java.time.LocalDate;

/**
 * main
 */
public class Main {

    public static void main(String[] args) {
        Students student1 = new Students(1, "2026001", "Budi Santoso", "L", LocalDate.of(2005, 3, 14));

        Students student2 = new Students();
        student2.setId(2);
        student2.setStudentId("2026002");
        student2.setFullName("Siti Aminah");
        student2.setGender("P");
        student2.setBirthDate(LocalDate.of(2006, 7, 21));

        System.out.println(student1);
        System.out.println(student2);
        System.out.println("Nama mahasiswa 1: " + student1.getFullName());
    }
}
