function [conf_mat, classes] = compute_confusion(true_labels, pred_labels)

classes = unique([true_labels; pred_labels]);
num_classes = numel(classes);
conf_mat = zeros(num_classes);

for i = 1:numel(true_labels)
    t = find(classes == true_labels(i));
    p = find(classes == pred_labels(i));
    conf_mat(t,p) = conf_mat(t,p) + 1;
end

end
