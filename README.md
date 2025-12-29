Official MATLAB implementation of the paper:

> **Title:** *Let Images Speak More: An Efficient Method for Detecting Image Manipulation History*  
> **Authors:** *Yang Wei, Haowei Liu, Xiaochen Yuan, Member, IEEE, Xiuli Bi, and Bin Xiao*  
> **Journal:** *IEEE Trans. on Circuits and Systems for Video Technology, 2025*

## 🚀 Todo List

- [x] Matlab code
- [ ] Datasets

Due to the large size of the dataset, it has not yet been organized and uploaded. And we have provided a portion of the dataset, which can be downloaded from Google Drive via [this link](https://drive.google.com/file/d/1yhBP7reHk1Omjod-kXiebkQT83WfaT5w/view?usp=sharing). Additionally, You can also choose to download it from the official dataset website.

## 📂 Project Structure

```text
.
├── main.m                 # Main entry point
├── config.m               # Experiment configuration
│
├── features/
│   └── ext_fft_feature.m  # FFT feature extraction
│
├── svm/
│   ├── train_svm.m        # SVM training and parameter selection
│   └── evaluate_svm.m     # Evaluation metrics
│
├── utils/
│   ├── load_dataset.m
│   ├── compute_confusion.m
│   └── compute_metrics.m
│
└── README.md
```

## 📈 Running the Code

Edit dataset paths in config.m:

```matlab
cfg.train_path = 'path_to_train_set';
cfg.test_path  = 'path_to_test_set';
```


Run the main script:

```matlab
main
```


The script will:

- Extract features

- Train the SVM classifier

- Evaluate performance on the test set


## 📝 Citation

If you find this code useful, please consider citing our paper:

```
@article{wei2025let,
  title={Let Images Speak More: An Efficient Method for Detecting Image Manipulation History},
  author={Wei, Yang and Liu, Haowei and Yuan, Xiaochen and Bi, Xiuli and Xiao, Bin},
  journal={IEEE Transactions on Circuits and Systems for Video Technology},
  year={2025},
  publisher={IEEE}
}
```
