public class BrazilianDocumentFormatter {

    public String formatCPF(String document) {

        if (String.isEmpty(document) 
            || document.length() > 11) {                
            return document;
        } 

        if (document.length() < 11) document =  document.leftPad(11, '0');

        return document.substring(0, 3) + '.' + document.substring(3, 6) + '.' + document.substring(6, 9) + '-' + document.substring(9, 11);
    }

    public String formatCNPJ(String document) {

        if ( String.isEmpty(document) || document.length() > 14) return document;
 
        if (document.length() < 14) document = document.leftPad(14, '0');

        return document.substring(0, 2) + '.' + document.substring(2, 5) + '.' + document.substring(5, 8) + '/' + document.substring(8, 12) + '-' + document.substring(12, 14);
    }
}