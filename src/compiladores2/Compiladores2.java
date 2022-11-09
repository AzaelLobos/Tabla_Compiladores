/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package compiladores2;

import java.io.File;

/**
 *
 * @author azaki
 */
public class Compiladores2 {
    public static void main(String[] args) {
        String ruta = "C:/Users/azaki/OneDrive/Documentos/NetBeansProjects/Compiladores2/src/compiladores2/Lexer.flex";
        generarLexer(ruta);
    }
    
    public static void generarLexer(String ruta){
        File archivo = new File(ruta);
        JFlex.Main.generate(archivo);
    }
    
}
