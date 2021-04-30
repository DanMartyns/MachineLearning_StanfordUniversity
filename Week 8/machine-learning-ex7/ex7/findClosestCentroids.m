function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

for index = 1:length(X)
  c = repmat(X(index, :),size(centroids,1),1)  - centroids;
  c = sqrt(sum(c.^2, 2)).^2;
  
  [minVal, row] = min(min(c,[],2));
  idx(index) = row;
endfor

end 
