library(lpSolveAPI)

# make an lp object with 0 constraints and 6 decision variables
lprec <- make.lp(0, 9)

# Now create the objective function. The default is a minimization problem. 
set.objfn(lprec, c(622, 614, 630, 641, 645, 649))

# As the default is a minimization problem, we change the direction to set maximization
lp.control(lprec,sense='min')

# Add the plant and capacity constraints
add.constraint(lprec, c(1, 0, 0, 1, 0, 0), ">=", 80)
add.constraint(lprec, c(0, 1, 0, 0, 1, 0), ">=", 60)
add.constraint(lprec, c(0, 0, 1, 0, 0, 1), ">=", 70)
add.constraint(lprec, c(1, 1, 1, 0, 0, 0), "<=", 100)
add.constraint(lprec, c(0, 0, 0, 1, 1, 1), "<=", 120)

# To identify the variables and constraints, we can
# set variable names and name the constraints
ColNames <- c("Plant 1 Warehouse 1", "Plant 1 Warehouse 2", "Plant 1 Warehouse 3", "Plant 2 Warehouse 1", "Plant 2 Warehouse 2", "Plant 2 Warehouse 3")
RowNames <- c("Warehouse 1 Demand", "Warehouse 2 Demand", "Warehouse 3 Demand", "Plant A Capacity", "Plant B Capacity")
dimnames(lprec) <- list(RowNames, ColNames)

# Now, print out the model
lprec

# The model can also be saved to a file
write.lp(lprec, filename = "HW4.lp", type = "lp")

#Solve the maximization problem
solve(lprec)

#Get the Results of the model for Sensitivity Analysis
get.objective(lprec)
get.variables(lprec)
get.constraints(lprec)
get.sensitivity.rhs(lprec)  # get shadow prices
get.sensitivity.obj(lprec)  # get reduced cost
get.dual.solution(lprec) # get the dual solution