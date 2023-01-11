import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Test
import kotlin.test.assertTrue

class AnimalTest {

    @Test
    fun testEat() {
        val animal = Animal()

        assertTrue(animal.isHungry)

        animal.eat()

        assertFalse(animal.isHungry)
    }
}
