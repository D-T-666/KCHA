import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class ListTest {
 static SortedIntegerList list;
 @BeforeAll
 public static void setup() {
 // Initialize the list and explicitly add values 0 to 99
 list = new SortedIntegerList();
 for (int i = 0; i < 100; i++) {
 list.add(i);
 }
 }
 // Test for valid indices (equivalence class)
 @Test
 public void testValidIndices() {
 assertEquals(0, list.getElement(0), "First element should be 0");
 assertEquals(50, list.getElement(50), "Middle element should be 50");
 assertEquals(99, list.getElement(99), "Last element should be 99");
 }
 // Test for boundary indices
 @Test
 public void testBoundaryIndices() {
 // Lower boundary
 assertEquals(0, list.getElement(0), "Element at index 0 should be
0");
 // Upper boundary
 assertEquals(99, list.getElement(99), "Element at index 99 should be
99");
 }
 // Test for invalid indices (below 0 and above 99)
 @Test
 public void testInvalidIndices() {
 // Test below lower boundary
 assertThrows(IndexOutOfBoundsException.class, () -> list.getElement(-
1),
 "Should throw IndexOutOfBoundsException for index -1");
 // Test above upper boundary
 assertThrows(IndexOutOfBoundsException.class, () ->
list.getElement(100),
 "Should throw IndexOutOfBoundsException for index 100");
 }
