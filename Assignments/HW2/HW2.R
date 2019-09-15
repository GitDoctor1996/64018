library(lpSolveAPI)

# make an lp object with 0 constraints and 3 decision variables
lprec <- make.lp(0, 9)

# Now create the objective function. The default is a minimization problem. 
set.objfn(lprec, c(420, 420, 420, 360, 360, 360, 300, 300, 300))

# As the default is a minimization problem, we change the direction to set maximization
lp.control(lprec,sense='max')

# Add the plant and capacity constraints
add.constraint(lprec, c(1, 0, 0, 1, 0, 0, 1, 0, 0), "<=", 750)
add.constraint(lprec, c(0, 1, 0, 0, 1, 0, 0, 1, 0), "<=", 900)
add.constraint(lprec, c(0, 0, 1, 0, 0, 1, 0, 0, 1), "<=", 450)
add.constraint(lprec, c(20, 0, 0, 15, 0, 0, 12, 0, 0), "<=", 13000)
add.constraint(lprec, c(0, 20, 0, 0, 15, 0, 0, 12, 0), "<=", 12000)
add.constraint(lprec, c(0, 0, 20, 0, 0, 15, 0, 0, 12), "<=", 5000)
add.constraint(lprec, c(1, 1, 1, 0, 0, 0, 0, 0, 0), "<=", 900)
add.constraint(lprec, c(0, 0, 0, 1, 1, 1, 0, 0, 0), "<=", 1200)
add.constraint(lprec, c(0, 0, 0, 0, 0, 0, 1, 1, 1), "<=", 750)

# To identify the variables and constraints, we can
# set variable names and name the constraints
ColNames <- c("Large Product Plant 1", "Large Product Plant 2", "Large Product Plant 3", "Medium Product Plant 1", "Medium Product Plant 2", "Medium Product Plant 3", "Small Product Plant 1", "Small Product Plant 2", "Small Product Plant 3")
RowNames <- c("Plant 1 capacity", "Plant 2 capacity", "Plant 3 capacity", "Plant 1 sq ft", "Plant 2 sq ft", "Plant 3 sq ft", "Large Product Forecast", "Medium Product Forecast", "Small Product Forecast")
dimnames(lprec) <- list(RowNames, ColNames)

# Now, print out the model
lprec

# The model can also be saved to a file
write.lp(lprec, filename = "HW2.lp", type = "lp")

#Solve the maximization problem
solve(lprec)

#Get the Results of the model
get.objective(lprec)
get.variables(lprec)
get.constraints(lprec)
