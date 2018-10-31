# TODO: Functionize. Create a function that creates the gridSearch function for i in nHyperparameters to tune.
# Function factories here: https://adv-r.hadley.nz/function-factories.html

# Example from a metabolomics grid search bout following:


# CREATE HYPERPARAMETER VECTORS WITH SELECTED VALUES TO BE CHECKED:
# Let rt_tolerance, mass_tolerance, threshold b e the hyperparameters to explore

rt_tolerance   = seq( from = 2.50 , to = 5    , by = 0.5  )  # 6 values to be checked
mass_tolerance = seq( from = 0.01 , to = 0.05 , by = 0.01 )  # 5 values
threshold      = seq( from = 0.5  , to = 0.8   , by = 0.1  ) # 4 values, 0.5 till 0.8 similarity 



# CREATE GRID SEARCH DATAFRAME:
# Initializing a dataframe with all possible hyperparameter triplets,
# metabolite ID's cells populated with NA values for populating later:

gridSearch_df <- expand.grid(    rt_tol        = rt_tolerance,
                                 mass_tol      = mass_tolerance,
                                 simil_thresh  = threshold,
                                 nMatchPairs   = 0,
                                  
                                 metabolite_ID_current  = NA,
                                 metabolite_ID_previous = NA) # initializing col to hold n of matching features
# Check for gridSearch
dim(gridSearch_df) # n_rows should be eq to len(rt) * len(mz) * len(simil_thr) aka 6*5*4 = 120

# Load initialized dataframe for preview 
DT::datatable(gridSearch_df)




# LOOP OVER EACH HYPERPARAMETER SET:
# Every row corresponds to one hyperparameter combination
nRows = dim(gridSearch_df)[1]
print(paste0("Number of hyperparameter triplets: ",nRows))
# Start of looping over 3plets of hypers:
## REMOVE HARD CODED
for(row_index in 1:nRows){
  
  # PRINT LOOP PROGRESS INFO:
  print(paste0(row_index, " of ", nRows, " iter"))
  print(paste0("Hyperparameter triplet: ", gridSearch_df[row_index,]))
 
  .
  .
  .
   
  
 # DO SEVERAL STUF HERE
 # e.g. use function that takes as input the hyperparameters as gridSearch_df instances and not hardcoded values:
  
  results <- matchingFeatures(dataset1, 
                              dataset2,
                              rt_tolerance   = gridSearch_df$rt_tol       [row_index],
                              mass_tolerance = gridSearch_df$mass_tol     [row_index], 
                              threshold      = gridSearch_df$simil_thresh [row_index]){
.
  .
  .
 
 
 # Exit loop with closing curly bracket
  }
  
 #_______________________________       The End       _______________________________
