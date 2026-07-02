arXiv:1708.07747v2[cs.LG]15Sep2017

[Figure 1]

Fashion-MNIST: a Novel Image Dataset for Benchmarking Machine Learning Algorithms

[Figure 2]

Han Xiao Zalando Research Mühlenstraße 25, 10243 Berlin han.xiao@zalando.de

Kashif Rasul Zalando Research Mühlenstraße 25, 10243 Berlin

kashif.rasul@zalando.de

Roland Vollgraf Zalando Research Mühlenstraße 25, 10243 Berlin roland.vollgraf@zalando.de

Abstract

We present Fashion-MNIST, a new dataset comprising of 28 × 28 grayscale images of 70,000 fashion products from 10 categories, with 7,000 images per category. The training set has 60,000 images and the test set has 10,000 images. Fashion-MNIST is intended to serve as a direct dropin replacement for the original MNIST dataset for benchmarking machine learning algorithms, as it shares the same image size, data format and the structure of training and testing splits. The dataset is freely available at https://github.com/zalandoresearch/fashion-mnist.

- 1 Introduction

The MNIST dataset comprising of 10-class handwritten digits, was ﬁrst introduced by LeCun et al. [1998] in 1998. At that time one could not have foreseen the stellar rise of deep learning techniques and their performance. Despite the fact that today deep learning can do so much the simple MNIST dataset has become the most widely used testbed in deep learning, surpassing CIFAR10 [Krizhevsky and Hinton, 2009] and ImageNet [Deng et al., 2009] in its popularity via Google trends1. Despite its simplicity its usage does not seem to be decreasing despite calls for it in the deep learning community.

The reason MNIST is so popular has to do with its size, allowing deep learning researchers to quickly check and prototypetheir algorithms. This is also complementedby the fact that all machine learning libraries (e.g. scikit-learn) and deep learning frameworks (e.g. Tensorﬂow, Pytorch) provide helper functions and convenient examples that use MNIST out of the box.

Our aim with this work is to create a good benchmark dataset which has all the accessibility of MNIST, namely its small size, straightforward encoding and permissive license. We took the approach of sticking to the 10 classes 70,000 grayscale images in the size of 28× 28 as in the original MNIST. In fact, the only change one needs to use this dataset is to change the URL from where the MNIST dataset is fetched. Moreover, Fashion-MNIST poses a more challenging classiﬁcation task than the simple MNIST digits data, whereas the latter has been trained to accuracies above 99.7% as reported in Wan et al. [2013], Ciregan et al. [2012].

We also looked at the EMNIST dataset provided by Cohen et al. [2017], an extended version of MNIST that extends the number of classes by introducing uppercase and lowercase characters. How-

[Figure 3]

1https://trends.google.com/trends/explore?date=all&q=mnist,CIFAR,ImageNet

ever, to be able to use it seamlessly one needs to not only extend the deep learning framework’s MNIST helpers, but also change the underlying deep neural network to classify these extra classes.

- 2 Fashion-MNIST Dataset

Fashion-MNIST is based on the assortment on Zalando’s website2. Every fashion product on Zalando has a set of pictures shot by professional photographers, demonstrating different aspects of the product, i.e. front and back looks, details, looks with model and in an outﬁt. The original picture has a light-gray background (hexadecimal color: #fdfdfd) and stored in 762 × 1000 JPEG format. For efﬁciently serving different frontend components, the original picture is resampled with multiple resolutions, e.g. large, medium, small, thumbnail and tiny.

We use the front look thumbnail images of 70,000 unique products to build Fashion-MNIST. Those products come from different gender groups: men, women, kids and neutral. In particular, whitecolor products are not included in the dataset as they have low contrast to the background. The thumbnails (51 × 73) are then fed into the following conversion pipeline, which is visualized in Figure 1.

- 1. Converting the input to a PNG image.
- 2. Trimming any edges that are close to the color of the corner pixels. The “closeness” is deﬁned by the distance within 5% of the maximum possible intensity in RGB space.
- 3. Resizing the longest edge of the image to 28 by subsampling the pixels, i.e. some rows and columns are skipped over.
- 4. Sharpening pixels using a Gaussian operator of the radius and standard deviation of 1.0, with increasing effect near outlines.
- 5. Extending the shortest edge to 28 and put the image to the center of the canvas.
- 6. Negating the intensities of the image.
- 7. Converting the image to 8-bit grayscale pixels.

[Figure 4]

[Figure 5]

[Figure 6]

[Figure 7]

[Figure 8]

[Figure 9]

[Figure 10]

[Figure 11]

[Figure 12]

[Figure 13]

[Figure 14]

[Figure 15]

[Figure 16]

[Figure 17]

Figure 1: Diagram of the conversion process used to generate Fashion-MNIST dataset. Two examples from dress and sandals categories are depicted, respectively. Each column represents a step described in section 2.

Table 1: Files contained in the Fashion-MNIST dataset. Name Description # Examples Size train-images-idx3-ubyte.gz Training set images 60,000 25 MBytes train-labels-idx1-ubyte.gz Training set labels 60,000 140 Bytes t10k-images-idx3-ubyte.gz Test set images 10,000 4.2 MBytes t10k-labels-idx1-ubyte.gz Test set labels 10,000 92 Bytes

[Figure 18]

[Figure 19]

[Figure 20]

For the class labels, we use the silhouette code of the product. The silhouette code is manually labeled by the in-house fashion experts and reviewed by a separate team at Zalando. Each product

[Figure 21]

2Zalando is the Europe’s largest online fashion platform. http://www.zalando.com

contains only one silhouette code. Table 2 gives a summary of all class labels in Fashion-MNIST with examples for each class.

Finally, the dataset is divided into a training and a test set. The training set receives a randomlyselected 6,000 examples from each class. Images and labels are stored in the same ﬁle format as the MNIST data set, which is designed for storing vectors and multidimensional matrices. The result ﬁles are listed in Table 1. We sort examples by their labels while storing, resulting in smaller label ﬁles after compression comparing to the MNIST. It is also easier to retrieve examples with a certain class label. The data shufﬂing job is therefore left to the algorithm developer.

Table 2: Class names and example images in Fashion-MNIST dataset. Label Description Examples

[Figure 22]

[Figure 23]

- 0 T-Shirt/Top

[Figure 24]

- 1 Trouser

[Figure 25]

- 2 Pullover

[Figure 26]

- 3 Dress

[Figure 27]

- 4 Coat

[Figure 28]

- 5 Sandals

[Figure 29]

- 6 Shirt

[Figure 30]

- 7 Sneaker

[Figure 31]

- 8 Bag

[Figure 32]

- 9 Ankle boots

[Figure 33]

[Figure 34]

- 3 Experiments

We provide some classiﬁcation results in Table 3 to form a benchmark on this data set. All algorithms are repeated 5 times by shufﬂing the training data and the average accuracy on the test set is reported. The benchmark on the MNIST dataset is also included for a side-by-side comparison. A more comprehensive table with explanations on the algorithms can be found on https://github.com/zalandoresearch/fashion-mnist.

Table 3: Benchmark on Fashion-MNIST (Fashion) and MNIST.

[Figure 35]

Test Accuracy

[Figure 36]

Classiﬁer Parameter Fashion MNIST DecisionTreeClassiﬁer criterion=entropymax_depth=10splitter=best 0.798 0.873

[Figure 37]

criterion=entropymax_depth=10splitter=random 0.792 0.861 criterion=entropymax_depth=50splitter=best 0.789 0.886

[Figure 38]

# Continued on next page

[Figure 39]

criterion=entropymax_depth=100splitter=best 0.789 0.886 criterion=ginimax_depth=10splitter=best 0.788 0.866 criterion=entropymax_depth=50splitter=random 0.787 0.883 criterion=entropymax_depth=100splitter=random 0.787 0.881 criterion=ginimax_depth=100splitter=best 0.785 0.879 criterion=ginimax_depth=50splitter=best 0.783 0.877 criterion=ginimax_depth=10splitter=random 0.783 0.853 criterion=ginimax_depth=50splitter=random 0.779 0.873 criterion=ginimax_depth=100splitter=random 0.777 0.875

[Figure 43]

ExtraTreeClassiﬁer criterion=ginimax_depth=10splitter=best 0.775 0.806 criterion=entropymax_depth=100splitter=best 0.775 0.847 criterion=entropymax_depth=10splitter=best 0.772 0.810 criterion=entropymax_depth=50splitter=best 0.772 0.847 criterion=ginimax_depth=100splitter=best 0.769 0.843 criterion=ginimax_depth=50splitter=best 0.768 0.845 criterion=entropymax_depth=50splitter=random 0.752 0.826 criterion=entropymax_depth=100splitter=random 0.752 0.828 criterion=ginimax_depth=50splitter=random 0.748 0.824 criterion=ginimax_depth=100splitter=random 0.745 0.820 criterion=ginimax_depth=10splitter=random 0.739 0.737 criterion=entropymax_depth=10splitter=random 0.737 0.745

[Figure 44]

GaussianNB priors=[0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1] 0.511 0.524 GradientBoostingClassiﬁer n_estimators=100loss=deviance max_depth=10 0.880 0.969

[Figure 45]

n_estimators=50loss=deviance max_depth=10 0.872 0.964 n_estimators=100loss=deviance max_depth=3 0.862 0.949 n_estimators=10loss=deviance max_depth=10 0.849 0.933 n_estimators=50loss=deviance max_depth=3 0.840 0.926 n_estimators=10loss=deviance max_depth=50 0.795 0.888 n_estimators=10loss=deviance max_depth=3 0.782 0.846

[Figure 46]

KNeighborsClassiﬁer weights=distance n_neighbors=5p=1 0.854 0.959

- weights=distance n_neighbors=9p=1 0.854 0.955

- weights=uniform n_neighbors=9p=1 0.853 0.955

- weights=uniform n_neighbors=5p=1 0.852 0.957 weights=distance n_neighbors=5p=2 0.852 0.945

weights=distance n_neighbors=9p=2 0.849 0.944

- weights=uniform n_neighbors=5p=2 0.849 0.944

- weights=uniform n_neighbors=9p=2 0.847 0.943 weights=distance n_neighbors=1p=2 0.839 0.943 weights=uniform n_neighbors=1p=2 0.839 0.943 weights=uniform n_neighbors=1p=1 0.838 0.955 weights=distance n_neighbors=1p=1 0.838 0.955

[Figure 47]

LinearSVC loss=hinge C=1multi_class=ovrpenalty=l2 0.836 0.917 loss=hinge C=1multi_class=crammer_singer penalty=l2 0.835 0.919 loss=squared_hinge C=1multi_class=crammer_singer penalty=l2 0.834 0.919 loss=squared_hinge C=1multi_class=crammer_singer penalty=l1 0.833 0.919 loss=hinge C=1multi_class=crammer_singer penalty=l1 0.833 0.919 loss=squared_hinge C=1multi_class=ovrpenalty=l2 0.820 0.912 loss=squared_hinge C=10multi_class=ovrpenalty=l2 0.779 0.885 loss=squared_hinge C=100multi_class=ovrpenalty=l2 0.776 0.873 loss=hinge C=10multi_class=ovrpenalty=l2 0.764 0.879 loss=hinge C=100multi_class=ovrpenalty=l2 0.758 0.872

[Figure 48]

# Continued on next page

[Figure 49]

loss=hinge C=10multi_class=crammer_singer penalty=l1 0.751 0.783 loss=hinge C=10multi_class=crammer_singer penalty=l2 0.749 0.816 loss=squared_hinge C=10multi_class=crammer_singer penalty=l2 0.748 0.829 loss=squared_hinge C=10multi_class=crammer_singer penalty=l1 0.736 0.829 loss=hinge C=100multi_class=crammer_singer penalty=l1 0.516 0.759 loss=hinge C=100multi_class=crammer_singer penalty=l2 0.496 0.753 loss=squared_hinge C=100multi_class=crammer_singer penalty=l1 0.492 0.746 loss=squared_hinge C=100multi_class=crammer_singer penalty=l2 0.484 0.737

[Figure 53]

LogisticRegression C=1multi_class=ovrpenalty=l1 0.842 0.917 C=1multi_class=ovrpenalty=l2 0.841 0.917 C=10multi_class=ovrpenalty=l2 0.839 0.916 C=10multi_class=ovrpenalty=l1 0.839 0.909 C=100multi_class=ovrpenalty=l2 0.836 0.916

[Figure 54]

MLPClassiﬁer activation=reluhidden_layer_sizes=[100] 0.871 0.972 activation=reluhidden_layer_sizes=[100, 10] 0.870 0.972 activation=tanhhidden_layer_sizes=[100] 0.868 0.962 activation=tanhhidden_layer_sizes=[100, 10] 0.863 0.957 activation=reluhidden_layer_sizes=[10, 10] 0.850 0.936 activation=reluhidden_layer_sizes=[10] 0.848 0.933 activation=tanhhidden_layer_sizes=[10, 10] 0.841 0.921 activation=tanhhidden_layer_sizes=[10] 0.840 0.921

[Figure 55]

PassiveAggressiveClassiﬁer C=1 0.776 0.877 C=100 0.775 0.875 C=10 0.773 0.880

[Figure 56]

Perceptron penalty=l1 0.782 0.887 penalty=l2 0.754 0.845 penalty=elasticnet 0.726 0.845

[Figure 57]

RandomForestClassiﬁer n_estimators=100criterion=entropy max_depth=100 0.873 0.970 n_estimators=100criterion=ginimax_depth=100 0.872 0.970 n_estimators=50criterion=entropymax_depth=100 0.872 0.968 n_estimators=100criterion=entropy max_depth=50 0.872 0.969 n_estimators=50criterion=entropymax_depth=50 0.871 0.967 n_estimators=100criterion=ginimax_depth=50 0.871 0.971 n_estimators=50criterion=ginimax_depth=50 0.870 0.968 n_estimators=50criterion=ginimax_depth=100 0.869 0.967 n_estimators=10criterion=entropymax_depth=50 0.853 0.949 n_estimators=10criterion=entropymax_depth=100 0.852 0.949 n_estimators=10criterion=ginimax_depth=50 0.848 0.948 n_estimators=10criterion=ginimax_depth=100 0.847 0.948 n_estimators=50criterion=entropymax_depth=10 0.838 0.947 n_estimators=100criterion=entropy max_depth=10 0.838 0.950 n_estimators=100criterion=ginimax_depth=10 0.835 0.949 n_estimators=50criterion=ginimax_depth=10 0.834 0.945 n_estimators=10criterion=entropymax_depth=10 0.828 0.933 n_estimators=10criterion=ginimax_depth=10 0.825 0.930

[Figure 58]

SGDClassiﬁer loss=hinge penalty=l2 0.819 0.914 loss=perceptron penalty=l1 0.818 0.912 loss=modified_huber penalty=l1 0.817 0.910 loss=modified_huber penalty=l2 0.816 0.913 loss=logpenalty=elasticnet 0.816 0.912 loss=hinge penalty=elasticnet 0.816 0.913

[Figure 59]

# Continued on next page

[Figure 60]

loss=squared_hinge penalty=elasticnet 0.815 0.914 loss=hinge penalty=l1 0.815 0.911 loss=logpenalty=l1 0.815 0.910 loss=perceptron penalty=l2 0.814 0.913 loss=perceptron penalty=elasticnet 0.814 0.912 loss=squared_hinge penalty=l2 0.814 0.912 loss=modified_huber penalty=elasticnet 0.813 0.914 loss=logpenalty=l2 0.813 0.913 loss=squared_hinge penalty=l1 0.813 0.911

[Figure 64]

SVC C=10kernel=rbf 0.897 0.973 C=10kernel=poly 0.891 0.976 C=100kernel=poly 0.890 0.978 C=100kernel=rbf 0.890 0.972 C=1kernel=rbf 0.879 0.966 C=1kernel=poly 0.873 0.957 C=1kernel=linear 0.839 0.929 C=10kernel=linear 0.829 0.927 C=100kernel=linear 0.827 0.926 C=1kernel=sigmoid 0.678 0.898 C=10kernel=sigmoid 0.671 0.873 C=100kernel=sigmoid 0.664 0.868

[Figure 65]

- 4 Conclusions

This paper introduced Fashion-MNIST, a fashion product images dataset intended to be a dropin replacement of MNIST and whilst providing a more challenging alternative for benchmarking machine learning algorithm. The images in Fashion-MNIST are converted to a format that matches that of the MNIST dataset, making it immediately compatible with any machine learning package capable of working with the original MNIST dataset.

References

D. Ciregan, U. Meier, and J. Schmidhuber. Multi-column deep neural networks for image classiﬁcation. In Computer Vision and Pattern Recognition (CVPR), 2012 IEEE Conference on, pages 3642–3649. IEEE, 2012.

G. Cohen, S. Afshar, J. Tapson, and A. van Schaik. Emnist: an extension of mnist to handwritten letters. arXiv preprint arXiv:1702.05373, 2017.

J. Deng, W. Dong, R. Socher, L.-J. Li, K. Li, and L. Fei-Fei. Imagenet: A large-scale hierarchical image database. In Computer Vision and Pattern Recognition, 2009. CVPR 2009. IEEE Conference on, pages 248–255. IEEE, 2009.

A. Krizhevsky and G. Hinton. Learning multiple layers of features from tiny images. 2009. Y. LeCun, L. Bottou, Y. Bengio, and P. Haffner. Gradient-based learning applied to document

recognition. Proceedings of the IEEE, 86(11):2278–2324, 1998.

L. Wan, M. Zeiler, S. Zhang, Y. L. Cun, and R. Fergus. Regularization of neural networks using dropconnect. In Proceedings of the 30th international conference on machine learning (ICML13), pages 1058–1066, 2013.

