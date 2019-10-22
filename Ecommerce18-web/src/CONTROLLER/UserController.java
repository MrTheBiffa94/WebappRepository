package CONTROLLER;

import MODEL.UserModel;
import engine.Engine;
import engine.Person;

import java.io.IOException;

public class UserController {

    public boolean checkFiscalCode(UserModel u, String Code) {
        Person p = new Person();

        p.setName(u.getFirstName().toUpperCase());
        p.setSurname(u.getLastName().toUpperCase());
        p.setBornCity(u.getBirthPlace().toUpperCase());
        if (u.getGender().equals("M")) {
            p.setSex("M");
        } else {
            p.setSex("F");
        }

        p.setDay(u.getBirthDate().substring(8));
        p.setMonth(u.getBirthDate().substring(5, 7));
        p.setYear(u.getBirthDate().substring(0, 4));
        Engine e = null;
        try {
            e = new Engine(p);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        System.out.println(e.getCode());
        return e.getCode().equals(Code.toUpperCase());
    }
}
