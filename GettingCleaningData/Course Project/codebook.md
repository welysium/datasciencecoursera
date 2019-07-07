This codebook should be used in conjunction with the finaldataset.txt and run_analysis.R files.

Variables and Identifiers

subject - ID of the test subject
activity - activity performed

Activities included:
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

Features included 561 different varaibles. A small sample is included below:
1 tBodyAcc-mean()-X
2 tBodyAcc-mean()-Y
3 tBodyAcc-mean()-Z
4 tBodyAcc-std()-X
5 tBodyAcc-std()-Y
6 tBodyAcc-std()-Z
7 tBodyAcc-mad()-X
8 tBodyAcc-mad()-Y
9 tBodyAcc-mad()-Z
10 tBodyAcc-max()-X
11 tBodyAcc-max()-Y
12 tBodyAcc-max()-Z
13 tBodyAcc-min()-X
14 tBodyAcc-min()-Y
15 tBodyAcc-min()-Z
16 tBodyAcc-sma()
17 tBodyAcc-energy()-X
18 tBodyAcc-energy()-Y
19 tBodyAcc-energy()-Z
20 tBodyAcc-iqr()-X


Sample of final, "tidy" data set:
> fread("finaldataset.txt")
          Description SubjectID       243         244        245         250
  1:           LAYING         1 0.2215982 -0.04051395 -0.1132036 -0.92805647
  2:           LAYING         2 0.2813734 -0.01815874 -0.1072456 -0.97405946
  3:           LAYING         3 0.2755169 -0.01895568 -0.1013005 -0.98277664
  4:           LAYING         4 0.2635592 -0.01500318 -0.1106882 -0.95419374
  5:           LAYING         5 0.2783343 -0.01830421 -0.1079376 -0.96593451
