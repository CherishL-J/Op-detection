function results = evaluate_svm(true_labels, pred_labels)
%EVALUATE_SVM Compute confusion matrix and metrics

[conf_mat, classes] = compute_confusion(true_labels, pred_labels);
N = numel(true_labels);

num_classes = numel(classes);
precision = zeros(num_classes,1);
recall    = zeros(num_classes,1);
f1        = zeros(num_classes,1);

for i = 1:num_classes
    TP = conf_mat(i,i);
    FP = sum(conf_mat(:,i)) - TP;
    FN = sum(conf_mat(i,:)) - TP;

    precision(i) = TP / max(TP + FP, eps);
    recall(i)    = TP / max(TP + FN, eps);
    f1(i)        = 2 * precision(i) * recall(i) / ...
                   max(precision(i) + recall(i), eps);
end

results.confusion_matrix = conf_mat;
results.accuracy = sum(diag(conf_mat)) / N;
results.macro_precision = mean(precision);
results.macro_recall    = mean(recall);
results.macro_f1        = mean(f1);

end
