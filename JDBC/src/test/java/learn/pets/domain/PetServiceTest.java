package learn.pets.domain;

import learn.pets.data.PetRepository;
import learn.pets.models.Pet;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.NONE)
class PetServiceTest {

    @MockBean
    PetRepository repository;

    @Autowired
    PetService service;

    @Test
    void shouldAdd() {
        Pet petIn = new Pet(0, "Ule", "Mantis");
        Pet petOut = new Pet(1, "Ule", "Mantis");

        when(repository.add(petIn)).thenReturn(petOut);

        Result<Pet> result = service.add(petIn);

        assertEquals(ResultType.SUCCESS, result.getType());
        assertEquals(petOut, result.getPayload());
    }

    @Test
    void shouldNotAddNull() {
        Result<Pet> result = service.add(null);
        assertEquals(ResultType.INVALID, result.getType());
        assertNull(result.getPayload());
    }

    @Test
    void shouldNotAddEmptyName() {
        Pet petIn = new Pet(0, " ", "Mantis");
        Result<Pet> result = service.add(petIn);
        assertEquals(ResultType.INVALID, result.getType());
        assertNull(result.getPayload());
    }

    @Test
    void shouldNotDeleteMissingPet() {
        when(repository.deleteById(10)).thenReturn(false);
        assertFalse(service.deleteById(10));
    }

    @Test
    void shouldDelete() {
        when(repository.deleteById(2)).thenReturn(true);
        assertTrue(service.deleteById(2));
    }
}