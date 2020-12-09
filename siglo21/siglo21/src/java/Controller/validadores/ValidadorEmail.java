/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.validadores;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Dr4g0n
 */
public class ValidadorEmail {
    public boolean isEmail(String correo) {
        Pattern pat = null;
        Matcher mat = null;
        pat = Pattern.compile("^([0-9a-zA-Z]([.w][0-9a-zA-Z])@([0-9a-zA-Z][-w]*[0-9a-zA-Z].)+([a-zA-Z]{2,9}.)+[a-zA-Z]{2,3})$");
        mat = pat.matcher(correo);
        if (mat.find()) {
            System.out.println("[" + mat.group() + "]");
            return true;
        }else{
            return false;
            //"^[a-zA-Z0-9!#$%&'+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$"
            //"^([0-9a-zA-Z]([_.w][0-9a-zA-Z])@([0-9a-zA-Z][-w][0-9a-zA-Z].)+([a-zA-Z]{2,9}.)+[a-zA-Z]{2,3})$"
            //"^[a-zA-Z0-9!#$%&'*+/=?`{|}~^-]+(?:\.[a-zA-Z0-9!#$%&'+/=?`{|}~^-]+)@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$"
        }
    }
    
}
