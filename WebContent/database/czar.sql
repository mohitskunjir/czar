-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2017 at 08:04 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `czar`
--

-- --------------------------------------------------------

--
-- Table structure for table `get_tbl`
--

CREATE TABLE IF NOT EXISTS `get_tbl` (
  `tbl_name` varchar(10) NOT NULL,
  `level` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `get_tbl`
--

INSERT INTO `get_tbl` (`tbl_name`, `level`) VALUES
('table1', 'FE'),
('table2', 'FE'),
('table3', 'FE'),
('table4', 'SE'),
('table5', 'SE'),
('table6', 'SE'),
('table7', 'TEBE'),
('table8', 'TEBE'),
('table9', 'TEBE');

-- --------------------------------------------------------

--
-- Table structure for table `playerdetails`
--

CREATE TABLE IF NOT EXISTS `playerdetails` (
  `emailId` varchar(25) NOT NULL,
  `password` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `college` varchar(50) NOT NULL,
  `year` varchar(2) NOT NULL,
  `score` int(3) NOT NULL DEFAULT '0',
  `time` varchar(5) NOT NULL DEFAULT '20:00',
  `questionsAttempted` int(2) NOT NULL DEFAULT '0',
  `correctlyAnswered` int(2) NOT NULL DEFAULT '0',
  `skipsRemaining` int(1) NOT NULL DEFAULT '3',
  `RegDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(10) NOT NULL DEFAULT 'unblock'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `playerdetails`
--

INSERT INTO `playerdetails` (`emailId`, `password`, `name`, `contact`, `college`, `year`, `score`, `time`, `questionsAttempted`, `correctlyAnswered`, `skipsRemaining`, `RegDate`, `status`) VALUES
('mohitkunjir@gmail.com', 'asdfg', 'Mohit Kunjir', '7040336919', 'PVGCOET', 'FE', 6, '19:43', 2, 2, 2, '2017-01-17 19:21:56', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `table1`
--

CREATE TABLE IF NOT EXISTS `table1` (
  `number` int(3) NOT NULL,
  `question` varchar(1000) NOT NULL,
  `o1` varchar(500) NOT NULL,
  `o2` varchar(500) NOT NULL,
  `o3` varchar(500) NOT NULL,
  `o4` varchar(500) NOT NULL,
  `answer` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table1`
--

INSERT INTO `table1` (`number`, `question`, `o1`, `o2`, `o3`, `o4`, `answer`) VALUES
(51, 'Predict the output -\r\n\r\n#include &ltstdio.h&gt\r\nint main()\r\n{\r\n    int a, b, c;\r\n    a = 10;\r\n    b = 5;\r\n    c = (++a + b++) / 32.0 * b;\r\n    printf("%d\\n", c);\r\n    return 0;\r\n}', '0', '2', '3', 'Compile time error', 'op3'),
(1, 'Predict the output of the following snippet -\n\nint i;\nfor (i=0; i<5; i++)\n    printf("%d\\t", i);\nprintf("%d\\n", i);', '012344', '0    1    2    3    4    5', '0    1    2    3    4    4', '1    2    3    4    5', 'op2'),
(2, 'Predict the output of the following program -\r\n\r\n#include &ltstdio.h&gt\r\nvoid swap(int a, int b)\r\n{\r\n    int temp= a;\r\n    a = b;\r\n    b = temp;\r\n}\r\nint main()\r\n{\r\n    int x = 10, y = 20;\r\n    swap(x,y);\r\n    printf("x = %d\\n", x);\r\n    printf("y = %d\\n", y);\r\n    return 0;\r\n}', 'x = 20\r\ny = 20', 'x = 20\r\ny = 10', 'x = 10\r\ny = 20', 'x = 10\r\ny = 10', 'op3'),
(3, 'Which of the following is the correct order of evaluation for the below expression?\r\n\r\nx = a + b * c - d % e / 2', '* % / + - =', '= * / % + -', '/ % * - + =', '* / % + - =', 'op1'),
(4, 'What happens when two blocks, one nested inside of the other, both declare variables with the same identifier? (Assume that the outer block declares a variable before the opening left-brace of the inner block)', 'Syntax error', 'The ''outer'' variable is hidden while the ''inner'' variable is in the scope.', 'The ''inner'' declaration is ignored and the ''outer'' variable has scope even inside the inner block.', 'The ''outer'' variable is irretrievably lost when the ''inner'' variable is declared.', 'op2'),
(5, 'Predict the output -\r\n\r\n#include &ltstdio.h&gt\r\nint main()\r\n{\r\n    float f = 0.1;\r\n    if (f == 0.1)\r\n        printf("True.\\n");\r\n    else\r\n        printf("My life is a lie.\\n");\r\n}', 'True.', 'False.', 'My life is a lie.', 'No output.', 'op3'),
(6, 'For a local variable, if the storage class is not mentioned, it defaults to ______.', 'auto', 'extern', 'static', 'register', 'op1'),
(7, 'Find the output - \r\n\r\n#include &ltstdio.h&gt\r\nint main()\r\n{\r\n    int i = 0;\r\n    int j = 0;\r\n    for (i = 0; i < 5; i++)\r\n    {\r\n        for (j = 0; j < 4; j++)\r\n        {\r\n            if (i > 1)\r\n                continue;\r\n                printf("Hi\\n");\r\n        }\r\n    }\r\n    return 0;\r\n}', 'Hi is printed 9 times', 'Hi is printed 8 times', 'Hi is printed 7 times', 'No output', 'op2'),
(8, 'Predict the output -\n\n#include &ltstdio.h&gt\nint main()\n{\n    float a, b, c, x, y, z;\n    a = 9;\n    b = 12;\n    c = 3;\n    x = a - b / 3 + c * 4 - 1;\n    y = a - b / (3 + c) * (4 - 1);\n    z = a - (b / (3 + c) * 4) - 1;\n    printf("x = %f\\n", x);\n    printf("y = %f\\n", y);\n    printf("z = %f\\n", z);\n    return 0;\n}', 'x = 10.000000\r\ny = 7.000000\r\nz = -2.000000', 'x = 16.000000\r\ny = 3.000000\r\nz = 0.000000', 'x = 10.000000\r\ny = 3.000000\r\nz = 0.000000', 'None of the above', 'op2'),
(9, 'If the following program is compiled using gcc, find the output -\r\n\r\n#include &ltstdio.h&gt\r\nint main()\r\n{\r\n    int a = 300, b, c;\r\n    if (a >= 400)\r\n        b = 300;\r\n    c = 200;\r\n    printf("%d %d\\n", b, c);\r\n    return 0;\r\n}', '0 200', '(garbage value) 200', 'Compile time error', 'None of the above', 'op2'),
(10, '#include &ltstdio.h&gt\r\n    struct student\r\n    {\r\n        char *name;\r\n    };\r\n    struct student s[2];\r\n    void main()\r\n    {\r\n        s[0].name = "alan";\r\n        s[1] = s[0];\r\n        printf("%s%s", s[0].name, s[1].name);\r\n        s[1].name = "turing";\r\n        printf("%s%s", s[0].name, s[1].name);\r\n    }', 'alan alan alan turing', 'alan alan turing turing', ' alan turing alan turing', 'Run time error', 'op1'),
(11, '1)What is the output of the following code?\r\n#include&ltstdio&gt\r\nvoid main()\r\n{\r\n	int x=5.3%2;\r\n	printf("Value of x: ",x);\r\n}\r\n', 'value of x: 1.3', 'value of x: 2.3\r\n', 'value of x: 0.1\r\n', 'Complie time Error', 'op4'),
(12, '1. What is the output of this C code?\r\n\r\n    #include&ltstdio.h&gt\r\n    int main()\r\n    {\r\n        double *ptr = (double *)100;\r\n        ptr = ptr + 2;\r\n        printf("%u", ptr);\r\n    }\r\n', '102', '104', '108', '116', 'op4'),
(13, '#include &ltstdio.h&gt\r\n    static int x;\r\n    void main()\r\n    {\r\n        int x;\r\n        printf("x is %d", x);\r\n    }', '0', 'Junkvalue', ' Run time error', 'Nothing', 'op2'),
(14, '#include &ltstdio.h&gt\r\n    int add(int a, int b)\r\n    {\r\n        return a + b;\r\n    }\r\n    int main()\r\n    {\r\n        int (*fn_ptr)(int, int);\r\n        fn_ptr = add;\r\n        printf("The sum of two numbers is: %d", (int)fn_ptr(2, 3));\r\n    }', 'Compile time error, declaration of a function inside main.', 'Compile time error, no definition of function fn_ptr.', 'Compile time error, illegal application of statement fn_ptr = add.', ' No Run time error, output is 5', 'op4'),
(15, 'What is the size of *ptr in a 32-bit machine, (assuming initialization as int *ptr = 10;)?\r\n', '1', '2', '4', '8', 'op3'),
(16, 'What is the output of the following code?\r\n#include&ltstdio&gt\r\nvoid main()\r\n{\r\n	int i=10;\r\n	int *p=&i;\r\n	fn(&p);\r\n	printf("%d",*p);\r\n	printf("%d",*p);\r\n}\r\nfn(int **const p)\r\n{\r\n	int j=11;\r\n	*p=&j;\r\n	printf("%d",**p);\r\n}\r\n', '11 11 11', '11 11 Undefined value', 'Compile error', 'Code crash', 'op2'),
(17, 'What is the output of this C code?\r\n\r\n    #include &ltstdio.h&gt\r\n    void main()\r\n    {\r\n        char *s = "hello";\r\n        char *p = s;\r\n        printf("%c\\t%c", *p, s[1]);\r\n    }\r\n', 'e h\r\n', 'Compile time error', 'h h\r\n', 'h e\r\n', 'op4'),
(18, 'What is the output of the following code?\r\nvoid main()\r\n{\r\n	char a=''a'';\r\n	int x=(a%10)++;\r\n	printf("%d",x);\r\n}\r\n', '6', 'Junk Value', 'Compile error', '7', 'op3'),
(19, 'What is the output of the following code?\r\nvoid main()\r\n{\r\n	struct student\r\n	{\r\n		char *c;\r\n		struct student *point;\r\n	}s;\r\n	int x=sizeof(s);\r\n	printf("%d",x);\r\n}\r\n', '5', '9', '8', '16', 'op3'),
(20, '#include &ltstdio.h&gt\r\n    int x = 5;\r\n    void main()\r\n    {\r\n        int x = 3;\r\n        printf("%d", x);\r\n        {\r\n            int x = 4;\r\n        }\r\n        printf("%d", x);\r\n    }', '3 3', '3 4', '3 5', 'Run time error', 'op1'),
(21, '#include &ltstdio.h&gt\r\n    int main()\r\n    {\r\n        foo();\r\n        foo();\r\n    }\r\n    void foo()\r\n    {\r\n        int i = 11;\r\n        printf("%d ", i);\r\n        static int j = 12;\r\n        j = j + 1;\r\n        printf("%d\\n", j);\r\n    }', '11 12 11 12', '11 13 11 14', '11 12 11 13', 'Compile time error', 'op2'),
(22, 'Which of the following are an external variable?\r\n\r\n    #include &ltstdio.h&gt\r\n    int func (int a)\r\n    {\r\n        int b;\r\n        return b;\r\n    }\r\n    int main()\r\n    {\r\n        int c;\r\n        func (c);\r\n    }\r\n    int d;', 'a', 'b', 'c', 'd', 'op4'),
(23, '#include &ltstdio.h&gt\r\n    #define foo(x, y) #x #y\r\n    int main()\r\n    {\r\n        printf("%s\\n", foo(k, l));\r\n        return 0;\r\n    }', 'kl', 'k l', 'xy', 'Compile time error', 'op1'),
(24, 'What is the output of this C code?\r\n\r\n    #include &ltstdio.h&gt\r\n    register int x;\r\n    void main()\r\n    {\r\n        printf("%d", x);\r\n    }\r\n', 'varies', '0', 'Junk value', 'Compile time error', 'op4'),
(25, '. What is the output of this C code?\r\n\r\n    #include &ltstdio.h&gt\r\n    int main()\r\n    {\r\n        printf("before continue ");\r\n        continue;\r\n        printf("after continue\\n");\r\n    }\r\n', 'Before continue after continue', 'Before continue', 'After continue', 'Compile time error\r\n\r\n', 'op4'),
(26, 'What is the output of the following program?\r\n\r\nint main()\r\n{\r\n   int x = 1;\r\n   \r\n   do\r\n      printf("%d ", x);\r\n   while(x++<=1);\r\n}\r\n', '1', '1 2\r\n', 'No output\r\n', 'Compile error\r\n', 'op2'),
(27, '#include &ltstdio.h&gt\r\n    int func()\r\n    {\r\n        return (double)(char)5.0;\r\n    }', 'char', 'int', 'double', 'multiple type-casting in return is illegal', 'op2'),
(28, 'What is the output of this C code?\r\n\r\n    #include &ltstdio.h&gt\r\n    #include &ltmath.h&gt\r\n    void main()\r\n    {\r\n        int k = sqrt(-4);\r\n        printf("%d\\n", k);\r\n    }\r\n', '-2', '2', 'Compile time error', 'NaN\r\n', 'op4'),
(29, 'What is the output of the following statement?\r\n\r\n#include&ltstdio&gt\r\n\r\nint main()\r\n{\r\n   printf("%d", -1<<1 );  \r\n}\r\n', '2', '-2', '1', '-1', 'op2'),
(30, 'In DOS, how many bytes exist for near, far and huge pointers?\r\n', 'Near: 2, far: 4, huge: 7\r\n', 'near: 4, far: 2, huge: 8\r\n', 'near: 2, far: 4, huge: 4\r\n', 'near: 4, far: 0, huge: 0\r\n', 'op3'),
(31, 'What is the output of this C code?\r\n\r\n    #include &ltstdio.h&gt\r\n    void m(int *p)\r\n    {\r\n        int i = 0;\r\n        for(i = 0;i < 5; i++)\r\n        printf("%d\\t", p[i]);\r\n    }\r\n    void main()\r\n    {\r\n        int a[5] = {6, 5, 3};\r\n        m(&a);\r\n    }\r\n', '0 0 0 0 0\r\n', '6 5 3 0 0\r\n', 'Run time error', '6 5 3 junk junk\r\n', 'op2'),
(32, 'What is the output of this C code?\r\n\r\n    #include &ltstdio.h&gt\r\n    void m(int p, int q)\r\n    {\r\n        int temp = p;\r\n        p = q;\r\n        q = temp;\r\n    }\r\n    void main()\r\n    {\r\n        int a = 6, b = 5;\r\n        m(a, b);\r\n        printf("%d %d\\n", a, b);\r\n    }\r\n', '5 6\r\n', '5 5', '6 5', '6 6', 'op3'),
(33, 'What is the output of this C code?\r\n\r\n    #include &ltstdio.h&gt\r\n    int x = 0;\r\n    void main()\r\n    {\r\n        int *ptr = &x;\r\n        printf("%p\\n", ptr);\r\n        x++;\r\n        printf("%p\\n ", ptr);\r\n    }\r\n', 'Same address', 'Different address', 'Compile time error', 'Varies\r\n', 'op1'),
(34, '1. void main()\r\n{\r\n	printf("%d",sizeof(0.5));\r\n}', '8', '2', '4', '1', 'op4'),
(35, 'int main()\r\n{\r\n	char str[20]="Hello";\r\n	char *const p =str;\r\n	*p = ''M";\r\n	printf("%s\\n",str);\r\n}\r\n', 'Hello\r\n', 'Mello\r\n', 'HelloM\r\n', 'Mhello\r\n', 'op2'),
(36, 'what will be the output?\r\n void main()\r\n{\r\n	char ch;\r\n	int in = 65;\r\n	int out =2;\r\n	ch= in* out;\r\n	printf("%d %d ", in*out,ch);\r\n}', '130 130', '130 -130', '130 -126', '130 126', 'op3'),
(37, '#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    int x=1, y=1;\r\n    for(; y; printf("%d %d\\n", x, y))\r\n    {\r\n        y = x++ <= 5;\r\n    }\r\n    printf("\\n");\r\n    return 0;\r\n}\r\n', '2 1\r\n3 1\r\n4 1\r\n5 1\r\n6 1\r\n7 0\r\n', '2 1\r\n3 1\r\n4 1\r\n5 1\r\n6 1', '2 1\r\n3 1\r\n4 1\r\n5 1\r\n', '2 2\r\n3 3\r\n4 4\r\n5 5\r\n', 'op1'),
(38, 'How many bytes are occupied by near, far and huge pointers (DOS)?', 'near=2 far=4 huge=4', 'near=4 far=8 huge=8', 'near=2 far=4 huge=8', 'near=4 far=4 huge=8', 'op1'),
(39, 'Which of the following is the correct order of evaluation for the below expression?\r\nz = x + y * z / 4 % 2 - 1\r\n', '* / % + - =\r\n', '= * / % + -\r\n', '/ * % - + =', '* % / - + =\r\n', 'op1'),
(40, 'What will be the output of the program ?\r\n#include<stdio.h>\r\n\r\nint main()\r\n{\r\n    int x=30, *y, *z;\r\n    y=&x; /* Assume address of x is 500 and integer is 4 byte size */\r\n    z=y;\r\n    *y++=*z++;\r\n    x++;\r\n    printf("x=%d, y=%d, z=%d\\n", x, y, z);\r\n    return 0;\r\n}', 'x=31, y=502, z=502', 'x=31, y=500, z=500', 'x=31, y=498, z=498', 'x=31, y=504, z=504', 'op4'),
(41, 'What will be the output of the program ?\r\n#include<stdio.h>\r\n\r\nint main()\r\n{\r\n    void *vp;\r\n    char ch=74, *cp="JACK";\r\n    int j=65;\r\n    vp=&ch;\r\n    printf("%c", *(char*)vp);\r\n    vp=&j;\r\n    printf("%c", *(int*)vp);\r\n    vp=cp;\r\n    printf("%s", (char*)vp+2);\r\n    return 0;\r\n}', 'JCK', 'J65K', 'JAK', 'JACK', 'op4'),
(42, 'If i,j,k are integers variables with values 1,2,3 respectively ,then what is the value of the expression\r\n!(j+k)>(i+5))', '6', '5', '1', '0', 'op3'),
(43, 'The following program fragment \r\nint x=4,y=x,i;\r\nfor(i=1;i<4;++i)\r\nx+=x;\r\noutputs an integer that is same as', '8*y', 'y*(1+2+3+4)', 'y*4', 'y*y', 'op1'),
(44, 'int main()\r\n{\r\n        int i;\r\n       for(i=0;i<10;++i)\r\n      {\r\n              printf("%d",i&1);\r\n      }\r\n}', '0101010101', '01111111111', '0000000000', '11111111111', 'op1'),
(45, 'The output of folllowing snippet is?\r\nint main()\r\n{\r\n      char str[]="hello\\0all";\r\n      int i;\r\n      i=strlen(str);\r\n      printf("%d",i);\r\n}', '5', '10', '8', '11', 'op1'),
(46, 'predict the output\r\nvoid main()\r\n{\r\n    int i;\r\n    for(i=1;i<4;i++)\r\n    {\r\n          i=6; \r\n          printf("%d",i);\r\n         i++;\r\n}', '6 6 6 ', 'garbage value', '6', 'infinite loop', 'op3'),
(47, 'void main()\r\n{\r\n   int a =25, b =10,c;\r\nif(!a>=50)\r\nb=a;\r\nprintf("%d",b);\r\n}', '25', '0', '50', '10', 'op4'),
(48, 'Which of the following function sets first n characters of a string to a given character?', 'strinit()', 'strnset()', 'strset()', 'strcset()', 'op2'),
(49, 'IF THE STORAGE  CLASS IS MISSING IN THE ARRAY DEFINITION ,BY DEFAULT IT WILL BE?', 'automatic', 'external', 'static', 'either automatic or external depending on the places of occurence', 'op4'),
(50, 'How will you print \\n on the screen?', 'printf("\\n");', 'echo "\\\\n";', 'printf(''\\n'');', 'printf("\\\\n");', 'op4');

-- --------------------------------------------------------

--
-- Table structure for table `table2`
--

CREATE TABLE IF NOT EXISTS `table2` (
  `number` int(3) NOT NULL,
  `question` varchar(1000) NOT NULL,
  `o1` varchar(500) NOT NULL,
  `o2` varchar(500) NOT NULL,
  `o3` varchar(50) NOT NULL,
  `o4` varchar(500) NOT NULL,
  `answer` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table2`
--

INSERT INTO `table2` (`number`, `question`, `o1`, `o2`, `o3`, `o4`, `answer`) VALUES
(43, 'Assuming that the following snippet is compiled using gcc, predict the output -\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    int a=1;\r\n    printf("%d %d", ++a, a++);\r\n    return 0;\r\n}', '3 1', '2 2', '2 3', 'None of the above', 'op1'),
(1, 'Predict the output of the following snippet -\r\n\r\nint x = 10;\r\nwhile (x < 5);\r\n{\r\n    printf("%d\\n", x++);\r\n    printf("%d\\n", x);\r\n}', 'No output', 'Compile time error', '10\r\n11', '10', 'op3'),
(2, 'Predict the output -\r\n\r\n#include&ltstdio.h&gt\r\n#define MAX(a, b) (a > b ? a : b)\r\nint main()\r\n{\r\n    int x;\r\n    x = MAX(3+2, 2+7);\r\n    printf("%d\\n", x);\r\n    return 0;\r\n}', '5', '9', '8', '6', 'op2'),
(3, 'In which order do the following operators get evaluated?\r\n1. Assignment\r\n2. Arithmetic\r\n3. Relational\r\n4. Logical', '2 3 4 1', '1 3 4 2', '2 4 3 1', '3 4 2 1', 'op1'),
(4, 'Predict the output-\n\n#include&ltstdio.h&gt\nmain()\n{\n    int n = 0, m = 0;\n    if (n > 0)\n        if (m > 0)\n            printf("True");\n    else \n        printf("False");\n}', 'True', 'False', 'No output', 'None of the above', 'op3'),
(5, 'Which of the following is not a relational operator?', '>', '<', '=', '>=', 'op3'),
(6, 'What is the output of the following code?\n\n#include&ltstdio.h&gt\nint foo();\nint main()\n{\n    int i = foo();\n    printf("%d\\n", i);\n}\nfoo()\n{\n    return 2;\n}', '2 ', 'Compile time error', 'No output', 'Depends on the compiler', 'op1'),
(7, 'Predict the output -\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    int x, y, z;\r\n    x = 4;\r\n    y = --x;\r\n    z = x--;\r\n    printf("%d %d %d\\n", x, y, z);\r\n    return 0;\r\n}', '2 3 3', '2 3 2', '3 3 3', 'None of the above', 'op1'),
(8, 'Predict the output -\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    int x = 10, y = 20;\r\n    if (x == y);\r\n        printf("%d %d\\n", y++, x++);\r\n    return 0;\r\n}', 'No output', 'Compile time error', '10 20', '20 10', 'op4'),
(9, '#include &ltstdio.h&gt\r\n    typedef struct p *q;\r\n    struct p\r\n    {\r\n        int x;\r\n        char y;\r\n        q ptr;\r\n    };\r\n    typedef struct p *q;\r\n    int main()\r\n    {\r\n        struct p p = {1, 2, &p};\r\n        printf("%d\\n", p.ptr->x);\r\n        return 0;\r\n    }', 'Compile time error', '1', 'Undefined behaviour', 'Address of p', 'op1'),
(10, '#include &ltstdio.h&gt\r\n    int *m();\r\n    void main()\r\n    {\r\n        int k = m();\r\n        printf("%d", k);\r\n    }\r\n    int *m()\r\n    {\r\n        int a[2] = {5, 8};\r\n        return a;\r\n    }', '5', '8', 'Nothing', 'Varies', 'op4'),
(11, '. Comment on the output of this C code?\r\n\r\n    #include &ltstdio.h&gt\r\n    int main()\r\n    {\r\n        int *p = (int *)2;\r\n        int *q = (int *)3;\r\n        printf("%d", p + q);\r\n    }\r\n', '2', '3', '5', 'Compile time error\r\n', 'op4'),
(12, 'What is the output of the following code?\r\nvoid main()\r\n{\r\n	int x=97;\r\n	int y=sizeof(x++);\r\n	printf("X is : ",x);\r\n}\r\n', '97', '98', '99', 'Run time error\r\n', 'op1'),
(13, 'What is the output of the following code?\r\nint main()\r\n{\r\n	int n=0;\r\n	int m=0;\r\n	if(n>0)\r\n		if(m>0)\r\n			printf("True");\r\n	else\r\n		printf("False");\r\n}\r\n', 'True', 'False', 'no output', 'Compile time error', 'op3'),
(14, 'What is the output of the following code?\r\nvoid main()\r\n{\r\n	char *p=0;\r\n	*p=''a'';\r\n	printf("value in pointer is %c\\n",*p");\r\n}\r\n', 'It will print 0\r\n', 'It will print a\r\n', 'Compile time error\r\n', 'Run time error', 'op4'),
(15, '#include &ltstdio.h&gt\r\n    struct student\r\n    {\r\n        int no = 5;\r\n        char name[20];\r\n    };\r\n    void main()\r\n    {\r\n        struct student s;\r\n        s.no = 8;\r\n        printf("hello");\r\n    }', 'Nothing', 'Compile time error', 'hello', 'Varies', 'op2'),
(16, 'Which of following logical operation can be applied to pointers?\r\n    (Assuming initialization int *a = 2; int *b = 3;)', 'a | b\r\n', 'a ^ b\r\n', 'a & b\r\n', 'None of the mentioned\r\n', 'op4'),
(17, '#include &ltstdio.h&gt\r\n    struct\r\n    {\r\n        char *name;\r\n        union\r\n        {\r\n            char *sval;\r\n        } u;\r\n    } symtab[10];\r\n    the first character of the string sval by either of', '*symtab[i].u.sval', 'symtab[i].u.sval[0] ', 'Both a & b', ' You cannot have union inside structure', 'op3'),
(18, 'What is the output of the following code?\r\nvoid main()\r\n{\r\n	int a=1;int b=2;\r\n	int x=1;\r\n	switch(x)\r\n	{\r\n		case a:printf("Yes");\r\n		case b:printf("NO");\r\n			break;\r\n	}\r\n}\r\n', 'Yes NO', 'Yes', 'NO', 'Compile error', 'op4'),
(19, '#include &ltstdio.h&gt\r\n    (sizeof double = 8, float = 4, void = 1)\r\n    #define PI 3.14\r\n    int main()\r\n    {\r\n        printf("%d", sizeof(PI));\r\n    }', 'Output is 8', 'Output is 4', 'Output is 1', 'Error, we can?t use sizeof on macro-definitions', 'op1'),
(20, 'What is the output of the following code?\r\nvoid main()\r\n{\r\n	int k=8;\r\n	int x=0==1 && k++;\r\n	printf("%d%d",x,k);\r\n}\r\n', '0,9', '0,8', '1,8', '1,9', 'op2'),
(21, '. What is the output of this C code?\r\n\r\n    #include &ltstdio.h&gt\r\n    int x = 5;\r\n    void main()\r\n    {\r\n        int x = 3;\r\n        m();\r\n        printf("%d", x);\r\n    }\r\n    void m()\r\n    {\r\n        x = 8;\r\n        n();\r\n    }\r\n    void n()\r\n    {\r\n        printf("%d", x);\r\n    }\r\n', '8 3\r\n', '3 8\r\n', '8 5\r\n', '5 3\r\n', 'op1'),
(22, '#include &ltstdio.h&gt\r\n    int main()\r\n    {\r\n        int i = 0, j = 0;\r\n        while (i < 2)\r\n        {\r\n            l1 : i++;\r\n            while (j < 3)\r\n            {\r\n                printf("Loop\\n");\r\n                goto l1;\r\n            }\r\n        }\r\n    }', 'Loop Loop', 'Compilation error', 'Loop Loop Loop Loop', 'Infinite Loop', 'op4'),
(23, 'What is the output of the below code snippet?\r\nint main() \r\n{\r\n   for()printf("Hello");\r\n}\r\n', 'Infinite loop\r\n', 'Prints ?Hello? once.', 'No output\r\n', 'Compile error\r\n', 'op4'),
(24, '#include &ltstdio.h&gt\r\n    static int x = 5;\r\n    void main()\r\n    {\r\n        int x = 9;\r\n        {\r\n            x = 4;\r\n        }\r\n        printf("%d", x);\r\n    }', '9', '5', '4', '0', 'op3'),
(25, '#include &ltstdio.h&gt\r\n    int main()\r\n    {\r\n        int a = 1;\r\n        if (a--)\r\n            printf("True");\r\n            if (a++)\r\n                printf("False");\r\n    }\r\n', ' True', ' False', 'True False', ' No Output', 'op1'),
(26, '#include &ltstdio.h&gt\r\nvoid main()\r\n{\r\n    int i = 0;\r\n    while (i < 10)\r\n    {\r\n        i++;\r\n        printf("hi\\n");\r\n        while (i < 8) {\r\n            i++;\r\n            printf("hello\\n");\r\n        }\r\n    }\r\n}', 'Hi is printed 8 times, hello 7 times and then hi 2 times', 'Hi is printed 10 times, hello 7 times', 'Hi is printed once, hello 7 times', 'Hi is printed once, hello 7 times and then hi 2 times', 'op4'),
(27, '#include &ltstdio.h&gt\r\n    int main()\r\n    {\r\n        int i = 0;\r\n        while (i = 0)\r\n            printf("True\\n");\r\n        printf("False\\n");\r\n    }', 'True (infinite time)', 'True (1 time) False', 'False', 'Compiler dependent', 'op3'),
(28, 'What is the output of this C code?\r\n\r\n    #include &ltstdio.h&gt\r\n    #include <math.h>\r\n    void main()\r\n    {\r\n        int k = pow(2, 3);\r\n        printf("%d\\n", k);\r\n    }\r\n', '9', '8', '-1', '6', 'op2'),
(29, 'In the standard library of C programming language, which of the following header file is designed for basic mathematical operations?\r\n', 'math.h', 'conio.h', 'dos.h', 'stdio.h', 'op1'),
(30, '- What do the following statement defines?\r\n\r\n   int *ptr[10];\r\n', 'ptr is a pointer to an array of 10 integer pointers.\r\n', 'ptr is a array of 10 pointers to integer', 'ptr is a array of 10 integer pointers\r\n', 'None of the above\r\n', 'op2'),
(31, 'What is the output of this C code?\r\n\r\n    #include &ltstdio.h&gt\r\n    int x = 0;\r\n    void main()\r\n    {\r\n        int *const ptr = &x;\r\n        printf("%p\\n", ptr);\r\n        ptr++;\r\n        printf("%p\\n ", ptr);\r\n    }\r\n', '0 1\r\n', 'Compile time error', '0xbfd605e8 0xbfd605ec', '0xbfd605e8 0xbfd605e8\r\n\r\n', 'op2'),
(32, 'Which of the statements is correct about the program?\r\n#include<stdio.h>\r\n\r\nint main()\r\n{\r\n    int arr[3][3] = {1, 2, 3, 4};\r\n    printf("%d\\n", *(*(*(arr))));\r\n    return 0;\r\n}\r\n	\r\n', 'Output: Garbage value', 'Output: 1', 'Output: 3', 'Error: Invalid indirection', 'op4'),
(33, 'int main()\r\n{\r\n	int i;\r\n	i=011\r\n	printf("%d",++i);\r\n}\r\n', '001', '11', '10', '111', 'op3'),
(34, 'What is the purpose of fflush() function.\r\n	\r\n', 'flushes all streams and specified streams.', 'flushes only specified stream.', 'flushes input/output buffer.', 'flushes file buffer.', 'op1'),
(35, ' int main()\r\nPredict the output:\r\n\r\n{\r\n    int x;\r\n	x=-3 * -8 % -6 /-5;\r\n    printf("%d\\n", x);\r\n    return 0;\r\n}', '1', '0', '-6', '6', 'op2'),
(36, 'Predict the output:\r\n\r\nint main()\r\n{\r\n	float me=1.1;\r\n	double you=1.1;\r\n	if(me == you)\r\n		printf(" U and me are equal ");\r\n	else \r\n	 if(me>you)\r\n		printf(" u are stronger than me");\r\n	else\r\n	  printf(" U are weaker than me");\r\n}', 'U and me are equal', 'u are stronger than me', ' U are weaker than me', 'error', 'op2'),
(37, 'Predict the output:\r\n\r\n int main()\r\n{\r\n    int x=5,y=6;\r\n	printf("%d\\n", x+++y);\r\n    return 0;\r\n}', '13', '11', 'error', '12', 'op2'),
(38, 'Will the printf() statement print the same values for any values of a?\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    float a;\r\n    scanf("%f", &a);\r\n    printf("%f\\n", a+a+a);\r\n    printf("%f\\n", 3*a);\r\n    return 0;\r\n}\r\n', 'yes', 'no', 'error', 'no output', 'op1'),
(39, 'Which of the following function sets first n characters of a string to a given character?', 'strinit()', 'strnset()', 'strset()', 'strcset()', 'op2'),
(40, 'If the two strings are identical, then strcmp() function returns', '-1', '1', '0', 'true', 'op3'),
(41, 'void main(0\r\n{\r\n  static  char s[] ="jasmine-infotech 1";\r\n  printf(" %c ",* (s+ strlen(s) - 1));\r\n}', 'nothing will be printed', '!', 'garbage value', 'char', 'op2'),
(42, 'void main()\r\n{\r\n int k= 1, n=2;\r\nk=(k >= 1? n>= 2 ? 3: 4: 5);\r\nprintf("%d",k);\r\n}', '3', '2', '1', '0', 'op1');

-- --------------------------------------------------------

--
-- Table structure for table `table3`
--

CREATE TABLE IF NOT EXISTS `table3` (
  `number` int(3) NOT NULL,
  `question` varchar(1000) NOT NULL,
  `o1` varchar(500) NOT NULL,
  `o2` varchar(50) NOT NULL,
  `o3` varchar(500) NOT NULL,
  `o4` varchar(500) NOT NULL,
  `answer` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table3`
--

INSERT INTO `table3` (`number`, `question`, `o1`, `o2`, `o3`, `o4`, `answer`) VALUES
(39, '#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    printf("%d", printf("Hello."));\r\n    return 0;\r\n}', 'Hello.Hello.', 'Compile time error', 'Hello', 'Hello.6', 'op4'),
(1, 'Find the output of the following snippet-\n\n#include&ltstdio.h&gt\nint main()\n{\n    int a = 4;\n    switch (a)\n    {   \n        case 1:\n        printf("One!\\n");\n        break;\n       \n        default:\n        printf("Zero!\\n");  \n        \n        case 2:\n        printf("Two!\\n");\n        break;\n        \n        case 3:\n        printf("Three!\\n");\n        break;\n    }\n    return 0;\n}', 'Zero', 'Zero\r\nTwo', 'Compile time error', 'No output', 'op2'),
(2, 'What will be the output of the following program?\r\n\r\n#include&ltstdio.h&gt\r\n#define do(int) printf("int=%d ", int);\r\n\r\nint main()\r\n{\r\n    int x=3, y=4, z=5;   \r\n    do(++x);\r\n    do(y++);\r\n    do(--z);\r\n    return 0;\r\n}', 'int=4 int=4 int=4', 'int=4 int=5 int=4', 'int=3 int=4 int=5', 'Compile time error: Cannot use a keyword as a macro name.', 'op1'),
(3, 'The operator used to get value at address stored in a pointer variable is -', '& operator', '* operator', '&& operator', '! operator', 'op2'),
(4, 'Find the output -\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    int line, stars;\r\n    for (line=1; line<=3; line++)\r\n    {\r\n        for (stars=1; stars<=line; stars++)\r\n            printf("*");\r\n        printf("\\n");\r\n    }\r\n    return 0;\r\n}', '******', '*\r\n**\r\n***', '***\r\n**\r\n*', '  *\r\n **\r\n***', 'op2'),
(5, 'Predict the output -\n\n#include&ltstdio.h&gt\nint main()\n{\n    int i = 10;\n    if (i = 20)\n        printf("Launch nuclear weapon!\\n");\n    return 0;\n}', 'Launch nuclear weapon!', 'No output', 'Compile time error', 'None of the above', 'op1'),
(6, 'Predict the output -\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    int arr[26], x;\r\n    for (x = 0; x <= 10; x++)\r\n    {\r\n        arr[x] = ''A'' + x;\r\n        printf("%c ", arr[x]);\r\n    }\r\n    return 0;\r\n}', 'A B C D E F G H I', 'A B C D E F G H I J', 'A B C D E F G H I J K', 'A B C D E F G H I J K L M N O P Q R S T U V W X Y Z', 'op3'),
(7, 'What is the output of the following code?\r\nvoid main()\r\n{\r\n	int i=3;\r\n	int l=i/-2;\r\n	int k=i%-2;\r\n	printf("%d,%d",l,k);\r\n}\r\n', 'Compile time error', '-1,-1', '-1,1', '1,-1\r\n', 'op3'),
(8, '#include &ltstdio.h&gt\r\n    int main()\r\n    {\r\n        return 0,1;\r\n    }', '0', '1', 'error', '0 and 1', 'op2'),
(9, 'Which of the following operand can be applied to pointers p and q?\r\n     (Assuming initialization as int *a = (int *)2; int *b = (int *)3;)\r\n', 'a + b\r\n', 'a ? b\r\n', 'a * b\r\n', 'a / b\r\n', 'op2'),
(10, '#include &ltstdio.h&gt\r\n    void main()\r\n    {\r\n        char s[] = "hello";\r\n        s++;\r\n        printf("%c\\n", *s);\r\n    }', 'Compile time error', 'h', 'e', 'o', 'op1'),
(11, '#include &ltstdio.h&gt\r\n    struct student\r\n    {\r\n        int no;\r\n        char name[20];\r\n    };\r\n    struct student s;\r\n    void main()\r\n    {\r\n        s.no = 8;\r\n        printf("%s", s.name);\r\n    }', 'Nothing', 'Compile time error', 'Junk', '8', 'op1'),
(12, '#include &ltstdio.h&gt\r\n    int main()\r\n    {\r\n        reverse(1);\r\n    }\r\n    void reverse(int i)\r\n    {\r\n        if (i > 5)\r\n            exit(0);\r\n        printf("%d\\n", i);\r\n        return reverse(i++);\r\n    }', '1 2 3 4 5', '1 2 3 4', 'Compile time error', 'Stack overflow', 'op4'),
(13, 'What is the output of this C code?\r\n\r\n    #include &ltstdio.h&gt\r\n    void main()\r\n    {\r\n        char *s = "hello";\r\n        char *p = s;\r\n        printf("%c\\t%c", *(p + 1), s[1]);\r\n    }\r\n', 'h e\r\n', 'e l\r\n', 'h h\r\n', 'e e\r\n', 'op4'),
(14, '#include &ltstdio.h&gt\r\n    int x = 0;\r\n    int main()\r\n    {\r\n        int i = (f() + g()) | g(); //bitwise or\r\n        int j = g() | (f() + g()); //bitwise or\r\n    }\r\n    int f()\r\n    {\r\n        if (x == 0)\r\n            return x + 1;\r\n        else\r\n            return x - 1;\r\n    }\r\n    int g()\r\n    {\r\n        return x++;\r\n    }', 'i value is 1 and j value is 1', 'i value is 0 and j value is 0', 'i value is 1 and j value is undefined', 'i and j value are undefined', 'op3'),
(15, '#include &ltstdio.h&gt\r\n    int main()\r\n    {\r\n        int x = 2, y = 0;\r\n        int z = y && (y |= 10);\r\n        printf("%d\\n", z);\r\n        return 0;\r\n    }', '1', '0', 'Undefined behaviour due to order of evaluation', '2', 'op2'),
(16, '#include &ltstdio.h&gt\r\n    int main()\r\n    {\r\n        int x = 2, y = 0;\r\n        int z = (y++) ? 2 : y == 1 && x;\r\n        printf("%d\\n", z);\r\n        return 0;\r\n    }', '0', '1', '2', 'Undefined behaviour', 'op2'),
(17, 'Size of an array can be evaluated by:\r\n    (Assuming array declaration int a[10];)', 'sizeof(a);', 'sizeof(*a);', ' sizeof(a[10]);', '10 * sizeof(a);', 'op1'),
(18, 'For initialization a = 2, c = 1 the value of a and c after this code will be\r\n     c = (c) ? a = 0 : 2;', 'a = 0, c = 0;', 'a = 2, c = 2;', 'a = 2, c = 2;', 'a = 1, c = 2;', 'op1'),
(19, 'The sizeof(void) in a 32-bit C is_____.', '0', '1', '2', '4', 'op2'),
(20, '#include &ltstdio.h&gt\r\n    int main()\r\n    {\r\n        int i = 0;\r\n        for (i++; i == 1; i = 2)\r\n            printf("In for loop ");\r\n            printf("After loop\\n");\r\n    }', 'In for loop after loop', 'After loop', 'Compile time error', 'Undefined behaviour', 'op1'),
(21, '. What is the output of this C code?\r\n\r\n    #include &ltstdio.h&gt\r\n    void main()\r\n    {\r\n        register int x;\r\n        printf("%d", x);\r\n    }\r\n', '0', 'Junk value', 'Compile time error', 'Noting\r\n', 'op2'),
(22, '#include &ltstdio.h&gt\r\n    void main()\r\n    {\r\n        char *str = "";\r\n        do\r\n        {\r\n            printf("hello");\r\n        } while (str);\r\n    }', 'Nothing', 'Run time error', 'Varies', 'Hello is printed infinite times', 'op4'),
(23, 'Compiler generates ___ file.\r\n', 'Executable code\r\n', 'Object code\r\n', 'Assembly code\r\n', 'None of the above.', 'op2'),
(24, '#include &ltstdio.h&gt\r\n    int main()\r\n    {\r\n        int i = 0, j = 0;\r\n        while (i < 5, j < 10)\r\n        {\r\n            i++;\r\n            j++;\r\n        }\r\n        printf("%d, %d\\n", i, j);\r\n    }', '5, 5', '5, 10', '10, 10', 'Syntax error', 'op3'),
(25, 'What is the output of this C code?\r\n\r\n    #include &ltstdio.h&gt\r\n    #include &ltmath.h&gt\r\n    void main()\r\n    {\r\n        int k = fabs(-87);\r\n        printf("%d\\n", k);\r\n    }\r\n', '-87', '87', '78', 'error', 'op2'),
(26, 'What is the output of the following program?\r\n#include&ltstdio&gt\r\n\r\nint* f() \r\n{\r\n   int x = 5;\r\n   \r\n   return &x;\r\n}	\r\nmain() \r\n{\r\n   printf("%d", *f());\r\n}\r\n', '5', 'Address of ?x?\r\n', 'Compile error\r\n', 'Runtime error\r\n', 'op4'),
(27, 'Which among the following mathematical function do not have a ?double? return-type?\r\n', 'srand(x);', 'ceil(x);\r\n', 'floor(x);', 'Both (b) and (c);\r\n', 'op1'),
(28, 'A bitwise operator ?&? can turn-off a particular bit into a number.\r\n', 'Yes', '&&\r\n', '*\r\n', '||\r\n', 'op1'),
(29, 'What is the output of this C code?\r\n\r\n    #include &ltstdio.h&gt\r\n    void m(int *p, int *q)\r\n    {\r\n        int temp = *p; *p = *q; *q = temp;\r\n    }\r\n    void main()\r\n    {\r\n        int a = 6, b = 5;\r\n        m(&a, &b);\r\n        printf("%d %d\\n", a, b);\r\n    }\r\n', '5 6\r\n', '6 5\r\n', '5 5\r\n', '6 6\r\n', 'op1'),
(30, 'In the given below code, what will be the value of a variable x?\r\n\r\n#include&ltstdio&gt\r\n\r\nint main()\r\n{\r\n    int y = 100;\r\n    const int x = y;\r\n    \r\n    printf("%d\\n", x);\r\n    return 0;\r\n}\r\n', '100', '0', 'print x', 'return Error', 'op1'),
(31, 'int main()\n{\n   extern int x=20;\n   printf("%d\\n", x);\n}\n\n', 'compiler error\r\n', 'linker error\r\n', '20', '2', 'op2'),
(32, 'int main()\r\n{\r\n	int i=1;\r\n	char *iptr =&i;\r\n	if((int)*iptr == 1)\r\n		printf("1 ");\r\n	else \r\n		printf("2 ");\r\n}\r\n', '1', '2', 'error', 'platform dependent', 'op4'),
(33, 'int main()\r\n{\r\n	int i;\r\n	i=64/square(4) ;\r\n	printf("%d",i);\r\n}\r\n', '4', '32', '64', '16', 'op3'),
(34, 'int main()\r\n{\r\n	printf("\\nhi tel");\r\n	printf("\\bam");\r\n	printf("\\rux");\r\n}\r\n', 'hi telamux', 'hi telam', 'ux team', 'ux hi telam \r\n', 'op3'),
(35, 'int main()\r\n{\r\n int i=0,a[3];\r\n a[i] = i++;\r\n print("%d",a[i]);\r\n}\r\n', '0', '1', 'garbage', 'NULL', 'op3'),
(36, 'int main()\r\n{ \r\n	int i=9;\r\n	printf("%d", -i++);\r\n	printf("%d",i);\r\n}\r\n\r\n', '109', '-109', '910', '-910', 'op4'),
(37, 'The library function used to find the last occurrence of a character in a string is', 'strnstr()', 'laststr()', 'strrchr()', 'strstr()', 'op3'),
(38, '	\r\nHow will you print \\n on the screen?', 'printf("\\n");', 'echo "\\\\n";', 'printf(''\\n'')', 'printf("\\\\n");', 'op4');

-- --------------------------------------------------------

--
-- Table structure for table `table4`
--

CREATE TABLE IF NOT EXISTS `table4` (
  `number` int(3) NOT NULL,
  `question` varchar(1000) NOT NULL,
  `o1` varchar(500) NOT NULL,
  `o2` varchar(500) NOT NULL,
  `o3` varchar(50) NOT NULL,
  `o4` varchar(500) NOT NULL,
  `answer` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table4`
--

INSERT INTO `table4` (`number`, `question`, `o1`, `o2`, `o3`, `o4`, `answer`) VALUES
(51, '#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    printf("%x\\n", -2 << 1);\r\n    return 0;\r\n}\r\n\r\nAssuming that sizeof(int) = 4 bytes, what is the output?', 'fffffffc', 'fffffffe', '1100', 'None of the above', 'op1'),
(1, 'Predict the output -\r\n#include&ltstdio.h&gt\r\n#include&ltstdlib.h&gt\r\nint main()\r\n{\r\n    int *p=(int *)malloc(-1);\r\n    printf("%d",p);\r\n    return 0;\r\n}', '-1', '0', 'Segmentation Fault', 'Random Address', 'op2'),
(2, 'Find the output of the following snippet-\r\n\r\nint main()\r\n{\r\n    int i;\r\n    for(i = 1; ++i; ++i)\r\n    {\r\n        printf("%d ", i++);\r\n        if (i > 10)\r\n            break;\r\n    }\r\n    return 0;\r\n}', '1 3 5 7 9 11', '1 2 3 4 5 6 7 8 9 10', '2 4 6 8 10', '2 5 8 11', 'op4'),
(3, 'int main()\r\n{\r\n    int a, b, c;\r\n    a = 12;\r\n    b = 7;\r\n    c = (++a + b++) / 40.0 * b;\r\n    printf("%d\\n", c);\r\n    return 0;\r\n}', '0', '2', 'Compile time error', '4', 'op4'),
(4, 'Automatic (auto) variables are allocated memory in the ____', 'Heap', 'Code segment', 'Stack', 'Data segment', 'op3'),
(5, 'int k, num;\r\nnum = 30;\r\nk = num>5 ? (num<10 ? 100 : 200) : 500;\r\nprintf("%d", k);', '30', '200', '500', '100', 'op2'),
(6, 'Predict the output of the following program -\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    int arr[] = {0,20,5,40,7};\r\n    int i;\r\n    int *k = arr;\r\n    for(i=0; i<5; i++)\r\n        printf("%d ", ++*k);\r\n    k = arr;\r\n    printf("\\n");\r\n    for(i=0; i<5; i++)\r\n    {\r\n        printf("%d ", *k);\r\n        k++;\r\n    }\r\n    return 0;\r\n}', '0 20 5 40 7\r\n0 20 5 40 7', '1 2 3 4 5\r\n5 20 5 40 7', '0 20 5 40 7\r\n1 21 6 41 8', 'Compile time error', 'op2'),
(7, 'Which bitwise operator is most suitable for turning on the bits of an integer (i.e. changing bits to 1)?', '~ operator', '| operator', '& operator', '^ operator', 'op2'),
(8, 'What is the output of the following code?\r\n\r\n#include&ltstdio.h&gt\r\nvoid m(int k)\r\n{\r\n    printf("hi");\r\n}\r\nvoid m(double k)\r\n{\r\n    printf("hello");\r\n}\r\nint main()\r\n{\r\n    m(3);\r\n    return 0;\r\n}', 'hi', 'hello', 'Compile time error', 'No output', 'op3'),
(9, 'What type of array is generally generated while accepting command line arguments?', 'One dimensional array', 'Two dimensional square array', 'Jagged array', 'Two dimensional rectangular array', 'op3'),
(10, 'Which line of the following code snippet can be removed without affecting the flow of the program?\r\n\r\n#include&ltstdio.h&gt\r\n\r\nint main()\r\n{\r\n    int x;\r\n    for (x = 0; x <= 10; x++)\r\n    {\r\n        if (x < 5)\r\n            continue;\r\n        else\r\n            break;\r\n        printf("*");\r\n    }\r\n    return 0;\r\n}', 'printf("*");', 'else', 'break;', 'continue;', 'op2'),
(11, 'Predict the output -\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    int i = 1, j = 1;\r\n    for (;;)\r\n    {\r\n        if (i > 5)\r\n            break;\r\n        else\r\n            j += i;\r\n        printf("%d\\n", j);\r\n        i += j;\r\n    }\r\n    return 0;\r\n}', '2\r\n3', '1\r\n4', '2\r\n5', 'Infinite loop', 'op3'),
(12, 'Pridict the output :\r\nint something(int x, int y)\r\n{\r\n    return printf("%*c%*c",  x, '' '',  y, '' '');\r\n}\r\n \r\nint main()\r\n{\r\n    printf("Sum = %d", something(3, 4));\r\n    return 0;\r\n}\r\n', '3 4 Sum = 7', '3 4', 'Sum = 7', 'NULL', 'op3'),
(13, 'Pridict the output :\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    int i;\r\n    i = (1, 2, 3);         \r\n    printf("i  = %d\\n", i);\r\n \r\n    getchar();\r\n     return 0;\r\n}\r\n', '10 10 10 10', '10 10 10 10 10', '10', 'error', 'op1'),
(14, '#include?stdio.h?\r\nint main()\r\n{\r\n    struct site\r\n    {\r\n        char name[] = "ASCIQuiz";\r\n        int no_of_pages = 200;\r\n    };\r\n    struct site *ptr;\r\n    printf("%d ", ptr->no_of_pages);\r\n    printf("%s", ptr->name);\r\n    getchar();\r\n    return 0;\r\n}\r\n', '200 ASCIQuiz', '200', 'Runtime Error', 'Compiler Error', 'op4'),
(15, '\r\nint main()\r\n{\r\n   char str1[] = "ASCIsQuiz";\r\n   char str2[] = {''G'', ''e'', ''e'', ''k'', ''s'', ''Q'', ''u'', ''i'', ''z''};\r\n   int n1 = sizeof(str1)/sizeof(str1[0]);\r\n   int n2 = sizeof(str2)/sizeof(str2[0]);\r\n   printf("n1 = %d, n2 = %d", n1, n2);\r\n   return 0;\r\n}', 'n1 = 10, n2 = 9\r\n', 'n1 = 10, n2 = 10\r\n', 'n1 = 9, n2 = 9\r\n', 'n1 = 9, n2 = 10\r\n', 'op1'),
(16, '#include&ltstdio.h&gt\r\nstruct st\r\n{\r\n    int x;\r\n    static int y;\r\n};\r\n \r\nint main()\r\n{\r\n    printf("%d", sizeof(struct st));\r\n    return 0;\r\n}\r\n', '4', '8', 'Compiler Error', 'Runtime Error', 'op3'),
(17, 'Suppose P, Q, R, S, T are sorted sequences having lengths 20, 24, 30, 35, 50 respectively. They are to be merged into a single sequence by merging together two sequences at a time. The number of comparisons that will be needed in the worst case by the optimal algorithm for doing this is ____.', '358', '360', '10', '159', 'op1'),
(18, 'union test\r\n{\r\n    int x;\r\n    char arr[4];\r\n    int y;\r\n};\r\n \r\nint main()\r\n{\r\n    union test t;\r\n    t.x = 0;\r\n    t.arr[1] = ''G'';\r\n    printf("%s", t.arr);\r\n    return 0;\r\n}\r\nPredict the output of above program. Assume that the size of an integer is 4 bytes and size of character is 1 byte. Also assume that there is no alignment needed.\r\n', 'Nothing is printed', 'G', 'Garbage character followed by ?G?', 'Garbage character followed by ?G?, followed by more garbage characters', 'op1'),
(19, 'Assume that float takes 4 bytes, predict the output of following program.\r\n#include&ltstdio.h&gt\r\n \r\nint main()\r\n{\r\n    float arr[5] = {12.5, 10.0, 13.5, 90.5, 0.5};\r\n    float *ptr1 = &arr[0];\r\n    float *ptr2 = ptr1 + 3;\r\n \r\n    printf("%f ", *ptr2);\r\n    printf("%d", ptr2 - ptr1);\r\n \r\n   return 0;\r\n}\r\n', '90.500000\r\n3\r\n', '90.500000\r\n12\r\n', '10.000000\r\n12\r\n', '0.500000\r\n3', 'op1'),
(20, '# include <iostream>\r\n# include <string.h>\r\nusing namespace std;\r\n \r\nstruct Test\r\n{\r\n  char str[20];\r\n};\r\n \r\nint main()\r\n{\r\n  struct Test st1, st2;\r\n  strcpy(st1.str, "ASCIquiz");\r\n  st2 = st1;\r\n  st1.str[0] = ''S'';\r\n  cout << st2.str;\r\n  return 0;\r\n}\r\nOutput?', 'Segmentation Fault', 'SSCIquiz ', 'ASCIquiz', 'Compiler Error', 'op3'),
(21, 'Assume that float takes 4 bytes, predict the output of following program.\r\n#include&ltstdio.h&gt\r\n \r\nint main()\r\n{\r\n    float arr[5] = {12.5, 10.0, 13.5, 90.5, 0.5};\r\n    float *ptr1 = &arr[0];\r\n    float *ptr2 = ptr1 + 3;\r\n \r\n    printf("%f ", *ptr2);\r\n    printf("%d", ptr2 - ptr1);\r\n \r\n   return 0;\r\n}\r\n\r\n', '90.500000\r\n3', '90.500000\r\n12', '10.000000\r\n12\r\n', '0.500000\r\n3', 'op1'),
(22, '#include&ltstdio.h&gt \r\nint main() \r\n{ \r\n   int a; \r\n   char *x; \r\n   x = (char *) &a; \r\n   a = 512; \r\n   x[0] = 1; \r\n   x[1] = 2; \r\n   printf("%d\\n",a);   \r\n   return 0; \r\n}\r\n\r\nWhat is the output of above program?\r\n', 'Machine dependent', '513', '258', 'Compiler Error', 'op1'),
(23, 'int main()\r\n{\r\n char *ptr = "ASCIQuiz";\r\n printf("%c\\n", *&*&*ptr);\r\n return 0;\r\n}\r\n', 'Compiler Error', 'Garbage Value', 'Run time Error', 'A', 'op4'),
(24, '#include&ltstdio.h&gt \r\nvoid f(int *p, int *q) \r\n{ \r\n  p = q; \r\n  *p = 2; \r\n} \r\nint i = 0, j = 1; \r\nint main() \r\n{ \r\n  f(&i, &j); \r\n  printf("%d %d \\n", i, j); \r\n  getchar(); \r\n  return 0; \r\n}\r\nPredict the output !', '2 2', '2 1', '0 1', '0 2', 'op4'),
(25, 'Consider this C code to swap two integers and these five statements after it:\r\nvoid swap(int *px, int *py) \r\n{ \r\n   *px = *px - *py; \r\n   *py = *px + *py; \r\n   *px = *py - *px; \r\n}\r\nS1: will generate a compilation error\r\nS2: may generate a segmentation fault at runtime depending on the arguments passed\r\nS3: correctly implements the swap procedure for all input pointers referring to integers stored in memory locations accessible to the process\r\nS4: implements the swap procedure correctly for some but not all valid input pointers\r\nS5: may add or subtract integers and pointers\r\n', 'S1', 'S2 and S3', 'S2 and S4', 'S2 and S5', 'op3'),
(26, 'int f(int x, int *py, int **ppz) \r\n{ \r\n  int y, z; \r\n  **ppz += 1; \r\n   z  = **ppz; \r\n  *py += 2; \r\n   y = *py; \r\n   x += 3; \r\n   return x + y + z; \r\n} \r\n   \r\nvoid main() \r\n{ \r\n   int c, *b, **a; \r\n   c = 4; \r\n   b = &c; \r\n   a = &b; \r\n   printf("%d ", f(c, b, a)); \r\n   return 0;\r\n}\r\nWhat would be the output of this snippet?', '18', '19', '21', '22', 'op2'),
(27, 'Predict the output of following program\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    int a = 12;\r\n    void *ptr = (int *)&a;\r\n    printf("%d", *ptr);\r\n    getchar();\r\n    return 0;\r\n}', '12', 'Compiler error', 'Run Time Error', '0', 'op2'),
(28, '#include&ltstdio.h&gt\r\n \r\nvoid swap (char *x, char *y)\r\n{\r\n    char *t = x;\r\n    x = y;\r\n    y = t;\r\n}\r\n \r\nint main()\r\n{\r\n    char *x = "ASCIquiz";\r\n    char *y = "algorhythm";\r\n    char *t;\r\n    swap(x, y);\r\n    printf("(%s, %s)", x, y);\r\n    t = x;\r\n    x = y;\r\n    y = t;\r\n    printf("\\n(%s, %s)", x, y);\r\n    return 0;\r\n}', '(ASCIsquiz, algorhythm)\r\n(algorhythm, ASCIquiz)\r\n', '(algorhythm, ASCIquiz)\r\n(ASCIquiz, algorhythm)', '(ASCIquiz, algorhythm)\r\n(ASCIquiz, algorhythm)', '(algorhythm, ASCIquiz)\r\n(algorhythm, ASCIquiz)', 'op1'),
(29, '#include&ltstdio.h&gt \r\nint main() \r\n{ \r\n  int a = 10, b = 20, c = 30; \r\n  if (c > b > a) \r\n    printf("TRUE"); \r\n  else\r\n    printf("FALSE"); \r\n  return 0; \r\n}\r\nOutput?', 'TRUE', 'FALSE', 'Compiler Error', 'Output is compiler dependent', 'op2'),
(30, ') Predict the output - (given that sizeof(unsigned int) = 4 bytes)\r\n\r\n#include&ltstdio.h&gt\r\nstruct stats\r\n{\r\n    unsigned int Atk : 6;\r\n    unsigned int Def : 6;\r\n};\r\nint main()\r\n{\r\n    struct stats pokemon;\r\n    printf("%d\\n", sizeof(pokemon));\r\n    return 0;\r\n}\r\n', '4', '12', '8', 'Compile time error', 'op1'),
(31, '#include&ltstdio.h&gt\r\n        int  main()\r\n       {\r\n                char   s[]=?hello?,t[]=?hello?;\r\n       	if(s==t)\r\n	printf(?equal   strings?);\r\n     }\r\n', 'Equal strings', 'Unequal strings', 'No output', 'Compilation error', 'op3'),
(32, '#include&ltstdio.h&gt\r\nint main()\r\n{\r\n  char *st;\r\n  char str[5]="dell";\r\n  st=str;\r\n  *st=''h'';\r\n  printf("%s",str);\r\n}\r\n', 'h', 'dell', 'hell', 'ell', 'op3'),
(33, '#include&ltstdio.h&gt\r\n	int main()\r\n        {\r\n               char  s[20]=?czar\\0?;\r\n		int  len;\r\n		len=strlen(s);\r\n		printf(?%d?,len);\r\n	}\r\n', '20', '6', '4', '5', 'op3'),
(34, '#include&ltstdio.h&gt\r\nint main()\r\n{\r\n  int x=10,y=20,z=5,i;\r\n  i=x<y<z;\r\n  printf("%d",i);\r\n}\r\n', '10', '1', '5', '20', 'op2'),
(35, 'WHAT WILL BE THE OUTPUT OF THE PROGRAM?\r\n	#include&ltstdio.h&gt\r\n	int  main()\r\n	{\r\n		int i=3,*j,k;\r\n		j=&i;\r\n 		printf(?%d?,i**j*i+*j);\r\n	}\r\n', '30', '27', '9', '3', 'op1'),
(36, 'Which bitwise operator is suitable for checking whether a particular bit is on or off?', '.&& OPERATOR', '.&	OPERATOR', '.|| OPERATOR', '.|  OPERATOR', 'op2'),
(37, '.#include&ltstdio.h&gt\r\n Int  main()\r\n{\r\n	int  i=1;\r\n      while(i++<=5);\r\n     printf(?%d?,i++);\r\n}', '2 3 4 5 6', '4', '6', 'SYNTAX ERROR', 'op3'),
(38, '.#include&ltstdio.h&gt\r\nInt main()\r\n{\r\n	Int a[3]={2,1};\r\n	printf(?%d?,a[a[1]]);\r\n}\r\n', '1', '2', '0', 'ERROR', 'op1'),
(39, '#include&ltstdio.h&gt\r\n	Int   main()\r\n	{\r\n			Int  a=10,b;\r\n			  b=a++   +   ++a;\r\n			printf(?%d %d %d %d?,b,a++,a,++a);\r\n	}\r\n', '12,10,11,13', '22,10,11,13', '22,11,11,11', '22,13,13,13', 'op4'),
(40, '#include&ltstdio.h&gt\r\nint x = 3;\r\nif( x == 2 );\r\n  x = 0;\r\nif( x == 3 )\r\nx++;\r\nelse x += 2;\r\n', '1', '2', '3', '4', 'op2'),
(41, 'GUESS THE OUTPUT\r\n#include&ltstdio.h&gt\r\n#include&ltmath.h&gt\r\nInt main()\r\n{\r\n	float i=2.5;\r\n	printf(?%f%f?,floor(i),ceil(i));\r\n}\r\n', '2,3', '2.000000,3', '2.000000,0', '2,0', 'op3'),
(42, '#include&ltstdio.h&gt\r\nint main()\r\n{\r\n   int x;\r\nx=5;\r\nx=10;\r\nprintf("%d %d",x,x);\r\n}\r\nPredict the output :', '5,5  ', '10,10', '10,5', '10,5', 'op2'),
(43, 'WHAT WILL BE THE OUTPUT?\r\n#include&ltstdio.h&gt\r\nint  main()\r\n{\r\n	int arr[1]={12};\r\n	printf(?%d?,0[arr]);\r\n}\r\n', '1', '10', '0', '6', 'op2'),
(44, 'INTEGER DIVISION IN C RETURNS:', 'rounding', 'overflow', 'truncation', 'none', 'op3'),
(45, 'GUESS THE OUTPUT\r\n#include&ltstdio.h&gt\r\nInt main()\r\n{\r\n	int i=0;\r\n	for(;i<=5;i++);\r\n	printf(?%d?,i);\r\n}\r\n', '0,1,2,3,4,5', '5', '1,2,3', '6', 'op4'),
(46, '#include&ltstdio.h&gt\r\nint main()\r\n{\r\n   int num=0;\r\nif (!(!num)==num)\r\n printf("hello");\r\nelse\r\nprintf("world");\r\n}\r\nGuess the output !', 'hello', 'world', 'hello  world', 'ERROR', 'op3'),
(47, 'WHAT WILL BE THE OUTPUT OF PROGRAM?\r\n(ASSUME ARRAY BEGINS AT LOCATION 1002 AND SIZE OF INTEGER IS 4bytes)\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n	int a[3][4]={1,2,3,4,5,6,7,8,9,10,11,12};\r\n	printf(?%u %u %u?,a[0]+1,*(a[0]+1),*(*(a+0)+1));\r\n}\r\n', '448,4,4', '520,2,2', '1006,2,2', 'ERROR', 'op3'),
(48, 'WHAT WILL BE THE OUTPUT?\r\n#include&ltstdio.h&gt\r\nInt main()\r\n{\r\n	int a=500,b=100,c;\r\n	if(!a>=500)\r\n	b=300;\r\n	c=200; \r\n	printf(?b=%d c=%d,b,c);\r\n}\r\n', 'b=300,c=200', 'b=100,c=garbage', 'b=300,c=garbage', 'b=100,c=200', 'op4'),
(49, 'what will be the output of the program?\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n	int  x=10,y=20;\r\n	if(!(!x)&&x)\r\n	printf(?x=%d?,x);\r\nelse\r\nprintf(?y=%d?,y);\r\n}\r\n', 'y=20', 'x=0', 'x=10', 'x=1', 'op3'),
(50, 'Output og this snippet will be ?\r\nvoid main()\r\n{\r\n	char ch;\r\n	int in = 65;\r\n	int out =2;\r\n	ch= in* out;\r\n	printf("%d %d ", in*out,ch);\r\n}', '130 130', '130 -130', '130 -126', '130 126', 'op3');

-- --------------------------------------------------------

--
-- Table structure for table `table5`
--

CREATE TABLE IF NOT EXISTS `table5` (
  `number` int(3) NOT NULL,
  `question` varchar(1000) NOT NULL,
  `o1` varchar(500) NOT NULL,
  `o2` varchar(500) NOT NULL,
  `o3` varchar(500) NOT NULL,
  `o4` varchar(500) NOT NULL,
  `answer` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table5`
--

INSERT INTO `table5` (`number`, `question`, `o1`, `o2`, `o3`, `o4`, `answer`) VALUES
(51, 'int i;\r\nint** matrix = (int**) malloc(sizeof(int*) * 3);\r\nfor (i = 0; i < 3; i++)\r\n	*(matrix + i) = (int*) malloc(sizeof(int) * 3);\r\n\r\nHow much memory is allocated to matrix?\r\nGiven data-\r\nsizeof(int) = 4 bytes\r\nsizeof(int*) = 8 bytes', '24 bytes', '36 bytes', '60 bytes', '8 bytes', 'op1'),
(1, 'Predict the output -\n\n#include&ltstdio.h&gt\n#include&ltstdlib.h&gt\nint main()\n{\n    int *p = (int *)malloc(20); /* Assume p has address of 1718 */\n    free(p);\n    printf("%u", p);\n    return 0;\n}', '1718', '0', 'Compile time error', 'Segmentation Fault', 'op1'),
(2, 'Predict the output of the following program -\n\n#include&ltstdio.h&gt\nint main()\n{\n    int arr[] = {0,20,5,40,7};\n    int i;\n    int *k = arr;\n    for(i=0; i<5; i++)\n        printf("%d ", *k++);\n    k = arr;\n    printf("\\n");\n    for(i=0; i<5; i++)\n    {\n        printf("%d ", *k);\n        k++;\n    }\n    return 0;\n}', '0 20 5 40 7\r\n0 20 5 40 7', '0 20 5 40 7\r\n1 21 5 41 7', '0 1 2 3 4\r\n5 20 2 40 7', 'None of the above', 'op1'),
(3, 'Find the output -\r\n\r\n#include&ltstdio.h&gt\r\n#include&ltstring.h&gt\r\nchar* fun()\r\n{\r\n    char buffer[30];\r\n    strcpy(buffer, "RAM");\r\n    return buffer;\r\n}\r\nint main()\r\n{\r\n    char *s;\r\n    s = fun();\r\n    printf("%s\\n", s);\r\n    return 0;\r\n}', 'Compile time error', 'RAM', '0xffff', 'Garbage value', 'op4'),
(4, 'Which bitwise operator is most suitable for turning off the bits of an integer (i.e. changing bits to 0)?', '^ operator', '~ operator', '| operator', '& operator', 'op4'),
(5, 'Assuming that f1, f2 and f3 are user defined functions, which of the following is the correct order of calling functions in the below code?\r\n\r\na = f1(2,3) + f2(12*3) / f3(3,4,5)', 'f1, f2, f3', 'f2, f3, f1', 'f3, f2, f1', 'Order may vary from compiler to compiler', 'op4'),
(6, 'Predict the output of the following snippet -\r\n\r\nint main()\r\n{\r\n    extern int a;\r\n    printf("%d\\n", a);\r\n}\r\nint a = 20;', '20', 'Garbage value', 'Compile time error', '0', 'op1'),
(7, 'Predict the output-\n\n#include&ltstdio.h&gt\nmain()\n{\n    int n = 0, m = 0;\n    if (n > 0)\n        if (m > 0)\n            printf("True");\n    else \n        printf("False");\n}', 'No output', 'True', 'False', 'None of the above', 'op1'),
(8, 'Which of the following cannot be a structure member?', 'Another structure', 'Array', 'Function', 'All of the above can be structure members', 'op3'),
(9, 'Pridict the output :\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    int i;\r\n    i = 1, 2, 3;         \r\n    printf("i = %d\\n", i);\r\n \r\n    getchar();\r\n    return 0;\r\n', '1', '2', '4', '3', 'op1'),
(10, 'Pridict the output :\r\n\r\n#include&ltstdio.h&gt\r\n#include&ltstring.h&gt\r\n \r\nint main()\r\n{\r\n    printf("ASCI size = %d \\n\\n", sizeof("ASCI"));\r\n    printf("ALGORHYTHM length = %d \\n", strlen("ALGORHYTHM"));\r\n    return 0;\r\n}\r\n', 'ACSI size = 5\r\nALGORHYTHM = 10', 'ACSI size = 5\r\nALGORHYTHM = 11\r\n', 'ACSI size = ASCI\r\nALGORHYTHM = ALGORHYTHM\r\n', 'ACSI size = 4\r\nALGORHYTHM = 11\r\n', 'op1'),
(11, ' Consider the following pseudo code. What is the total number of multiplications to be performed?\r\nD = 2\r\nfor i = 1 to n do\r\n   for j = i to n do\r\n      for k = j + 1 to n do\r\n           D = D * 3 \r\n', 'Half of the product of the 3 consecutive integers', 'One-third of the product of the 3 consecutive integers.', 'One-sixth of the product of the 3 consecutive integers.', 'None of the above.', 'op3'),
(12, 'struct node \r\n{ \r\n   int i; \r\n   float j; \r\n}; \r\nstruct node *s[10]\r\nThe above C declaration define ?s? to be \r\n', 'An array, each element of which is a pointer to a structure of type node', 'A structure of 2 fields, each field being a pointer to an array of 10 elements', 'A structure of 3 fields: an integer, a float, and an array of 10 elements', 'An array, each element of which is a structure of type node.', 'op1'),
(13, 'Output of following program?\r\n#include&ltstdio.h&gt\r\n \r\nint main()\r\n{\r\n    int *ptr;\r\n    int x;\r\n \r\n    ptr = &x;\r\n    *ptr = 0;\r\n \r\n    printf(" x = %d\\n", x);\r\n    printf(" *ptr = %d\\n", *ptr);\r\n \r\n    *ptr += 5;\r\n    printf(" x  = %d\\n", x);\r\n    printf(" *ptr = %d\\n", *ptr);\r\n \r\n    (*ptr)++;\r\n    printf(" x = %d\\n", x);\r\n    printf(" *ptr = %d\\n", *ptr);\r\n \r\n    return 0;\r\n}\r\n', 'x = 0\r\n*ptr = 0\r\nx = 5\r\n*ptr = 5\r\nx = 6\r\n*ptr = 6\r\n', 'x = garbage value\r\n*ptr = 0\r\nx = garbage value\r\n*ptr = 5\r\nx = garbage value\r\n*ptr = 6\r\n', 'x = 0\r\n*ptr = 0\r\nx = 5\r\n*ptr = 5\r\nx = garbage value\r\n*ptr = garbage value\r\n', 'x = 0\r\n*ptr = 0\r\nx = 0\r\n*ptr = 0\r\nx = 0\r\n*ptr = 0\r\n', 'op1'),
(14, 'C = 100\r\nfor i = 1 to n do\r\n    for j = 1 to n do\r\n    {\r\n        Temp = A[i][j] + C\r\n        A[i][j] = A[j][i]\r\n        A[j][i] = Temp - C\r\n    }\r\nfor i = 1 to n do\r\n    for j = 1 to n do\r\n        Output(A[i][j]);\r\nWhat will be the output of the pseudo code ?', 'The matrix A itself', 'Transpose of matrix A', 'Adding 100 to the upper diagonal elements and subtracting 100 from diagonal elements of A', 'None of the above', 'op1'),
(15, 'If  the  sequence  of  operati ons  ­  push(1),   push(2),   pop,   push(1),   push(2),\r\npop,   pop,   pop,   push(2),   pop  are  performed  on  a  stack,   the  sequence  of\r\npopped  out  values  are  ?    \r\n', '2,   2,   1,   1,   2', '2,   2,   1,   2,   2', '2,   1,   2,   2,   1', '2,   1,   2,   2,   2', 'op1'),
(16, '#include&ltstdio.h&gt \r\nstruct st \r\n{ \r\n    int x; \r\n    struct st next; \r\n}; \r\n   \r\nint main() \r\n{ \r\n    struct st temp; \r\n    temp.x = 10; \r\n    temp.next = temp; \r\n    printf("%d", temp.next.x); \r\n    return 0; \r\n}\r\noutput?   ', 'Compiler Error\r\n\r\n', '10', 'Runtime Error', 'Garbage Value', 'op1'),
(17, 'Which of the following operators can be applied on structure variables?', 'Equality comparison ( == )', 'Assignment ( = )', 'Both of the above', 'None of the above', 'op2'),
(18, 'Consider a compiler where int takes 4 bytes, char takes 1 byte and pointer takes 4 bytes.\r\n#include&ltstdio.h&gt\r\n \r\nint main()\r\n{\r\n    int arri[] = {1, 2 ,3};\r\n    int *ptri = arri;\r\n \r\n    char arrc[] = {1, 2 ,3};\r\n    char *ptrc = arrc;\r\n \r\n    printf("sizeof arri[] = %d ", sizeof(arri));\r\n    printf("sizeof ptri = %d ", sizeof(ptri));\r\n \r\n    printf("sizeof arrc[] = %d ", sizeof(arrc));\r\n    printf("sizeof ptrc = %d ", sizeof(ptrc));\r\n \r\n    return 0;\r\n}\r\n', 'sizeof arri[] = 3\r\nsizeof ptri = 4\r\nsizeof arrc[] = 3\r\nsizeof ptrc = 4\r\n', 'sizeof arri[] = 12\r\nsizeof ptri = 4\r\nsizeof arrc[] = 3\r\nsizeof ptrc = 1\r\n', 'sizeof arri[] = 3\r\nsizeof ptri = 4\r\nsizeof arrc[] = 3\r\nsizeof ptrc = 1\r\n', 'sizeof arri[] = 12\r\nsizeof ptri = 4\r\nsizeof arrc[] = 3\r\nsizeof ptrc = 4\r\n', 'op4'),
(19, '#include&ltstdio.h&gt\r\nstruct Point\r\n{\r\n  int x, y, z;\r\n};\r\n \r\nint main()\r\n{\r\n  struct Point p1 = {.y = 0, .z = 1, .x = 2};\r\n  printf("%d %d %d", p1.x, p1.y, p1.z);\r\n  return 0;\r\n}\r\n', 'Compiler Error', '2 0 1', '0 1 2', '2 1 0', 'op2'),
(20, 'Anyone of the followings can be used to declare a node for a singly linked list. If we use the first declaration, ?struct node * nodePtr;? would be used to declare pointer to a node. If we use the second declaration, ?NODEPTR nodePtr;? can be used to declare pointer to a node.\r\n/* First declaration */\r\nstruct node {\r\nint data;\r\nstruct node * nextPtr;\r\n};\r\n \r\n/* Second declaration */\r\ntypedef struct node{\r\nint data;\r\nNODEPTR nextPtr;\r\n} * NODEPTR;\r\n', 'TRUE', 'FALSE', 'Both', 'None', 'op2'),
(21, 'With respect to the / operator and the % operator, \r\n', ' / has greater precedence than %', ' % has greater precedence than /', '/ and & have equal precedence', ' None of the above', 'op3'),
(22, ' Find the error -\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    int a, b;\r\n    a = b = 10;\r\n    printf("a = %d\\nb = %d\\n", a, b);\r\n    return 0;\r\n}', ' a = b = 10;', 'printf("a = %d\\nb = %d\\n", a, b);', ' Both a and b', ' No error', 'op4'),
(23, ' What is the default initial value of an auto variable?\r\n', '0', ' Garbage value', '0xFFFF', 'None of the above', 'op2'),
(24, '#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    int arr[] = {10, 20, 30, 40, 50, 60};\r\n    int *ptr1 = arr;\r\n    int *ptr2 = arr + 5;\r\n    printf("Number of elements between two pointer are: %d.", \r\n                                (ptr2 - ptr1));\r\n    printf("Number of bytes between two pointers are: %d",  \r\n                              (char*)ptr2 - (char*) ptr1);\r\n    return 0;\r\n}\r\nAssume that an int variable takes 4 bytes and a char variable takes 1 byte\r\n', 'Number of elements between two pointer are: 5.\r\nNumber of bytes between two pointers are: 20\r\n', 'Number of elements between two pointer are: 20.\r\nNumber of bytes between two pointers are: 20', 'Number of elements between two pointer are: 5.\r\nNumber of bytes between two pointers are: 5', 'Compiler Error', 'op1'),
(25, 'What is the default initial value of a static variable?\r\n', '0', 'Garbage value', '0xFFFF', ' None of the above', 'op1'),
(26, ' What is the default initial value of a register variable?\r\n', ' 0', ' Garbage value', ' 0xFFFF', 'None of the above', 'op2'),
(27, '6) What is the default initial value of a extern variable?\r\n', '0', ' Garbage value', ' 0xFFFF', 'None of the above', 'op1'),
(28, 'The reason for using pointers in a C program is', 'Pointers allow different functions to share and modify their local variables', 'To pass large structures so that complete copy of the structure can be avoided', 'Pointers enable complex ?linked? data structures like linked lists and binary trees', 'All of the above', 'op4'),
(29, 'The storage class of a variable can tell us -\r\n\r\n', ' Where it is stored', ' Its scope', ' Its default initial value', ' All of the above', 'op4'),
(30, ' What is the correct syntax for declaring a pointer to an integer pointer?\r\n', '** int myPtr;', ' int* myPtr;', 'int** myPtr;', ' int myPtr**;', 'op3'),
(31, ' Assuming that the gcc compiler is used, what value does sizeof(int) return?\r\n', '1', '2', '4', '8', 'op3'),
(32, 'Predict the output - \r\n\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    int a[5] = {1, 2, 3, 5, 5};\r\n    int i;\r\n    for (i = 0; i < 5; i++)\r\n    {\r\n        if ((char)a[i] == ''5'')\r\n            printf("%d ", a[i]);\r\n        else\r\n            printf("Not equal. ");\r\n    }\r\n    return 0;\r\n}', 'Compile time errror', 'Not equal. Not equal. Not equal. Not equal. Not equal.', ' Not equal. Not equal. Not equal. 5 5', ' 1 2 3 Not equal. Not equal.', 'op2'),
(33, 'For which datatype is the format identifier "%i" used?\r\n\r\n', 'int', 'float', ' double', ' unsigned int', 'op1'),
(34, ' What is the format identifier for the double datatype?\r\n\r\n', ' %d', ' %lf', ' %f', ' %ld', 'op3'),
(35, 'Predict the output -\r\n \r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    FILE* file = fopen("test.txt", "w");\r\n    char a;\r\n    putc(''a'', file);\r\n    putc(-1, file);\r\n    putc(''b'', file);\r\n    fclose(file);\r\n    file = fopen("test.txt", "r");\r\n    while ((a = getc(file)) != -1)\r\n    {\r\n        printf("%c ", a);\r\n    }\r\n    fclose(file);\r\n    return 0;\r\n}', ' a -1 c', 'Compile time error', 'Compiler dependent', ' a', 'op4'),
(36, 'Predict the output -\r\n \r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    FILE* file = fopen("test.txt", "w");\r\n    char a;\r\n    fprintf(file, "My name is Dennis Ritchie");\r\n    fclose(file);\r\n    file = fopen("test.txt", "w");\r\n    fprintf(file, "My name is Johnny");\r\n    fclose(file);\r\n    file = fopen("test.txt", "r");\r\n    while ((a = getc(file)) != EOF)\r\n    {\r\n        printf("%c", a);\r\n    }\r\n    fclose(file);\r\n    return 0;\r\n}', 'My name is Johnny', 'My name is Dennis RitchieMy name is Johnny', 'My name is Johnny Ritchie', 'My name is JohnnyMy name is Dennis Ritchie', 'op1'),
(37, 'What is the average time complexity of binary search?\r\n', ' O(n)', 'O(n * log n)', 'O(log n)', ' None of the above', 'op3'),
(38, 'Which of the following can be used to create user defined datatypes?\r\n', 'struct', 'enum', ' typedef', 'All of the above', 'op4'),
(39, ' When passed as parameters to a function, variables may be passed -\r\n', ' By value', 'By reference', ' Both a and b', 'None of the above', 'op3'),
(40, 'What is the output of the following program if it is executed from the command line as follows -\r\n\r\n$ ./a.out This is Czar\r\n\r\n#include&ltstdio.h&gt\r\nint main(int argc, char** argv)\r\n{\r\n    int i;\r\n    for (i = 0; i < argc; i++)\r\n        printf("%s ", argv[i]);\r\n    return 0;\r\n}\r\n', 'This is Czar', 'is Czar', 'Compile time error', './a.out This is Czar ', 'op4'),
(41, 'How to declare "A pointer to a function which receives an int pointer and returns float pointer".\r\n\r\na)\r\nb) \r\nc) \r\nD)', ' float *(*ptr)(int)', 'float *(ptr)*int;', 'float *(*ptr)(int)', ' float *(*ptr)(int*)', 'op4'),
(42, 'Predict the output -\r\n \r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    int i=-3, j=2, k=0, m;\r\n    m = ++i && ++j || ++k;\r\n    printf("%d, %d, %d, %d\\n", i, j, k, m);\r\n    return 0;\r\n}', '1, 2, 0, 1', '-2, 3, 0, 1', '-3, 2, 0, 1', '2, 3, 1, 1', 'op2'),
(43, 'What will be the output of the program if the array begins at 65472 and each integer occupies 2 bytes?\r\n\r\n#include&ltstdio.h&gt\r\n\r\nint main()\r\n{\r\n    int a[3][4] = {1, 2, 3, 4, 4, 3, 2, 1, 7, 8, 9, 0};\r\n    printf("%u, %u\\n", a+1, &a+1);\r\n    return 0;\r\n}', '65480, 65496', '65480, 65488', '65474, 65476	', '65474, 65488', 'op1'),
(44, ' Predict the output -\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    int a[5] = {5, 1, 15, 20, 25};\r\n    int i, j, m;\r\n    i = ++a[1];\r\n    j = a[1]++;\r\n    m = a[i++];\r\n    printf("%d, %d, %d", i, j, m);\r\n    return 0;\r\n}', '2, 1, 5', ' 1, 2, 15', '3, 2, 15', '2, 3, 20', 'op3'),
(45, 'Point out the error, if any in the following program.\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    void fun();\r\n    int i = 1;\r\n    while(i <= 5)\r\n    {\r\n        printf("%d\\n", i);\r\n        if(i>2)\r\n            goto here;\r\n    }\r\nreturn 0;\r\n}\r\nvoid fun()\r\n{\r\n    here:\r\n    printf("It works");\r\n}\r\n', 'No Error: prints "It works"', 'Error: goto cannot pass control to other function', 'Error: fun() cannot be accessed', 'Error: goto label must be before the goto statement', 'op2'),
(46, 'Point out the error, if any in the following program.\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    int i=1;\r\n    while(i>0)\r\n    {\r\n        printf("%d", i++);\r\n        if(i==5)\r\n          goto mylabel;\r\n    }\r\n    mylabel:\r\n    return 0;\r\n}', 'No Error: prints "1,2,3,4"', 'Error: goto cannot pass control to other function', 'Error: goto label must be before the goto statement', 'None of the above', 'op1'),
(47, ' Point out the error, if any in the program.\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    int i = 1;\r\n    switch(i)\r\n    {\r\n        printf("This is a C program.");\r\n        case 1:\r\n            printf("Case1");\r\n            break;\r\n        case 2:\r\n            printf("Case2");\r\n            break;\r\n    }\r\nreturn 0;\r\n}', 'Error: No default specified', 'Error: Invalid printf statement after switch statement', 'No Error and prints "Case1"', 'None of the above\r\n', 'op3'),
(48, 'Predict the output -\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    char str = "Bell";\r\n    printf("%s\\n", str);\r\n    return 0;\r\n}', ' B', ' Bell', ' 1', 'Compile time error', 'op4'),
(49, ' What does stderr stand for?\r\n', 'Standard Error', 'Standard Error Types', 'Standard Error Definitions', 'Standard Error Streams', 'op4'),
(50, 'In mathematics and computer programming, which is the correct order of mathematical operators ?\r\n', 'Exponent, Division, Multiplication, Addition', ' Division, Multiplication, Exponent, Addition', ' Addition, Exponent, Division, Multiplication', ' Division, Multiplication, Addition, Exponent', 'op1');

-- --------------------------------------------------------

--
-- Table structure for table `table6`
--

CREATE TABLE IF NOT EXISTS `table6` (
  `number` int(3) NOT NULL,
  `question` varchar(1000) NOT NULL,
  `o1` varchar(500) NOT NULL,
  `o2` varchar(500) NOT NULL,
  `o3` varchar(50) NOT NULL,
  `o4` varchar(500) NOT NULL,
  `answer` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table6`
--

INSERT INTO `table6` (`number`, `question`, `o1`, `o2`, `o3`, `o4`, `answer`) VALUES
(51, 'Predict the output -\r\n#include&ltstdio.h&gt\r\n#include&ltstdlib.h&gt\r\nint main()\r\n{\r\n    int *p=(int *)malloc(0);\r\n    printf("%u",p);\r\n    return 0;\r\n}', '1314', 'Segmentation Fault', 'Garbage Value', 'Random Address', 'op4'),
(1, 'Predict the output - \n\n#include&ltstdio.h&gt\nint main()\n{\n    printf("%d\\n", printf("%d ", printf("Hello "))); // Note the spaces after after %d and Hello\n    return 0;\n}', 'Hello 6 2', 'Hello 6 8', 'Hello 5 7', 'Compile time error', 'op1'),
(2, 'Which of the following cannot be static?', 'Variables', 'Functions', 'Structures', 'All of them can be static', 'op4'),
(3, 'Predict the output -\r\n\r\nint i = 011;\r\ni++;\r\nprintf("%d\\n", i);', '12', '012', '10', '011', 'op3'),
(4, '#include&ltstdio.h&gt\r\n#include&ltstdlib.h&gt\r\n\r\nint main()\r\n{\r\n    int *p;\r\n    p = (int*) malloc(256 * 256);\r\n    if(p == NULL)\r\n        printf("Allocation failed");\r\n    free(p);\r\n    return 0;\r\n}', '65536', '0', 'Compile time error', 'Run time error', 'op1'),
(5, 'What is the error in the following program?\r\n\r\n#include&ltstdio.h&gt\r\n#include&ltstdlib.h&gt\r\n\r\nint main()\r\n{\r\n    int *myArray[3];\r\n    myArray = (int*) malloc(sizeof(int)*3);\r\n    free(myArray);\r\n    return 0;\r\n}', 'We are unable to allocate memory', 'We cannot store the address of allocated memory in myArray', 'We are unable to free memory', 'No error', 'op2'),
(6, 'What will be the output of the following program?\r\n\r\n#include&ltstdio.h&gt\r\n#define do(int) printf("int=%d ", int);\r\n\r\nint main()\r\n{\r\n    int x=2, y=3, z=4;   \r\n    do(++x);\r\n    do(y++);\r\n    do(--z);\r\n    return 0;\r\n}', 'int=3 int=4 int=3', 'int=2 int=3 int=4', 'int=3 int=3 int=3', 'Compile time error : Cannot use a keyword as a macro name.', 'op3'),
(7, 'If you pass an array as an argument to a function, what gets passed actually?', 'First element of the array', 'Sum of all elements of the array', 'Base address of the array', 'Address of the last element of the array', 'op3'),
(8, 'Predict the output -\r\n\r\n#include&ltstdio.h&gt\r\nenum months {JAN = 3, FEB, MAR};\r\nint foo();\r\nint main()\r\n{\r\n    enum months i = foo();\r\n    printf("%d\\n", i);\r\n}\r\nint foo()\r\n{\r\n    return MAR;\r\n}', '2', '5', 'Compiler dependent', 'Compile time error', 'op2'),
(9, 'Pridict the output :\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    int i;\r\n    i = (1, 2, 3);         \r\n    printf("i  = %d\\n", i);\r\n \r\n    getchar();\r\n     return 0;\r\n}\r\n', '1', '2', '4', '3', 'op4'),
(10, 'Pridict the output :\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n   int a = 10;\r\n   printf("%o %x", a, a);\r\n   return 0;\r\n}\r\n', '12 a', '10 10', '10', 'o a', 'op1'),
(11, '\r\nvoid swap(char *str1, char *str2)\r\n{\r\n  char *temp = str1;\r\n  str1 = str2;\r\n  str2 = temp;\r\n}  \r\n   \r\nint main()\r\n{\r\n  char *str1 = "ASCIs";\r\n  char *str2 = "Quiz";\r\n  swap(str1, str2);\r\n  printf("str1 is %s, str2 is %s", str1, str2);\r\n  return 0;\r\n}\r\n', ' str1 is Quiz, str2 is Geeks\r\n', 'str1 is Geeks, str2 is Quiz\r\n', 'str1 is Geeks, str2 is Geeks\r\n', 'str1 is Quiz, str2 is Quiz\r\n', 'op2'),
(12, 'int fun(char *str1)\r\n{\r\n  char *str2 = str1;\r\n  while(*++str1);\r\n  return (str1-str2);\r\n}\r\n \r\nint main()\r\n{\r\n  char *str = "ASCIsQuiz";\r\n  printf("%d", fun(str));\r\n  return 0;\r\n}\r\n', '10', '9', '8', 'Random Number', 'op2'),
(13, 'What does the following fragment of C-program print?\r\nchar c[] = "GATE2011"; \r\nchar *p =c; \r\nprintf("%s", p + p[3] - p[1]) ;\r\n', 'GATE2011', 'E2011', '2011', '011', 'op3'),
(14, '#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    char str[] = "ASCIsQuiz";\r\n    printf("%s %s %s\\n", &str[5], &5[str], str+5);\r\n    printf("%c %c %c\\n", *(str+6), str[6], 6[str]);\r\n    return 0;\r\n}\r\n', 'Runtime Error\r\n', 'Compiler Error\r\n ', 'uiz uiz uiz\r\nu u u\r\n', 'Quiz Quiz Quiz\r\nu u u\r\n', 'op4'),
(15, 'In below program, what would you put in place of ??? to print ?Quiz??\r\n#include&ltstdio.h&gt\r\nint main() \r\n{ \r\n  char arr[] = "ASCIsQuiz"; \r\n  printf("%s", ?); \r\n  return 0; \r\n}\r\n', 'arr', '(arr+5)\r\n', '(arr+4)', 'Not possible\r\n', 'op2'),
(16, 'Output?\r\nint main()\r\n{\r\n    char a[2][3][3] = {''A'',''S'',''C'',''I'',''Q'',''U'',''I'',''Z'',?Z?};\r\n    printf("%s ", **a);\r\n    return 0;\r\n}\r\n', ' Compiler Error\r\n', 'ASCIQUIZZ followed by garbage characters\r\n', 'ASCIQUIZZ\r\n', 'Runtime Error\r\n', 'op3'),
(17, 'Consider the following C program segment:\r\nchar p[20]; \r\nchar *s = "string"; \r\nint length = strlen(s); \r\nint i; \r\nfor (i = 0; i < length; i++) \r\n    p[i] = s[length ? i]; \r\nprintf("%s", p);\r\n\r\nThe output of the program is? ', 'gnirts', 'gnirt', 'string', 'no output is printed\r\n', 'op4'),
(18, '  \r\nvoid my_toUpper(char* str, int index)\r\n{\r\n    *(str + index) &= ~32;\r\n}\r\n  \r\nint main()\r\n{\r\n    char* arr = "ascisquiz";\r\n    my_toUpper(arr, 0);\r\n    my_toUpper(arr, 5);\r\n    printf("%s", arr);\r\n    return 0;\r\n}\r\n\r\n', 'AscisQuiz', 'ascissquiz', 'Compiler dependent', 'Aszis Quiz', 'op3'),
(19, 'Predict the output of the following program:\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    char str[] = "%d %c", arr[] = "ASCIsQuiz";\r\n    printf(str, 0[arr], 2[arr + 3]);\r\n    return 0;\r\n}\r\n', 'G Q\r\n', '71 81\r\n', '71 Q\r\n', 'Compile-time error', 'op3'),
(20, 'Consider the following C program segment.\r\n# include <stdio.h>\r\nint main( )\r\n{\r\n    char s1[7] = "1234", *p;\r\n    p = s1 + 2;\r\n    *p = ''0'' ;\r\n    printf ("%s", s1);\r\n}\r\n\r\nWhat will be printed by the program?\r\n\r\n', '12', '120400', '1204', '1034', 'op3'),
(21, 'struct { \r\n    short s[5];\r\n    union { \r\n         float y; \r\n         long z; \r\n    }u; \r\n} t;\r\nAssume that objects of the type short, float and long occupy 2 bytes, 4 bytes and 8 bytes, respectively. The memory requirement for variable t, ignoring alignment considerations, is \r\n', '22 bytes', '14 bytes', '18 bytes', '10 bytes', 'op3'),
(22, ' Find the error -\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    unsigned int a, b, c, d;\r\n    a = b = c = d = 32;\r\n    a <<= 2;\r\n    b ^= 2;\r\n    c |= 2;\r\n    d ~= 2;\r\n    printf("%x %x %x %x\\n", a, b, c, d);\r\n    return 0;\r\n}', 'unsigned int a = b = c = d = 32', 'printf() statement', 'd ~= 2', 'No error', 'op3'),
(23, 'Predict the output -\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    auto pi = 3.14;\r\n    auto pi2 = 3.14f;\r\n    printf("%d, %d\\n", sizeof(pi), sizeof(pi2));\r\n    return 0;\r\n}\r\n(Given - sizeof(char) = 1, sizeof(int) = 4, sizeof(float) = 4, sizeof(double) = 8)\r\n', '8, 4\r\n', '4, 4\r\n', '4, 8\r\n', 'Compile time error\r\n', 'op3'),
(24, 'Predict the output -\r\n\r\n#include&ltstdio.h&gt\r\n#include&ltmath.h&gt\r\nint main()\r\n{\r\n    float n = -1.54;\r\n    printf("%.2f, %.2f\\n", ceil(n), floor(n));\r\n    return 0;\r\n}\r\n', '-2.00, -1.00\r\n', '-1.50, -1.50', '-1.00, -2.00\r\n', 'Compile time error', 'op3'),
(25, 'What does the following declaration mean?\r\nvoid (*cmp)();\r\n	\r\n', ' cmp is a pointer to an void function type.', ' cmp is a void type pointer function.', 'cmp is a function that return a void pointer.', 'cmp is a pointer to a function which returns void.', 'op4'),
(26, 'Every C program must contain at least ____ preprocessor directive(s).\r\n\r\n', '1', '2', '3', ' None of the above', 'op4'),
(27, 'What will be the contents of file.txt after the execution of this program?\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    FILE *fp1, *fp2;\r\n    fp1=fopen("file.txt", "w");\r\n    fp2=fopen("file.txt", "w");\r\n    fputc(''A'', fp1);\r\n    fputc(''B'', fp2);\r\n    fclose(fp1);\r\n    fclose(fp2);\r\n    return 0;\r\n}\r\n\r\n', 'A', 'B', 'AB', 'Compile time error', 'op2'),
(28, 'What will be the contents of file.txt after the execution of this program?\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    FILE *fp1, *fp2;\r\n    fp1=fopen("file.txt", "a");\r\n    fp2=fopen("file.txt", "a");\r\n    fputc(''A'', fp1);\r\n    fputc(''B'', fp2);\r\n    fclose(fp1);\r\n    fclose(fp2);\r\n    return 0;\r\n}\r\n', 'A', 'B', 'AB', 'Compile time error\r\n', 'op3'),
(29, 'What is the output of the following program if it is executed from the command line as follows -\r\n\r\n$ ./sample.o one two three\r\n\r\n#include&ltstdio.h&gt\r\nint main(int argc, char *argv[])\r\n{\r\n    int i=0;\r\n    i+=strlen(argv[1]);\r\n    while(i>0)\r\n    {\r\n        printf("%c", argv[1][--i]);\r\n    }\r\n    return 0;\r\n}\r\n\r\n', 'three two one', 'eno\r\n', 'owt', 'o.elpmas/.\r\n', 'op2'),
(30, 'What is the output of the following program if it is executed from the command line as follows -\r\n\r\n$ ./sample.o friday tuesday saturday\r\n\r\n#include&ltstdio.h&gt\r\nint main(int argc, char *argv[])\r\n{\r\n    printf("%c", *++argv[2] );\r\n    return 0;\r\n}\r\na) s\r\nb) f\r\nC) u\r\nd) a\r\n', 's', 'f', 'u', 'a', 'op3'),
(31, 'Predict the output -\r\n(Given - sizeof(char) = 1, sizeof(int) = 4, sizeof(float) = 4, sizeof(double) = 8)\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    char ch = ''A'';\r\n    printf("%d, %d, %d", sizeof(ch), sizeof(''A''), sizeof(3.14));\r\n    return 0;\r\n}\r\n', '1, 4, 4\r\n', '1, 1, 4\r\n', '1, 1, 8\r\n', '1, 4, 8\r\n', 'op4'),
(32, 'Predict the output -\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    int x = 10, y = 20;\r\n    if(!(!x) && x)\r\n        printf("x = %d\\n", x);\r\n    else\r\n        printf("y = %d\\n", y);\r\n    return 0;\r\n}\r\n', 'x = 10\r\n', 'y = 20', 'x = 1\r\n', 'None of the above', 'op1'),
(33, 'Predict the output, if sizeof(int) = 4 bytes\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    int x = 10;\r\n    x = ~x;\r\n    printf("x = %u\\n", x);\r\n    return 0;\r\n}\r\n\r\n', 'x = -10\r\n', 'x = -11\r\n', 'x = 4294967285', 'Compile time error\r\n', 'op3'),
(34, 'Predict the output - (given that sizeof(unsigned int) = 4 bytes)\r\n\r\n#include&ltstdio.h&gt\r\nstruct status\r\n{\r\n    unsigned int poisoned : 1;\r\n    unsigned int burned : 1;\r\n    unsigned int asleep : 1;\r\n    unsigned int confused : 1;\r\n    unsigned int infatuated : 1;\r\n};\r\nint main()\r\n{\r\n    struct status pikachu;\r\n    printf("%d\\n", sizeof(pikachu));\r\n    return 0;\r\n}\r\n', '5', '20', 'Compile time error', 'None of the above', 'op4'),
(35, 'Which of the following statements obtains the remainder on dividing 6.5 by 2.3?\r\n \r\n', '6.5 % 2.3', 'fmod(6.5, 2.3)', 'modf(6.5, 2.3)', 'None of the above', 'op2'),
(36, 'Predict the output -\r\n\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n    printf("%d %d\\n", 16<<1, 16<<0);\r\n    printf("%d %d\\n", 16<<-1, 16<<-0);\r\n    printf("%d %d\\n", 16>>1, 16>>0);\r\n    printf("%d %d\\n", 16>>-1, 16>>-0);\r\n    return 0;\r\n}\r\n', '8 16\r\n32 16\r\n32 16\r\n8 16\r\n', 'Garbage values', '32 16\r\n0 16\r\n8 16\r\n0 16\r\n', '32 16\r\n8 16\r\n8 16\r\n32 16\r\n', 'op3'),
(37, 'A floating point argument when passed from the command line is treated as a(n) -\r\n', 'integer', ' float', 'string', 'double', 'op3'),
(38, '#include&ltstdio.h&gt\r\n     struct  name\r\n     {\r\n		Char name[10]=?dinesh?;\r\n	};\r\n	int main()\r\n	{\r\n			name n;\r\n			printf(?%s?,n.name);\r\n       }\r\n', 'dinesh', 'garbage value', 'runtime error', 'compile time error', 'op4'),
(39, 'what will be the output of the program?\r\n#include&ltstdio.h&gt\r\nInt main()\r\n{\r\n	Char *str;\r\n	str=?%d\\n?; \r\n	str++;\r\n	str++;\r\n	printf(str-2,300);\r\n}\r\n', 'NO OUTPUT', '30', '3', '300', 'op4'),
(40, 'Predict output:\r\n#include&ltstdio.h&gt\r\nint  main()\r\n{\r\n    extern   int  a;\r\n   printf("%d",a);\r\n}\r\nint   a=20;\r\n\r\n', '0', 'garbage value', '20', 'error', 'op3'),
(41, 'Predict the output:\r\n\r\nint  main()\r\n{\r\n  int  a[4]={1,2};\r\nprintf("%d    %d",a[2],a[3]);\r\n}\r\n', '2,1', '1,2', '0,0', 'garbage value', 'op3'),
(42, 'WHAT WILL BE THE OUTPUT OF THE PROGRAM\r\n#include&ltstdio.h&gt\r\n{\r\n	int k=1;\r\n	printf(?%d==1 is??%s\\n?,k,k==1??true?:?false?);\r\n}\r\n', 'k==1 is true ', '1==1 is true', '1==1 is false', 'k==1 is false', 'op2'),
(43, 'Predict the output:\r\n\r\nint   main()\r\n{\r\n    char   *str;\r\n\r\nstr="%s";\r\n\r\nprintf(str,"k\\n");\r\n}\r\n', 'error', 'no  output', '%s', 'k', 'op4'),
(44, 'Predict the output:\r\n\r\nint main()\r\n{\r\n    int k,num=30;\r\n\r\n   k=(num<10)?100:200;\r\n\r\nprintf("%d",num);\r\n}\r\n', '200', '100', 'garbage', '30', 'op4'),
(45, 'WHAT WILL BE THE OUTPUT OF THE PROGRAM?\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n	i=scanf(?%d%d?,&i,&i);\r\n	printf(?%d?,i);\r\n}\r\n', '1', '2', 'GARBAGE VALUE', 'ERROR CANNOT ASSIGN SCANF TO VARIABLE', 'op2'),
(46, 'Predict the output:\r\n\r\nint  main()\r\n{\r\n  struct student\r\n{\r\n   char name[10];\r\n   int age;\r\n   float marks;\r\n}\r\nstruct student s={"radha"};\r\nprintf("%d %f",s.age,s.marks);\r\n', '0,0.000000', 'garbage value', 'error', 'none', 'op1'),
(47, 'GUESS THE OUTPUT\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\nint i=-3,j=2,k=0,m;\r\nm=++i&&++j&&++k;\r\nprintf(?%d%d%d%d?,i,j,k,m);\r\n}\r\n', '.-2,3,1,1', '2,3,1,2', '1,2,3,1', '3,3,1,2', 'op1'),
(48, 'Which bitwise operator is suitable for turning on a particular bit in a number?', '&& OPERATOR', '&  OPERATOR', '|| OPERATOR', '|  OPERATOR', 'op4'),
(49, 'WHAT WILL BE THE OUTPUT OF THE PROGRAM?\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n	int x=4,y,z;\r\n	y=--x;\r\n	z=x--;\r\n	printf(?%d%d%d?,x,y,z);\r\n}\r\n', '4,3,3', '4,3,2', '3,3,2', '2,3,3', 'op4'),
(50, ' GUESS THE OUTPUT\r\n#include&ltstdio.h&gt\r\nint main()\r\n{\r\n	int a[5]={2,3};\r\n	printf(?%d%d%d?,a[2],a[3],a[4]);\r\n}\r\n', 'GARBAGE VALUE', '2,3,3', '3,2,2', '0,0,0', 'op4');

-- --------------------------------------------------------

--
-- Table structure for table `table7`
--

CREATE TABLE IF NOT EXISTS `table7` (
  `number` int(3) NOT NULL,
  `question` varchar(1000) NOT NULL,
  `o1` varchar(500) NOT NULL,
  `o2` varchar(500) NOT NULL,
  `o3` varchar(500) NOT NULL,
  `o4` varchar(500) NOT NULL,
  `answer` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table7`
--

INSERT INTO `table7` (`number`, `question`, `o1`, `o2`, `o3`, `o4`, `answer`) VALUES
(22, 'Assuming, integer is 2 byte, What will be the output of the program?\r\n#include<stdio.h>\r\nint main()\r\n{\r\n    printf("%x\\n", -1>>1);\r\n    return 0;\r\n}', 'ffff		  ', '0fff				  ', '0000				  ', 'fff0				  ', 'op1'),
(1, 'Predict the output -\r\n\r\n#include <stdio.h>\r\nint main()\r\n{\r\n    int a = 10, b = 6, c = 0, d;\r\n    d = a++ && b-- || ++c;\r\n    printf("%d %d %d %d", a, b, c, d);\r\n}', '11 5 0 1', '11 5 1 1', '11 5 0 3', '11 5 1 3', 'op1'),
(2, 'Predict the output -\r\n\r\n#include <stdio.h>\r\nint main()\r\n{\r\n    int i = 011;\r\n    i++;\r\n    printf("%d\\n", i);\r\n    return 0;\r\n}', '011', '10', '012', '12', 'op2'),
(3, 'Find the output -\r\n#include <stdio.h>\r\n#define FUN(arg) do\\\r\n                 {\\\r\n                    if(arg)\\\r\n                        printf("Macro...\\n");\\\r\n                  }while(--i)\r\n\r\nint main()\r\n{\r\n    int i=2;\r\n    FUN(i<3);\r\n    return 0;\r\n}', 'Macro...', 'Macro...\r\nMacro...', 'Compile time error', 'Macro...\r\nMacro...\r\nMacro...', 'op2'),
(4, 'Which of the following cannot be a structure member?', 'Function', 'Array', 'Another structure', 'All of the above can be structure members', 'op1'),
(5, 'Find the correct error statement\r\n#include<stdio.h>\r\n#include<stdlib.h>\r\n\r\nint main()\r\n{\r\n    int *a[3];\r\n    a = (int*) malloc(sizeof(int)*3);\r\n    free(a);\r\n    return 0;\r\n}', 'Error: unable to allocate memory', 'Error: We cannot store address of allocated memory in a', 'Error: unable to free memory', 'No error', 'op2'),
(6, 'which set off statements correctly print the p array?\r\n#include<stdio.h>\r\n#include<stdlib.h>\r\n\r\nint main()\r\n{\r\n    int i, j;\r\n    int(*p)[3];\r\n    p = (int(*)[3])malloc(3*sizeof(*p));\r\n    return 0;\r\n}', 'for(i=0; i<3; i++)\r\n{\r\n    for(j=0; j<3; j++)\r\n        printf("%d", p[i+j]);\r\n}', 'for(i=0; i<3; i++)\r\n    printf("%d", p[i]);\r\n', 'for(i=0; i<3; i++)\r\n{\r\n    for(j=0; j<3; j++)\r\n        printf("%d", p[i][j]);\r\n}', 'for(j=0; j<3; j++)\r\n    printf("%d", p[i][j]);', 'op3'),
(7, '#include<stdio.h>\r\n\r\nint main()\r\n{\r\n    union a\r\n    {\r\n        int i;\r\n        char ch[2];\r\n    };\r\n    union a u;\r\n    u.ch[0]=3;\r\n    u.ch[1]=2;\r\n    printf("%d, %d, %d\\n", u.ch[0], u.ch[1], u.i);\r\n    return 0;\r\n}\r\n', '3, 2, 2130510339', '515, 2, 3', '3, 2, 5', '515, 515, 4', 'op1'),
(8, 'What will be the output of the program ?\r\n#include<stdio.h>\r\n\r\nint main()\r\n{\r\n    struct value\r\n    {\r\n        int bit1:1;\r\n        int bit3:4;\r\n        int bit4:4;\r\n    }bit={1, 2, 13};\r\n\r\n    printf("%d, %d, %d\\n", bit.bit1, bit.bit3, bit.bit4);\r\n    return 0;\r\n}\r\n', '1, 2, 13', '1, 4, 4', '-1, 2, -3', '-1, -2, -13', 'op3'),
(9, 'What will be the output of the program in 16 bit platform (Turbo C under 64 bit DOS)?\r\n\r\n#include<stdio.h>\r\n\r\nint main()\r\n{\r\n    struct value\r\n    {\r\n        int bit1:1;\r\n        int bit3:4;\r\n        int bit4:4;\r\n    }bit;\r\n    printf("%d\\n", sizeof(bit));\r\n    return 0;\r\n}\r\n', '1', '2', '4', '9', 'op3'),
(10, 'Null Macro is defined by?', '\\0', '((void*) 0)', '-1', 'None of the above', 'op2'),
(11, 'How many bytes are occupied by near, far and huge pointers (DOS)?', 'near=2 far=4 huge=4', 'near=4 far=8 huge=8', 'near=2 far=4 huge=8', 'near=4 far=4 huge=8', 'op1'),
(12, 'What would be the equivalent pointer expression for referring the array element a[i][j][k][l]', '((((a+i)+j)+k)+l)', '*(*(*(*(a+i)+j)+k)+l)', '(((a+i)+j)+k+l)', '((a+i)+j+k+l)', 'op2'),
(13, '#include<stdio.h>\r\n\r\nint main()\r\n{\r\n    static char *s[] = {"black", "white", "pink", "violet"};\r\n    char **ptr[] = {s+3, s+2, s+1, s}, ***p;\r\n    p = ptr;\r\n    ++p;\r\n    printf("%s", **p+1);\r\n    return 0;\r\n}\r\n', 'ink', 'ack', 'ite', 'let', 'op1'),
(14, '#include<stdio.h>\r\n\r\nint main()\r\n{\r\n    void *vp;\r\n    char ch=74, *cp="JACK";\r\n    int j=65;\r\n    vp=&ch;\r\n    printf("%c", *(char*)vp);\r\n    vp=&j;\r\n    printf("%c", *(int*)vp);\r\n    vp=cp;\r\n    printf("%s", (char*)vp+2);\r\n    return 0;\r\n}', 'JCK', 'J65K', 'JAK', 'JACK', 'op4'),
(15, '#include<stdio.h>\r\n\r\nint main()\r\n{\r\n    void *vp;\r\n    char ch=74, *cp="JACK";\r\n    int j=65;\r\n    vp=&ch;\r\n    printf("%c", *(char*)vp);\r\n    vp=&j;\r\n    printf("%c", *(int*)vp);\r\n    vp=cp;\r\n    printf("%s", (char*)vp+2);\r\n    return 0;\r\n}\r\n', 'JCK', 'J65K', 'JAK', 'JACK', 'op4'),
(16, 'Which of the following statements correctly declare a function that receives a pointer to pointer to a pointer to a float and returns a pointer to a pointer to a pointer to a pointer to a float?', 'float **fun(float***);', 'float *fun(float**);', 'float fun(float***);', 'float ****fun(float***);', 'op4'),
(17, 'int main()\r\n{\r\n    float a=3.14;\r\n    char *j;\r\n    j = (char*)&a;\r\n    printf("%d\\n", *j);\r\n    return 0;\r\n}', 'It prints ASCII value of the binary number present in the first byte of a float variable a.', 'It prints character equivalent of the binary number present in the first byte of a float variable a.', 'Error', 'It will print a garbage value', 'op1'),
(18, 'In the following program add a statement in the function fun() such that address of a gets stored in j?\r\n#include<stdio.h>\r\nint main()\r\n{\r\n    int *j;\r\n    void fun(int**);\r\n    fun(&j);\r\n    return 0;\r\n}\r\nvoid fun(int **k)\r\n{\r\n    int a=10;\r\n    /* Add a statement here */\r\n}', '**k=a;', 'k=&a;', '*k=&a', '&k=*a', 'op3'),
(19, 'Which of the statements is correct about the program?\r\n#include<stdio.h>\r\n\r\nint main()\r\n{\r\n    int arr[3][3] = {1, 2, 3, 4};\r\n    printf("%d\\n", *(*(*(arr))));\r\n    return 0;\r\n}', 'Output: Garbage value', 'Output: 1', 'Output: 3', 'Error: Invalid indirection', 'op4'),
(20, 'What is the output of the following C code? Assume that the address of x is 2000 (in decimal) and an integer requires four bytes of memory.\r\n#include &ltstdio.h&gt\r\nint main()\r\n{ \r\n   unsigned int x[4][3] = {{1, 2, 3}, {4, 5, 6}, \r\n                          {7, 8, 9}, {10, 11, 12}};\r\n   printf("%u, %u, %u", x+3, *(x+3), *(x+2)+3);\r\n}\r\n\r\n', '2036, 2036, 2036', '2012, 4, 2204', ' 2036, 10, 10', '2012, 4, 6', 'op1'),
(21, 'Which of the following best describes C language???', 'C is a low level language', 'C is a high level language with features that support low level programming', 'C is a high level language', 'C is a very high level language', 'op2');

-- --------------------------------------------------------

--
-- Table structure for table `table8`
--

CREATE TABLE IF NOT EXISTS `table8` (
  `number` int(3) NOT NULL,
  `question` varchar(1000) NOT NULL,
  `o1` varchar(500) NOT NULL,
  `o2` varchar(500) NOT NULL,
  `o3` varchar(500) NOT NULL,
  `o4` varchar(500) NOT NULL,
  `answer` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table8`
--

INSERT INTO `table8` (`number`, `question`, `o1`, `o2`, `o3`, `o4`, `answer`) VALUES
(21, 'int i;\r\nint** matrix = (int**) malloc(sizeof(int*) * 3);\r\nfor (i = 0; i < 3; i++)\r\n    *(matrix + i) = (int*) malloc(sizeof(int) * 3);\r\n\r\nHow much memory is allocated in all?\r\nGiven data-\r\nsizeof(int) = 4 bytes\r\nsizeof(int*) = 8 bytes', '24 bytes', '36 bytes', '60 bytes', '8 bytes', 'op3'),
(1, 'The correct way to generate numbers between min and max (both inclusive) is _____________.', 'min + (rand() % (max ? min));', 'rand(min, max);', 'min + (rand() % (max ? min + 1));', 'min + rand(max);', 'op3'),
(2, '#include <stdio.h>\r\nstruct p\r\n{\r\n    int k;\r\n    char c;\r\n    float f;\r\n};\r\nint main()\r\n{\r\n    struct p x = {.c = 97, .f = 3, .k = 1};\r\n    printf("%f\\n", x.f);\r\n}\r\n\r\nCan the above code be compiled successfully?', 'Yes', 'No', 'Depends on the platform', 'Depends on the standard', 'op4'),
(3, 'Is the code error  free?\r\n#include<stdio.h>\r\nint main()\r\n{\r\n    int a=10, *j;\r\n    void *k;\r\n    j=k=&a;\r\n    j++;\r\n    k++;\r\n    printf("%u %u\\n", j, k);\r\n    return 0;\r\n}\r\n', 'Yes', 'Run time error', 'Compile time error', 'Error free under DOS', 'op3'),
(4, 'Scope of varaiable having auto storage class lies within:', 'within the block/ function it has declared', 'throughout the function', 'global scope', 'none', 'op1'),
(5, 'What is the default storage class in C', 'Register', 'Extern', 'Auto', 'Static', 'op3'),
(6, 'what is amount of memeory allocated to variable i if this statement is executed ( under 64 bit machine)\r\n\r\nextern int i;', 'No memory;', '2 bytes', '4 bytes', '8 bytes', 'op1'),
(7, 'Scope of varaiable having extern  storage class lies within:', 'within the block/ function it has declared', 'throughout the function', 'global scope', 'none', 'op3'),
(8, 'Return type of getc() function when some error occurs is?', 'EOF', '0', '-1', 'None of the above', 'op1'),
(9, 'From where does the control read value of volatile variable?', 'Heap', 'Register', 'Main Memory', 'Stack', 'op3'),
(10, 'Stack unwinding deals with .....??? ', 'deals with polymorphism', 'deals with inheritance', 'deals with exception handing', 'deals with classes', 'op2'),
(11, 'Return type of  sscanf() function is?', 'Void', 'int', 'float', 'char', 'op2'),
(12, 'Which header file has macro definition of NULL?', 'stdio.h', 'stdlib.h', 'stddef.h', 'conio.h', 'op3'),
(13, 'If the file name is enclosed in double quotation marks then..', 'The preprocessor searches  file in current directory', 'The preprocessor searches  file in predefined path', 'The preprocessor searches  file in current directory and in predefined directory(if not found in dir)', 'None of the mentioned', 'op3'),
(14, 'Which of the following file extensions are accepted with #include?', '.h', '.in', '.com', 'All of the mentioned', 'op4'),
(15, 'In expression i = g() + f(), first function called depends on', 'Compiler', 'Associativiy of () operator', 'Precedence of () and + operator', 'Left to write of the expression', 'op1'),
(16, 'What is the output of this C code?\r\n	    #include <stdio.h>\r\n	    int main()\r\n	    {\r\n	        int i = 10;\r\n	        void *p = &i;\r\n	        printf("%f\\n", *(float*)p);\r\n	        return 0;\r\n    }\r\n', 'Compile time error', 'Undefined behaviour', '10', '0.000000', 'op4'),
(17, '\r\nWhat is the output of this C code?\r\n#include <stdio.h>\r\n2.	    void main()\r\n3.	    {\r\n4.	        char *s= "hello";\r\n5.	        char *p = s;\r\n6.	        printf("%c\\t%c", 1[p], s[1]);\r\n7.	    }\r\n', 'h h', 'Run time error', 'l l', 'e e', 'op4'),
(18, 'What is the output of this C code?\r\n1.	#include &ltstdio.h&gt\r\n2.	    void foo( int[] );\r\n3.	    int main()\r\n4.	    {\r\n5.	        int ary[4] = {1, 2, 3, 4};\r\n6.	        foo(ary);\r\n7.	        printf("%d ", ary[0]);\r\n8.	    }\r\n9.	    void foo(int p[4])\r\n10.	    {\r\n11.	        int i = 10;\r\n12.	        p = &i;\r\n13.	        printf("%d ", p[0]);\r\n14.	    }', '10 10', 'Compile time error', '10 1', 'Undefined behaviour', 'op3'),
(19, 'What is the output of this C code?\r\n\r\n1.	#include &ltstdio.h&gt\r\n2.	    int main()\r\n3.	    {\r\n4.	        int ary[4] = {1, 2, 3, 4};\r\n5.	        int *p = ary + 3;\r\n6.	        printf("%d\\n", p[-2]);\r\n7.	    }\r\n', '1', '2', 'Compile time error', 'Some garbage value', 'op2'),
(20, '#include &ltstdlib.h&gt\r\nint main()\r\n{\r\n int *pInt;\r\n int **ppInt1;\r\n int **ppInt2;\r\n pInt = (int*)malloc(sizeof(int));\r\n ppInt1 = (int**)malloc(10*sizeof(int*));\r\n ppInt2 = (int**)malloc(10*sizeof(int*));\r\n free(pInt);\r\n free(ppInt1);\r\n free(*ppInt2);\r\n return 0;\r\n}\r\nChoose the correct statement w.r.t. above C program.\r\n', 'malloc() for ppInt1 and ppInt2 isn?t correct. It?ll give compile time error', 'free(*ppInt2) is not correct. It?ll give compile time error', ' free(*ppInt2) is not correct. It?ll give run time error.', 'No issue with any of the malloc() and free() i.e. no compile/run time error', 'op4');

-- --------------------------------------------------------

--
-- Table structure for table `table9`
--

CREATE TABLE IF NOT EXISTS `table9` (
  `number` int(3) NOT NULL,
  `question` varchar(1000) NOT NULL,
  `o1` varchar(500) NOT NULL,
  `o2` varchar(500) NOT NULL,
  `o3` varchar(500) NOT NULL,
  `o4` varchar(500) NOT NULL,
  `answer` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table9`
--

INSERT INTO `table9` (`number`, `question`, `o1`, `o2`, `o3`, `o4`, `answer`) VALUES
(51, 'Predict the output -\r\n\r\n#include <stdio.h>\r\n#define L 10\r\nint main()\r\n{\r\n    auto money=10;\r\n    switch(money,money*2)\r\n    {\r\n        case L:\r\n        printf("Willian");\r\n        break;\r\n        case L*2:\r\n        printf("Warren");\r\n        break;\r\n        case L*3:\r\n        printf("Carlos");\r\n        break;\r\n        default:\r\n        printf("Lawrence");\r\n        case L*4:\r\n        printf("Inqvar");\r\n        break;\r\n    }\r\n    return 0;\r\n}', 'Warren', 'Willian', 'Compile time error', 'None of the above', 'op1'),
(1, 'Which bitwise operator is most suitable for flipping (toggling) bits of an integer?', '& operator', '~ operator', '^ operator', '| operator', 'op3'),
(2, 'Assuming that f, g and h are user defined functions, which of the following is the correct order of calling functions in the below code?\r\n\r\na = f(3,5) + h(12*3) / g(3,4,5)', 'f, g, h', 'h, g, f', 'g, h, f', 'Order may vary from compiler to compiler', 'op4'),
(3, 'Which is the best way to generate random numbers between 0 and 99?', 'rand() - 100', 'rand() % 100', 'rand(100)', 'rand(99)', 'op2'),
(4, 'What is the output of the following code?\r\n\r\n#include <stdio.h>\r\nvoid foo(int k)\r\n{\r\n    printf("hi");\r\n}\r\nvoid foo(double k)\r\n{\r\n    printf("hello");\r\n}\r\nint main()\r\n{\r\n    foo(3);\r\n    return 0;\r\n}', 'hello', 'hi', 'No output', 'Compile time error', 'op4'),
(5, 'What is the output of the code given below?\r\n	    #include &ltstdio.h&gt\r\n	    int main()\r\n	    {\r\n	        int ary[4] = {1, 2, 3, 4};\r\n	        int *p = ary + 3;\r\n	        printf("%d %d\\n", p[-2], ary[*p]);\r\n	    }\r\n', '2 3', 'Compile time error', '2 4', '2 some garbage value', 'op4'),
(6, 'What is the output of this C code?\r\n	    #include &ltstdio.h&gt\r\n	    void main()\r\n	    {\r\n	        int k = 5;\r\n	        int *p = &k;\r\n	        int **m  = &p;\r\n	        printf("%d%d%d\\n", k, *p, **p);\r\n', '5 5 5', '5 5 junk value', '5 junk junk', 'Compile time error', 'op4'),
(7, 'C preprocessors can have compiler specific features', 'true', 'false', 'Depends on the standard', 'Depends on the platform', 'op1'),
(8, 'A preprocessor is a program ...', 'That processes its input data to produce output that is used as input to another program', 'That is nothing but a loader', 'That links various source files', 'All of the mentioned', 'op1'),
(9, 'What is the output of this printf() statement\r\n\r\n printf("%2d %c %4.2f",1234,''x'',456);', '1234 x 4.56', '1234 x 0.00', '12.34 x 4.56', 'None of the above', 'op2'),
(10, 'What will be the output of this printf() statement\r\n\r\nprintf("%d %d %d",1234,456);', 'Compile Time Error', 'Run time Error', '1234 456 garbage', 'None', 'op3'),
(11, 'What is output of the program\r\n#include &ltstdio.h&gt\r\n    int main()\r\n    {\r\n        int m, n ,p;\r\n        for(m=0;m<3;m++)\r\n        	for(n=0;n<3;n++)\r\n        		for(p=0;p<2;p++)\r\n        			if(m+n+p == 2)\r\n        				goto print;\r\n\r\n        print:\r\n		printf("%d %d %d", m, n, p);\r\n\r\n        return 0;\r\n    }\r\n', '2 0 0', '0 0 2', '0 1 1 ', '1 1 0', 'op3'),
(12, 'For 16-bit compiler allowable range for integer constants is ________?', '. -3.4e38 to 3.4e38', '. -32767 to 32768', '. -32668 to 32667', '. -32768 to 32767', 'op4'),
(13, 'Find the output of the following program.\r\nvoid main()\r\n{\r\n   int i=065, j=65;\r\n   printf("%d %d", i, j);\r\n}\r\n', '53 65', '65 65', '065 65', 'Syntax error', 'op1'),
(14, 'Find the output (64 bit machine)\r\n#include <stdio.h>\r\nvoid main()\r\n{\r\n	 char *str1 = "abcd";\r\n	      char str2[] = "abcd";\r\n	      printf("%d %d %d", sizeof(str1), sizeof(str2), sizeof("abcd"));\r\n}\r\n', '4 5 5', '2 4 4', '5 5 5', '2 4 5', 'op1'),
(15, 'Find the output\r\n#include <stdio.h>\r\nvoid main()\r\n{\r\n	 char *p;\r\n	      p = "Hello";\r\n	      printf("%c\\n",*&*p);\r\n}\r\n\r\n', 'Hello', 'H', 'Some address will be printed', 'None of these', 'op2'),
(16, 'What will be output if you will compile and execute the following c code?\r\n#include &ltstdio.h&gt\r\nvoid main(){\r\n   int i=320;\r\n   char *ptr=(char *)&i;\r\n   printf("%d",*ptr); \r\n}\r\n\r\n\r\n', '320', '1', '64', 'Compiler error', 'op3'),
(17, 'What will be output if you will compile and execute the following c code?\r\n#include &ltstdio.h&gt\r\nvoid main(){\r\nchar c=125;\r\n    c=c+10;\r\n    printf("%d",c); \r\n}\r\n', '135', '+INF', '-121', '-8', 'op3'),
(18, 'What will be output if you will compile and execute the following c code?\r\n#include &ltstdio.h&gt\r\nvoid main(){\r\n   float a=5.2;\r\n  if(a==5.2)\r\n     printf("Equal");\r\n  else if(a<5.2)\r\n     printf("Less than");\r\n  else\r\n     printf("Greater than"); \r\n}\r\n', 'Equal', 'Less than', 'Greater than', 'Compiler error', 'op2'),
(19, 'What will be output if you will compile and execute the following c code?\r\n#include &ltstdio.h&gt\r\nvoid main(){\r\n  int i=4,x;\r\n  x=++i + ++i + ++i;\r\n  printf("%d",x); \r\n}\r\n', '21', '18', '12', 'Compiler error	', 'op1'),
(20, 'Find the output.\r\n #include &ltstdio.h&gt\r\nvoid main()\r\n{\r\n int a=2;\r\n if(a==2){\r\n   a=~a+2<<1;\r\n   printf("%d",a);\r\n } else{\r\n  break;\r\n }\r\n', '-3', '-2', '1', 'Compiler error', 'op4'),
(21, 'What will be output if you will compile and execute the following c code?\r\n#include &ltstdio.h&gt\r\n#include &ltstring.h&gt\r\nvoid main(){\r\n   char *str=NULL;\r\n   strcpy(str,"cquestionbank");\r\n   printf("%s",str);\r\n}\r\n', 'cquestionbank', 'Compiler error', '(null)', 'It will print nothing', 'op3'),
(22, '#include &ltstdio.h&gt\r\n#include &ltstring.h&gt\r\nvoid main(){\r\n  int i=0;\r\n  for(;i<=2;)\r\n   printf(" %d",++i); \r\n}\r\n\r\n\r\n', '0 1 2', 'Infinite loop', '1 2 3', 'Compiler error', 'op3'),
(23, '#include &gtstdio.h&lt\r\n#define call(x,y) x##y\r\nvoid main(){\r\nint x=5,y=10,xy=20;\r\nprintf("%d",xy+call(x,y));\r\n}\r\n', '35', '510', '15', '40', 'op4'),
(24, '#include &gtstdio.h&lt\r\nint * call();\r\nvoid main(){\r\nint *ptr;\r\nptr=call();\r\nclrscr();\r\nprintf("%d",*ptr); \r\n}\r\nint * call(){\r\nint a=25;\r\na++;\r\nreturn &a;\r\n}\r\n', '25', '26', 'Any address', 'Error at runtime', 'op4'),
(25, 'Find the output\r\n#include &gtstdio.h&lt\r\nint * call();\r\nvoid main(){\r\n	int array[]={10,20,30,40};\r\n	printf("%d",-2[array]+-1[array]);\r\n}\r\n', '-60', '-50', '60', 'Garbage value', 'op2'),
(26, 'What will be output if you will compile and execute the following c code?\r\n#include &gtstdio.h&lt\r\nvoid main(){\r\nint i=10;\r\nstatic int x=i;\r\nif(x==i)\r\nprintf("Equal");\r\nelse if(x>i)\r\nprintf("Greater than");\r\nelse\r\nprintf("Less than");\r\n}\r\n', 'Equal', 'Greater than', 'Less than', 'Compiler error', 'op4'),
(27, 'What will be output if you will compile and execute the following c code?\r\n#include&ltstdio.h&gt\r\n#define max 5;\r\nvoid main(){\r\nint i=0;\r\ni=max+1;\r\nprintf("%d",i++);\r\n}\r\n', '5', '6', '7', 'Compile Error', 'op1'),
(28, 'What is the output of this C code?\r\n1.	    #include &ltstdio.h&gt\r\n2.	    void main()\r\n3.	    {\r\n4.	        int a = -5;\r\n5.	        int k = (a++, ++a);\r\n6.	        printf("%d\\n", k);\r\n7.	    }\r\n', '-3', '-5', '4', 'Undefined', 'op1'),
(29, 'What is the output of this C code?\r\n1.	    #include &ltstdio.h&gt\r\n2.	    int main()\r\n3.	    {\r\n4.	        int x = -2;\r\n5.	        x = x >> x;\r\n6.	        printf("%d\\n", x);\r\n7.	    }\r\n', '1', '-1', '2 ^ 31 ? 1 considering int to be 4 bytes', 'Either b or c', 'op2'),
(30, 'What is the output of this C code?\r\n1.	    #include &ltstdio.h&gt\r\n2.	    int main()\r\n3.	    {\r\n4.	        if (~0 == 1)\r\n5.	            printf("yes\\n");\r\n6.	        else\r\n7.	            printf("no\\n");\r\n8.	    }\r\n', 'Yes', 'No', 'Compile time error', 'Undefined', 'op2'),
(31, 'What is the output of this C code?\r\n1.	    #include &ltstdio.h&gt\r\n2.	    void main()\r\n3.	    {\r\n4.	        char a = ''a'';\r\n5.	        int x = (a % 10)++;\r\n6.	        printf("%d\\n", x);\r\n7.	    }\r\n', '6', 'Junk value', 'Compile time error', '7', 'op3'),
(32, 'What is the output of this C code?\r\n1.	    #include &ltstdio.h&gt\r\n2.	    int main()\r\n3.	    {\r\n4.	        int x = 2, y = 1;\r\n5.	        x *= x + y;\r\n6.	        printf("%d\\n", x);\r\n7.	        return 0;\r\n8.	    }\r\n', '5', '6', 'Undefined behaviour', 'Compile time error', 'op2'),
(33, 'What is the output of this C code?\r\n1.	    #include &ltstdio.h&gt\r\n2.	    int main()\r\n3.	    {\r\n4.	        int x = 2;\r\n5.	        x /= x / x;\r\n6.	        printf("%d\\n", x);\r\n7.	        return 0;\r\n8.	    }\r\n', '2', '1', '1.5', 'Undefined behaviour', 'op1'),
(34, 'Which of the following is the correct way to declare a function pointer named pMyFunc that returns an int and has an int parameter?', 'int pMyFunc(int));', 'int ()(int)* pMyFunc;', 'int (*pMyFunc)(int);', 'int *pMyFunc (int);', 'op3'),
(35, 'For the code below which lines should be reported as errors by a compiler?\r\n#include &ltstdio.h&gt\r\nint main(int argc, char** argv){\r\n\r\n  const char* foo = "wow";           // line 1\r\n  foo = "top";                       // line 2\r\n  foo[0] = 1;                        // line 3\r\n\r\n  return 0;\r\n}\r\n', 'line 2', 'line 3', 'lines 2 and 3', 'none of the lines', 'op2'),
(36, '#include &ltstdio.h&gt\r\n \r\n#define R 10\r\n#define C 20\r\n \r\nint main()\r\n{\r\n   int (*p)[R][C];\r\n   printf("%d",  sizeof(*p));\r\n   getchar();\r\n   return 0;\r\n}\r\n', '200', '20', '800', '80', 'op3'),
(37, '#include &ltstdio.h&gt\r\n#define PRINT(i, limit) do \\\r\n                        { \\\r\n                            if (i++ < limit) \\\r\n                            { \\\r\n                                printf("CZAR\\n"); \\\r\n                                continue; \\\r\n                            } \\\r\n                        }while(1)\r\n \r\nint main()\r\n{\r\n    PRINT(0, 3);\r\n    return 0;\r\n}\r\n\r\nHow many times CZAR is printed in the above program?\r\n', '1', '3', '4', 'Compile-time error', 'op4'),
(38, 'What is the default return-type of getchar()?', 'char', 'int ', 'char*', 'Reading character doesn?t require a return-type', 'op2'),
(39, 'void * malloc(size_t n) returns---??', 'Pointer to n bytes of uninitialized storage', 'NULL if the request cannot be satisfied', 'Nothing', 'Both a & b are true', 'op4'),
(40, 'calloc() returns a storage that is initialized to---?', 'Zero', 'Null', 'Nothing', 'One', 'op1'),
(41, 'Let x be an integer which can take a value of 0 or 1. The statement if(x = =0) x = 1; else x = 0; is equivalent to which one of the following?', 'x =x+1                                                     ', 'x =1-x', 'x =x-1', 'x =1%x', 'op2'),
(42, 'Which of the following is correct for ?typedef??', 'typedef can be used to alias compound data types such as struct and union', 'typedef can be used to alias both compound data types and pointer to these compound types', 'typedef can be used to alias a function pointer.', 'All of the above', 'op4'),
(43, 'Find the output\r\n#include &ltstdio.h&gt\r\nint main()\r\n{\r\n  printf("%d", main);  \r\n  return 0;\r\n}\r\n', 'Address of main function', ' Compiler Error', 'Runtime Error', 'Some random value', 'op1'),
(44, 'find the output\r\n#include &ltstdio.h&gt\r\n \r\nint main()\r\n{\r\n    int (*ptr)(int ) = fun;\r\n    (*ptr)(3);\r\n    return 0;\r\n}\r\n \r\nint fun(int n)\r\n{\r\n  for(;n > 0; n--)\r\n    printf("GeeksQuiz ");\r\n  return 0;\r\n}\r\n', 'GeeksQuiz GeeksQuiz GeeksQuiz', 'GeeksQuiz GeeksQuiz', 'Compiler Error', 'Runtime Error', 'op3'),
(45, '#include &ltstdio.h&gt\r\n#include &ltstdarg.h&gt\r\nint fun(int n, ...)\r\n{\r\n    int i, j = 1, val = 0;\r\n    va_list p;\r\n    va_start(p, n);\r\n    for (; j < n; ++j)\r\n    {\r\n        i = va_arg(p, int);\r\n        val += i;\r\n    }\r\n    va_end(p);\r\n    return val;\r\n}\r\nint main()\r\n{\r\n    printf("%d\\n", fun(4, 1, 2, 3));\r\n    return 0;\r\n}\r\n', '3', '5', '6', '10', 'op3'),
(46, 'The output of the following C program is __________.\r\n#include &ltstdio.h&gt\r\nvoid f1 (int a, int b)\r\n{\r\n  int c;\r\n  c=a; a=b; b=c;\r\n}\r\nvoid f2 (int *a, int *b)\r\n{\r\n  int c;\r\n  c=*a; *a=*b;*b=c;\r\n}\r\nint main()\r\n{\r\n  int a=4, b=5, c=6;\r\n  f1(a, b);\r\n  f2(&b, &c);\r\n  printf (?%d?, c-a-b);\r\n  return 0;\r\n}\r\n', '-5', '-4', '5', '3', 'op1'),
(47, 'What?s going to happen when we compile and run the following C program snippet?\r\n#include &ltstdio.h&gt\r\nint main()\r\n{\r\n int a = 10;\r\n int b = 15;\r\n \r\n printf("=%d",(a+1),(b=a+2));\r\n printf(" %d=",b);\r\n \r\n return 0;\r\n}\r\n', '=11 15=', '=11 12=', 'Compiler Error due to (b=a+2) in the first printf()', 'No compile error but output would be =11 X= where X would depend on compiler implementation', 'op2'),
(48, 'What is the return type of malloc() or calloc()??', 'void *', 'Pointer of allocated memory type', 'void **', 'int *', 'op1'),
(49, '#include &ltstdio.h&gt\r\nint main()\r\n{\r\n    int *p = (int *)malloc(sizeof(int));\r\n \r\n    p = NULL;\r\n \r\n    free(p);\r\n}\r\n', 'Compiler Error: free can?t be applied on NULL pointer', 'Memory Leak', 'Dangling Pointer', 'The program may crash as free() is called for NULL pointer', 'op2'),
(50, 'find the output\r\n#include &ltstdio.h&gt\r\nint main()\r\n{\r\n    int a[5] = {1,2,3,4,5};\r\n    int *ptr = (int*)(&a+1);\r\n    printf("%d %d", *(a+1), *(ptr-1));\r\n    return 0;\r\n}\r\n', '2 5', 'Garbage Value', 'Compiler Error', 'Segmentation Fault', 'op1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `playerdetails`
--
ALTER TABLE `playerdetails`
  ADD PRIMARY KEY (`emailId`);

--
-- Indexes for table `table1`
--
ALTER TABLE `table1`
  ADD PRIMARY KEY (`number`);

--
-- Indexes for table `table2`
--
ALTER TABLE `table2`
  ADD PRIMARY KEY (`number`);

--
-- Indexes for table `table3`
--
ALTER TABLE `table3`
  ADD PRIMARY KEY (`number`);

--
-- Indexes for table `table4`
--
ALTER TABLE `table4`
  ADD PRIMARY KEY (`number`);

--
-- Indexes for table `table5`
--
ALTER TABLE `table5`
  ADD PRIMARY KEY (`number`);

--
-- Indexes for table `table6`
--
ALTER TABLE `table6`
  ADD PRIMARY KEY (`number`);

--
-- Indexes for table `table7`
--
ALTER TABLE `table7`
  ADD PRIMARY KEY (`number`);

--
-- Indexes for table `table8`
--
ALTER TABLE `table8`
  ADD PRIMARY KEY (`number`);

--
-- Indexes for table `table9`
--
ALTER TABLE `table9`
  ADD PRIMARY KEY (`number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `table1`
--
ALTER TABLE `table1`
  MODIFY `number` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `table2`
--
ALTER TABLE `table2`
  MODIFY `number` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `table3`
--
ALTER TABLE `table3`
  MODIFY `number` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `table4`
--
ALTER TABLE `table4`
  MODIFY `number` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `table5`
--
ALTER TABLE `table5`
  MODIFY `number` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `table6`
--
ALTER TABLE `table6`
  MODIFY `number` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `table7`
--
ALTER TABLE `table7`
  MODIFY `number` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `table8`
--
ALTER TABLE `table8`
  MODIFY `number` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `table9`
--
ALTER TABLE `table9`
  MODIFY `number` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
