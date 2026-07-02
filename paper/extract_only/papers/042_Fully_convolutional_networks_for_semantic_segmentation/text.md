## Fully Convolutional Networks for Semantic Segmentation

Jonathan Long∗ Evan Shelhamer∗ Trevor Darrell UC Berkeley

{jonlong,shelhamer,trevor}@cs.berkeley.edu

# arXiv:1411.4038v2[cs.CV]8Mar2015

### Abstract

Convolutional networks are powerful visual models that yield hierarchies of features. We show that convolutional networks by themselves, trained end-to-end, pixelsto-pixels, exceed the state-of-the-art in semantic segmentation. Our key insight is to build “fully convolutional” networks that take input of arbitrary size and produce correspondingly-sized output with efﬁcient inference and learning. We deﬁne and detail the space of fully convolutional networks, explain their application to spatially dense prediction tasks, and draw connections to prior models. We adapt contemporary classiﬁcation networks (AlexNet [19], the VGG net [31], and GoogLeNet [32]) into fully convolutional networks and transfer their learned representations by ﬁne-tuning [4] to the segmentation task. We then deﬁne a novel architecture that combines semantic information from a deep, coarse layer with appearance information from a shallow, ﬁne layer to produce accurate and detailed segmentations. Our fully convolutional network achieves state-of-the-art segmentation of PASCAL VOC (20% relative improvement to 62.2% mean IU on 2012), NYUDv2, and SIFT Flow, while inference takes less than one ﬁfth of a second for a typical image.

### 1. Introduction

Convolutional networks are driving advances in recognition. Convnets are not only improving for whole-image classiﬁcation [19, 31, 32], but also making progress on local tasks with structured output. These include advances in bounding box object detection [29, 12, 17], part and keypoint prediction [39, 24], and local correspondence [24, 9].

The natural next step in the progression from coarse to ﬁne inference is to make a prediction at every pixel. Prior approaches have used convnets for semantic segmentation [27, 2, 8, 28, 16, 14, 11], in which each pixel is labeled with the class of its enclosing object or region, but with shortcomings that this work addresses.

∗Authors contributed equally

pixelwisepredictionsegmentationg.t.

[Figure 1]

[Figure 2]

forward/inference

backward/learning

40964096

21

384

384256

256

96

21

Figure 1. Fully convolutional networks can efﬁciently learn to make dense predictions for per-pixel tasks like semantic segmentation.

We show that a fully convolutional network (FCN), trained end-to-end, pixels-to-pixels on semantic segmentation exceeds the state-of-the-art without further machinery. To our knowledge, this is the ﬁrst work to train FCNs end-to-end (1) for pixelwise prediction and (2) from supervised pre-training. Fully convolutional versions of existing networks predict dense outputs from arbitrary-sized inputs. Both learning and inference are performed whole-image-ata-time by dense feedforward computation and backpropagation. In-network upsampling layers enable pixelwise prediction and learning in nets with subsampled pooling.

This method is efﬁcient, both asymptotically and absolutely, and precludes the need for the complications in other works. Patchwise training is common [27, 2, 8, 28, 11], but lacks the efﬁciency of fully convolutional training. Our approach does not make use of pre- and post-processing complications, including superpixels [8, 16], proposals [16, 14], or post-hoc reﬁnement by random ﬁelds or local classiﬁers [8, 16]. Our model transfers recent success in classiﬁcation [19, 31, 32] to dense prediction by reinterpreting classiﬁcation nets as fully convolutional and ﬁne-tuning from their learned representations. In contrast, previous works have applied small convnets without supervised pre-training [8, 28, 27].

Semantic segmentation faces an inherent tension between semantics and location: global information resolves what while local information resolves where. Deep feature

1

hierarchies jointly encode location and semantics in a localto-global pyramid. We deﬁne a novel “skip” architecture to combine deep, coarse, semantic information and shallow, ﬁne, appearance information in Section 4.2 (see Figure 3).

In the next section, we review related work on deep classiﬁcation nets, FCNs, and recent approaches to semantic segmentation using convnets. The following sections explain FCN design and dense prediction tradeoffs, introduce our architecture with in-network upsampling and multilayer combinations, and describe our experimental framework. Finally, we demonstrate state-of-the-art results on PASCAL VOC 2011-2, NYUDv2, and SIFT Flow.

### 2. Related work

Our approach draws on recent successes of deep nets for image classiﬁcation [19, 31, 32] and transfer learning [4, 38]. Transfer was ﬁrst demonstrated on various visual recognition tasks [4, 38], then on detection, and on both instance and semantic segmentation in hybrid proposalclassiﬁer models [12, 16, 14]. We now re-architect and ﬁnetune classiﬁcation nets to direct, dense prediction of semantic segmentation. We chart the space of FCNs and situate prior models, both historical and recent, in this framework.

Fully convolutional networks To our knowledge, the idea of extending a convnet to arbitrary-sized inputs ﬁrst appeared in Matan et al. [25], which extended the classic LeNet [21] to recognize strings of digits. Because their net was limited to one-dimensional input strings, Matan et al. used Viterbi decoding to obtain their outputs. Wolf and Platt [37] expand convnet outputs to 2-dimensional maps of detection scores for the four corners of postal address blocks. Both of these historical works do inference and learning fully convolutionally for detection. Ning et al. [27] deﬁne a convnet for coarse multiclass segmentation of C. elegans tissues with fully convolutional inference.

Fully convolutional computation has also been exploited in the present era of many-layered nets. Sliding window detection by Sermanet et al. [29], semantic segmentation by Pinheiro and Collobert [28], and image restoration by Eigen et al. [5] do fully convolutional inference. Fully convolutional training is rare, but used effectively by Tompson et al. [35] to learn an end-to-end part detector and spatial model for pose estimation, although they do not exposit on or analyze this method.

Alternatively, He et al. [17] discard the nonconvolutional portion of classiﬁcation nets to make a feature extractor. They combine proposals and spatial pyramid pooling to yield a localized, ﬁxed-length feature for classiﬁcation. While fast and effective, this hybrid model cannot be learned end-to-end.

Dense prediction with convnets Several recent works have applied convnets to dense prediction problems, including semantic segmentation by Ning et al. [27], Farabet et al.

[8], and Pinheiro and Collobert [28]; boundary prediction for electron microscopy by Ciresan et al. [2] and for natural images by a hybrid neural net/nearest neighbor model by Ganin and Lempitsky [11]; and image restoration and depth estimation by Eigen et al. [5, 6]. Common elements of these approaches include

- • small models restricting capacity and receptive ﬁelds;
- • patchwise training [27, 2, 8, 28, 11];
- • post-processing by superpixel projection, random ﬁeld regularization, ﬁltering, or local classiﬁcation [8, 2, 11];
- • input shifting and output interlacing for dense output [28, 11] as introduced by OverFeat [29];
- • multi-scale pyramid processing [8, 28, 11];
- • saturating tanh nonlinearities [8, 5, 28]; and
- • ensembles [2, 11],

whereas our method does without this machinery. However, we do study patchwise training 3.4 and “shift-and-stitch” dense output 3.2 from the perspective of FCNs. We also discuss in-network upsampling 3.3, of which the fully connected prediction by Eigen et al. [6] is a special case.

Unlike these existing methods, we adapt and extend deep classiﬁcation architectures, using image classiﬁcation as supervised pre-training, and ﬁne-tune fully convolutionally to learn simply and efﬁciently from whole image inputs and whole image ground thruths.

Hariharan et al. [16] and Gupta et al. [14] likewise adapt deep classiﬁcation nets to semantic segmentation, but do so in hybrid proposal-classiﬁer models. These approaches ﬁne-tune an R-CNN system [12] by sampling bounding boxes and/or region proposals for detection, semantic segmentation, and instance segmentation. Neither method is learned end-to-end.

They achieve state-of-the-art results on PASCAL VOC segmentation and NYUDv2 segmentation respectively, so we directly compare our standalone, end-to-end FCN to their semantic segmentation results in Section 5.

### 3. Fully convolutional networks

Each layer of data in a convnet is a three-dimensional array of size h × w × d, where h and w are spatial dimensions, and d is the feature or channel dimension. The ﬁrst layer is the image, with pixel size h × w, and d color channels. Locations in higher layers correspond to the locations in the image they are path-connected to, which are called their receptive ﬁelds.

Convnets are built on translation invariance. Their basic components (convolution, pooling, and activation functions) operate on local input regions, and depend only on relative spatial coordinates. Writing xij for the data vector at location (i,j) in a particular layer, and yij for the follow-

ing layer, these functions compute outputs yij by

yij = fks ({xsi+δi,sj+δj}0≤δi,δj≤k)

where k is called the kernel size, s is the stride or subsampling factor, and fks determines the layer type: a matrix multiplication for convolution or average pooling, a spatial max for max pooling, or an elementwise nonlinearity for an activation function, and so on for other types of layers.

This functional form is maintained under composition, with kernel size and stride obeying the transformation rule

fks ◦ gk s = (f ◦ g)k +(k−1)s ,ss .

While a general deep net computes a general nonlinear function, a net with only layers of this form computes a nonlinear ﬁlter, which we call a deep ﬁlter or fully convolutional network. An FCN naturally operates on an input of any size, and produces an output of corresponding (possibly resampled) spatial dimensions.

A real-valued loss function composed with an FCN deﬁnes a task. If the loss function is a sum over the spatial dimensions of the ﬁnal layer, (x;θ) = ij (xij;θ), its gradient will be a sum over the gradients of each of its spatial components. Thus stochastic gradient descent on computed on whole images will be the same as stochastic gradient descent on , taking all of the ﬁnal layer receptive ﬁelds as a minibatch.

When these receptive ﬁelds overlap signiﬁcantly, both feedforward computation and backpropagation are much more efﬁcient when computed layer-by-layer over an entire image instead of independently patch-by-patch.

We next explain how to convert classiﬁcation nets into fully convolutional nets that produce coarse output maps. For pixelwise prediction, we need to connect these coarse outputs back to the pixels. Section 3.2 describes a trick that OverFeat [29] introduced for this purpose. We gain insight into this trick by reinterpreting it as an equivalent network modiﬁcation. As an efﬁcient, effective alternative, we introduce deconvolution layers for upsampling in Section 3.3. In Section 3.4 we consider training by patchwise sampling, and give evidence in Section 4.3 that our whole image training is faster and equally effective.

#### 3.1. Adapting classiﬁers for dense prediction

Typical recognition nets, including LeNet [21], AlexNet [19], and its deeper successors [31, 32], ostensibly take ﬁxed-sized inputs and produce nonspatial outputs. The fully connected layers of these nets have ﬁxed dimensions and throw away spatial coordinates. However, these fully connected layers can also be viewed as convolutions with kernels that cover their entire input regions. Doing so casts them into fully convolutional networks that take input of any size and output classiﬁcation maps. This transformation

``tabby cat"

[Figure 3]

384384256409640961000

256

96

convolutionalization

tabby cat heatmap

[Figure 4]

409640961000

384256

384

256

96

Figure 2. Transforming fully connected layers into convolution layers enables a classiﬁcation net to output a heatmap. Adding layers and a spatial loss (as in Figure 1) produces an efﬁcient machine for end-to-end dense learning.

is illustrated in Figure 2. (By contrast, nonconvolutional nets, such as the one by Le et al. [20], lack this capability.)

Furthermore, while the resulting maps are equivalent to the evaluation of the original net on particular input patches, the computation is highly amortized over the overlapping regions of those patches. For example, while AlexNet takes 1.2 ms (on a typical GPU) to produce the classiﬁcation scores of a 227 × 227 image, the fully convolutional version takes 22 ms to produce a 10 × 10 grid of outputs from a 500 × 500 image, which is more than 5 times faster than the na¨ıve approach1.

The spatial output maps of these convolutionalized models make them a natural choice for dense problems like semantic segmentation. With ground truth available at every output cell, both the forward and backward passes are straightforward, and both take advantage of the inherent computational efﬁciency (and aggressive optimization) of convolution.

The corresponding backward times for the AlexNet example are 2.4 ms for a single image and 37 ms for a fully convolutional 10 × 10 output map, resulting in a speedup similar to that of the forward pass. This dense backpropagation is illustrated in Figure 1.

While our reinterpretation of classiﬁcation nets as fully convolutional yields output maps for inputs of any size, the output dimensions are typically reduced by subsampling. The classiﬁcation nets subsample to keep ﬁlters small and computational requirements reasonable. This coarsens the output of a fully convolutional version of these nets, reducing it from the size of the input by a factor equal to the pixel stride of the receptive ﬁelds of the output units.

1Assuming efﬁcient batching of single image inputs. The classiﬁcation scores for a single image by itself take 5.4 ms to produce, which is nearly 25 times slower than the fully convolutional version.

#### 3.2. Shift-and-stitch is ﬁlter rarefaction

Input shifting and output interlacing is a trick that yields dense predictions from coarse outputs without interpolation, introduced by OverFeat [29]. If the outputs are downsampled by a factor of f, the input is shifted (by left and top padding) x pixels to the right and y pixels down, once for every value of (x,y) ∈ {0,...,f − 1} × {0,...,f − 1}. These f2 inputs are each run through the convnet, and the outputs are interlaced so that the predictions correspond to the pixels at the centers of their receptive ﬁelds.

Changing only the ﬁlters and layer strides of a convnet can produce the same output as this shift-and-stitch trick. Consider a layer (convolution or pooling) with input stride s, and a following convolution layer with ﬁlter weights fij (eliding the feature dimensions, irrelevant here). Setting the lower layer’s input stride to 1 upsamples its output by a factor of s, just like shift-and-stitch. However, convolving the original ﬁlter with the upsampled output does not produce the same result as the trick, because the original ﬁlter only sees a reduced portion of its (now upsampled) input. To reproduce the trick, rarefy the ﬁlter by enlarging it as

f ij =

fi/s,j/s if s divides both i and j; 0 otherwise,

(with i and j zero-based). Reproducing the full net output of the trick involves repeating this ﬁlter enlargement layerby-layer until all subsampling is removed.

Simply decreasing subsampling within a net is a tradeoff: the ﬁlters see ﬁner information, but have smaller receptive ﬁelds and take longer to compute. We have seen that the shift-and-stitch trick is another kind of tradeoff: the output is made denser without decreasing the receptive ﬁeld sizes of the ﬁlters, but the ﬁlters are prohibited from accessing information at a ﬁner scale than their original design.

Although we have done preliminary experiments with shift-and-stitch, we do not use it in our model. We ﬁnd learning through upsampling, as described in the next section, to be more effective and efﬁcient, especially when combined with the skip layer fusion described later on.

#### 3.3. Upsampling is backwards strided convolution

Another way to connect coarse outputs to dense pixels is interpolation. For instance, simple bilinear interpolation computes each output yij from the nearest four inputs by a linear map that depends only on the relative positions of the input and output cells.

In a sense, upsampling with factor f is convolution with a fractional input stride of 1/f. So long as f is integral, a natural way to upsample is therefore backwards convolution (sometimes called deconvolution) with an output stride of f. Such an operation is trivial to implement, since it simply reverses the forward and backward passes of convolution.

Thus upsampling is performed in-network for end-to-end learning by backpropagation from the pixelwise loss.

Note that the deconvolution ﬁlter in such a layer need not be ﬁxed (e.g., to bilinear upsampling), but can be learned. A stack of deconvolution layers and activation functions can even learn a nonlinear upsampling.

In our experiments, we ﬁnd that in-network upsampling is fast and effective for learning dense prediction. Our best segmentation architecture uses these layers to learn to upsample for reﬁned prediction in Section 4.2.

#### 3.4. Patchwise training is loss sampling

In stochastic optimization, gradient computation is driven by the training distribution. Both patchwise training and fully-convolutional training can be made to produce any distribution, although their relative computational efﬁciency depends on overlap and minibatch size. Whole image fully convolutional training is identical to patchwise training where each batch consists of all the receptive ﬁelds of the units below the loss for an image (or collection of images). While this is more efﬁcient than uniform sampling of patches, it reduces the number of possible batches. However, random selection of patches within an image may be recovered simply. Restricting the loss to a randomly sampled subset of its spatial terms (or, equivalently applying a DropConnect mask [36] between the output and the loss) excludes patches from the gradient computation.

If the kept patches still have signiﬁcant overlap, fully convolutional computation will still speed up training. If gradients are accumulated over multiple backward passes, batches can include patches from several images.2

Sampling in patchwise training can correct class imbalance [27, 8, 2] and mitigate the spatial correlation of dense patches [28, 16]. In fully convolutional training, class balance can also be achieved by weighting the loss, and loss sampling can be used to address spatial correlation.

We explore training with sampling in Section 4.3, and do not ﬁnd that it yields faster or better convergence for dense prediction. Whole image training is effective and efﬁcient.

### 4. Segmentation Architecture

We cast ILSVRC classiﬁers into FCNs and augment them for dense prediction with in-network upsampling and a pixelwise loss. We train for segmentation by ﬁne-tuning. Next, we build a novel skip architecture that combines coarse, semantic and local, appearance information to reﬁne prediction.

For this investigation, we train and validate on the PASCAL VOC 2011 segmentation challenge [7]. We train with

2Note that not every possible patch is included this way, since the receptive ﬁelds of the ﬁnal layer units lie on a ﬁxed, strided grid. However, by shifting the image left and down by a random value up to the stride, random selection from all possible patches may be recovered.

a per-pixel multinomial logistic loss and validate with the standard metric of mean pixel intersection over union, with the mean taken over all classes, including background. The training ignores pixels that are masked out (as ambiguous or difﬁcult) in the ground truth.

#### 4.1. From classiﬁer to dense FCN

We begin by convolutionalizing proven classiﬁcation architectures as in Section 3. We consider the AlexNet3 architecture [19] that won ILSVRC12, as well as the VGG nets [31] and the GoogLeNet4 [32] which did exceptionally well in ILSVRC14. We pick the VGG 16-layer net5, which we found to be equivalent to the 19-layer net on this task. For GoogLeNet, we use only the ﬁnal loss layer, and improve performance by discarding the ﬁnal average pooling layer. We decapitate each net by discarding the ﬁnal classiﬁer layer, and convert all fully connected layers to convolutions. We append a 1 × 1 convolution with channel dimension 21 to predict scores for each of the PASCAL classes (including background) at each of the coarse output locations, followed by a deconvolution layer to bilinearly upsample the coarse outputs to pixel-dense outputs as described in Section 3.3. Table 1 compares the preliminary validation results along with the basic characteristics of each net. We report the best results achieved after convergence at a ﬁxed learning rate (at least 175 epochs).

Fine-tuning from classiﬁcation to segmentation gave reasonable predictions for each net. Even the worst model achieved ∼ 75% of state-of-the-art performance. The segmentation-equippped VGG net (FCN-VGG16) already appears to be state-of-the-art at 56.0 mean IU on val, compared to 52.6 on test [16]. Training on extra data raises performance to 59.4 mean IU on a subset of val7. Training details are given in Section 4.3.

Despite similar classiﬁcation accuracy, our implementation of GoogLeNet did not match this segmentation result.

#### 4.2. Combining what and where

We deﬁne a new fully convolutional net (FCN) for segmentation that combines layers of the feature hierarchy and reﬁnes the spatial precision of the output. See Figure 3.

While fully convolutionalized classiﬁers can be ﬁnetuned to segmentation as shown in 4.1, and even score highly on the standard metric, their output is dissatisfyingly coarse (see Figure 4). The 32 pixel stride at the ﬁnal prediction layer limits the scale of detail in the upsampled output.

We address this by adding links that combine the ﬁnal prediction layer with lower layers with ﬁner strides. This

3Using the publicly available CaffeNet reference model. 4Since there is no publicly available version of GoogLeNet, we use

our own reimplementation. Our version is trained with less extensive data augmentation, and gets 68.5% top-1 and 88.4% top-5 ILSVRC accuracy.

5Using the publicly available version from the Caffe model zoo.

Table 1. We adapt and extend three classiﬁcation convnets to segmentation. We compare performance by mean intersection over union on the validation set of PASCAL VOC 2011 and by inference time (averaged over 20 trials for a 500 × 500 input on an NVIDIA Tesla K40c). We detail the architecture of the adapted nets as regards dense prediction: number of parameter layers, receptive ﬁeld size of output units, and the coarsest stride within the net. (These numbers give the best performance obtained at a ﬁxed learning rate, not best performance possible.)

| |FCNAlexNet<br><br>FCNVGG16<br><br>FCNGoogLeNet4|
|---|---|
|mean IU forward time<br><br>conv. layers parameters rf size max stride|39.8 56.0 42.5 50 ms 210 ms 59 ms 8 16 22 57M 134M 6M 355 404 907 32 32 32<br><br>|

turns a line topology into a DAG, with edges that skip ahead from lower layers to higher ones (Figure 3). As they see fewer pixels, the ﬁner scale predictions should need fewer layers, so it makes sense to make them from shallower net outputs. Combining ﬁne layers and coarse layers lets the model make local predictions that respect global structure. By analogy to the multiscale local jet of Florack et al. [10], we call our nonlinear local feature hierarchy the deep jet.

We ﬁrst divide the output stride in half by predicting from a 16 pixel stride layer. We add a 1 × 1 convolution layer on top of pool4 to produce additional class predictions. We fuse this output with the predictions computed on top of conv7 (convolutionalized fc7) at stride 32 by adding a 2× upsampling layer and summing6 both predictions. (See Figure 3). We initialize the 2× upsampling to bilinear interpolation, but allow the parameters to be learned as described in Section 3.3. Finally, the stride 16 predictions are upsampled back to the image. We call this net FCN-16s. FCN-16s is learned end-to-end, initialized with the parameters of the last, coarser net, which we now call FCN-32s. The new parameters acting on pool4 are zero-initialized so that the net starts with unmodiﬁed predictions. The learning rate is decreased by a factor of 100.

Learning this skip net improves performance on the validation set by 3.0 mean IU to 62.4. Figure 4 shows improvement in the ﬁne structure of the output. We compared this fusion with learning only from the pool4 layer (which resulted in poor performance), and simply decreasing the learning rate without adding the extra link (which results in an insigniﬁcant performance improvement, without improving the quality of the output).

We continue in this fashion by fusing predictions from pool3 with a 2× upsampling of predictions fused from pool4 and conv7, building the net FCN-8s. We obtain

6Max fusion made learning difﬁcult due to gradient switching.

FCN-32s FCN-16s FCN-8s Ground truth

[Figure 5]

[Figure 6]

[Figure 7]

[Figure 8]

- Figure 4. Reﬁning fully convolutional nets by fusing information from layers with different strides improves segmentation detail. The ﬁrst three images show the output from our 32, 16, and 8 pixel stride nets (see Figure 3).

Table 2. Comparison of skip FCNs on a subset of PASCAL VOC2011 validation7. Learning is end-to-end, except for FCN32s-ﬁxed, where only the last layer is ﬁne-tuned. Note that FCN32s is FCN-VGG16, renamed to highlight stride.

| |pixel acc.<br><br>mean acc.<br><br>mean IU<br><br>f.w. IU|
|---|---|
|FCN-32s-ﬁxed FCN-32s FCN-16s<br><br>FCN-8s|83.0 59.7 45.4 72.0<br><br>89.1 73.3 59.4 81.4<br><br>90.0 75.7 62.4 83.0<br><br><br>90.3 75.9 62.7 83.2|

a minor additional improvement to 62.7 mean IU, and ﬁnd a slight improvement in the smoothness and detail of our output. At this point our fusion improvements have met diminishing returns, both with respect to the IU metric which emphasizes large-scale correctness, and also in terms of the improvement visible e.g. in Figure 4, so we do not continue fusing even lower layers.

Reﬁnement by other means Decreasing the stride of pooling layers is the most straightforward way to obtain ﬁner predictions. However, doing so is problematic for our VGG16-based net. Setting the pool5 layer to have stride 1 requires our convolutionalized fc6 to have a kernel size of

14×14 in order to maintain its receptive ﬁeld size. In addition to their computational cost, we had difﬁculty learning such large ﬁlters. We made an attempt to re-architect the layers above pool5 with smaller ﬁlters, but were not successful in achieving comparable performance; one possible explanation is that the initialization from ImageNet-trained weights in the upper layers is important.

Another way to obtain ﬁner predictions is to use the shiftand-stitch trick described in Section 3.2. In limited experiments, we found the cost to improvement ratio from this method to be worse than layer fusion.

#### 4.3. Experimental framework

Optimization We train by SGD with momentum. We use a minibatch size of 20 images and ﬁxed learning rates of 10−3, 10−4, and 5−5 for FCN-AlexNet, FCN-VGG16, and FCN-GoogLeNet, respectively, chosen by line search. We use momentum 0.9, weight decay of 5−4 or 2−4, and doubled the learning rate for biases, although we found training to be insensitive to these parameters (but sensitive to the learning rate). We zero-initialize the class scoring convolution layer, ﬁnding random initialization to yield neither better performance nor faster convergence. Dropout was included where used in the original classiﬁer nets.

Fine-tuning We ﬁne-tune all layers by backpropagation through the whole net. Fine-tuning the output classiﬁer alone yields only 70% of the full ﬁnetuning performance as compared in Table 2. Training from scratch is not feasible considering the time required to learn the base classiﬁcation nets. (Note that the VGG net is trained in stages, while we initialize from the full 16-layer version.) Fine-tuning takes three days on a single GPU for the coarse FCN-32s version, and about one day each to upgrade to the FCN-16s and FCN-8s versions.

Patch Sampling As explained in Section 3.4, our full image training effectively batches each image into a regu-

32x upsampled prediction (FCN-32s)

16x upsampled prediction (FCN-16s)

8x upsampled prediction (FCN-8s)

2x upsampled prediction

2x upsampled prediction

| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |

| | |
|---|---|
| | |

| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |

| | | | |
|---|---|---|---|
| | | | |
| | | | |
| | | | |

| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |

pool3 P prediction P

image pool1 pool2 pool3 pool4 pool5

pool4 prediction

| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |

| | | | | | | | | | | | | | | | |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | |
| | | | | | | | | | | | | | | | |

| | | | | | | | |
|---|---|---|---|---|---|---|---|
| | | | | | | | |
| | | | | | | | |
| | | | | | | | |
| | | | | | | | |
| | | | | | | | |
| | | | | | | | |
| | | | | | | | |

| | | | |
|---|---|---|---|
| | | | |
| | | | |
| | | | |

| | |
|---|---|
| | |

| | |
|---|---|
| | |

| | | | |
|---|---|---|---|
| | | | |
| | | | |
| | | | |

Figure 3. Our DAG nets learn to combine coarse, high layer information with ﬁne, low layer information. Layers are shown as grids that reveal relative spatial coarseness. Only pooling and prediction layers are shown; intermediate convolution layers (including our converted fully connected layers) are omitted. Solid line (FCN-32s): Our single-stream net, described in Section 4.1, upsamples stride 32 predictions back to pixels in a single step. Dashed line (FCN-16s): Combining predictions from both the ﬁnal layer and the pool4 layer, at stride 16, lets our net predict ﬁner details, while retaining high-level semantic information. Dotted line (FCN-8s): Additional predictions from pool3, at stride 8, provide further precision.

1.2

1.2

|full images<br><br>50% sampling 25% sampling<br><br>|
|---|

1.0

1.0

0.8

0.8

loss

loss

0.6

0.6

0.4

0.4

500 1000 1500 iteration number

10000 20000 30000 relative time (num. images processed)

- Figure 5. Training on whole images is just as effective as sampling patches, but results in faster (wall time) convergence by making more efﬁcient use of data. Left shows the effect of sampling on convergence rate for a ﬁxed expected batch size, while right plots the same by relative wall time.

lar grid of large, overlapping patches. By contrast, prior work randomly samples patches over a full dataset [27, 2, 8, 28, 11], potentially resulting in higher variance batches that may accelerate convergence [22]. We study this tradeoff by spatially sampling the loss in the manner described earlier, making an independent choice to ignore each ﬁnal layer cell with some probability 1−p. To avoid changing the effective batch size, we simultaneously increase the number of images per batch by a factor 1/p. Note that due to the efﬁciency of convolution, this form of rejection sampling is still faster than patchwise training for large enough values of p (e.g., at least for p > 0.2 according to the numbers in Section 3.1). Figure 5 shows the effect of this form of sampling on convergence. We ﬁnd that sampling does not have a signiﬁcant effect on convergence rate compared to whole image training, but takes signiﬁcantly more time due to the larger number of images that need to be considered per batch. We therefore choose unsampled, whole image training in our other experiments.

Class Balancing Fully convolutional training can balance classes by weighting or sampling the loss. Although our labels are mildly unbalanced (about 3/4 are background), we ﬁnd class balancing unnecessary.

Dense Prediction The scores are upsampled to the input dimensions by deconvolution layers within the net. Final layer deconvolutional ﬁlters are ﬁxed to bilinear interpolation, while intermediate upsampling layers are initialized to bilinear upsampling, and then learned. Shift-andstitch (Section 3.2), or the ﬁlter rarefaction equivalent, are not used.

Augmentation We tried augmenting the training data by randomly mirroring and “jittering” the images by translating them up to 32 pixels (the coarsest scale of prediction) in each direction. This yielded no noticeable improvement.

More Training Data The PASCAL VOC 2011 segmentation challenge training set, which we used for Table 1, labels 1112 images. Hariharan et al. [15] have collected

labels for a much larger set of 8498 PASCAL training images, which was used to train the previous state-of-the-art system, SDS [16]. This training data improves the FCNVGG16 validation score7 by 3.4 points to 59.4 mean IU.

Implementation All models are trained and tested with Caffe [18] on a single NVIDIA Tesla K40c. The models and code will be released open-source on publication.

### 5. Results

We test our FCN on semantic segmentation and scene parsing, exploring PASCAL VOC, NYUDv2, and SIFT Flow. Although these tasks have historically distinguished between objects and regions, we treat both uniformly as pixel prediction. We evaluate our FCN skip architecture8 on each of these datasets, and then extend it to multi-modal input for NYUDv2 and multi-task prediction for the semantic and geometric labels of SIFT Flow.

Metrics We report four metrics from common semantic segmentation and scene parsing evaluations that are variations on pixel accuracy and region intersection over union (IU). Let nij be the number of pixels of class i predicted to belong to class j, where there are ncl different classes, and let ti = j nij be the total number of pixels of class i. We compute:

- • pixel accuracy: i nii/ i ti
- • mean accuraccy: (1/ncl) i nii/ti
- • mean IU: (1/ncl) i nii/ ti + j nji − nii
- • frequency weighted IU:

( k tk)−1 i tinii/ ti + j nji − nii

PASCAL VOC Table 3 gives the performance of our FCN-8s on the test sets of PASCAL VOC 2011 and 2012, and compares it to the previous state-of-the-art, SDS [16], and the well-known R-CNN [12]. We achieve the best results on mean IU9 by a relative margin of 20%. Inference time is reduced 114× (convnet only, ignoring proposals and reﬁnement) or 286× (overall).

Table 3. Our fully convolutional net gives a 20% relative improvement over the state-of-the-art on the PASCAL VOC 2011 and 2012 test sets, and reduces inference time.

| |mean IU mean IU inference<br><br>VOC2011 test VOC2012 test time<br><br>|
|---|---|
|R-CNN [12] SDS [16] FCN-8s<br><br>|47.9 - 52.6 51.6 ∼ 50 s 62.7 62.2 ∼ 175 ms|

NYUDv2 [30] is an RGB-D dataset collected using the

- 7There are training images from [15] included in the PASCAL VOC 2011 val set, so we validate on the non-intersecting set of 736 images. An earlier version of this paper mistakenly evaluated on the entire val set.
- 8Our models and code are publicly available at https://github.com/BVLC/caffe/wiki/Model-Zoo#fcn.
- 9This is the only metric provided by the test server.

Table 4. Results on NYUDv2. RGBD is early-fusion of the RGB and depth channels at the input. HHA is the depth embedding of [14] as horizontal disparity, height above ground, and the angle of the local surface normal with the inferred gravity direction. RGB-HHA is the jointly trained late fusion model that sums RGB and HHA predictions.

| |pixel acc.<br><br>mean acc.<br><br>mean IU<br><br>f.w. IU|
|---|---|
|Gupta et al. [14]<br><br>FCN-32s RGB FCN-32s RGBD<br><br>FCN-32s HHA FCN-32s RGB-HHA FCN-16s RGB-HHA<br><br>|60.3 - 28.6 47.0<br><br>60.0 42.2 29.2 43.9<br>61.5 42.4 30.5 45.5 57.1 35.2 24.2 40.4<br><br><br>64.3 44.9 32.8 48.0<br>65.4 46.1 34.0 49.5<br>|

Microsoft Kinect. It has 1449 RGB-D images, with pixelwise labels that have been coalesced into a 40 class semantic segmentation task by Gupta et al. [13]. We report results on the standard split of 795 training images and 654 testing images. (Note: all model selection is performed on PASCAL 2011 val.) Table 4 gives the performance of our model in several variations. First we train our unmodiﬁed coarse model (FCN-32s) on RGB images. To add depth information, we train on a model upgraded to take four-channel RGB-D input (early fusion). This provides little beneﬁt, perhaps due to the difﬁcultly of propagating meaningful gradients all the way through the model. Following the success of Gupta et al. [14], we try the three-dimensional HHA encoding of depth, training nets on just this information, as well as a “late fusion” of RGB and HHA where the predictions from both nets are summed at the ﬁnal layer, and the resulting two-stream net is learned end-to-end. Finally we upgrade this late fusion net to a 16-stride version.

SIFT Flow is a dataset of 2,688 images with pixel labels for 33 semantic categories (“bridge”, “mountain”, “sun”), as well as three geometric categories (“horizontal”, “vertical”, and “sky”). An FCN can naturally learn a joint representation that simultaneously predicts both types of labels. We learn a two-headed version of FCN-16s with semantic and geometric prediction layers and losses. The learned model performs as well on both tasks as two independently trained models, while learning and inference are essentially as fast as each independent model by itself. The results in Table 5, computed on the standard split into 2,488 training and 200 test images,10 show state-of-the-art performance on both tasks.

10Three of the SIFT Flow categories are not present in the test set. We made predictions across all 33 categories, but only included categories actually present in the test set in our evaluation. (An earlier version of this paper reported a lower mean IU, which included all categories either present or predicted in the evaluation.)

Table 5. Results on SIFT Flow10 with class segmentation (center) and geometric segmentation (right). Tighe [33] is a non-parametric transfer method. Tighe 1 is an exemplar SVM while 2 is SVM + MRF. Farabet is a multi-scale convnet trained on class-balanced samples (1) or natural frequency samples (2). Pinheiro is a multi-scale, recurrent convnet, denoted RCNN3 (◦3). The metric for geometry is pixel accuracy.

| |pixel acc.<br><br>mean acc.<br><br>mean IU<br><br>f.w. IU<br><br>|geom. acc.|
|---|---|---|
|Liu et al. [23]<br><br>Tighe et al. [33]<br><br>Tighe et al. [34] 1 Tighe et al. [34] 2<br><br><br>Farabet et al. [8] 1<br><br>Farabet et al. [8] 2 Pinheiro et al. [28]<br><br><br>FCN-16s<br><br>|76.7 - - -<br><br>- - - 75.6 41.1 - 78.6 39.2 - 72.3 50.8 - 78.5 29.6 - -<br><br>77.7 29.8 - 85.2 51.7 39.5 76.1<br>|90.8 94.3<br><br>|

FCN-8s SDS [16] Ground Truth Image

[Figure 9]

[Figure 10]

[Figure 11]

[Figure 12]

[Figure 13]

[Figure 14]

[Figure 15]

[Figure 16]

[Figure 17]

[Figure 18]

[Figure 19]

[Figure 20]

[Figure 21]

[Figure 22]

[Figure 23]

[Figure 24]

Figure 6. Fully convolutional segmentation nets produce stateof-the-art performance on PASCAL. The left column shows the output of our highest performing net, FCN-8s. The second shows the segmentations produced by the previous state-of-the-art system by Hariharan et al. [16]. Notice the ﬁne structures recovered (ﬁrst row), ability to separate closely interacting objects (second row), and robustness to occluders (third row). The fourth row shows a failure case: the net sees lifejackets in a boat as people.

### 6. Conclusion

Fully convolutional networks are a rich class of models, of which modern classiﬁcation convnets are a special case. Recognizing this, extending these classiﬁcation nets to segmentation, and improving the architecture with multi-resolution layer combinations dramatically improves the state-of-the-art, while simultaneously simplifying and speeding up learning and inference.

Acknowledgements This work was supported in part

by DARPA’s MSEE and SMISC programs, NSF awards IIS1427425, IIS-1212798, IIS-1116411, and the NSF GRFP, Toyota, and the Berkeley Vision and Learning Center. We gratefully acknowledge NVIDIA for GPU donation. We thank Bharath Hariharan and Saurabh Gupta for their advice and dataset tools. We thank Sergio Guadarrama for reproducing GoogLeNet in Caffe. We thank Jitendra Malik for his helpful comments. Thanks to Wei Liu for pointing out an issue wth our SIFT Flow mean IU computation and an error in our frequency weighted mean IU formula.

### A. Upper Bounds on IU

In this paper, we have achieved good performance on the mean IU segmentation metric even with coarse semantic prediction. To better understand this metric and the limits of this approach with respect to it, we compute approximate upper bounds on performance with prediction at various scales. We do this by downsampling ground truth images and then upsampling them again to simulate the best results obtainable with a particular downsampling factor. The following table gives the mean IU on a subset of PASCAL 2011 val for various downsampling factors.

|factor|mean IU<br><br>|
|---|---|
|128 64 32 16<br><br>8 4<br><br>|50.9 73.3 86.1 92.8 96.4 98.5|

Pixel-perfect prediction is clearly not necessary to achieve mean IU well above state-of-the-art, and, conversely, mean IU is a not a good measure of ﬁne-scale accuracy.

### B. More Results

We further evaluate our FCN for semantic segmentation. PASCAL-Context [26] provides whole scene annota-

tions of PASCAL VOC 2010. While there are over 400 distinct classes, we follow the 59 class task deﬁned by [26] that picks the most frequent classes. We train and evaluate on the training and val sets respectively. In Table 6, we compare to the joint object + stuff variation of Convolutional Feature Masking [3] which is the previous state-of-the-art on this task. FCN-8s scores 35.1 mean IU for an 11% relative improvement.

### Changelog

The arXiv version of this paper is kept up-to-date with corrections and additional relevant material. The following gives a brief history of changes.

Table 6. Results on PASCAL-Context. CFM is the best result of [3] by convolutional feature masking and segment pursuit with the VGG net. O2P is the second order pooling method [1] as reported in the errata of [26]. The 59 class task includes the 59 most frequent classes while the 33 class task consists of an easier subset identiﬁed by [26].

|59 class|pixel acc.<br><br>mean acc.<br><br>mean IU<br><br>f.w. IU<br><br>|
|---|---|
|O2P<br><br>CFM FCN-32s FCN-16s<br><br>FCN-8s 33 class|- - 18.1 -<br><br>- - 31.5 -<br><br><br>63.8 42.7 31.8 48.3 65.7 46.2 34.8 50.7 65.9 46.5 35.1 51.0<br><br>|
|O2P<br><br>CFM FCN-32s FCN-16s<br><br>FCN-8s<br><br>|- - 29.2 -<br>- - 46.1 -<br><br><br>69.8 65.1 50.4 54.9 71.8 68.0 53.4 57.5 71.8 67.6 53.5 57.7|

v2 Add Appendix A giving upper bounds on mean IU and Appendix B with PASCAL-Context results. Correct PASCAL validation numbers (previously, some val images were included in train), SIFT Flow mean IU (which used an inappropriately strict metric), and an error in the frequency weighted mean IU formula. Add link to models and update timing numbers to reﬂect improved implementation (which is publicly available).

### References

- [1] J. Carreira, R. Caseiro, J. Batista, and C. Sminchisescu. Semantic segmentation with second-order pooling. In ECCV,

2012. 9

- [2] D. C. Ciresan, A. Giusti, L. M. Gambardella, and J. Schmidhuber. Deep neural networks segment neuronal membranes in electron microscopy images. In NIPS, pages 2852–2860,

2012. 1, 2, 4, 7

- [3] J. Dai, K. He, and J. Sun. Convolutional feature masking for joint object and stuff segmentation. arXiv preprint arXiv:1412.1283, 2014. 9
- [4] J. Donahue, Y. Jia, O. Vinyals, J. Hoffman, N. Zhang, E. Tzeng, and T. Darrell. DeCAF: A deep convolutional activation feature for generic visual recognition. In ICML, 2014. 1, 2
- [5] D. Eigen, D. Krishnan, and R. Fergus. Restoring an image taken through a window covered with dirt or rain. In Computer Vision (ICCV), 2013 IEEE International Conference on, pages 633–640. IEEE, 2013. 2
- [6] D. Eigen, C. Puhrsch, and R. Fergus. Depth map prediction from a single image using a multi-scale deep network. arXiv preprint arXiv:1406.2283, 2014. 2
- [7] M. Everingham, L. Van Gool, C. K. I. Williams, J. Winn, and A. Zisserman. The PASCAL Visual Object Classes

- Challenge 2011 (VOC2011) Results. http://www.pascalnetwork.org/challenges/VOC/voc2011/workshop/index.html. 4
- [8] C. Farabet, C. Couprie, L. Najman, and Y. LeCun. Learning hierarchical features for scene labeling. Pattern Analysis and Machine Intelligence, IEEE Transactions on, 2013. 1, 2, 4, 7, 8
- [9] P. Fischer, A. Dosovitskiy, and T. Brox. Descriptor matching with convolutional neural networks: a comparison to SIFT. CoRR, abs/1405.5769, 2014. 1
- [10] L. Florack, B. T. H. Romeny, M. Viergever, and J. Koenderink. The gaussian scale-space paradigm and the multiscale local jet. International Journal of Computer Vision, 18(1):61–75, 1996. 5
- [11] Y. Ganin and V. Lempitsky. N4-ﬁelds: Neural network nearest neighbor ﬁelds for image transforms. In ACCV, 2014. 1, 2, 7
- [12] R. Girshick, J. Donahue, T. Darrell, and J. Malik. Rich feature hierarchies for accurate object detection and semantic segmentation. In Computer Vision and Pattern Recognition,

2014. 1, 2, 7

- [13] S. Gupta, P. Arbelaez, and J. Malik. Perceptual organization and recognition of indoor scenes from RGB-D images. In CVPR, 2013. 8
- [14] S. Gupta, R. Girshick, P. Arbelaez, and J. Malik. Learning rich features from RGB-D images for object detection and segmentation. In ECCV. Springer, 2014. 1, 2, 8
- [15] B. Hariharan, P. Arbelaez, L. Bourdev, S. Maji, and J. Malik. Semantic contours from inverse detectors. In International Conference on Computer Vision (ICCV), 2011. 7
- [16] B. Hariharan, P. Arbel´aez, R. Girshick, and J. Malik. Simultaneous detection and segmentation. In European Conference on Computer Vision (ECCV), 2014. 1, 2, 4, 5, 7, 8
- [17] K. He, X. Zhang, S. Ren, and J. Sun. Spatial pyramid pooling in deep convolutional networks for visual recognition. In ECCV, 2014. 1, 2
- [18] Y. Jia, E. Shelhamer, J. Donahue, S. Karayev, J. Long, R. Girshick, S. Guadarrama, and T. Darrell. Caffe: Convolutional architecture for fast feature embedding. arXiv preprint arXiv:1408.5093, 2014. 7
- [19] A. Krizhevsky, I. Sutskever, and G. E. Hinton. Imagenet classiﬁcation with deep convolutional neural networks. In NIPS, 2012. 1, 2, 3, 5
- [20] Q. V. Le, R. Monga, M. Devin, K. Chen, G. S. Corrado, J. Dean, and A. Y. Ng. Building high-level features using large scale unsupervised learning. In ICML, 2012. 3
- [21] Y. LeCun, B. Boser, J. Denker, D. Henderson, R. E. Howard, W. Hubbard, and L. D. Jackel. Backpropagation applied to hand-written zip code recognition. In Neural Computation,

1989. 2, 3

- [22] Y. A. LeCun, L. Bottou, G. B. Orr, and K.-R. M¨uller. Efﬁcient backprop. In Neural networks: Tricks of the trade, pages 9–48. Springer, 1998. 7
- [23] C. Liu, J. Yuen, and A. Torralba. Sift ﬂow: Dense correspondence across scenes and its applications. Pattern Analysis and Machine Intelligence, IEEE Transactions on, 33(5):978– 994, 2011. 8

- [24] J. Long, N. Zhang, and T. Darrell. Do convnets learn correspondence? In NIPS, 2014. 1
- [25] O. Matan, C. J. Burges, Y. LeCun, and J. S. Denker. Multidigit recognition using a space displacement neural network. In NIPS, pages 488–495. Citeseer, 1991. 2
- [26] R. Mottaghi, X. Chen, X. Liu, N.-G. Cho, S.-W. Lee, S. Fidler, R. Urtasun, and A. Yuille. The role of context for object detection and semantic segmentation in the wild. In Computer Vision and Pattern Recognition (CVPR), 2014 IEEE Conference on, pages 891–898. IEEE, 2014. 9
- [27] F. Ning, D. Delhomme, Y. LeCun, F. Piano, L. Bottou, and P. E. Barbano. Toward automatic phenotyping of developing embryos from videos. Image Processing, IEEE Transactions on, 14(9):1360–1371, 2005. 1, 2, 4, 7
- [28] P. H. Pinheiro and R. Collobert. Recurrent convolutional neural networks for scene labeling. In ICML, 2014. 1, 2, 4, 7, 8
- [29] P. Sermanet, D. Eigen, X. Zhang, M. Mathieu, R. Fergus, and Y. LeCun. Overfeat: Integrated recognition, localization and detection using convolutional networks. In ICLR, 2014. 1, 2, 3, 4
- [30] N. Silberman, D. Hoiem, P. Kohli, and R. Fergus. Indoor segmentation and support inference from rgbd images. In ECCV, 2012. 7
- [31] K. Simonyan and A. Zisserman. Very deep convolutional networks for large-scale image recognition. CoRR, abs/1409.1556, 2014. 1, 2, 3, 5
- [32] C. Szegedy, W. Liu, Y. Jia, P. Sermanet, S. Reed, D. Anguelov, D. Erhan, V. Vanhoucke, and A. Rabinovich. Going deeper with convolutions. CoRR, abs/1409.4842,

2014. 1, 2, 3, 5

- [33] J. Tighe and S. Lazebnik. Superparsing: scalable nonparametric image parsing with superpixels. In ECCV, pages 352–

365. Springer, 2010. 8

- [34] J. Tighe and S. Lazebnik. Finding things: Image parsing with regions and per-exemplar detectors. In CVPR, 2013. 8
- [35] J. Tompson, A. Jain, Y. LeCun, and C. Bregler. Joint training of a convolutional network and a graphical model for human pose estimation. CoRR, abs/1406.2984, 2014. 2
- [36] L. Wan, M. Zeiler, S. Zhang, Y. L. Cun, and R. Fergus. Regularization of neural networks using dropconnect. In Proceedings of the 30th International Conference on Machine Learning (ICML-13), pages 1058–1066, 2013. 4
- [37] R. Wolf and J. C. Platt. Postal address block location using a convolutional locator network. Advances in Neural Information Processing Systems, pages 745–745, 1994. 2
- [38] M. D. Zeiler and R. Fergus. Visualizing and understanding convolutional networks. In Computer Vision–ECCV 2014, pages 818–833. Springer, 2014. 2
- [39] N. Zhang, J. Donahue, R. Girshick, and T. Darrell. Partbased r-cnns for ﬁne-grained category detection. In Computer Vision–ECCV 2014, pages 834–849. Springer, 2014. 1

