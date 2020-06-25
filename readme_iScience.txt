######################################
#    codes
######################################

features_extraction.m
- matlab code to compute the eight features to be used for the algorithm, for each of the non-overlaping windows of length w of one channel of the LEM recording. 

Katz_FD.m
- matlab code to compute the fractal dimension of a given time-series.

func_SRP.m
- matlab code to compute the symbolic recurrence matrix of a given time-series and embedding dimension m.

RPcla.m
- matlab code to compute the classical recurrence matrix of a given time-series, for a chosen embedding dimension m and proximity parameter eps.

code_RusBoost.m
- matlab code that returns a trained classifier for ictal/non-ictal predictions, along with its accuracy in K-fold cross-validation. The input is a matrix with the same number of columns and data type as in the feature extraction. The output is a matlab struct containing the trained classifier. 
The struct contains various fields with information about the trained classifier:
     - trainedClassifier.predictFcn: a function to draw predictions on new data (for example, yfit = trainedClassifier.predictFcn(T) draws a prediction on T, where is a matrix containing only the predictor columns used for training).
     - validationAccuracy: a double precision number measuring accuracy in percent. 

