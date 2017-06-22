
sed:

url: http://www.theunixschool.com/2011/01/sed-include-or-append-line-to-file.html


sed, short for "stream editor", allows you to filter and transform text.



sed OPTIONS... [SCRIPT] [INPUTFILE...]


Assume I have a flat file, test1, containing employee name and employee id as shown below:

Hilesh, 1001 
Bharti, 1002 
Aparna, 1003 
Harshal, 1004 
Keyur, 1005


1. How to add a header line say  "Employee, EmpId"  to this file using sed?

sed  '1i Employee, EmpId'  test1

Output:
Employee, EmpId 
Hilesh, 1001 
Bharti, 1002 
Aparna, 1003 
Harshal, 1004 
Keyur, 1005

This command does the following:The number'1'tells the operation is to be done only for the first line. 
'i' stands for including the following content before reading the line. 
So, '1i' means to include the following before reading the first line and hence we got the header in the file.    
However, the file with the header is displayed only in the output, the file contents still remain the old file. 
So, if the user's requirement is to update the original file with this output, 
the user has to re-direct the output of the sed command to a temporary file and then move it to the original file.  
The UNIX system which has the GNU version contains sed with the '-i' option. 
This option of the sed command is used to edit the file in-place. 
Let us see the same above example using '-i' option:

sed -i '1i Employee, EmpId' test1
 As shown above, the '-i' option edits the file in-place without the need of a temporary file.

2. How to add a line '-------' after the header line or the 1st line?
sed -i '1a ---------------' test1

 '1i' is similar to '1a' except that 'i' tells to include the content before reading the line,
 'a' tells to include the content after reading the line. And hence in this case, 
the '----' line gets included after the 1st line. 
As you thought correctly, even if you had used '2i', it will work well and fine.

3. How to add a trailer line to this file?

sed -i '$a ---------------' test1

To add to the last line of the file, we need to know the total line count of the file to use in the above mentioned methods. However, sed has the '$' symbol which denotes the last line. '$a' tells to include the following content after reading the last line of the file.

4. How to add a record after a particular record?     
Let us assume the sample file contains only 3 records as shown below:

Employee, EmpId 
--------------- 
Hilesh, 1001 
Harshal, 1004 
Keyur, 1005 
---------------

Now, if I want to insert the record for the employee 'Bharti' after the employee 'Hilesh':

sed -i '/Hilesh/a Bharti, 1002' test1

 If you note the above sed command carefully, all we have done is in place of a number, we have used a pattern. /Hilesh/a tells to include the following contents after finding the pattern 'Hilesh', and hence the result.

5. How to add a record before a particular record? 
Say, add the record for the employee 'Aparna' before the employee record of 'Harshal'

sed -i '/Harshal/i Aparna, 1003' test1

Similarly, /Harshal/i tells to include the following contents before reading the line containing the pattern 'Harshal'.
