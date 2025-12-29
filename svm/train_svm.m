function model = train_svm(trainData, trainLabels, cfg)
%TRAIN_SVM Train SVM with grid search

[bestacc, bestc, bestg] = SVMcgForClass( ...
    trainLabels, trainData, ...
    cfg.c_range(1), cfg.c_range(2), ...
    cfg.g_range(1), cfg.g_range(2), ...
    3, 0.5, 0.5, 0.9);

fprintf('Best C: %.4f, Best Gamma: %.4f\n', bestc, bestg);

cmd = sprintf('-c %f -g %f -t %d', ...
    bestc, bestg, cfg.svm_kernel);

model = svmtrain(trainLabels, trainData, cmd);

% Parameter statistics
numSV = size(model.SVs, 1);
numFeat = size(trainData, 2);
numParams = numSV * (numFeat + 1);

fprintf('Number of parameters: %d\n', numParams);

end
