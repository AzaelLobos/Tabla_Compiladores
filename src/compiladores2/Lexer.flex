package compiladores2;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

class Yytoken {
    Yytoken (int numToken, String token, String tipo, String lexema1, String lexema2){
        this.numToken = numToken;
        this.token = new String(token); //Lexema
        this.tipo = tipo;               //Token
        this.lexema1 = lexema1;
        this.lexema2 = lexema2;
    }

    public int numToken;
    public String token;
    public String tipo;
    public String lexema1;
    public String lexema2;

    public String toString(){
        return "Token "+numToken+": "+tipo+" Lexema: "+token+" Lexema1:" + lexema1 + "Lexema2:" + lexema2;
    }
}

// JFlex

%% //inicio de declaraciones

%function nextToken

%public

%class metodos

%unicode //soporte unicode representacion de caracteres


%{

    private int contador;
    private ArrayList<Yytoken> tokens;

        // Escribir en txt
        private void writeOutputFile() throws IOException{
                    String filename = "file.out";
                    BufferedWriter out = new BufferedWriter(
                            new FileWriter(filename));
                    for(Yytoken t: this.tokens){
                            out.write(t + "\n");
                    }
                    out.close();
        }
%}


%init{                  //Contador de tokens se guarda en el constructor
    contador = 0;
    tokens = new ArrayList<Yytoken>();
%init}

%eof{                   //Se ejecuta una vez al fin del archivo de entrada
        try{
                this.writeOutputFile();
        }catch(IOException ioe){
                ioe.printStackTrace();
        }
%eof}

%line                   // contador de lineas, variableyyline

%column                 // contador de columnas, variableyycolumn


EXP_ALPHA=[A-Za-z_]             // acepta letras
EXP_DIGITO=[0-9]                // acepta numeros
EXP_ALPHANUMERIC={EXP_ALPHA}|{EXP_DIGITO}   //aceptar alfanumericos
NUMERO=({EXP_DIGITO})+                 // conjunto de numeros 1 o mas veces
IDENTIFICADOR={EXP_ALPHA}({EXP_ALPHANUMERIC})*  // letras con numeros 0 o mas veces
ESPACIO=" "
SALTO=\n|\r|\r\n        // salto de linea y retorno de carro
comentarios="\//".+//\""
LineasCom=[/,/*]
LineasComF=[/,*/]
ComentariosMul={LineasCom} [^"/"]*{LineasComF}
/*reglas lexicas */

%%

{NUMERO}    {
        contador++;
        Yytoken t = new Yytoken(contador,yytext(),"NUM","NUM",yytext());
        tokens.add(t);
        return t;
}

( "private" | "package" | "import" | "public" | "class" | "static" | "String" | "int" | "new" | "in" | "nextInt" | "for" ) {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"PALRE",yytext(), "-");
    tokens.add(t);
    return t;
}

{IDENTIFICADOR}     {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"ID","ID", yytext());
    tokens.add(t);
    return t;
}

( "=" ) {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"OPASI","ASI","-");
    tokens.add(t);
    return t;
}

( "<=" ) {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"OPREL","MEI","-");
    tokens.add(t);
    return t;
}

( "++" ) {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"OPIND","INC","-");
    tokens.add(t);
    return t;
}

( ";" ) {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"OPESP","DEL","-");
    tokens.add(t);
    return t;
}

( ":" ) {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"OPESP","DEL","-");
    tokens.add(t);
    return t;
}

( "{" ) {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"OPESP","LLI","-");
    tokens.add(t);
    return t;
}

( "{" ) {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"OPESP","LLI","-");
    tokens.add(t);
    return t;
}

( "}" ) {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"OPESP","LLD","-");
    tokens.add(t);
    return t;
}

( "(" ) {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"OPESP","PIZ","-");
    tokens.add(t);
    return t;
}

( ")" ) {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"OPESP","PDE","-");
    tokens.add(t);
    return t;
}

( "[" ) {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"OPESP","COI","-");
    tokens.add(t);
    return t;
}

( "]" ) {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"OPESP","COD","-");
    tokens.add(t);
    return t;
}

( "," ) {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"OPESP","COM",yytext());
    tokens.add(t);
    return t;
}

( "." ) {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"OPESP","DPU","-");
    tokens.add(t);
    return t;
}

( "\"Introduce un numero: \"" ) {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"MSG","MSG",yytext());
    tokens.add(t);
    return t;
}

( "System.out.print") {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"PALRE","print","-");
    tokens.add(t);
    return t;
}

( "System.out.println") {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"PALRE","println","-");
    tokens.add(t);
    return t;
}

( "WS.Curso.Scrum.CTRL") {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"ID","ID","CTRL");
    tokens.add(t);
    return t;
}

( "java") {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"ID","ID","java");
    tokens.add(t);
    return t;
}

( "util") {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"ID","ID","util");
    tokens.add(t);
    return t;
}

( "Scanner") {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"ID","ID","Scanner");
    tokens.add(t);
    return t;
}

( "System") {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"PALRE","System","-r");
    tokens.add(t);
    return t;
}

{ESPACIO} {
        // contador de espacios
}

{SALTO} {
        // contador de saltos
}

{comentarios} {

}
{ComentariosMul} {

}
