function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

% Calculate the result of the second hidden layer
a_2 = sigmoid(X * Theta1');

% Add the bias unit
a_2 = [ones(size(X,1), 1) a_2];

% Calculate the result of the third hidden layer
a_3 = sigmoid(a_2 * Theta2');

% Get the result
[max_values p] = max(a_3, [], 2);

end
