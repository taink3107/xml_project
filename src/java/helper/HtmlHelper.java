/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helper;

/**
 *
 * @author taink
 */
public class HtmlHelper {
    public static String hyperlink(String label, String href)
    {
        return "<a class=\"btn btn-light m-1\" href=\""+href+"\">" + label + "</a>"; 
    }
    
    public static String pager(int pageindex,int pagecount, int gap)
    {
        String result = "";
        if(pageindex > gap-1)
            result += hyperlink("First","oder?page="+1);
        
        for (int i = gap; i > 0; i--) {
            if(pageindex - i > gap)
                result += hyperlink(""+(pageindex - i),"oder?page="+(pageindex - i));
        }
        
        result += "<span class=\"btn btn-primary m-1\">"+pageindex+"</span>";
        
        for (int i = 1; i <= gap; i++) {
            if(pageindex + i < pagecount)
                result += hyperlink(""+(pageindex + i),"oder?page="+(pageindex + i));
        }
        
        if(pageindex + gap < pagecount-1)
            result += hyperlink("Last","oder?page="+pagecount);
        return result;
    }
}
