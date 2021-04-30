function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

values = [0.01 0.03 0.1 0.3 1 3 10 30];

% Cartesian product
[C_values, sigma_values] = meshgrid(values,values);
result = [C_values(:) sigma_values(:) zeros(length(C_values(:)),1)];

% Prediction error for each C and sigma combination
for i = 1:rows(result)
  [C_test, sigma_test] = deal(result(i,1), result(i,2));
  model = svmTrain(X, y, C_test, @(x1, x2) gaussianKernel(x1, x2, sigma_test));
  predictions = svmPredict(model, Xval);
  result(i,3) = mean(double(predictions ~= yval));
endfor

% search the row with the min prediction
[minVal, row] = min(min(result(:,3),[],2));

[C, sigma] = deal(result(row,1), result(row,2));

% =========================================================================

end
