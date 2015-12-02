package CleanRockyou;

import java.util.regex.*;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class RockyouClean {

	public static void main(String[] args) throws IOException{
		// TODO Auto-generated method stub
		RockyouClean ss=new RockyouClean();
		ss.cleanRockyou("Files/rockyou.txt");
		System.out.println("Original rockyou database was cleaned successfully.");
	}
	
	private void cleanRockyou(String fileName) throws IOException{
		File originalRockyou=new File(fileName);
		File cleanedRockyou=new File("Files/cleanedRockyou.txt");
		BufferedReader reader=new BufferedReader(new FileReader(originalRockyou));
		BufferedWriter writer=new BufferedWriter(new FileWriter(cleanedRockyou));
		
		int count=0;
		String pwd;
        //Define the password character set, \x20-\x7e refers to all printable characters, and space
		//String regx="[\\x20-\\x7e]+"; 
		String regx="[\\u0020-\\u007e\\u00A5\\u00A3]+";
		while((pwd=reader.readLine())!=null){
			//Match passwords with predefined pwd character set regex, if matches, write out to cleanedRockyou.txt file
			if(Pattern.matches(regx, pwd)==true){
				writer.write(pwd+"\r\n");
				count++;
			}			
		}
	    reader.close();
	    writer.close();
	    //Output how many passwords we have after filtering the special pwds
		System.out.println(count);
	}
}
