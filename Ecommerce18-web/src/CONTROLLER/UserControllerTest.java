package CONTROLLER;

import MODEL.UserModel;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class UserControllerTest {

    /*
        Test On CheckFiscalCode:
    */

    @Test
    void checkFiscalCodeTest1(){
        String cf = "CPNNDR95S16E791F";
        UserModel um = new UserModel("Andrea","Capone","M","MADDALONI","1995-11-16");
        UserController uc = new UserController();
        assertTrue(uc.checkFiscalCode(um,cf));
    }


    @Test
    void checkFiscalCodeTest2(){
        UserModel um = new UserModel("Andrea","Capone","M","MADDALONI","1995-11-16");
        UserController uc = new UserController();
        NullPointerException exception = assertThrows(NullPointerException.class, ()->{
            uc.checkFiscalCode(um,null);
        });
    }

    @Test
    void checkFiscalCodeTest3(){
        UserController uc = new UserController();
        NullPointerException exception = assertThrows(NullPointerException.class, ()->{
            uc.checkFiscalCode(null,"CPNNDR95S16E791F");
        });
    }

    @Test
    void checkFiscalCodeTest4(){
        String cf = "1111111111111111";
        UserModel um = new UserModel("Andrea","Capone","M","MADDALONI","1995-11-16");
        UserController uc = new UserController();
        assertFalse(uc.checkFiscalCode(um,cf));
    }

    @Test
    void checkFiscalCodeTest5(){
        String cf = "CPNNDR95S16E7911F"; // MORE THAN 16 CHARACTER
        UserModel um = new UserModel("Andrea","Capone","M","MADDALONI","1995-11-16");
        UserController uc = new UserController();
        assertFalse(uc.checkFiscalCode(um,cf));
    }

    @Test
    void checkFiscalCodeTest6(){
        String cf = "CPNN"; // LESS THAN 16 CHARACTER
        UserModel um = new UserModel("Andrea","Capone","M","MADDALONI","1995-11-16");
        UserController uc = new UserController();
        assertFalse(uc.checkFiscalCode(um,cf));
    }
}