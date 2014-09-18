########################### Instructions ######################################
## 1. Download your data set from Blackboard onto your computer and          ##
##      load the dataset into R                                              ##
## 2. Get the information you will need from the data set in order to        ##
##      determine what types of graphs are best for the data                 ##
## 3. Create 2 graphs for nominal scale variables and include a short        ## 
##      interpretation of the results                                        ##
## 4. Create 2 graphs for ordinal scale variables and include a short        ##
##      interpretation of the results                                        ##
## 5. Create 2 graphs for intervallic scale variables and include a short    ##
##      interpretation of the results                                        ##
## 6. Create 1 graph for a ratio scale variable and include a short          ##
##      interpretation of the results                                        ##
###############################################################################

######################## Additional Information ###############################
## Think of this document like an answer sheet if you are using R Studio, If ##
##      not download the R script and use that instead                       ##
## Once you've added all of your answers to the document save it and upload  ##
##      the file to blackboard before the due date/time                      ##
## I've gone through and set up the majority of this document for you so you ##
##      don't need to worry about learning the formatting stuff right away   ##
##  You will need to be comfortable extrapolating from here for future       ##
##      assignments to generate the formatting                               ##
##  I will provide you with an even more minimalist shell, but everything    ##
##      that you would need to know/do is already included here              ##
## You can either submit this document for your grade OR you can submit an R ##
##      script using comments for your written interpretation.               ##
##  If you submit a file created in MS Word it will NOT BE GRADED            ##
##  If you submit a file in any other format other than those specified above## 
##      and in the syllabus IT WILL NOT BE GRADED                            ##
##  Your file must be named with the following naming convention:            ##
##      'FirstLast-Task1.Rmd' if using this template or 'FirstLast-Task1.R'  ##
##      if using a regular R script.  Substitute your first and last names   ##
##      where you see FirstLast above; do not add spaces to the file name,   ##
##      it causes delays in everyone getting their work back.                ##
## You can ask classmates for help with the coding aspects of the assignment ##
##  If you need to ask for help, post it to the Blackboard website because   ##
##      someone else probably has the same question                          ##
## You CANNOT share your interpretation of the results with anyone; if there ##
##      is evidence that this happened it will be turned over to Dr. Smith   ##
##      immediately                                                          ##
###############################################################################

### Step 2. Get the information you will need from the data set in order to 
### determine what types of graphs are best for the data

# Load the package you need to read the data file provided
library("foreign")

# Enter the code that you used to load your data below
exampleData <- as.data.frame(read.dta( # 
     "http://www.paces-consulting.org/mde/data-wrkshp4-584.dta"))

# Display the names of the variables in your dataset
names(exampleData)

# Generate the summary statistics for the variables in the dataset
summary(exampleData)

# Find out what data types exist in your data
class(exampleData)

# Load the library that you need to generate the graphs 
library("ggplot2")

# If you want to see the variable labels (e.g., what the variable names mean) you can use
attr(exampleData, "var.label")

### Step 3. Create 2 graphs for nominal scale variables and include a short  
### interpretation of the results
# Enter the code to create the graph for your first nominal scale variable on the line below
qplot(homeless, facets = . ~ frl, data = exampleData)

## Interpretation of graph for first nominal scale variable
# There are almost the same number of students who are homeless and receive free 
# lunch as students who pay for lunch and are not homeless.  There are way more 
# students receiving free/reduced price lunch than there are students who pay for 
# their lunch.

## Quality of interpretation
# The quality of the interpretation above was acceptable.  Things that would 
# improve it would be additional precision regarding the comparison of the 
# magnitudes.  For example, the number of students who were both homeless and 
# received free/reduced lunch was approximately 66% that of students who had house 
# and paid for lunch.  The number of students who had housing and received 
# free/reduced price lunch was almost four times greater than the number of students 
# who paid for lunch and had housing.

## Create second nominal scale variable graph
# Enter the code to create the graph for your second nominal scale variable on the line below
# Create a data object with the data required for the graph
nominalGraph <- ggplot(exampleData, aes(x = race))

# Generate the graph
nominalGraph + geom_bar(aes(fill = frl)) + #
     facet_wrap(sped ~ scd, nrow = 3, ncol = 2)

## Interpretation of graph for second nominal scale variable
# Very few students are missing special education status and only students who are
# identified for special education are identified as students with severe 
# cognitive disabilities.  Of the special education and general education students, 
# the special education population is a small fraction, with the greatest number 
# of special education students being Black, Hispanic, and Native American.  The 
# free/reduced price vs. paid lunch status generally follows the same distribution
# across general and special education.

## Quality of interpretation
# This would be a much better interpretation than the previous.  Here there is 
# additional detail, analysis, and interpretation of what the graph is attempting 
# to represent.  Given the sample size, it is a bit difficult to interpret things with 
# any additional precision, so that might be something to consider adding to your 
# interpretation as a limitation of the data.


### Step 4. Create 2 graphs for ordinal scale variables and include a short  
### interpretation of the results
# Enter the code to create the graph for your first ordinal scale variable on the line below
qplot(mthleoy, fill = mthleoy, facets = female ~ ., data = exampleData)

## Interpretation of graph for first ordinal scale variable
# Both of the distributions look the same.  I guess I would say there really aren't 
# any big differences between boys and girls on the end of year math proficiency 
# levels.

## Quality of interpretation
# This would be an example of a poor interpretation.  Would we really expect that 
# more students would score on the higher side of minimal than all of basic combined?  
# Would we expect that more students scored advanced than basic?  Yes the 
# distributions are fairly similar, but here the real interpretation is about whether 
# or not the data appear to make sense based on our understanding of how test scores 
# are typically distributed.


## Create graph for second ordinal scale variable
# Enter the code to create the graph for your second ordinal scale variable on the line below
ordinalGraph <- ggplot(exampleData, aes(x = elalboy))

# Create the graph
ordinalGraph + geom_bar(aes(fill = elaleoy)) + facet_wrap(~ sped, ncol = 1)

## Interpretation of graph for second ordinal scale variable
# Students in minimal, proficient, and advanced levels at the beginning of the 
# year tended to remain at the same proficiency level at the end of the year.  
# Students at basic at the beginning of the year had the most mobility between 
# proficiency levels, and students in the advanced proficiency level at the 
# beginning of the year tended to not drop below proficient.  There were similar 
# patterns for general ed and special ed students, but special ed students did not 
# have as much movement into the advanced proficiency level.

## Quality of interpretation
# This is a much better interpretation.  It's difficult to see all of the detail 
# for students with disabilities, but there are some things going on in the graph 
# - that were they real - would probably be worth looking into with greater detail.  
# If students are ending up typically in the same place they started is it due to 
# more of the scores being clustered around the middle of those score ranges or 
# because they truly have not made any progress?  In cases where there is a 
# substantial amount of change (e.g., Gen Ed Basic) Is that change primarily due to 
# more of those students being "bubble" students, or because they were split up and 
# had an equal number of ineffective, average, and highly effective teachers?

### Step 5. Create 2 graphs for intervallic scale variables and include a  
### short interpretation of the results
# Enter the code to create the graph for your first intervallic scale variable on the line below
qplot(elamoy, geom = "histogram", binwidth = 5, data = exampleData)

## Interpretation of graph for first intervallic scale variable
# The distribution kind of looks like a bell-curve, but there is a big group of 
# students at the bottom that stick out.

## Quality of interpretation
# This isn't the worst example here, but far from the best.  If each of the 
# bars are 5 points wide, how clear of a picture do you think we are seeing 
# of these data?  What is so important about the group of students that stick 
# out at the bottom that would make you want to say something about it?

## Create Graph for second intervallic scale variable
# Enter the code to create the graph for your second intervallic scale variable on the line below
intervallicGraph <- ggplot(exampleData, aes(x = mthboy))

# Build the graph with layers
intervallicGraph +  geom_density(adjust = .25, color = "Blue", size = .25) +    #
                    geom_histogram(binwidth = 10, fill = "White",               # 
                                   aes(y = ..density..), alpha = .35) +         # 
                    geom_density(color = "Orange", size = 1.5)


## Interpretation of graph for second intervallic scale variable
# Here we see that a bin width of 10 for the beginning of year math scores is far too 
# coarse to provide an accurate depiction of the distribution of the data.  Because the 
# blue line represents a the density with a small bandwidth, it's clear that several 
# significant peaks are being masked by the width of the bins in the histogram.  However, 
# the resolution is so precise that it creates peaks that are illogical.  The orange colored 
# density line provides a more reasonable illustration of the distribution of the data 
# elements and provides a better approximation and middle ground to the two previous approaches.  
# While the data generally follow a Gaussian distribution, an argument could be made based on 
# visual inspection that the data are not normal and symmetrical.

## Quality of interpretation
# First, I would not expect you to create a graph like this for this class.  
# Second, this is here to give you examples of creating different graphs and what 
# the interpretations could look like.  Now, onto the quality of what you see above.  
# The type of response that you see above is an automatic full-credit.  There is analysis 
# of the data and the mechanics of how the graph was created.  Then, there is additional 
# comparison between the different views of exactly the same data.  


### Step 6. Create 1 graphs for a ratio scale variable and include a short interpretation of the result
# Enter the code to create the graph for your ratio scale variable on the line below
qplot(suspension, geom = "histogram", binwidth = 1, fill = race, #
      facets = lep ~ sped, data = na.omit(exampleData))


## Interpretation of graph for ratio scale variable
# The majority of the students in this example are students with limited english 
# proficiency.  Only a small number of students are in special education, and the 
# majority of the racial composition is Hispanic/Latino(a).  Of the students 
# suspended multiple times, nearly all were ethnoracial minorities.  This pattern 
# held regardless of limited english proficiency status and/or identification 
# as a student with disabilities.  Most of the students, in all cases, were 
# never suspended.

## Quality of interpretation
# This is a decent interpretation.  What else do you think could have been 
# discussed about this graph?
