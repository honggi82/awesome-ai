## Deep Learning Face Attributes in the Wild∗

# arXiv:1411.7766v3[cs.CV]24Sep2015

Ziwei Liu1 Ping Luo1 Xiaogang Wang2 Xiaoou Tang1

- 1Department of Information Engineering, The Chinese University of Hong Kong
- 2Department of Electronic Engineering, The Chinese University of Hong Kong {lz013,pluo,xtang}@ie.cuhk.edu.hk, xgwang@ee.cuhk.edu.hk

### Abstract

Predicting face attributes in the wild is challenging due to complex face variations. We propose a novel deep learning framework for attribute prediction in the wild. It cascades two CNNs, LNet and ANet, which are ﬁnetuned jointly with attribute tags, but pre-trained differently. LNet is pre-trained by massive general object categories for face localization, while ANet is pre-trained by massive face identities for attribute prediction. This framework not only outperforms the state-of-the-art with a large margin, but also reveals valuable facts on learning face representation.

(1) It shows how the performances of face localization (LNet) and attribute prediction (ANet) can be improved by different pre-training strategies. (2) It reveals that although the ﬁlters of LNet are ﬁne-tuned only with imagelevel attribute tags, their response maps over entire images have strong indication of face locations. This fact enables training LNet for face localization with only image-level annotations, but without face bounding boxes or landmarks, which are required by all attribute recognition works. (3) It also demonstrates that the high-level hidden neurons of ANet automatically discover semantic concepts after pretraining with massive face identities, and such concepts are signiﬁcantly enriched after ﬁne-tuning with attribute tags. Each attribute can be well explained with a sparse linear combination of these concepts.

### 1. Introduction

Face attributes are beneﬁcial for multiple applications such as face veriﬁcation [15, 2, 25], identiﬁcation [20], and retrieval. Predicting face attributes from images in the wild is challenging, because of complex face variations such as poses, lightings, and occlusions as shown in Fig.1.

Attribute recognition methods are generally categorized into two groups: global and local methods. Global methods extract features from the entire object, where accurate locations of object parts or landmarks are not required.

∗This work has been accepted to appear in ICCV 2015. This is the preprinted version. Content may slightly change prior to the ﬁnal publication.

Arched Eyebrows Receding Hairline Smiling Mustache Young

(c)(a)HOG(landmarks)+SVM(b)OurMethod

|[Figure 1]<br><br>true|false|[Figure 2]<br><br>[Figure 3]<br><br>[Figure 4]<br><br>false|false|[Figure 5]<br><br>| |
|---|
<br><br>true|
|---|---|---|---|---|
|[Figure 6]<br><br>true|true|[Figure 7]<br><br>[Figure 8]<br><br>[Figure 9]<br><br>true|true|[Figure 10]<br><br>true|
|[Figure 11]<br><br>[Figure 12]|[Figure 13]<br><br>5 attributes|10 attributes|20 attributes|[Figure 14]<br><br>[Figure 15]<br><br>40 attributes|

Figure 1. (a) Inaccurate localization and alignment lead to prediction errors on attributes by existing methods (b) LNet localizes face regions by averaging the response maps of attribute ﬁlters. ANet predicts attributes without alignment (c) Face localization with the averaged response map when LNet is trained with different numbers of attributes. (Best viewed in color)

They are not robust to deformations of objects [23]. Recent local models [15, 4, 5, 2, 19, 32] ﬁrst detect object parts and extract features from each part. These local features are concatenated to train classiﬁers. For example, Kumar et al. [15] predicted face attributes by extracting hand-crafted features from ten face parts. Zhang et al. [32] recognized human attributes by employing hundreds of poselets [4] to align human body parts. These local methods may fail when unconstrained face images with complex variations are present, which makes face localization and alignment difﬁcult. As shown in Fig.1 (a), HOG+SVM fails because the faces or landmarks are wrongly localized or misaligned. Thus the features are extracted at wrong positions [26]. Recent research shows that face localization and alignment are still not well solved problems, especially in the wild condition, although much progress has been achieved in the past decade. It is also proved by our experimental result.

This work revisits global methods by proposing a novel deep learning framework, which integrates two CNNs,

LNet and ANet, where LNet locates the entire face region and ANet extracts high-level face representation from the located region. The novelties are in three aspects. Firstly, LNet is trained in a weakly supervised manner, i.e. only image-level attribute tags of training images are provided, making data preparation much easier. This is different from training face and landmark detectors, where face bounding boxes and landmark positions are required. LNet is pretrained by classifying massive general object categories, such that its pre-trained features have good generalization capability on handling large background clutters. LNet is then ﬁne-tuned by attributes tags. We demonstrate that features learned in this way are effective for face localization and also can distinguish subtle differences between human faces and analogous patterns, such as a cat face.

Secondly, ANet extracts discriminative face representation, making attribute recognition from the entire face region possible. ANet is pre-trained by classifying massive face identities and is ﬁne-tuned by attributes. We show that the pre-training step enables ANet to account for complex variations in the unconstrained face images.

Thirdly, within the rough locations of face regions provided by LNet, averaging the predictions of multiple patches can improve the performance. A simple way is to evaluate the feed-forward pass for each single patch. However, it is slow and has a lot of redundant computation. A novel fast feed-forward scheme is proposed to replace patch-by-patch evaluation. It evaluates images with arbitrary sizes with only one-pass feed-forward operation. It becomes non-trivial if the ﬁlters are locally shared, while studies [28, 27] showed that locally shared ﬁlters perform better in face related tasks. This is solved by proposing an interweaved operation.

Besides proposing new methods, our framework also reveals valuable facts on learning face representation. They not only motivate this work but also beneﬁt future research on face and deep learning. (1) It shows how pre-training with massive object categories and massive identities can improve feature learning for face localization and attribute recognition, respectively. (2) It demonstrates that although ﬁlters of LNet are ﬁne-tuned by attribute tags, their response maps over the entire image have strong indication of face location. Good features for face localization should be able to capture rich face variations, and more supervised information on these variations improves the learning process. The examples in Fig. 1 (a) show that as the number of attributes decreases, the localization capability of learned neurons gets reduced dramatically. (3) ANet is pre-trained with massive face identities. It discloses that the pre-trained high-level hidden neurons of ANet implicitly learn and discover sematic concepts that are related to identity, such as race, gender, and age. It indicates that when a deep model is pre-trained for face recognition, it implicitly learns

attributes. The performance of attribute prediction drops without this pre-training stage.

The main contributions are summarized as follows. (1) We propose a novel deep learning framework, which combines massive objects and massive identities to pre-train two CNNs for face localization and attribute prediction, respectively. It achieves state-of-the-art attribute classiﬁcation results on both the challenging CelebFaces [27] and LFW [12] datasets, improving existing methods by 8 and 13 percent, respectively. (2) A novel fast feed-forward algorithm for CNN with locally shared ﬁlters is devised. (3) Our study reveals multiple valuable facts on leaning face representation by deep models. (4) We also contribute a large facial attribute database with more than eight million attribute labels and it is 20 times larger than the largest publicly available dataset.

#### 1.1. Related Work

Extracting hand-crafted features at pre-deﬁned landmarks has become a standard step in attribute recognition [9, 15, 4, 2]. Kumar et al. [15] extracted HOG-like features on various face regions to tackle attribute classiﬁcation and face veriﬁcation. To improve the discriminativeness of hand-crafted features given a speciﬁc task, Bourdev et al. [4] built a three-level SVM system to extract higher-level information. Deep learning [23, 7, 19, 32, 31, 13, 33, 22, 3] recently achieved great success in attribute prediction, due to their ability to learn compact and discriminative features. Razavian et al. [23] and Donahue et al. [7] demonstrated that off-the-shelf features learned by CNN of ImageNet [13] can be effectively adapted to attribute classiﬁcation. Zhang et al. [32] showed that better performance can be achieved by ensembling learned features of multiple pose-normalized CNNs. The main drawback of these methods is that they rely on accurate landmark detection and pose estimation in both training and testing steps. Even though a recent work [31] can perform automatic part localization during test, it still requires landmark annotations of the training data.

### 2. Our Approach

Framework Overview Fig.2 illustrates our pipeline where LNet locates the entire face region in a coarse-toﬁne manner as shown in (a) and (b), while ANet extracts features for attribute recognition as shown in (c).

Different from existing works that rely on accurate face and landmark annotations, LNet is trained in a weakly supervised manner with only image-level annotations. Specifically, it is pre-trained with one thousand object categories of ImageNet [6] and ﬁne-tuned by image-level attribute tags. The former step accounts for background clutters, while the latter step learns features robust to complex face variations. Learning LNet in this way not only signiﬁcantly reduces data labeling, but also improves the

[Figure 16]

[Figure 17]

[Figure 18]

[Figure 19]

[Figure 20]

[Figure 21]

[Figure 22]

[Figure 23]

(a) LNeto (b) LNets

[Figure 24]

n

[Figure 25]

[Figure 26]

[Figure 27]

[Figure 28]

[Figure 29]

[Figure 30]

[Figure 31]

[Figure 32]

[Figure 33]

[Figure 34]

[Figure 35]

[Figure 36]

[Figure 37]

[Figure 38]

[Figure 39]

[Figure 40]

[Figure 41]

[Figure 42]

[Figure 43]

[Figure 44]

[Figure 45]

[Figure 46]

[Figure 47]

[Figure 48]

[Figure 49]

[Figure 50]

[Figure 51]

[Figure 52]

[Figure 53]

[Figure 54]

[Figure 55]

[Figure 56]

[Figure 57]

[Figure 58]

[Figure 59]

[Figure 60]

[Figure 61]

[Figure 62]

[Figure 63]

[Figure 64]

m

[Figure 65]

|xo h(5)o xs h(5)s<br><br>[Figure 66]<br><br>[Figure 67]<br><br>[Figure 68]<br><br>[Figure 69]<br><br>[Figure 70]<br><br>| |
|---|---|
|[Figure 71]<br><br>|[Figure 72]<br><br>|

[Figure 73]

[Figure 74]

[Figure 75]

[Figure 76]

[Figure 77]

[Figure 78]

[Figure 79]

[Figure 80]

[Figure 81]

[Figure 82]

[Figure 83]

[Figure 84]

[Figure 85]

[Figure 86]

[Figure 87]

[Figure 88]

[Figure 89]

Wavy Hair No Beard High Cheekbones

FC

[Figure 90]

[Figure 91]

[Figure 92]

[Figure 93]

###### Linear SVM

[Figure 94]

[Figure 95]

[Figure 96]

[Figure 97]

[Figure 98]

…

[Figure 99]

[Figure 100]

[Figure 101]

[Figure 102]

[Figure 103]

[Figure 104]

[Figure 105]

[Figure 106]

FC FC

[Figure 107]

[Figure 108]

[Figure 109]

Linear SVM Linear SVM

[Figure 110]

Smiling

[Figure 111]

[Figure 112]

[Figure 113]

[Figure 114]

[Figure 115]

[Figure 116]

[Figure 117]

…

[Figure 118]

[Figure 119]

xf

FC y

h(4)

f

[Figure 120]

[Figure 121]

xf

(c) ANet (d) Extracting features to predict attributes

Figure 2. The proposed pipeline of attribute prediction (Best viewed in color)

accuracy of face localization. Both LNeto and LNets have network structures similar to AlexNet [13], whose hyper parameters are speciﬁed in Fig.2 (a) and (b) respectively. The ﬁfth convolutional layer (C5) of LNeto indicates headshoulders while C5 of LNets indicates faces, with their highly responsed regions in their averaged response maps. Moreover, the input xo of LNeto is a m × n image, while the input xs of LNets is the head-shoulder region, which is localized by LNeto and resized to 227 × 227.

As illustrated in Fig.2 (c), ANet is learned to predict attributes y by providing the input face region xf, which is detected by LNets and properly resized. Speciﬁcally, multiview versions [13] of xf are utilized to train ANet. Furthermore, ANet contains four convolutional layers, where the ﬁlters of C1 and C2 are globally shared and the ﬁlters of C3 and C4 are locally shared. The effectiveness of local ﬁlters have been demonstrated in many face related tasks [26, 28]. To handle complex face variations, ANet is pre-trained by distinguishing massive face identities, which facilitates the learning of discriminative features.

Fig.2 (d) outlines the procedure of attribute recognition. ANet extracts a set of feature vectors (FCs) by cropping overlapping patches on xf. An efﬁcient feed-forward algorithm is developed to reduce redundant computation in the feature extraction stage. SVMs [8] are trained to predict attribute values given each FC. The ﬁnal prediction is obtained by averaging all these values, to cope with small misalignment of face localization.

#### 2.1. Face Localization

The cascade of LNeto and LNets accurately localizes face regions by being trained on image-level attribute tags.

Pre-training LNet Both LNeto and LNets are pretrained with 1,000 general object categories from the ImageNet Large Scale Visual Recognition Challenge

(ILSVRC) 2012 [6], containing 1.2 million training images and 50 thousands validation images. All the data is employed for pre-training except one third of the validation data for choosing hyper-parameters [13]. We augment data by cropping ten patches from each image, including one patch at the center and four at the corners, and their horizontal ﬂips. We adopt softmax for object classiﬁcation, which is optimized by stochastic gradient descent (SGD) with back-propagation (BP) [16]. As shown in Fig.3 (a.2), the averaged response map in C5 of LNeto already indicates locations of objects including human faces after pre-training.

Fine-tuning LNet Both LNeto and LNets are ﬁne-tuned with attribute tags. Additional output layers are added to the LNets individually for ﬁne-tuning and then removed for evaluation. LNeto adopts the full image xo as input while LNets uses the highly responsed region xs in the averaged response map in C5 of LNeto as input, which roughly respond to head-shoulders. The cross-entropy loss is used for attribute classiﬁcation, i.e. L = i=1 yi log p(yi|x)+(1− yi)log 1 − p(yi|x) , where p(yi = 1|x) = 1+exp(1−f(x)) is the probability of the i-th attribute given image x. As shown in Fig.3 (a.3), the response maps after ﬁne-tuning become much more clean and smooth, indicating that the ﬁlters learned by attribute tags can detect face patterns with complex variations. To appreciate the effectiveness of pretraining, we also include the averaged response map in C5 of being directly trained from scratch with attribute tags but without pre-training in Fig.3 (a.4). It cannot separate face regions from background and other body parts well.

Thresholding and Proposing Windows We show that the responses of C5 in LNet are discriminative enough to separate faces and background by simply searching a threshold, such that a window with response larger than this threshold corresponding to face and otherwise is back-

[Figure 122]

[Figure 123]

|[Figure 124]<br><br>[Figure 125]<br><br>(a.1)|
|---|

###### (b)

(a.2)

Response on Face Images

Response on Bg. Images

PercentageofImages

[Figure 126]

[Figure 127]

[Figure 128]

(a.3) (a.4)

threshold

Maximum Score

Figure 3. (a.1) Original image. (a.2)-(a.4) are averaged response maps in C5 of LNeto after pre-training (a.2), ﬁne-tuning (a.3) and directly training from scratch with attribute tags but without pre-training (a.4). (b) Determine threshold.

ground. To determine the threshold, we select 2000 images, each of which contains a single face, and 2000 background images from SUN dataset [29]. For each image, EdgeBox [34] is adopted to propose 500 candidate windows, each of which is measured by a score that sums over its response values normalized by its window size. A larger score indicates the localized pattern is more likely to be a face. Each image is then represented by the maximum score over all its windows. In Fig.3 (b), the histogram of the maximum scores shows that these scores clearly separate face images from background images. The threshold is chosen as the decision boundary as shown in Fig.3 (b). More results are given in Fig.6 (a), showing that the above strategy can precisely localize face within a single test image. Since each training image only contains one single face, we localize a face region using the window with the largest score during training.

Pruning Multiple Faces within a single Window. For some challenging cases in the testing stage, it encounters difﬁculty when multiple faces are presented within a single window, such that there may be multiple regions with high responses. We predict attributes based one face region which generates the largest response1. Similar to [24], a fast density peak identiﬁcation technique is devised. It calculates a special geodesic distance for each position i in the response map, di = (ρ2i +σi2)1/2, where ρi is the density intensity in position i, σi = minj:ρ

j>ρi(sij) and sij is the spatial distance between i and j. Then density peaks are identiﬁed by selecting extreme large di. This process can be further accelerated, as the averaged response map in C5 is sparse. We propose the correct window by cropping the region with the highest density.

To understand why rich attribute information enables accurate face localization, one could consider the examples in Fig.4. If only a single detector [17, 21] is used to classify all the positive and negative samples in Fig.4 (a), it is difﬁcult to handle complex face variations. Therefore, multi-view face detectors [30] were developed in Fig.4 (b), i.e. face images in different views are handled by different

1In CelebFaces and LFW, it is assumed that each image has a “dominant” face, based on which the attribute tags were labeled by users.

Male Black Hair Sunglasses

Brown Hair Big Eyes Smiling

[Figure 129]

[Figure 130]

[Figure 131]

[Figure 132]

[Figure 133]

Frontal Left

[Figure 134]

[Figure 135]

[Figure 136]

[Figure 137]

[Figure 138]

[Figure 139]

[Figure 140]

[Figure 141]

[Figure 142]

[Figure 143]

View 1 View N Attr Config 1

Attr Config N

...

...

...

(a) single detector (c) face localization by attributes

(b) multi-view detector

Figure 4. Face localization by attributes

detectors. View labels were used in training detectors and the whole training set is divided into subsets according to views. If views are treated as one type of face attributes, learning face representation by predicting attributes with deep models actually extends this idea to extreme. As shown in Fig.4 (c), a ﬁlter (or a group of ﬁlters) functions as a detector of an attribute. When a subset of neurons are activated, they indicate the existence of face images with a particular attribute conﬁguration. The neurons at different layers can form many activation patterns, implying that the whole set of face images can be divided into many subsets based on attribute conﬁgurations, and each activation pattern corresponds to one subset (e.g. ‘pointy nose’, ‘rosy cheek’, and ‘smiling’). Therefore, it is not surprising that ﬁlters learned by attributes lead to effective representations for face localization.

#### 2.2. Attribute Prediction

As shown in Fig.2 (c) and (d), ANet is learned to extract features and SVM classiﬁers are used to predict attributes. Speciﬁcally, in the pre-training stage, ANet is trained by classifying massive face identities. In the ﬁnetuning stage, we ﬁrst extend the localized face region, which is properly resized, with a small factor to incorporate more context information. Then, multiple patches are cropped from the enlarged face region and utilized as inputs of ANet. ANet is ﬁne-tuned by attributes to learn the highlevel feature FC. Furthermore, as shown in Fig.2 (d), each feature vector is adopted to train SVM classiﬁer for attribute prediction. The above strategy is similar to the multiview data augmentation [13], increasing the robustness of attribute recognition. In the testing stage, attributes are predicted by averaging the SVM scores over all the patches.

Pre-training of ANet We introduce how to learn discriminative features by pre-training ANet with a large number of identities. We select eight thousand face identities from the CelebFaces [27] dataset, where each identity has around twenty images. There are over 160 thousand training images in total. A simple way to train ANet is to classify eight thousand categories with the softmax loss. However, it is challenging because the number of samples of each identity is limited to maintain the intraclass invariance. To improve intra-class invariance, we employ the similarity loss similar to [27, 10]. It decreases the distances between samples of the same identity. We

[Figure 144]

[Figure 145]

[Figure 146]

[Figure 147]

[Figure 148]

[Figure 149]

3

[Figure 150]

[Figure 151]

[Figure 152]

[Figure 153]

[Figure 154]

3

[Figure 155]

[Figure 156]

2

[Figure 157]

[Figure 158]

2

1

[Figure 159]

[Figure 160]

[Figure 161]

6

[Figure 162]

[Figure 163]

5

[Figure 164]

[Figure 165]

[Figure 166]

1

4

6

[Figure 167]

[Figure 168]

9

[Figure 169]

[Figure 170]

[Figure 171]

8

[Figure 172]

[Figure 173]

[Figure 174]

[Figure 175]

[Figure 176]

[Figure 177]

7

…

[Figure 178]

[Figure 179]

5

[Figure 180]

[Figure 181]

[Figure 182]

[Figure 183]

[Figure 184]

4

[Figure 185]

9

[Figure 186]

8

…

[Figure 187]

7

(c) feature extraction with interweaved operation (d) interweaved operation

(a) global convolution (b) local convolution

Figure 5. Detailed pipeline of efﬁcient feature extractions in ANet.

have L = |iD=1|,y

i=yj FCi −FCj 22, where FCi and FCj denote the feature vectors of the i-th and j-th face images respectively, and yi = yj indicates the identities of these samples are the same. In summary, ANet is pre-trained by combining the softmax loss and the similarity loss.

Efﬁcient Feature Extractions In test, ANet is evaluated on multiple patches of the face region as shown in Fig.2 (d), leading to redundant convolutional computations because of the large overlaps in these patches. When all the ﬁlters are globally-shared, the computational cost can be reduced by applying [11], which convolves the ﬁlters in the input image and then obtains a feature vector for each patch by pooling over the last convolutional layer. Given a simple example with one convolutional layer as shown in Fig.5 (a), the feature vector FC for each patch (e.g. rectangle in red) can be extracted by pooling in the corresponding region of the response map h(1), without evaluating convolutions in the input image patch-by-patch. Therefore, it shares the convolutions for every patch.

However, this scheme is not applicable when we have more than two convolutional layers whose ﬁlters are locally-shared. An example is illustrated in Fig.5 (b), where each patch is equally divided into 3 × 3 = 9 cells and we learn different ﬁlters for different cells. To reduce computations in the ﬁrst convolutional layer, each local ﬁlter can be applied on the entire image, resulting in the

response map with nine channels, i.e. h(1)i and i = 1...9. The ﬁnal response map h(1) is obtained by cropping and

padding the regions (i.e. rectangles in black) in these 9 channels. As a result, each feature vector FC can be pooled from h(1), without convolving the input image patchby-patch. Nevertheless, since h(1) is corresponded to a patch of the input image, the succeeding local convolutions have to be handled patch-by-patch, leading to redundant computations.

To this end, we propose an interweaved operation, which is a fast feed-forward method for CNN with locally-shared ﬁlters. Suppose we have four local ﬁlters in the next locally convolutional layer and each ﬁlter is applied on 2 × 2 cells of h(1) as shown in (b). These cells are the receptive ﬁelds

of the ﬁlters, including {1,2,4,5}, {2,3,5,6}, {4,5,7,8}, and {5,6,8,9}. Instead of directly applying the local ﬁlters on h1, the interweaved operation generates an interweaved

map Ii(1) for each ﬁlter, where i = 1...4. Each local ﬁlter is then apply on its corresponding interweaved map. Since

the interweaved map capturing the entire image, each local ﬁlter is turned into a global ﬁlter such that its computation can be shared across different patches.

Speciﬁcally, each interweaved map, e.g. I1(1), is achieved by padding the cells of the corresponding channels in an interweaved manner, e.g. h(1)i={1,2,4,5}, as shown in Fig.5 (d). All of the interweaved maps are illustrated in Fig.5 (c). After that, each of the four local ﬁlters is applied on its corresponding interweaved map, leading to four response maps h(2)i , where i = 1...4. As a result, the feature vector FC is pooled and concatenated from the receptive ﬁelds of the ﬁlters, which are the rectangles in black as shown in (c).

Intuitively, instead of padding cells according to the receptive ﬁelds of all the local ﬁlters (e.g. h(1) in (b)), which has to be performed in a patch-by-patch way, the interweaved operation pads the cells with respect to the receptive ﬁeld of each local ﬁlter over the entire image. It enables extracting multiple feature vectors with only onepass of feed-forward evaluation. This operation can be repeated when more locally convolutional layers are added. The proposed feature extraction scheme has achieved 6× speedup empirically when compared with patch-by-patch scanning. It is applicable to CNNs with local ﬁlters and compatible to all existing CNN operations.

### 3. Experiments

Large-scale Data Collection We construct two face attribute datasets, namely CelebA and LFWA, by labeling images selected from two challenging face datasets, CelebFaces [27] and LFW [12]. CelebA contains ten thousand identities, each of which has twenty images. There are two hundred thousand images in total. LFWA has 13,233 images of 5,749 identities. Each image in CelebA and LFWA is annotated with forty face attributes and ﬁve key

|[Figure 188]|[Figure 189]|[Figure 190]|[Figure 191]|[Figure 192]|[Figure 193]|[Figure 194]|[Figure 195]|
|---|---|---|---|---|---|---|---|
|[Figure 196]|[Figure 197]|[Figure 198]|[Figure 199]|[Figure 200]|[Figure 201]|[Figure 202]|[Figure 203]|
|[Figure 204]|[Figure 205]|[Figure 206]|[Figure 207]|[Figure 208]|[Figure 209]|[Figure 210]|[Figure 211]|

|[Figure 212]|[Figure 213]|
|---|---|
|[Figure 214]|[Figure 215]|
|[Figure 216]|[Figure 217]|

[Figure 218]

[Figure 219]

(a)

(b) (c)

[Figure 220]

[Figure 221]

[Figure 222]

[Figure 223]

Figure 6. Averaged response maps of LNet, including (a) CelebA, (b) MobileFaces, (c) some failure cases. (Best viewed in color)

- 0.8

- 1

- 0.8

- 1

(a) (b)

TruePositiveRates

TruePositiveRates

0.6

0.6

LNet

LNet

DPM [21]

DPM [21]

0.4

0.4

ACF Multi-view [29]

ACF Multi-view [29]

SURF Cascade [17]

SURF Cascade [17]

Face++ [1]

Face++ [1]

0.2

0.2

0 0.1 0.2 0.3 0.4 0.5

0 0.1 0.2 0.3 0.4 0.5

False Positive Per Image

False Positive Per Image

(c) (d)

- 0.8

- 1

1

RecallRates(FPPI=0.1)

RecallRates(FPPI=0.1)

0.9

0.6

0.8

0.4

LNet

DPM [21]

0.7

ACF Multi-view [29]

0.2

SURF Cascade [17]

LNet (w/o pre-training)

0

10 20 30 40

0 0.2 0.4 0.6 0.8 1

Number of Attributes

Overlap Ratio

Figure 7. ROC curves on (a) CelebA (b) MobileFaces. (c) Recall rates w.r.t. overlap ratio (FPPI = 0.1). (d) Recall rates w.r.t. number of attributes (FPPI = 0.1)

points by a professional labeling company. CelebA and LFWA have over eight million and ﬁve hundred thousand attribute labels, respectively.

CelebA is partitioned into three parts. Images of the ﬁrst eight thousand identities (with 160 thousand images) are used to pre-train and ﬁne-tune ANet and LNet, and the images of another one thousand identities (with twenty thousand images) are employed to train SVM. The images of the remaining one thousand identities (with twenty thousand images) are used for testing. LFWA is partitioned into half for training and half for testing. Speciﬁcally, 6,263 images are adopted to train SVM and the remaining images for test. When being evaluated on LFWA, LNet and ANet are trained on CelebA.

Methods for Comparisons The proposed method is compared with three competitive approaches, i.e. FaceTracer [14], PANDA-w [32], and PANDA-l [32]. FaceTracer extracts HOG and color histograms in several important functional face regions and then trains SVM for attribute classiﬁcation. We extract these functional regions referring to the ground truth landmark points. PANDA-w and PANDA-l are based on PANDA [32], which was proposed recently for human attribute recognition by ensem-

[Figure 224]

[Figure 225]

[Figure 226]

[Figure 227]

[Figure 228]

[Figure 229]

(a)

Input Image Young Pale Skin Bangs Brown Hair No Beard

[Figure 230]

[Figure 231]

[Figure 232]

[Figure 233]

[Figure 234]

[Figure 235]

- (b)
- (c)

Input Image Receding Hairline

Male

Bags Under Eyes

Chubby Wearing Necktie

[Figure 236]

[Figure 237]

[Figure 238]

[Figure 239]

[Figure 240]

[Figure 241]

Input Image Attractive Wearing Lipstick

Straight Hair

Wearing Earrings

Wearing Necklace

Figure 9. Attribute-speciﬁc regions discovery.

bling multiple CNNs, each of which extracts features from a well-aligned human part. These features are concatenated to train SVM for attribute recognition. It is straightforward to adapt this method to face attributes, since face parts can be well-aligned by landmark points. Here, we consider two settings. PANDA-w obtains the face parts by applying the state-of-the-art face detection [17] and alignment [26] on wild images, while PANDA-l attains the face parts by using ground truth landmark points. For fair comparison, all the above methods are trained with the same data as ours.

#### 3.1. Effectiveness of the Framework

This section demonstrates the effectiveness of the framework. All experiments in this section are done on CelebA.

##### • LNet

Performance Comparison We compare LNet with four state-of-the-art face detectors, including DPM [21], ACF Multi-view [30], SURF Cascade [17], and Face++ [1]. We evaluate them by using ROC curves when IoU2≥0.5. As plotted in Fig.7(a), when FPPI = 0.01, the true positive rates of Face++ and LNet are 85% and 93%; when FPPI = 0.1, our method outperforms the other three methods by 11, 9 and 22 percent respectively. We also investigate how these methods perform with respect to overlap ratio (IoU), following [34, 21]. Fig.7(c) shows that

2IoU indicates Intersection over Union.

High Resp. Low Resp. High Resp. Low Resp. Test Image Neurons

Activations

|[Figure 242]|[Figure 243]|[Figure 244]<br><br>Bangs|[Figure 245]<br><br>Brown Hair|[Figure 246]<br><br>Pale Skin|[Figure 247]<br><br>Narrow Eyes|[Figure 248]<br><br>High Cheek.|
|---|---|---|---|---|---|---|
|[Figure 249]|[Figure 250]|[Figure 251]<br><br>Eyeglasses|[Figure 252]<br><br>Mustache|[Figure 253]<br><br>Black Hair|[Figure 254]<br><br>Smiling|[Figure 255]<br><br>Big Nose|
|[Figure 256]|[Figure 257]|[Figure 258]<br><br>Wear. Hat|[Figure 259]<br><br>Blond Hair|[Figure 260]<br><br>Wear. Lipstic|[Figure 261]<br><br>k Asian|[Figure 262]<br><br>Big Eyes|

|[Figure 263]<br><br>(a.1) Gender|[Figure 264]<br><br>(a.2) Hair Color|
|---|---|
|[Figure 265]<br><br>(a.3) Age|[Figure 266]<br><br>(a.4) Race|
|[Figure 267]<br><br>(a.5) Face Shape|[Figure 268]<br><br>(a.6) Eye Shape|

- (b.1)
- (b.2)
- (b.3)

Figure 8. Visualization of neurons in ANet (a) after pre-training (b) after ﬁne-tuning (Best viewed in color)

- (a) ANet (FC) ANet (C4) ANet (C3)

- (b)

Identity-related Attributes Identity-non-related Attributes

100%

90%

85%

95%

Accuracy

80%

90%

75%

85%

70%

80%

Smiling Wearing Hat

Rosy Cheeks

5oClock Shadow

Male White Black Asian

ANet (After fine-tuning) HOG (After PCA)

80%

AverageAccuracy

single best performing neuron

70%

60%

50%

100% 90% 80% 70% 60% 50% 40% 30% 20% 10% 0%

Percentage of Best Performing Neurons Used

Figure 10. (a) Layer-wise comparison of ANet after pre-training (b) Best performing neurons analysis of ANet after ﬁne-tuning. Best performing neurons are different for different attributes. The proposed accuracies are averaged over attributes which select their own subsets of best performing neurons.

LNet generally provides more accurate face localization, leading to good performance in the subsequent attribute prediction.

Further Analysis LNet signiﬁcantly outperforms LNet (without pre-training) by 74 percent when the overlap ratio equals to 0.5, which validates the effectiveness of pre-training, as shown in Fig.7(c). We then explore the inﬂuence of the number of attributes on localization. Fig.7(d) illustrates rich attribute information facilitates face localization. To examine the generalization ability of LNet, we collect another 3,876 face images for testing, namely MobileFaces, which comes from a different source3 and has a different distribution from CelebA. Several examples of MobileFaces are shown in Fig.6(b) and the corresponding ROC curves are plotted in Fig.7(b). We observe that LNet constantly performs better and still gains 7 percent improvement (FPPI = 0.1) compared with other face detectors. Despite some failure cases due to extreme poses and large occlusions, LNet accurately localize faces in the wild as demonstrated in Fig.6. More results of LNet under

3MobileFaces was collected by normal users with mobile phones, while CelebA and LFWA collected face images of celebrities taken by professional photographers.

No_Beard

_

_

_

Attractive

Group #1 Group #2

Mouth_Slightly_Open

_ _

_ _

_ _

Young

Heavy_Makeup

_

_

_

High_Cheekbones

_

_

_

Wavy_Hair

_Hair

_Hair

_Hair

Smiling

Wearing_

Wearing_

Wearing_

Wearing_Lipstick

Bangs

Blond_Hair

_Hair _Hair

_Hair _Hair

_Hair _Hair

Brown_Hair

_Hair

_Hair

_Hair

Black_Hair

_Hair

_Hair

_Hair

Pointy_Nose

_Nose

_Nose

_Nose

Group #3

Gray_Hair Pale_Skin

Group #4

Rosy_Cheeks

_

_

_

Straight_Hair

_Hair

_Hair

_Hair

_

_

_

Oval_Face

_

_

_

Blurry

Group #6

Wearing_

Wearing_

Wearing_

Wearing_Hat Eyeglasses

Wearing_

Wearing_

Wearing_

Wearing_Earrings

Wearing_

Wearing_

Wearing_

Wearing_Necktie

Wearing_

Wearing_

Wearing_

Wearing_Necklace

Chubby Double_Chin

_

_

_

Group #5

Bald

Male

Receding_Hairline

_

_

_

Arched_Eyebrows

_Eyebrows

_Eyebrows

_Eyebrows

5_o_Clock_Shadow

_ _ _

_ _ _

_ _ _

Bushy_Eyebrows

_Eyebrows

_Eyebrows

_Eyebrows

Narrow_Eyes

_Eyes

_Eyes

_Eyes

Bags_Under_Eyes

_ _Eyes

_ _Eyes

_ _Eyes

Sideburns

Big_Nose

Big_Nose

Big_Nose

Big_Nose

Mustache

Big_

Big_

Big_

Big_Lips

Goatee

Figure 11. Automatic attributes grouping.

different circumstances (lighting, pose, occlusion, image resolution, background clutter etc.) are shown in Fig.14.

Attribute-speciﬁc Regions Discovery Different attribute captures information from different region of face. We show that LNet automatically learns to discover these regions. Given an attribute, by converting fully connected layers of LNet into fully convolutional layers following [18], we can locate important region of this attribute. Fig.9 shows some examples. The important regions of some attributes are locally distributed, such as ‘Bags Under Eyes’, ‘Straight Hair’ and ‘Wearing Necklace’, but some are globally distributed, such as ‘Young’, ‘Male’ and ‘Attractive’.

##### • ANet

Pre-training Discovers Semantic Concepts We show that pre-training of ANet can implicity discover semantic concepts related to face identity. Given a hidden neuron at the FC layer of ANet as shown in Fig.2(c), we partition the face images into three groups, including the face images with high, medium, and low responses at this neuron. The face images of each group are then averaged to obtain the mean face. We visualize these mean faces for several neurons in Fig.8(a). Interestingly, these mean face changes smoothly from high response to low response, following a high-level concept. Human can easily assign each neuron with a semantic concept it measures (i.e. the text in yellow). For example, the neurons in (a.1) and (a.4) correspond to ‘gender’ and ‘race’, respectively. It reveals that the high-level hidden neurons of ANet can implicitly learn to discover semantic concepts, even though they are only

| | |5Shadow|Arch.Eyebrows<br><br>|Attractive|BagsUn.Eyes<br><br>|Bald<br><br>|Bangs|BigLips<br><br>|BigNose|BlackHair<br><br>|BlondHair|Blurry|BrownHair<br><br>|BushyEyebrows|Chubby|DoubleChin<br><br>|Eyeglasses|Goatee<br><br>|GrayHair|HeavyMakeup<br><br>|H.Cheekbones<br><br>|Male|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|CelebA<br><br>|FaceTracer [14] PANDA-w [32] PANDA-l [32] [17]+ANet LNets+ANet(w/o) LNets+ANet|85<br><br>82 88<br><br>86<br><br><br>88 91<br><br>|76<br><br>73<br><br>78 75<br><br>74<br><br>79<br><br><br>|78<br><br>77 81<br><br>79<br><br><br>77 81<br><br>|76<br><br>71 79<br><br>77<br><br><br>73 79<br><br>|89 92 96 92 95 98<br><br>|88<br><br>89 92<br><br><br>94 92<br><br>95<br><br><br>|64 61<br><br>67 63 66<br><br>68<br><br><br>|74 70<br>75<br><br><br>74<br>75 78<br>|70 74 85 77 84 88<br><br>|80<br><br>81 93 86 91 95<br><br><br>|81 77 86<br><br>83 80<br><br>84<br><br><br>|60 69<br><br>77 74<br>78 80<br>|80 76 86 80 85 90<br><br>|86 82 86 86 86 91<br><br>|88 85 88 90 88 92<br><br>|98 94<br><br>98 96 96<br><br>99<br><br><br>|93 86 93 92 92 95<br><br>|90 88 94 93 93 97|85<br><br>84<br><br>90 87<br><br>85<br><br><br>90<br><br>|84 80<br><br>86<br><br>85 84<br><br>87<br><br><br>|91<br><br>93<br><br>97<br><br>95 94<br><br>98<br><br><br>|

BushyEyebrows

Arch.Eyebrows

H.Cheekbones

HeavyMakeup

BagsUn.Eyes

DoubleChin

BrownHair

BlondHair

Eyeglasses

BlackHair

GrayHair

Attractive

5Shadow

BigNose

BigLips

Chubby

Goatee

Blurry

Bangs

Male

Bald

FaceTracer [14] 70 67 71 65 77 72 68 73 76 88 73 62 67 67 70 90 69 78 88 77 84 PANDA-w [32] 64 63 70 63 82 79 64 71 78 87 70 65 63 65 64 84 65 77 86 75 86 PANDA-l [32] 84 79 81 80 84 84 73 79 87 94 74 74 79 69 75 89 75 81 93 86 92 [17]+ANet 78 66 75 72 86 84 70 73 82 90 75 71 69 68 70 88 68 82 89 79 91 LNets+ANet(w/o) 81 78 80 79 83 84 72 76 86 94 70 73 79 70 74 92 75 81 91 83 91 LNets+ANet 84 82 83 83 88 88 75 81 90 97 74 77 82 73 78 95 78 84 95 88 94

LFWA

| | |MouthS.O.<br><br>|Mustache<br><br>|NarrowEyes|NoBeard|OvalFace<br><br>|PaleSkin|PointyNose|Reced.Hairline|RosyCheeks<br><br>|Sideburns<br><br>|Smiling|StraightHair<br><br>|WavyHair|Wear.Earrings<br><br>|Wear.Hat<br><br>|Wear.Lipstick<br><br>|Wear.Necklace<br><br>|Wear.Necktie|Young| |Average|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|CelebA|FaceTracer [14] PANDA-w [32] PANDA-l [32] [17]+ANet LNets+ANet(w/o) LNets+ANet<br><br>|87 82 93<br><br>85<br>86 92<br>|91 83 93 87 91 95<br><br>|82 79 84<br>83 77 81<br>|90<br><br>87 93<br><br>91<br><br>92<br><br><br>95<br><br>|64<br><br>62<br><br>65<br><br>65<br><br>63<br><br>66<br><br><br><br><br>|83<br><br>84<br><br><br>91 89 87 91<br><br>|68 65<br><br>71<br><br>67 70<br><br>72<br>|76 82 85<br><br>84<br><br>85<br><br><br>89<br><br>|84 81 87<br><br>85 87 90<br><br><br>|94<br><br>90<br><br>93<br><br>94<br><br><br>91 96<br><br><br>|89 89 92 92 88 92|63 67<br><br>69<br><br>70<br><br><br>69 73<br><br>|73<br><br>76<br><br>77<br><br><br>79 75<br><br>80<br><br><br>|73 72 78<br><br>77<br>78 82<br>|89 91 96 93 96 99<br><br>|89<br><br>88 93 91<br><br>90<br><br><br>93|68 67<br><br>67<br><br>70<br><br>68<br><br>71<br><br><br><br><br>|86 88 91 90 86 93|80<br><br>77 84<br><br>81<br><br><br>83 87<br><br>| |81 79 85 83 83 87<br><br>|

Hairline

ecklace

arrings

ipstick

ecktie

heeks

Eyes

tHair

S.O.

Nose

air

ce

at

ns

he

rd

in

###### e

FaceTracer [14] 77 83 73 69 66 70 74 63 70 71 78 67 62 88 75 87 81 71 80 74 PANDA-w [32] 74 77 68 63 64 64 68 61 64 68 77 68 63 85 78 83 79 70 76 71 PANDA-l [32] 78 87 73 75 72 84 76 84 73 76 89 73 75 92 82 93 86 79 82 81 [17]+ANet 76 79 74 69 66 68 72 70 71 72 82 72 65 87 82 86 81 72 79 76 LNets+ANet(w/o) 78 87 77 75 71 81 76 81 72 72 88 71 73 90 84 92 83 76 82 79 LNets+ANet 82 92 81 79 74 84 80 85 78 77 91 76 76 94 88 95 88 79 86 84

LFWA

Table 1. Performance comparison of attribute prediction. (Note that FaceTracer and PANDA-l attains the face parts by using ground truth landmark points.)

optimized for face recognition using identity information and attribute labels are not used in pre-training. We also observe that most of these concepts are intrinsic to face identity, such as the shape of facial components, gender, and race.

To better explain this phenomena, we compare the accuracy of attribute prediction using features at different layers of ANet right after pre-training. They are FC, C4, and C3. The forty attributes are roughly separated into two groups, which are identity-related attributes, such as gender and race, and identity-non-related attributes, e.g. attributes of expressions, wearing hat and sunglasses. We select some representative attributes for each group and plot the results in Fig.10(a), which shows that the performance of FC outperforms C4 and C3 in the group of identity-related attributes, but they are relatively weaker when dealing with identity-non-related attributes. This is because the top layer FC learns identity features, which are insensitive to intrapersonal face variations.

Fine-tuning Expands Semantic Concepts Fig.8 shows that after ﬁne-tuning, ANet can expand these concepts to more attribute types. Fig.8(b) visualizes the neurons in the FC layer, which are ranked by their responses in descending order with respect to several test images. Human can assign semantic meaning to each of these neurons. We found that a large number of new concepts can be observed. Remark-

ably, these neurons express diverse high-level meanings and cooperate to explain the test images. The activations of all the neurons are visualized in Fig.8(b), and they are sparse. In some sense, attributes presented in each test image are explained by a sparse linear combination of these concepts. For instance, the ﬁrst image is described as “a lady with bangs, brown hair, pale skin, narrow eyes and high cheekbones”, which well matches human perception.

To validate this, we explore how the number of neurons inﬂuences attribute prediction accuracies. Best performing neurons for each attribute are identiﬁed by sorting corresponding SVM weights. Fig.10(b) illusatrates that only 10% of ANet best performing neurons are needed to achieve 90% of the original performance of a particular attribute4. In contrast, HOG+PCA does not have the sparse nature and need more than 95% features Besides, the best single performing neuron of ANet outperforms that of HOG+PCA by 25 percent in average prediction accuracy.

Automatic Attributes Grouping Here we show that the weight matrix at the FC layer of ANet can implicitly capture relations between attributes. Each column vector of the weight matrix can be viewed as a decision hyperplane to partition the negatives and positive samples of an attribute. By simply applying k-means to these vectors, the clusters show clear grouping patterns, which can be interpreted

4Best performing neurons are different for different attributes.

Mustache

| |Gender<br><br>|Asian<br><br>|White|Black<br><br>|Youth|M.Aged|Senior<br><br>|BlackH.<br><br>|BlondH.|Bald<br><br>|NoEye.<br><br>|Eye.|Mustache|R.Hair.<br><br>|B.Eye.<br><br>|A.Eye.|B.Nose<br><br>|NoBeard|R.Jaw| |Average|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|FaceTracer [14] POOF [2] LNets+ANet<br><br>|91<br>92 94<br>|87 90 85<br><br>|86 81 83<br><br>|75 90 87|66 71 80<br><br>|54 60 77<br><br>|70<br><br>80<br><br>81<br><br><br>|66<br>67 86<br>|68 75 89<br><br>|72 67 84<br><br>|84 87<br><br>85<br><br><br>|86 90 84<br><br>|83 86 86|76 72 83<br><br>|72 74 82|66 71 75<br><br>|65 68 79|81<br><br>77<br><br>78<br><br><br>|51 55 81| |73 76 83|

NoBeard

BlondH.

M.Aged

BlackH.

Average

NoEye.

B.Nose

R.Hair.

A.Eye.

B.Eye.

Gender

R.Jaw

Senior

White

Youth

Asian

Black

Bald

Eye.

Table 2. Performance comparison on extended attributes. (Performance are measured by the average of true positive rates and true negative rates.)

FaceTracer [11] PANDA-w [26] PANDA-l [26] LNets+ANet

100%

95%

90%

Accuracy

85%

80%

75%

70%

65%

60%

Figure 12. Performance comparison of FaceTracer [14], PANDA-w [32], PANDA-l [32] and LNets+ANet on LFWA+.

LNets+ANet

PANDA-l

CelebA LFWA LFWA+

84 86

88

| |
|---|

| |
|---|

| |
|---|

Accuracy

82

85

80

82

76

77

1k 3k 10k

1k 3k 10k

1k 3k 10k

Dataset Size

Figure 13. Performances of different training dataset sizes.

semantically. As shown in Fig.11, Group #1, Group #2 and Group #4 demonstrate co-occurrence relationship between attributes, e.g. ‘Attractive’ and ‘Heavy Makeup’ have high correlation. Attributes in Group #3 share similar color descriptors, while attributes in Group #6 correspond to certain texture and appearance traits.

#### 3.2. Attribute Prediction

Performance Comparison The attribute prediction performance is reported in Table.1. On CelebA, the prediction accuracies of FaceTracer [14], PANDA-w [32], PANDA-l [32], and our LNets+ANet are 81, 79, 85, and 87 percent respectively, while the corresponding accuracies on LFWA are 74, 71, 81, and 84 percent. Our method outperforms PANDA-w by nearly 10 percent. Remarkably, even when PANDA-l is equipped with groundtruth bounding boxes and landmark positions, our method still achieves 3 percent gain. The strength of our method is illustrated not only on global attributes, e.g. “Chubby” and “Young”, but also on ﬁne-grained facial traits, e.g. “Mastache” and “Pointy Nose”. We also report performance on 19 extended attributes and compare our result with [14] and [2]. The evaluation protocol is the same as [2]. In Table 2, LNets+ANet

outperforms them by 10 and 7 percent respectively.

Further Analysis When compared with [17]+ANet, LNets accounts for nearly 6 percentage improvement over using an off-the-shelf face detector [17]. We also experiment with the case of providing ANet with localized face region by LNets, but without pre-training, denoted as LNets+ANet(w/o). The average accuracies have dropped 4 and 5 percent on CelebA and LFWA, which indicate pre-training with massive facial identities helps discover semantic concepts.

Performance on LFWA+ To further examine whether the proposed approach can be generalized to unseen attributes, we manually label 30 more attributes for the testing images on LFWA and denote this extended dataset as LFWA+. To test on these 30 attributes, we directly transfer weights learned by deep models to extract features, and only re-train SVMs using one third of the images. LNets+ANet leads to 8, 10, and 3 percent average gains over the other three approaches (FaceTracer, PANDA-w, and PANDA-l). It demonstrates that our method learns discriminative face representations and has good generalization ability.

Size of Training Dataset We compare the attribute prediction accuracy of the proposed method with the accuracy of PANDA-l, regarding different sizes of training datasets. Only the training data of ANet is changed in our method for fair comparison. Fig.13 demonstrates that LNets+ANet performs well when dataset size is small, but the performance of PANDA-l drops signiﬁcantly.

Time Complexity For a 300 ∗ 300 image, LNets takes 35ms to localize face region while ANet takes 14ms to extract features on GPU. In contrast, a na¨ıve patch-bypatch scanning needs nearly 80 ms to extract features. Our framework has large potential in real-world applications.

### 4. Conclusion

This paper has proposed a novel deep learning framework for face attribute prediction in the wild. With carefully designed pre-training strategies, our method is robust to background clutters and face variations. We devise a new fast feed-forward algorithm for locally shared ﬁlters to save redundant computation, which enables evaluating image with arbitrary size in realtime. It allows taking images of arbitrary sizes as input without normalization. We have also revealed multiple important facts about learning face representation, which shed a light on new directions of face localization and representation learning.

### References

- [1] Face++. http://www.faceplusplus.com/. 6
- [2] T. Berg and P. N. Belhumeur. Poof: Part-based one-vs.-one features for ﬁne-grained categorization, face veriﬁcation, and attribute estimation. In CVPR, pages 955–962, 2013. 1, 2, 9
- [3] A. Bergamo, L. Bazzani, D. Anguelov, and L. Torresani. Self-taught object localization with deep networks. arXiv preprint arXiv:1409.3964, 2014. 2
- [4] L. Bourdev, S. Maji, and J. Malik. Describing people: A poselet-based approach to attribute classiﬁcation. In ICCV, pages 1543–1550, 2011. 1, 2
- [5] J. Chung, D. Lee, Y. Seo, and C. D. Yoo. Deep attribute networks. In NIPS Workshop on Deep Learning and Unsupervised Feature Learning, volume 3, 2012. 1
- [6] J. Deng, W. Dong, R. Socher, L.-J. Li, K. Li, and L. FeiFei. Imagenet: A large-scale hierarchical image database. In CVPR, pages 248–255, 2009. 2, 3
- [7] J. Donahue, Y. Jia, O. Vinyals, J. Hoffman, N. Zhang, E. Tzeng, and T. Darrell. Decaf: A deep convolutional activation feature for generic visual recognition. arXiv preprint arXiv:1310.1531, 2013. 2
- [8] R.-E. Fan, K.-W. Chang, C.-J. Hsieh, X.-R. Wang, and C.J. Lin. Liblinear: A library for large linear classiﬁcation. JMLR, 9:1871–1874, 2008. 3
- [9] A. Farhadi, I. Endres, D. Hoiem, and D. Forsyth. Describing objects by their attributes. In CVPR, pages 1778–1785, 2009. 2
- [10] R. Hadsell, S. Chopra, and Y. LeCun. Dimensionality reduction by learning an invariant mapping. In CVPR, volume 2, pages 1735–1742, 2006. 4
- [11] K. He, X. Zhang, S. Ren, and J. Sun. Spatial pyramid pooling in deep convolutional networks for visual recognition. In ECCV, pages 346–361. 2014. 5
- [12] G. B. Huang, M. Ramesh, T. Berg, and E. Learned-Miller. Labeled faces in the wild: A database for studying face recognition in unconstrained environments. Technical Report 07-49, University of Massachusetts, Amherst, October

2007. 2, 5

- [13] A. Krizhevsky, I. Sutskever, and G. E. Hinton. Imagenet classiﬁcation with deep convolutional neural networks. In NIPS, pages 1097–1105, 2012. 2, 3, 4
- [14] N. Kumar, P. Belhumeur, and S. Nayar. Facetracer: A search engine for large collections of images with faces. In ECCV, pages 340–353. 2008. 6, 8, 9
- [15] N. Kumar, A. C. Berg, P. N. Belhumeur, and S. K. Nayar. Attribute and simile classiﬁers for face veriﬁcation. In ICCV, pages 365–372, 2009. 1, 2
- [16] Y. LeCun, B. Boser, J. S. Denker, D. Henderson, R. E. Howard, W. Hubbard, and L. D. Jackel. Handwritten digit recognition with a back-propagation network. In NIPS, 1990.

- 3

[17] J. Li and Y. Zhang. Learning surf cascade for fast and accurate object detection. In CVPR, pages 3468–3475, 2013.

- 4, 6, 8, 9

- [18] J. Long, E. Shelhamer, and T. Darrell. Fully convolutional networks for semantic segmentation. In CVPR, 2015. 7

- [19] P. Luo, X. Wang, and X. Tang. A deep sum-product architecture for robust facial attributes analysis. In ICCV, pages 2864–2871, 2013. 1, 2
- [20] O. K. Manyam, N. Kumar, P. Belhumeur, and D. Kriegman. Two faces are better than one: Face recognition in group photographs. In IJCB, pages 1–8, 2011. 1
- [21] M. Mathias, R. Benenson, M. Pedersoli, and L. Van Gool. Face detection without bells and whistles. In ECCV, pages 720–735. 2014. 4, 6
- [22] M. Oquab, L. Bottou, I. Laptev, and J. Sivic. Is object localization for free?–weakly-supervised learning with convolutional neural networks. In CVPR, pages 685–694, 2015. 2
- [23] A. S. Razavian, H. Azizpour, J. Sullivan, and S. Carlsson. Cnn features off-the-shelf: an astounding baseline for recognition. arXiv preprint arXiv:1403.6382, 2014. 1, 2
- [24] A. Rodriguez and A. Laio. Clustering by fast search and ﬁnd of density peaks. Science, 344(6191):1492–1496, 2014. 4
- [25] F. Song, X. Tan, and S. Chen. Exploiting relationship between attributes for improved face veriﬁcation. CVIU, 122:143–154, 2014. 1
- [26] Y. Sun, X. Wang, and X. Tang. Deep convolutional network cascade for facial point detection. In CVPR, pages 3476– 3483, 2013. 1, 3, 6
- [27] Y. Sun, X. Wang, and X. Tang. Deep learning face representation by joint identiﬁcation-veriﬁcation. In NIPS,

2014. 2, 4, 5

- [28] Y. Taigman, M. Yang, M. Ranzato, and L. Wolf. Deepface: Closing the gap to human-level performance in face veriﬁcation. In CVPR, pages 1701–1708, 2014. 2, 3
- [29] J. Xiao, J. Hays, K. A. Ehinger, A. Oliva, and A. Torralba. Sun database: Large-scale scene recognition from abbey to zoo. In CVPR, pages 3485–3492, 2010. 4
- [30] B. Yang, J. Yan, Z. Lei, and S. Z. Li. Aggregate channel features for multi-view face detection. In IJCB, pages 1–8,

2014. 4, 6

- [31] N. Zhang, J. Donahue, R. Girshick, and T. Darrell. Partbased r-cnns for ﬁne-grained category detection. In ECCV, pages 834–849. 2014. 2
- [32] N. Zhang, M. Paluri, M. Ranzato, T. Darrell, and L. Bourdev. Panda: Pose aligned networks for deep attribute modeling. In CVPR, 2014. 1, 2, 6, 8, 9
- [33] B. Zhou, A. Khosla, A. Lapedriza, A. Oliva, and A. Torralba. Object detectors emerge in deep scene cnns. In ICLR, 2015. 2
- [34] C. L. Zitnick and P. Doll´ar. Edge boxes: Locating object proposals from edges. In ECCV, pages 391–405. 2014. 4, 6

|[Figure 269]|[Figure 270]|[Figure 271]|[Figure 272]|[Figure 273]|[Figure 274]|[Figure 275]|[Figure 276]|[Figure 277]|[Figure 278]|
|---|---|---|---|---|---|---|---|---|---|
|[Figure 279]|[Figure 280]|[Figure 281]|[Figure 282]|[Figure 283]|[Figure 284]|[Figure 285]|[Figure 286]|[Figure 287]|[Figure 288]|
|[Figure 289]|[Figure 290]|[Figure 291]|[Figure 292]|[Figure 293]|[Figure 294]|[Figure 295]|[Figure 296]|[Figure 297]|[Figure 298]|
|[Figure 299]|[Figure 300]|[Figure 301]|[Figure 302]|[Figure 303]|[Figure 304]|[Figure 305]|[Figure 306]|[Figure 307]|[Figure 308]|
|[Figure 309]|[Figure 310]|[Figure 311]|[Figure 312]|[Figure 313]|[Figure 314]|[Figure 315]|[Figure 316]|[Figure 317]|[Figure 318]|
|[Figure 319]|[Figure 320]|[Figure 321]|[Figure 322]|[Figure 323]|[Figure 324]|[Figure 325]|[Figure 326]|[Figure 327]|[Figure 328]|

###### Figure 14. More results of LNet averaged response maps. (Best viewed in color)

