function cfg = config()
%CONFIG  Experiment configuration

% Dataset paths
cfg.train_path = 'path/to/train_data';
cfg.test_path  = 'path/to/test_data';

% Image format
cfg.image_ext = '*.png';

% Feature parameters
cfg.feature_dim = 21;

% SVM parameters search range
cfg.c_range = [-2, 4];
cfg.g_range = [-4, 4];

% LibSVM kernel type (RBF)
cfg.svm_kernel = 2;

end
