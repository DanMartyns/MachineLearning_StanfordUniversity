function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;
predictions = zeros(size(yval));

true_anomalies = length(yval(yval == 1));
true_normal = length(yval(yval == 0));

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)

  predictions = (pval < epsilon);

  TP = sum(yval == 1 & yval == predictions);
  TN = sum(yval == 0 & yval == predictions);
  FN = true_anomalies - TP;
  FP = true_normal - TN;

  if TP != 0 precision = TP/(TP + FP); else precision = 0; endif
  if TP != 0 recall = TP/(TP + FN); else recall = 0; endif

  if precision == 0 && recall == 0 
    F1 = 0; 
  else 
    F1 = 2 * ( precision * recall ) / ( precision + recall );
  endif

  % =============================================================

  if F1 > bestF1
     bestF1 = F1;
     bestEpsilon = epsilon;
  end
end

end
