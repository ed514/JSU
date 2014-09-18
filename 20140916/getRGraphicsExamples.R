# Define a function to pull all of the examples from the book R Graphics
getRGraphicsExamples <- function(out = 0) {

     # URL to get to code examples for R Graphics by Murrell
     baseURL <- "https://www.stat.auckland.ac.nz/~paul/RG2e/"

     # Create a vector for the chapters
     chapters <- c(1:8, 10:19)

     # Create a list to store each of the 19 chapter pages
     pages <- list(NULL)

     # Create a list to store the examples from each chapter
     RGraphExamples <- list(NULL)

     # Loop over elements of the object x
     for (i in chapters) {

          # Read the website for a given chapter into object x
          x <- readLines(paste(baseURL, "chapter", i, ".html", sep = ""))
     
          # Parse the links to the source code for the book examples
          x <- grep("={1}.*[.]R{1}", x, ignore.case = FALSE, value = TRUE)
          
          # Parse all of the extra markup around the link
          pages[[i]] <- gsub("(<tr>.*href=)|(>R code</a></td></tr>)", "", x, ignore.case = FALSE)
     
          # Create the URL to access the code examples
          codeURL <- sapply(pages[[i]],                               # Store results in object codeURL
                         function(x){                                 # For all examples in chapter i
                              url <- paste(baseURL, x, sep = "")      # Append the file to the base URL
                         }                                            # 
                      )
          
          # Create name where the examples will be stored
          coderef <- paste("chapter", i, sep= "")
          
          # Read the source code for the examples
          RGraphExamples[[coderef]] <- lapply(codeURL, readLines)

          # Check the value of the parameter out
          if (out != 1) {
               
               # Print a warning message
               warning("Examples not saved to disk, stored in object examples instead.")
               
          } else { # use a value of 1 to save the code examples to external files
               
               # Break the structure of the list to use the cat function to write the file
               excode <- unlist(RGraphExamples[[coderef]])
               
               # Write the file
               lapply(excode, cat, file = paste("RGraphics-", coderef, ".R", sep = ""), #
                      sep = "\n", fill = FALSE, append = TRUE)
               
          } # End Else Block for storing the examples
                    
     } # End for loop
     
} # End of Function definition

