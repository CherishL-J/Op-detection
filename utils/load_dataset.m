function [data, labels] = load_dataset(dataset_path, image_ext, K)
%LOAD_DATASET Load images and extract FFT features

files = dir(fullfile(dataset_path, image_ext));
num_images = numel(files);


data   = zeros(num_images, 79);
labels = zeros(num_images, 1);

for i = 1:num_images
    filename = fullfile(dataset_path, files(i).name);
    fprintf('Processing: %s\n', filename);

    % Label from filename (first two chars)
    label_str = strrep(files(i).name(1:2), '_', '');
    labels(i) = str2double(label_str);

    img = imread(filename);
    if size(img,3) > 1
        img = rgb2gray(img);
    end

    data(i,:) = ext_fft_feature(img, K);
end

data = gather(data);

end
