clc; clear; close all;

%% Load configuration
cfg = config();

%% Load training data
fprintf('Loading training data...\n');
[trainData, trainLabels] = load_dataset( ...
    cfg.train_path, cfg.image_ext, cfg.feature_dim);

%% Train SVM
fprintf('Training SVM...\n');
model = train_svm(trainData, trainLabels, cfg);

%% Load test data
fprintf('Loading test data...\n');
[testData, testLabels] = load_dataset( ...
    cfg.test_path, cfg.image_ext, cfg.feature_dim);

%% Test SVM
fprintf('Testing...\n');
tic;
% [predict_label, accuracy] = svmpredict(testLabels, testData, model);
[predict_label, accuracy, dec_values] = svmpredict(testLabels, testData, model);
elapsed_time = toc;

fprintf('Inference time: %.4f seconds\n', elapsed_time);

%% Evaluation
results = evaluate_svm(testLabels, predict_label);

disp('Overall Accuracy:');
disp(results.accuracy);

disp('Macro Precision / Recall / F1:');
disp([results.macro_precision, ...
      results.macro_recall, ...
      results.macro_f1]);
