package TestCode;

import java.util.Scanner;

public class Demo {

	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
        System.out.println("================================");
        for(int i=0;i<3;i++)
        {
            String s1=sc.next();
            int x=sc.nextInt();
            if (x<10){System.out.println(s1 +" "+"00"+x);}
            else if (x >=10 && x<100){System.out.println(s1 +" "+"0"+x);}else{
                System.out.println(s1 +" "+ i);}
            }
               System.out.println("================================");

	}
}
