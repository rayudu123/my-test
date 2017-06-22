url: http://www.theunixschool.com/2011/05/awk-read-file-and-split-contents.html

Example 1 :

 mkdir test
 cd test/
 vi test1

Name Domain 
Deepak Banking 
Neha Telecom 
Vijay Finance 
Guru Migration
:wq
 
 ll
 chmod u=rwx test1
 ll
1)To print only the names present in the file:
 awk '{print $1}' test1
 awk '{print $1}' test1

The above awk command does not have any pattern or condition. 
Hence, the action will be executed on every line of the file. 
The action statement reads "print $1". awk, while reading a file, splits the different columns into $1, $2, $3 and so on. 
And hence the first column is accessible using $1, second using $2, etc. 
And hence the above command prints all the names which happens to be first column in the file.

2)Similarly, to print the second column of the file:
 awk '{print $2}' test1

3)In the first example, the list of names got printed along with the header record. 
How to omit the header record and get only the names printed?
 awk 'NR!=1{print $0}' test1
 awk 'NR!=1{print $1}' test1
 awk 'NR!=1{print $2}' test1
The above awk command uses a special variable NR. NR denotes line number ranging from 1 to the actual line count.
The conditon 'NR!=1' indicates not to execute the action part for the first line of the file, and hence the header record gets skipped.

4)How do we print the entire file contents?
 awk '{print $0}' test1
$0 stands for the entire line. And hence when we do "print $0", the whole line gets printed.

5)How do we get the entire file content printed in other way?
 awk '1' test1
 
 
Example 2:

vi test2

Name,Domain,Expertise 
Deepak,Banking,MQ Series 
Neha,Telecom,Power Builder 
Vijay,Finance,CRM Expert 
Guru,Migration,Unix

Let us try to print the first column of this csv file using the same method as mentioned in Point 1.
 awk '1' test2
 awk 'NR!=1{print $1}' test2
The output looks weird. Isnt it? We expected only the first column to get printed, 
but it printed little more and that too not a definitive one. 
If you notice carefully, it printed every line till the first space is encountered. 
awk, by default, uses the white space as the delimiter which could be a single space, 
tab space or a series of spaces. And hence our original file was split into fields depending on space.   
Since our requirement now involves dealing with a file which is comma separated, 
we need to specify the delimiter.
 awk -F"," 'NR!=1{print $1}' test2

awk has a special variable called "FS" which stands for field separator. 
In place of the command line option "-F', we can also use the "FS".
 awk  '{print $1,$3}' FS="," test2
 awk -F, '{print $2}' test2
 awk -F, '{print $3}' test2

The output shown above is not easily readable since the third column has more than one word. 
It would have been better had the fields being displayed are present with a delimiter. 
Say, lets use comma to separate the output. Also, lets discard the header record. 

 awk -F"," 'NR!=1{print $1,$3}' OFS="," test2

OFS is another awk special variable. Just like how FS is used to separate the input fields, 
OFS (Output field separator) is used to separate the output fields.
 history

