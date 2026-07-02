# arXiv:1505.07818v4[stat.ML]26May2016

Journal of Machine Learning Research 17 (2016) 1-35 Submitted 5/15; Published 4/16

### Domain-Adversarial Training of Neural Networks

Yaroslav Ganin ganin@skoltech.ru Evgeniya Ustinova evgeniya.ustinova@skoltech.ru Skolkovo Institute of Science and Technology (Skoltech) Skolkovo, Moscow Region, Russia

Hana Ajakan hana.ajakan.1@ulaval.ca Pascal Germain Pascal.Germain@ift.ulaval.ca D´epartement d’informatique et de g´enie logiciel, Universit´e Laval Qu´ebec, Canada, G1V 0A6

Hugo Larochelle hugo.larochelle@usherbrooke.ca D´epartement d’informatique, Universite´ de Sherbrooke Qu´ebec, Canada, J1K 2R1

Fran¸cois Laviolette Francois.Laviolette@ift.ulaval.ca Mario Marchand Mario.Marchand@ift.ulaval.ca D´epartement d’informatique et de g´enie logiciel, Universit´e Laval Qu´ebec, Canada, G1V 0A6

Victor Lempitsky lempitsky@skoltech.ru Skolkovo Institute of Science and Technology (Skoltech) Skolkovo, Moscow Region, Russia

Editor: Urun Dogan, Marius Kloft, Francesco Orabona, and Tatiana Tommasi

#### Abstract

We introduce a new representation learning approach for domain adaptation, in which data at training and test time come from similar but diﬀerent distributions. Our approach is directly inspired by the theory on domain adaptation suggesting that, for eﬀective domain transfer to be achieved, predictions must be made based on features that cannot discriminate between the training (source) and test (target) domains.

The approach implements this idea in the context of neural network architectures that are trained on labeled data from the source domain and unlabeled data from the target domain (no labeled target-domain data is necessary). As the training progresses, the approach promotes the emergence of features that are (i) discriminative for the main learning task on the source domain and (ii) indiscriminate with respect to the shift between the domains. We show that this adaptation behaviour can be achieved in almost any feed-forward model by augmenting it with few standard layers and a new gradient reversal layer. The resulting augmented architecture can be trained using standard backpropagation and stochastic gradient descent, and can thus be implemented with little eﬀort using any of the deep learning packages.

We demonstrate the success of our approach for two distinct classiﬁcation problems (document sentiment analysis and image classiﬁcation), where state-of-the-art domain adaptation performance on standard benchmarks is achieved. We also validate the approach for descriptor learning task in the context of person re-identiﬁcation application.

Keywords: domain adaptation, neural network, representation learning, deep learning, synthetic data, image classiﬁcation, sentiment analysis, person re-identiﬁcation

c 2016 Yaroslav Ganin, Evgeniya Ustinova, Hana Ajakan, Pascal Germain, Hugo Larochelle, et al.

#### 1. Introduction

The cost of generating labeled data for a new machine learning task is often an obstacle for applying machine learning methods. In particular, this is a limiting factor for the further progress of deep neural network architectures, that have already brought impressive advances to the state-of-the-art across a wide variety of machine-learning tasks and applications. For problems lacking labeled data, it may be still possible to obtain training sets that are big enough for training large-scale deep models, but that suﬀer from the shift in data distribution from the actual data encountered at “test time”. One important example is training an image classiﬁer on synthetic or semi-synthetic images, which may come in abundance and be fully labeled, but which inevitably have a distribution that is diﬀerent from real images (Liebelt and Schmid, 2010; Stark et al., 2010; V´zquez et al., 2014; Sun and Saenko, 2014). Another example is in the context of sentiment analysis in written reviews, where one might have labeled data for reviews of one type of product (e.g., movies), while having the need to classify reviews of other products (e.g., books).

Learning a discriminative classiﬁer or other predictor in the presence of a shift between training and test distributions is known as domain adaptation (DA). The proposed approaches build mappings between the source (training-time) and the target (test-time) domains, so that the classiﬁer learned for the source domain can also be applied to the target domain, when composed with the learned mapping between domains. The appeal of the domain adaptation approaches is the ability to learn a mapping between domains in the situation when the target domain data are either fully unlabeled (unsupervised domain annotation) or have few labeled samples (semi-supervised domain adaptation). Below, we focus on the harder unsupervised case, although the proposed approach (domain-adversarial learning) can be generalized to the semi-supervised case rather straightforwardly.

Unlike many previous papers on domain adaptation that worked with ﬁxed feature representations, we focus on combining domain adaptation and deep feature learning within one training process. Our goal is to embed domain adaptation into the process of learning representation, so that the ﬁnal classiﬁcation decisions are made based on features that are both discriminative and invariant to the change of domains, i.e., have the same or very similar distributions in the source and the target domains. In this way, the obtained feed-forward network can be applicable to the target domain without being hindered by the shift between the two domains. Our approach is motivated by the theory on domain adaptation (Ben-David et al., 2006, 2010), that suggests that a good representation for cross-domain transfer is one for which an algorithm cannot learn to identify the domain of origin of the input observation.

We thus focus on learning features that combine (i) discriminativeness and (ii) domaininvariance. This is achieved by jointly optimizing the underlying features as well as two discriminative classiﬁers operating on these features: (i) the label predictor that predicts class labels and is used both during training and at test time and (ii) the domain classiﬁer that discriminates between the source and the target domains during training. While the parameters of the classiﬁers are optimized in order to minimize their error on the training set, the parameters of the underlying deep feature mapping are optimized in order to minimize the loss of the label classiﬁer and to maximize the loss of the domain classiﬁer. The latter

update thus works adversarially to the domain classiﬁer, and it encourages domain-invariant features to emerge in the course of the optimization.

Crucially, we show that all three training processes can be embedded into an appropriately composed deep feed-forward network, called domain-adversarial neural network (DANN) (illustrated by Figure 1, page 12) that uses standard layers and loss functions, and can be trained using standard backpropagation algorithms based on stochastic gradient descent or its modiﬁcations (e.g., SGD with momentum). The approach is generic as a DANN version can be created for almost any existing feed-forward architecture that is trainable by backpropagation. In practice, the only non-standard component of the proposed architecture is a rather trivial gradient reversal layer that leaves the input unchanged during forward propagation and reverses the gradient by multiplying it by a negative scalar during the backpropagation.

We provide an experimental evaluation of the proposed domain-adversarial learning idea over a range of deep architectures and applications. We ﬁrst consider the simplest DANN architecture where the three parts (label predictor, domain classiﬁer and feature extractor) are linear, and demonstrate the success of domain-adversarial learning for such architecture. The evaluation is performed for synthetic data as well as for the sentiment analysis problem in natural language processing, where DANN improves the state-of-the-art marginalized Stacked Autoencoders (mSDA) of Chen et al. (2012) on the common Amazon reviews benchmark.

We further evaluate the approach extensively for an image classiﬁcation task, and present results on traditional deep learning image data sets—such as MNIST (LeCun et al., 1998) and SVHN (Netzer et al., 2011)—as well as on Office benchmarks (Saenko et al., 2010), where domain-adversarial learning allows obtaining a deep architecture that considerably improves over previous state-of-the-art accuracy.

Finally, we evaluate domain-adversarial descriptor learning in the context of person re-identiﬁcation application (Gong et al., 2014), where the task is to obtain good pedestrian image descriptors that are suitable for retrieval and veriﬁcation. We apply domainadversarial learning, as we consider a descriptor predictor trained with a Siamese-like loss instead of the label predictor trained with a classiﬁcation loss. In a series of experiments, we demonstrate that domain-adversarial learning can improve cross-data-set re-identiﬁcation considerably.

#### 2. Related work

The general approach of achieving domain adaptation explored under many facets. Over the years, a large part of the literature has focused mainly on linear hypothesis (see for instance Blitzer et al., 2006; Bruzzone and Marconcini, 2010; Germain et al., 2013; Baktashmotlagh

- et al., 2013; Cortes and Mohri, 2014). More recently, non-linear representations have become increasingly studied, including neural network representations (Glorot et al., 2011; Li et al.,

- 2014) and most notably the state-of-the-art mSDA (Chen et al., 2012). That literature has mostly focused on exploiting the principle of robust representations, based on the denoising autoencoder paradigm (Vincent et al., 2008).

Concurrently, multiple methods of matching the feature distributions in the source and the target domains have been proposed for unsupervised domain adaptation. Some ap-

proaches perform this by reweighing or selecting samples from the source domain (Borgwardt et al., 2006; Huang et al., 2006; Gong et al., 2013), while others seek an explicit feature space transformation that would map source distribution into the target one (Pan et al., 2011; Gopalan et al., 2011; Baktashmotlagh et al., 2013). An important aspect of the distribution matching approach is the way the (dis)similarity between distributions is measured. Here, one popular choice is matching the distribution means in the kernelreproducing Hilbert space (Borgwardt et al., 2006; Huang et al., 2006), whereas Gong et al. (2012) and Fernando et al. (2013) map the principal axes associated with each of the distributions.

Our approach also attempts to match feature space distributions, however this is accomplished by modifying the feature representation itself rather than by reweighing or geometric transformation. Also, our method uses a rather diﬀerent way to measure the disparity between distributions based on their separability by a deep discriminatively-trained classiﬁer. Note also that several approaches perform transition from the source to the target domain (Gopalan et al., 2011; Gong et al., 2012) by changing gradually the training distribution. Among these methods, Chopra et al. (2013) does this in a “deep” way by the layerwise training of a sequence of deep autoencoders, while gradually replacing source-domain samples with target-domain samples. This improves over a similar approach of Glorot et al.

- (2011) that simply trains a single deep autoencoder for both domains. In both approaches, the actual classiﬁer/predictor is learned in a separate step using the feature representation learned by autoencoder(s). In contrast to Glorot et al. (2011); Chopra et al. (2013), our approach performs feature learning, domain adaptation and classiﬁer learning jointly, in a uniﬁed architecture, and using a single learning algorithm (backpropagation). We therefore argue that our approach is simpler (both conceptually and in terms of its implementation). Our method also achieves considerably better results on the popular Office benchmark.

While the above approaches perform unsupervised domain adaptation, there are approaches that perform supervised domain adaptation by exploiting labeled data from the target domain. In the context of deep feed-forward architectures, such data can be used to “ﬁne-tune” the network trained on the source domain (Zeiler and Fergus, 2013; Oquab

- et al., 2014; Babenko et al., 2014). Our approach does not require labeled target-domain data. At the same time, it can easily incorporate such data when they are available.

An idea related to ours is described in Goodfellow et al. (2014). While their goal is quite diﬀerent (building generative deep networks that can synthesize samples), the way they measure and minimize the discrepancy between the distribution of the training data and the distribution of the synthesized data is very similar to the way our architecture measures and minimizes the discrepancy between feature distributions for the two domains. Moreover, the authors mention the problem of saturating sigmoids which may arise at the early stages of training due to the signiﬁcant dissimilarity of the domains. The technique they use to circumvent this issue (the “adversarial” part of the gradient is replaced by a gradient computed with respect to a suitable cost) is directly applicable to our method.

Also, recent and concurrent reports by Tzeng et al. (2014); Long and Wang (2015) focus on domain adaptation in feed-forward networks. Their set of techniques measures and minimizes the distance between the data distribution means across domains (potentially, after embedding distributions into RKHS). Their approach is thus diﬀerent from our idea of matching distributions by making them indistinguishable for a discriminative classiﬁer.

Below, we compare our approach to Tzeng et al. (2014); Long and Wang (2015) on the Oﬃce benchmark. Another approach to deep domain adaptation, which is arguably more diﬀerent from ours, has been developed in parallel by Chen et al. (2015).

From a theoretical standpoint, our approach is directly derived from the seminal theoretical works of Ben-David et al. (2006, 2010). Indeed, DANN directly optimizes the notion of H-divergence. We do note the work of Huang and Yates (2012), in which HMM representations are learned for word tagging using a posterior regularizer that is also inspired by Ben-David et al.’s work. In addition to the tasks being diﬀerent—Huang and Yates

- (2012) focus on word tagging problems—, we would argue that DANN learning objective more closely optimizes the H-divergence, with Huang and Yates (2012) relying on cruder approximations for eﬃciency reasons.

A part of this paper has been published as a conference paper (Ganin and Lempitsky,

- 2015). This version extends Ganin and Lempitsky (2015) very considerably by incorporating the report Ajakan et al. (2014) (presented as part of the Second Workshop on Transfer and Multi-Task Learning), which brings in new terminology, in-depth theoretical analysis and justiﬁcation of the approach, extensive experiments with the shallow DANN case on synthetic data as well as on a natural language processing task (sentiment analysis). Furthermore, in this version we go beyond classiﬁcation and evaluate domain-adversarial learning for descriptor learning setting within the person re-identiﬁcation application.

#### 3. Domain Adaptation

We consider classiﬁcation tasks where X is the input space and Y = {0,1,...,L−1} is the set of L possible labels. Moreover, we have two diﬀerent distributions over X×Y , called the source domain DS and the target domain DT. An unsupervised domain adaptation learning algorithm is then provided with a labeled source sample S drawn i.i.d. from DS, and an unlabeled target sample T drawn i.i.d. from DTX, where DTX is the marginal distribution of DT over X.

S = {(xi,yi)}ni=1 ∼ (DS)n ; T = {xi}Ni=n+1 ∼ (DTX)n , with N = n + n being the total number of samples. The goal of the learning algorithm is to build a classiﬁer η : X → Y with a low target risk

RDT(η) = Pr

(x,y)∼DT

η(x) = y ,

while having no information about the labels of DT.

##### 3.1 Domain Divergence

To tackle the challenging domain adaptation task, many approaches bound the target error by the sum of the source error and a notion of distance between the source and the target distributions. These methods are intuitively justiﬁed by a simple assumption: the source risk is expected to be a good indicator of the target risk when both distributions are similar. Several notions of distance have been proposed for domain adaptation (Ben-David et al., 2006, 2010; Mansour et al., 2009a,b; Germain et al., 2013). In this paper, we focus on the H-divergence used by Ben-David et al. (2006, 2010), and based on the earlier work of Kifer

et al. (2004). Note that we assume in deﬁnition 1 below that the hypothesis class H is a (discrete or continuous) set of binary classiﬁers η : X → {0,1}.1

Deﬁnition 1 (Ben-David et al., 2006, 2010; Kifer et al., 2004) Given two domain distributions DSX and DTX over X, and a hypothesis class H, the H-divergence between DSX and DTX is

dH(DSX,DTX) = 2 sup η∈H

η(x) = 1 − Pr

Pr

η(x) = 1 .

x∼DSX

x∼DTX

That is, the H-divergence relies on the capacity of the hypothesis class H to distinguish

between examples generated by DSX from examples generated by DTX. Ben-David et al. (2006, 2010) proved that, for a symmetric hypothesis class H, one can compute the empirical

H-divergence between two samples S ∼ (DSX)n and T ∼ (DTX)n by computing

n

N

1 n

1 n

dˆH(S,T) = 2 1 − min η∈H

I[η(xi)=1] , (1)

I[η(xi)=0] +

i=n+1

i=1

where I[a] is the indicator function which is 1 if predicate a is true, and 0 otherwise.

##### 3.2 Proxy Distance

Ben-David et al. (2006) suggested that, even if it is generally hard to compute dˆH(S,T) exactly (e.g., when H is the space of linear classiﬁers on X), we can easily approximate it by running a learning algorithm on the problem of discriminating between source and target examples. To do so, we construct a new data set

U = {(xi,0)}ni=1 ∪ {(xi,1)}Ni=n+1 , (2)

where the examples of the source sample are labeled 0 and the examples of the target sample are labeled 1. Then, the risk of the classiﬁer trained on the new data set U approximates the “min” part of Equation (1). Given a generalization error on the problem of discriminating between source and target examples, the H-divergence is then approximated by

dˆA = 2(1 − 2 ). (3)

In Ben-David et al. (2006), the value dˆA is called the Proxy A-distance (PAD). The Adistance being deﬁned as dA(DSX,DTX) = 2 supA∈A PrDX

(A) − PrDX

(A) , where A is a

S

T

subset of X. Note that, by choosing A = {Aη|η ∈ H}, with Aη the set represented by the characteristic function η, the A-distance and the H-divergence of Deﬁnition 1 are identical.

In the experiments section of this paper, we compute the PAD value following the approach of Glorot et al. (2011); Chen et al. (2012), i.e., we train either a linear SVM or a deeper MLP classiﬁer on a subset of U (Equation 2), and we use the obtained classiﬁer error on the other subset as the value of in Equation (3). More details and illustrations of the linear SVM case are provided in Section 5.1.5.

1. As mentioned by Ben-David et al. (2006), the same analysis holds for multiclass setting. However, to obtain the same results when |Y | > 2, one should assume that H is a symmetrical hypothesis class. That is, for all h ∈ H and any permutation of labels c : Y → Y , we have c(h) ∈ H. Note that this is the case for most commonly used neural network architectures.

##### 3.3 Generalization Bound on the Target Risk

The work of Ben-David et al. (2006, 2010) also showed that the H-divergence dH(DSX,DTX) is upper bounded by its empirical estimate dˆH(S,T) plus a constant complexity term that depends on the VC dimension of H and the size of samples S and T. By combining this result with a similar bound on the source risk, the following theorem is obtained.

Theorem 2 (Ben-David et al., 2006) Let H be a hypothesis class of VC dimension d. With probability 1 − δ over the choice of samples S ∼ (DS)n and T ∼ (DTX)n, for every η ∈ H:

4 n

1 n

dlog 2e nd + log 4δ + dˆH(S,T) + 4

dlog 2dn + log 4δ + β , with β ≥ inf

RDT(η) ≤ RS(η) +

[RDS(η∗) + RDT(η∗)] , and

η∗∈H

m

1 n

RS(η) =

I [η(xi) = yi]

i=1

is the empirical source risk.

The previous result tells us that RDT(η) can be low only when the β term is low, i.e., only when there exists a classiﬁer that can achieve a low risk on both distributions. It also tells

us that, to ﬁnd a classiﬁer with a small RDT(η) in a given class of ﬁxed VC dimension, the learning algorithm should minimize (in that class) a trade-oﬀ between the source risk

RS(η) and the empirical H-divergence dˆH(S,T). As pointed-out by Ben-David et al. (2006), a strategy to control the H-divergence is to ﬁnd a representation of the examples where both the source and the target domain are as indistinguishable as possible. Under such a representation, a hypothesis with a low source risk will, according to Theorem 2, perform well on the target data. In this paper, we present an algorithm that directly exploits this idea.

#### 4. Domain-Adversarial Neural Networks (DANN)

An original aspect of our approach is to explicitly implement the idea exhibited by Theorem 2 into a neural network classiﬁer. That is, to learn a model that can generalize well from one domain to another, we ensure that the internal representation of the neural network contains no discriminative information about the origin of the input (source or target), while preserving a low risk on the source (labeled) examples.

In this section, we detail the proposed approach for incorporating a “domain adaptation component” to neural networks. In Subsection 4.1, we start by developing the idea for the simplest possible case, i.e., a single hidden layer, fully connected neural network. We then describe how to generalize the approach to arbitrary (deep) network architectures.

##### 4.1 Example Case with a Shallow Neural Network

Let us ﬁrst consider a standard neural network (NN) architecture with a single hidden layer. For simplicity, we suppose that the input space is formed by m-dimensional real

vectors. Thus, X = Rm. The hidden layer Gf learns a function Gf : X → RD that maps an example into a new D-dimensional representation2, and is parameterized by a matrix-vector pair (W,b) ∈ RD×m × RD :

Gf(x;W,b) = sigm Wx + b , (4)

with sigm(a) = 1+exp( 1 −a

i)

|a| i=1

.

Similarly, the prediction layer Gy learns a function Gy : RD → [0,1]L that is parameterized by a pair (V,c) ∈ RL×D × RL:

Gy(Gf(x);V,c) = softmax VGf(x) + c ,

with softmax(a) = |a exp(| ai)

j=1 exp(aj)

###### |a|

.

i=1

Here we have L = |Y |. By using the softmax function, each component of vector Gy(Gf(x)) denotes the conditional probability that the neural network assigns x to the class in Y represented by that component. Given a source example (xi,yi), the natural classiﬁcation loss to use is the negative log-probability of the correct label:

1 Gy(Gf(x))yi

Ly Gy(Gf(xi)),yi = log

.

Training the neural network then leads to the following optimization problem on the source domain:

n

1 n

Liy(W,b,V,c) + λ · R(W,b) , (5)

min

W,b,V,c

i=1

where Liy(W,b,V,c) = Ly Gy(Gf(xi;W,b);V,c),yi is a shorthand notation for the prediction loss on the i-th example, and R(W,b) is an optional regularizer that is weighted by hyper-parameter λ.

The heart of our approach is to design a domain regularizer directly derived from the

H-divergence of Deﬁnition 1. To this end, we view the output of the hidden layer Gf(·) (Equation 4) as the internal representation of the neural network. Thus, we denote the source sample representations as

- S(Gf) = Gf(x) x ∈ S .

Similarly, given an unlabeled sample from the target domain we denote the corresponding representations

- T(Gf) = Gf(x) x ∈ T .

Based on Equation (1), the empirical H-divergence of a symmetric hypothesis class H between samples S(Gf) and T(Gf) is given by

dˆH S(Gf),T(Gf) = 2 1−min η∈H

n

1 n

1 n

I η(Gf(xi))=0 +

i=1

N

I η(Gf(xi))=1 . (6)

i=n+1

2. For brevity of notation, we will sometimes drop the dependence of Gf on its parameters (W, b) and shorten Gf(x; W, b) to Gf(x).

Let us consider H as the class of hyperplanes in the representation space. Inspired by the Proxy A-distance (see Section 3.2), we suggest estimating the “min” part of Equation (6) by a domain classiﬁcation layer Gd that learns a logistic regressor Gd : RD → [0,1], parameterized by a vector-scalar pair (u,z) ∈ RD × R, that models the probability that a given input is from the source domain DSX or the target domain DTX. Thus,

Gd(Gf(x);u,z) = sigm u Gf(x) + z . (7) Hence, the function Gd(·) is a domain regressor. We deﬁne its loss by

1 1−Gd(Gf(xi))

1 Gd(Gf(xi))

+ (1−di)log

Ld Gd(Gf(xi)),di = di log

,

where di denotes the binary variable (domain label) for the i-th example, which indicates whether xi come from the source distribution (xi∼DSX if di=0) or from the target distribution (xi∼DTX if di=1).

Recall that for the examples from the source distribution (di=0), the corresponding labels yi ∈ Y are known at training time. For the examples from the target domains, we do not know the labels at training time, and we want to predict such labels at test time. This enables us to add a domain adaptation term to the objective of Equation (5), giving the following regularizer:

R(W,b) = max

u,z

n

1 n

1 n

Lid(W,b,u,z) −

−

i=1

N

Lid(W,b,u,z , (8)

i=n+1

where Lid(W,b,u,z)=Ld Gd(Gf(xi;W,b);u,z),di). This regularizer seeks to approximate the H-divergence of Equation (6), as 2(1−R(W,b)) is a surrogate for dˆH S(Gf),T(Gf) . In line with Theorem 2, the optimization problem given by Equations (5) and (8) implements a trade-oﬀ between the minimization of the source risk RS(·) and the divergence dˆH(·,·). The hyper-parameter λ is then used to tune the trade-oﬀ between these two quantities during the learning process.

For learning, we ﬁrst note that we can rewrite the complete optimization objective of Equation (5) as follows:

E(W,V,b,c,u,z) (9)

=

n

1 n

Liy(W,b,V,c) − λ

i=1

n

1 n

Lid(W,b,u,z) +

i=1

N

1 n

Lid(W,b,u,z) ,

i=n+1

where we are seeking the parameters Wˆ ,Vˆ ,bˆ,cˆ,uˆ,zˆ that deliver a saddle point given by (Wˆ ,Vˆ ,bˆ,cˆ) = argmin

E(W,V,b,c,uˆ,zˆ), (uˆ,zˆ) = argmax

W,V,b,c

E(Wˆ ,Vˆ ,bˆ,cˆ,u,z).

u,z

Thus, the optimization problem involves a minimization with respect to some parameters, as well as a maximization with respect to the others.

Algorithm 1 Shallow DANN – Stochastic training update

- 1: Input:

— samples S = {(xi, yi)}ni=1 and T = {xi}n i=1,

— hidden layer size D,

— adaptation parameter λ,

— learning rate µ,

- 2: Output: neural network {W, V, b, c}
- 3: W, V ← random init( D )

- 4: b, c, u, d ← 0
- 5: while stopping criterion is not met do
- 6: for i from 1 to n do
- 7: # Forward propagation
- 8: Gf(xi) ← sigm(b + Wxi)
- 9: Gy(Gf(xi)) ← softmax(c + VGf(xi))
- 10: # Backpropagation
- 11: ∆c ← −(e(yi) − Gy(Gf(xi)))
- 12: ∆V ← ∆c Gf(xi)
- 13: ∆b ← V ∆c Gf(xi) (1 − Gf(xi))
- 14: ∆W ← ∆b · (xi)
- 15: # Domain adaptation regularizer...
- 16: # ...from current domain
- 17: Gd(Gf(xi)) ← sigm(d + u Gf(xi))
- 18: ∆d ← λ(1 − Gd(Gf(xi)))
- 19: ∆u ← λ(1 − Gd(Gf(xi)))Gf(xi)

- 20: tmp ← λ(1 − Gd(Gf(xi))) × u Gf(xi) (1 − Gf(xi))
- 21: ∆b ← ∆b + tmp
- 22: ∆W ← ∆W + tmp · (xi)
- 23: # ...from other domain
- 24: j ← uniform integer(1, . . . , n )

- 25: Gf(xj) ← sigm(b + Wxj)
- 26: Gd(Gf(xj)) ← sigm(d + u Gf(xj))
- 27: ∆d ← ∆d − λGd(Gf(xj))
- 28: ∆u ← ∆u − λGd(Gf(xj))Gf(xj)
- 29: tmp ← −λGd(Gf(xj)) × u Gf(xj) (1 − Gf(xj))
- 30: ∆b ← ∆b + tmp
- 31: ∆W ← ∆W + tmp · (xj)
- 32: # Update neural network parameters
- 33: W ← W − µ∆W
- 34: V ← V − µ∆V
- 35: b ← b − µ∆b
- 36: c ← c − µ∆c
- 37: # Update domain classifier
- 38: u ← u + µ∆u
- 39: d ← d + µ∆d
- 40: end for
- 41: end while

Note: In this pseudo-code, e(y) refers to a “one-hot” vector, consisting of all 0s except for a 1 at position y, and is the element-wise product.

We propose to tackle this problem with a simple stochastic gradient procedure, in which updates are made in the opposite direction of the gradient of Equation (9) for the minimizing parameters, and in the direction of the gradient for the maximizing parameters. Stochastic estimates of the gradient are made, using a subset of the training samples to compute the averages. Algorithm 1 provides the complete pseudo-code of this learning procedure.3 In words, during training, the neural network (parameterized by W,b,V,c) and the domain regressor (parameterized by u,z) are competing against each other, in an adversarial way, over the objective of Equation (9). For this reason, we refer to networks trained according to this objective as Domain-Adversarial Neural Networks (DANN). DANN will eﬀectively attempt to learn a hidden layer Gf(·) that maps an example (either source or target) into a representation allowing the output layer Gy(·) to accurately classify source samples, but crippling the ability of the domain regressor Gd(·) to detect whether each example belongs to the source or target domains.

- 3. We provide an implementation of Shallow DANN algorithm at http://graal.ift.ulaval.ca/dann/

##### 4.2 Generalization to Arbitrary Architectures

For illustration purposes, we’ve so far focused on the case of a single hidden layer DANN. However, it is straightforward to generalize to other sophisticated architectures, which might be more appropriate for the data at hand. For example, deep convolutional neural networks are well known for being state-of-the-art models for learning discriminative features of images (Krizhevsky et al., 2012).

Let us now use a more general notation for the diﬀerent components of DANN. Namely, let Gf(·;θf) be the D-dimensional neural network feature extractor, with parameters θf. Also, let Gy(·;θy) be the part of DANN that computes the network’s label prediction output layer, with parameters θy, while Gd(·;θd) now corresponds to the computation of the domain prediction output of the network, with parameters θd. Note that for preserving the theoretical guarantees of Theorem 2, the hypothesis class Hd generated by the domain prediction component Gd should include the hypothesis class Hy generated by the label prediction component Gy. Thus, Hy ⊆ Hd.

We will note the prediction loss and the domain loss respectively by

Liy(θf,θy) = Ly Gy(Gf(xi;θf);θy),yi , Lid(θf,θd) = Ld Gd(Gf(xi;θf);θd),di).

Training DANN then parallels the single layer case and consists in optimizing

1 n

E(θf,θy,θd) =

n

Liy(θf,θy) − λ

i=1

n

1 n

Lid(θf,θd) +

i=1

N

1 n

Lid(θf,θd) , (10)

i=n+1

by ﬁnding the saddle point θˆf,θˆy,θˆd such that (θˆf,θˆy) = argmin

E(θf,θy,θˆd), (11)

θf,θy

θˆd = argmax

E(θˆf,θˆy,θd). (12)

θd

As suggested previously, a saddle point deﬁned by Equations (11-12) can be found as a stationary point of the following gradient updates:

θf ←− θf − µ

∂Liy ∂θf − λ

∂Lid ∂θf

, (13)

∂Liy ∂θy

θy ←− θy − µ

θd ←− θd − µλ

, (14)

∂Lid ∂θd

, (15)

where µ is the learning rate. We use stochastic estimates of these gradients, by sampling examples from the data set.

The updates of Equations (13-15) are very similar to stochastic gradient descent (SGD) updates for a feed-forward deep model that comprises feature extractor fed into the label

Figure 1: The proposed architecture includes a deep feature extractor (green) and a deep label predictor (blue), which together form a standard feed-forward architecture. Unsupervised domain adaptation is achieved by adding a domain classiﬁer (red) connected to the feature extractor via a gradient reversal layer that multiplies the gradient by a certain negative constant during the backpropagation-based training. Otherwise, the training proceeds standardly and minimizes the label prediction loss (for source examples) and the domain classiﬁcation loss (for all samples). Gradient reversal ensures that the feature distributions over the two domains are made similar (as indistinguishable as possible for the domain classiﬁer), thus resulting in the domain-invariant features.

predictor and into the domain classiﬁer (with loss weighted by λ). The only diﬀerence is that in (13), the gradients from the class and domain predictors are subtracted, instead of being summed (the diﬀerence is important, as otherwise SGD would try to make features dissimilar across domains in order to minimize the domain classiﬁcation loss). Since SGDand its many variants, such as ADAGRAD (Duchi et al., 2010) or ADADELTA (Zeiler, 2012)—is the main learning algorithm implemented in most libraries for deep learning, it would be convenient to frame an implementation of our stochastic saddle point procedure as SGD.

Fortunately, such a reduction can be accomplished by introducing a special gradient reversal layer (GRL), deﬁned as follows. The gradient reversal layer has no parameters associated with it. During the forward propagation, the GRL acts as an identity transformation. During the backpropagation however, the GRL takes the gradient from the subsequent level and changes its sign, i.e., multiplies it by −1, before passing it to the preceding layer. Implementing such a layer using existing object-oriented packages for deep learning is simple, requiring only to deﬁne procedures for the forward propagation (identity transformation), and backpropagation (multiplying by −1). The layer requires no parameter update.

The GRL as deﬁned above is inserted between the feature extractor Gf and the domain classiﬁer Gd, resulting in the architecture depicted in Figure 1. As the backpropagation process passes through the GRL, the partial derivatives of the loss that is downstream

the GRL (i.e., Ld) w.r.t. the layer parameters that are upstream the GRL (i.e., θf) get multiplied by −1, i.e., ∂∂θLd

is eﬀectively replaced with −∂∂θLd

. Therefore, running SGD in the resulting model implements the updates of Equations (13-15) and converges to a saddle point of Equation (10).

f

f

Mathematically, we can formally treat the gradient reversal layer as a “pseudo-function” R(x) deﬁned by two (incompatible) equations describing its forward and backpropagation behaviour:

R(x) = x, (16)

dR dx

= −I, (17)

where I is an identity matrix. We can then deﬁne the objective “pseudo-function” of (θf,θy,θd) that is being optimized by the stochastic gradient descent within our method:

n

1 n

E˜(θf,θy,θd) =

Ly Gy(Gf(xi;θf);θy),yi (18)

i=1

n

N

1 n

1 n

− λ

Ld Gd(R(Gf(xi;θf));θd),di +

Ld Gd(R(Gf(xi;θf));θd),di .

i=1

i=n+1

Running updates (13-15) can then be implemented as doing SGD for (18) and leads to the emergence of features that are domain-invariant and discriminative at the same time. After the learning, the label predictor Gy(Gf(x;θf);θy) can be used to predict labels for samples from the target domain (as well as from the source domain). Note that we release the source code for the Gradient Reversal layer along with the usage examples as an extension to Caffe (Jia et al., 2014).4

#### 5. Experiments

In this section, we present a variety of empirical results for both shallow domain adversarial neural networks (Subsection 5.1) and deep ones (Subsections 5.2 and 5.3).

##### 5.1 Experiments with Shallow Neural Networks

In this ﬁrst experiment section, we evaluate the behavior of the simple version of DANN described by Subsection 4.1. Note that the results reported in the present subsection are obtained using Algorithm 1. Thus, the stochastic gradient descent approach here consists of sampling a pair of source and target examples and performing a gradient step update of all parameters of DANN. Crucially, while the update of the regular parameters follows as usual the opposite direction of the gradient, for the adversarial parameters the step must follow the gradient’s direction (since we maximize with respect to them, instead of minimizing).

- 5.1.1 Experiments on a Toy Problem

As a ﬁrst experiment, we study the behavior of the proposed algorithm on a variant of the inter-twinning moons 2D problem, where the target distribution is a rotation of the source

4. http://sites.skoltech.ru/compvision/projects/grl/

###### Label classification

###### Representation PCA

###### Domain classification

###### Hidden neurons

+

+

+

+

+

+

+

++

+

++

+

++

++

++

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

D

+ + +

+ + +

+ + +

++

++

++

++

++

++

+ +

+ +

+ +

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+ +

+ +

+ +

+

+

+

+

++

++

++

++

++

++

+

+

+

+

+

+

D

+

+

+

+

+

+ +

+ +

+ +

+

+

+

+

+

+ +

+ +

+ +

+

+

+

+

+

+

- +

- +

- +

+

+

+

+

+

+

-

-

-

+

+

+

+

-

-

-

-

-

-

+

-

-

-

+

+

+

+

+

+

+

+ ++

-

-

-

+

+

+

+

+

-

-

-

+ +

+ +

+ +

-

-

-

+

+

+

-

-

-

-

-

-

+

+

+

+

+

+

+

+

+

+

+ + -

+ + -

+ + -

-

-

-

-

++

+

+

+

+ +

+ +

+ +

+

+

-

++++ -

-

+ --

+

-

+

+

+

## -

--

+

-

+

+ -

+

+++ - -

+

+ -

+

++ -

-

+

-

-

B

-

-

-

- +

- +

- +

-

- -

+

-

-

-

- -

+

+

+

-

-

-

-

+ -

+

+ -

-

C

+

+

+

-

-

-

-

-

-

+

+

+

- +

- +

- +

-

-

-

+ - -

+ - -

+ - -

+ -

+ -

+ -

-

-

-

-

-

C

-

-

-

-

-

-

+

+

+

-

+

+

+

+

+

+

-

- - -

- - -

- - -

+

+

+

+

+

+

- -

-

--

--

--

-

-

-

-

-

--

--

--

-

--

--

--

-

- -

- -

- -

- A

- B

- -

- -

- -

--

-

-

-

-

-

- -

- -

- -

-

- -

- -

- -

-

-

-

-

-

-

-

- -

- -

- -

-

-

-

-

-

-

- -

-

-

-

-

-

-

-

- -

- -

- -

-

--

--

--

-

-

-

-

-

-

- -

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

A

-

-

-

-

-

-

-

-

-

−3 −2 −1 0 1 2 3

−1.0 −0.5 0.0 0.5 1.0

−3 −2 −1 0 1 2 3

−3 −2 −1 0 1 2 3

###### (a) Standard NN. For the “domain classiﬁcation”, we use a non adversarial domain regressor on the hidden neurons learned by the Standard NN. (This is equivalent to run Algorithm 1, without Lines 22 and 31)

+

+

+

+ +

+

+

+

+

+ +

+

+ +

+

+

+

## -

++

++

++

+

+

+

+

+

+

+

+

+

- +

+

+ - +

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

+

D

+ + +

+ + +

+ + +

++

++

++

++

++

++

+ +

+ +

+ +

- - +
- - +

+

+

- - +

+

- - -

+

+

+

+

+

+

+

+

+

+

+

+

+ +

+ +

+ +

+

+

+

++

++

++

+

++

++

++

+

+

+

## -

+

+

+

+ +

+ +

+ +

D

+

+

+

++

+ +

+ +

+ +

+

+

+

+

+

+

- +

- +

- +

+

+

+

+

+

+

+

-

-

-

+

-

-

-

++

-

-

-

-

-

-

+

+

+

+

+

+

-

-

-

+

+

+

+

+ ++-

-

-

-

+

+ +

+ +

+ +

+ +

+

-

-

-

+

+

+

+

- +

-

-

-

+

-

-

-

B

+-

+

+

+

+

+

+

+

+

+

+

+

- +-

+

+

+

+

+

+

+ + -

+ + -

+ + -

-

-

-

-

+

+

+

+ +

+ +

+ +

+

+

+

+

-

-

-

-

- +

- +

- +

-

-

-

-

+

+

+

-

-

-

C

+

+

+

-

-

-

-

-

-

+

+

+

- +

- +

- +

-

-

-

+

+ - -

+ - -

+ - -

--

+

-- -

+ -

+ -

+ -

-

-

-

-

-

-

-

-

-

+

+

+

-

-

-

+

+

+

+

+

+

-

-

- - -

- - -

- - -

+

+

+

+

+

+

-

-

-

-

-

-

--

--

--

-

-

-

-

-

-

--

--

--

-

- -

--

--

--

- -

- -

- -

- -

- -

- -

- -

-

-

-

- -

- -

- -

- -

- -

- -

-

-

-

-

- A

- B

-

-

-

-

- -

- -

- -

-

-

-

-

-

-

-

-

-

-

-

-

-

C

- -

- -

- -

--

--

--

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

-

+

+

-

-

- -

A

+

-

-

- -

- -

-

+

-

+

-

-

-

-

-

-

-

-

−3 −2 −1 0 1 2 3

−1.5 −1.0 −0.5 0.0 0.5 1.0 1.5

−3 −2 −1 0 1 2 3

−3 −2 −1 0 1 2 3

(b) DANN (Algorithm 1)

- Figure 2: The inter-twinning moons toy problem. Examples from the source sample are represented as a “+”(label 1) and a “−”(label 0), while examples from the unlabeled target sample are represented as black dots. See text for the ﬁgure discussion.

one. As the source sample S, we generate a lower moon and an upper moon labeled 0 and 1 respectively, each of which containing 150 examples. The target sample T is obtained by the following procedure: (1) we generate a sample S the same way S has been generated; (2) we rotate each example by 35◦; and (3) we remove all the labels. Thus, T contains 300 unlabeled examples. We have represented those examples in Figure 2.

We study the adaptation capability of DANN by comparing it to the standard neural network (NN). In these toy experiments, both algorithms share the same network architecture, with a hidden layer size of 15 neurons. We train the NN using the same procedure as the DANN. That is, we keep updating the domain regressor component using target sample T (with a hyper-parameter λ = 6; the same value is used for DANN), but we disable the adversarial back-propagation into the hidden layer. To do so, we execute Algorithm 1 by omitting the lines numbered 22 and 31. This allows recovering the NN learning algorithm—based on the source risk minimization of Equation (5) without any regularizer—and simultaneously train the domain regressor of Equation (7) to discriminate between source and target domains. With this toy experience, we will ﬁrst illustrate how DANN adapts its decision boundary when compared to NN. Moreover, we will also illustrate how the representation given by the hidden layer is less adapted to the source domain task with DANN than with NN (this is why we need a domain regressor in the NN experiment). We recall that this is the founding idea behind our proposed algorithm. The analysis of the experiment appears in Figure 2, where upper graphs relate to standard NN, and lower graphs relate to DANN. By looking at the lower and upper graphs pairwise, we compare NN and DANN from four diﬀerent perspectives, described in details below.

The column “Label Classification” of Figure 2 shows the decision boundaries of DANN and NN on the problem of predicting the labels of both source and the target examples. As expected, NN accurately classiﬁes the two classes of the source sample S, but is not fully adapted to the target sample T. On the contrary, the decision boundary of DANN perfectly classiﬁes examples from both source and target samples. In the studied task, DANN clearly adapts to the target distribution.

The column “Representation PCA” studies how the domain adaptation regularizer

aﬀects the representation Gf(·) provided by the network hidden layer. The graphs are obtained by applying a Principal component analysis (PCA) on the set of all representation of

source and target data points, i.e., S(Gf)∪T(Gf). Thus, given the trained network (NN or DANN), every point from S and T is mapped into a 15-dimensional feature space through the hidden layer, and projected back into a two-dimensional plane by the PCA transformation. In the DANN-PCA representation, we observe that target points are homogeneously spread out among source points; In the NN-PCA representation, a number of target points belong to clusters containing no source points. Hence, labeling the target points seems an easier task given the DANN-PCA representation. To push the analysis further, the PCA graphs tag four crucial data points by the letters A, B, C and D, that correspond to the moon extremities in the original space (note that the original point locations are tagged in the ﬁrst column graphs). We observe that points A and B are very close to each other in the NN-PCA representation, while they clearly belong to diﬀerent classes. The same happens to points C and D. Conversely, these four points are at the opposite four corners in the DANN-PCA representation. Note also that the target point A (resp. D)—that is diﬃcult to classify in the original space—is located in the “+”cluster (resp. “−”cluster) in the DANN-PCA representation. Therefore, the representation promoted by DANN is better suited to the adaptation problem.

The column “Domain Classification” shows the decision boundary on the domain classiﬁcation problem, which is given by the domain regressor Gd of Equation (7). More precisely, an example x is classiﬁed as a source example when Gd(Gf(x)) ≥ 0.5, and is classiﬁed as a domain example otherwise. Remember that, during the learning process of DANN, the Gd regressor struggles to discriminate between source and target domains, while the hidden representation Gf(·) is adversarially updated to prevent it to succeed. As explained above, we trained a domain regressor during the learning process of NN, but without allowing it to inﬂuence the learned representation Gf(·). On one hand, the DANN domain regressor clearly fails to generalize source and target distribution topologies. On the other hand, the NN domain regressor shows a better (although imperfect) generalization capability. Inter alia, it seems to roughly capture the rotation angle of the target distribution. This again corroborates that the DANN representation does not allow discriminating between domains.

The column “Hidden Neurons” shows the conﬁguration of hidden layer neurons (by Equation 4, we have that each neuron is indeed a linear regressor). In other words, each of the ﬁfteen plot line corresponds to the coordinates x ∈ R2 for which the i-th component of Gf(x) equals 12, for i ∈ {1,...,15}. We observe that the standard NN neurons are grouped in three clusters, each one allowing to generate a straight line of the zigzag decision boundary for the label classiﬁcation problem. However, most of these neurons are also able

to (roughly) capture the rotation angle of the domain classiﬁcation problem. Hence, we observe that the adaptation regularizer of DANN prevents these kinds of neurons to be produced. It is indeed striking to see that the two predominant patterns in the NN neurons (i.e., the two parallel lines crossing the plane from lower left to upper right) are vanishing in the DANN neurons.

- 5.1.2 Unsupervised Hyper-Parameter Selection

To perform unsupervised domain adaption, one should provide ways to set hyper-parameters (such as the domain regularization parameter λ, the learning rate, the network architecture for our method) in an unsupervised way, i.e., without referring to labeled data in the target domain. In the following experiments of Sections 5.1.3 and 5.1.4, we select the hyper-parameters of each algorithm by using a variant of reverse cross-validation approach proposed by Zhong et al. (2010), that we call reverse validation.

To evaluate the reverse validation risk associated to a tuple of hyper-parameters, we proceed as follows. Given the labeled source sample S and the unlabeled target sample T, we split each set into training sets (S and T respectively, containing 90% of the original examples) and the validation sets (SV and TV respectively). We use the labeled set S and the unlabeled target set T to learn a classiﬁer η. Then, using the same algorithm, we learn a reverse classiﬁer ηr using the self-labeled set {(x,η(x))}x∈T and the unlabeled part of S as target sample. Finally, the reverse classiﬁer ηr is evaluated on the validation set SV of source sample. We then say that the classiﬁer η has a reverse validation risk of RSV (ηr). The process is repeated with multiple values of hyper-parameters and the selected parameters are those corresponding to the classiﬁer with the lowest reverse validation risk.

Note that when we train neural network architectures, the validation set SV is also used as an early stopping criterion during the learning of η, and self-labeled validation set {(x,η(x))}x∈TV is used as an early stopping criterion during the learning of ηr. We also observed better accuracies when we initialized the learning of the reverse classiﬁer ηr with the conﬁguration learned by the network η.

- 5.1.3 Experiments on Sentiment Analysis Data Sets

We now compare the performance of our proposed DANN algorithm to a standard neural network with one hidden layer (NN) described by Equation (5), and a Support Vector Machine (SVM) with a linear kernel. We compare the algorithms on the Amazon reviews data set, as pre-processed by Chen et al. (2012). This data set includes four domains, each one composed of reviews of a speciﬁc kind of product (books, dvd disks, electronics, and kitchen appliances). Reviews are encoded in 5000 dimensional feature vectors of unigrams and bigrams, and labels are binary: “0” if the product is ranked up to 3 stars, and “1” if the product is ranked 4 or 5 stars.

We perform twelve domain adaptation tasks. All learning algorithms are given 2000 labeled source examples and 2000 unlabeled target examples. Then, we evaluate them on separate target test sets (between 3000 and 6000 examples). Note that NN and SVM do not use the unlabeled target sample for learning.

Here are more details about the procedure used for each learning algorithms leading to the empirical results of Table 1.

###### Original data mSDA representation

Source Target DANN NN SVM DANN NN SVM books dvd .784 .790 .799 .829 .824 .830 books electronics .733 .747 .748 .804 .770 .766 books kitchen .779 .778 .769 .843 .842 .821 dvd books .723 .720 .743 .825 .823 .826 dvd electronics .754 .732 .748 .809 .768 .739 dvd kitchen .783 .778 .746 .849 .853 .842 electronics books .713 .709 .705 .774 .770 .762 electronics dvd .738 .733 .726 .781 .759 .770 electronics kitchen .854 .854 .847 .881 .863 .847 kitchen books .709 .708 .707 .718 .721 .769 kitchen dvd .740 .739 .736 .789 .789 .788 kitchen electronics .843 .841 .842 .856 .850 .861

(a) Classiﬁcation accuracy on the Amazon reviews data set

###### Original data

###### mSDA representations

DANN NN SVM

DANN NN SVM

DANN .50 .87 .83 NN .13 .50 .63 SVM .17 .37 .50

DANN .50 .92 .88 NN .08 .50 .62 SVM .12 .38 .50

(b) Pairwise Poisson binomial test

- Table 1: Classiﬁcation accuracy on the Amazon reviews data set, and Pairwise Poisson binomial test.

- • For the DANN algorithm, the adaptation parameter λ is chosen among 9 values between 10−2 and 1 on a logarithmic scale. The hidden layer size l is either 50 or 100. Finally, the learning rate µ is ﬁxed at 10−3.
- • For the NN algorithm, we use exactly the same hyper-parameters grid and training procedure as DANN above, except that we do not need an adaptation parameter. Note that one can train NN by using the DANN implementation (Algorithm 1) with λ = 0.
- • For the SVM algorithm, the hyper-parameter C is chosen among 10 values between 10−5 and 1 on a logarithmic scale. This range of values is the same as used by Chen et al. (2012) in their experiments.

As presented at Section 5.1.2, we used reverse cross validation selecting the hyper-parameters for all three learning algorithms, with early stopping as the stopping criterion for DANN and NN.

The “Original data” part of Table 1a shows the target test accuracy of all algorithms, and Table 1b reports the probability that one algorithm is signiﬁcantly better than the others according to the Poisson binomial test (Lacoste et al., 2012). We note that DANN has a signiﬁcantly better performance than NN and SVM, with respective probabilities 0.87 and 0.83. As the only diﬀerence between DANN and NN is the domain adaptation regularizer, we conclude that our approach successfully helps to ﬁnd a representation suitable for the target domain.

- 5.1.4 Combining DANN with Denoising Autoencoders

We now investigate on whether the DANN algorithm can improve on the representation learned by the state-of-the-art Marginalized Stacked Denoising Autoencoders (mSDA) proposed by Chen et al. (2012). In brief, mSDA is an unsupervised algorithm that learns a new robust feature representation of the training samples. It takes the unlabeled parts of both source and target samples to learn a feature map from input space X to a new representation space. As a denoising autoencoders algorithm, it ﬁnds a feature representation from which one can (approximately) reconstruct the original features of an example from its noisy counterpart. Chen et al. (2012) showed that using mSDA with a linear SVM classiﬁer reaches state-of-the-art performance on the Amazon reviews data sets. As an alternative to the SVM, we propose to apply our Shallow DANN algorithm on the same representations generated by mSDA (using representations of both source and target samples). Note that, even if mSDA and DANN are two representation learning approaches, they optimize diﬀerent objectives, which can be complementary.

We perform this experiment on the same Amazon reviews data set described in the previous subsection. For each source-target domain pair, we generate the mSDA representations using a corruption probability of 50% and a number of layers of 5. We then execute the three learning algorithms (DANN, NN, and SVM) on these representations. More precisely, following the experimental procedure of Chen et al. (2012), we use the concatenation of the output of the 5 layers and the original input as the new representation. Thus, each example is now encoded in a vector of 30000 dimensions. Note that we use the same grid search as in the previous Subsection 5.1.3, but use a learning rate µ of 10−4 for both DANN and the NN. The results of “mSDA representation” columns in Table 1a conﬁrm that combining mSDA and DANN is a sound approach. Indeed, the Poisson binomial test shows that DANN has a better performance than the NN and the SVM, with probabilities 0.92 and 0.88 respectively, as reported in Table 1b. We note however that the standard NN and the SVM ﬁnd the best solution on respectively the second and the fourth tasks. This suggests that DANN and mSDA adaptation strategies are not fully complementary.

- 5.1.5 Proxy Distance

The theoretical foundation of the DANN algorithm is the domain adaptation theory of BenDavid et al. (2006, 2010). We claimed that DANN ﬁnds a representation in which the source and the target example are hardly distinguishable. Our toy experiment of Section 5.1.1 already points out some evidence for that and here we provide analysis on real data. To do so, we compare the Proxy A-distance (PAD) on various representations of the Amazon Reviews data set; these representations are obtained by running either NN, DANN, mSDA,

2.0

2.0

2.0

PADonmSDAandDANNrepresentations

B↔E D↔E B↔K D↔K

|mSDA<br><br>mSDA + DANN|
|---|

- D→K

E→K

K→E

K→D

K→B

- E→D

PADonDANNrepresentations

PADonDANNrepresentations

1.8

B↔D

1.5

1.5

E↔K

E→B D→B

1.6

B→E

D→E

D→B

K→B

B→E

1.4

B→D

- D→K

E→K

K→E

K→D

K→B

- E→D

B→D

1.0

D→B

1.0

1.2

K→D

B→K D→E

- D→E

- D→K

E→B

- E→D

1.0

B→D

0.5

0.5

B→E B→K

B→K

K→E

0.8

E→K

0.6

0.0

0.0

0.0 0.5 1.0 1.5 2.0 PAD on raw input

0.0 0.5 1.0 1.5 2.0 PAD on NN representations

0.6 0.8 1.0 1.2 1.4 1.6 1.8 2.0

PAD on raw input

(a) DANN on Original data.

(b) DANN & NN with 100 hidden neurons.

(c) DANN on mSDA representations.

- Figure 3: Proxy A-distances (PAD). Note that the PAD values of mSDA representations are symmetric when swapping source and target samples.

or mSDA and DANN combined. Recall that PAD, as described in Section 3.2, is a metric estimating the similarity of the source and the target representations. More precisely, to obtain a PAD value, we use the following procedure: (1) we construct the data set U of

- Equation (2) using both source and target representations of the training samples; (2) we randomly split U in two subsets of equal size; (3) we train linear SVMs on the ﬁrst subset of U using a large range of C values; (4) we compute the error of all obtained classiﬁers on the second subset of U; and (5) we use the lowest error to compute the PAD value of
- Equation (3).

Firstly, Figure 3a compares the PAD of DANN representations obtained in the experiments of Section 5.1.3 (using the hyper-parameters values leading to the results of Table 1) to the PAD computed on raw data. As expected, the PAD values are driven down by the DANN representations.

Secondly, Figure 3b compares the PAD of DANN representations to the PAD of standard NN representations. As the PAD is inﬂuenced by the hidden layer size (the discriminating power tends to increase with the representation length), we ﬁx here the size to 100 neurons for both algorithms. We also ﬁx the adaptation parameter of DANN to λ 0.31; it was the value that has been selected most of the time during our preceding experiments on the Amazon Reviews data set. Again, DANN is clearly leading to the lowest PAD values.

Lastly, Figure 3c presents two sets of results related to Section 5.1.4 experiments. On one hand, we reproduce the results of Chen et al. (2012), which noticed that the mSDA representations have greater PAD values than original (raw) data. Although the mSDA approach clearly helps to adapt to the target task, it seems to contradict the theory of BenDavid et al.. On the other hand, we observe that, when running DANN on top of mSDA (using the hyper-parameters values leading to the results of Table 1), the obtained representations have much lower PAD values. These observations might explain the improvements provided by DANN when combined with the mSDA procedure.

##### 5.2 Experiments with Deep Networks on Image Classiﬁcation

We now perform extensive evaluation of a deep version of DANN (see Subsection 4.2) on a number of popular image data sets and their modiﬁcations. These include large-scale data sets of small images popular with deep learning methods, and the Office data sets (Saenko

- et al., 2010), which are a de facto standard for domain adaptation in computer vision, but have much fewer images.

- 5.2.1 Baselines

The following baselines are evaluated in the experiments of this subsection. The source-only model is trained without consideration for target-domain data (no domain classiﬁer branch included into the network). The train-on-target model is trained on the target domain with class labels revealed. This model serves as an upper bound on DA methods, assuming that target data are abundant and the shift between the domains is considerable.

In addition, we compare our approach against the recently proposed unsupervised DA method based on subspace alignment (SA) (Fernando et al., 2013), which is simple to setup and test on new data sets, but has also been shown to perform very well in experimental comparisons with other “shallow” DA methods. To boost the performance of this baseline, we pick its most important free parameter (the number of principal components) from the range {2,...,60}, so that the test performance on the target domain is maximized. To apply SA in our setting, we train a source-only model and then consider the activations of the last hidden layer in the label predictor (before the ﬁnal linear classiﬁer) as descriptors/features, and learn the mapping between the source and the target domains (Fernando et al., 2013).

Since the SA baseline requires training a new classiﬁer after adapting the features, and in order to put all the compared settings on an equal footing, we retrain the last layer of the label predictor using a standard linear SVM (Fan et al., 2008) for all four considered methods (including ours; the performance on the target domain remains approximately the same after the retraining).

For the Office data set (Saenko et al., 2010), we directly compare the performance of our full network (feature extractor and label predictor) against recent DA approaches using previously published results.

- 5.2.2 CNN architectures and Training Procedure

In general, we compose feature extractor from two or three convolutional layers, picking their exact conﬁgurations from previous works. More precisely, four diﬀerent architectures were used in our experiments. The ﬁrst three are shown in Figure 4. For the Office domains, we use pre-trained AlexNet from the Caffe-package (Jia et al., 2014). The adaptation architecture is identical to Tzeng et al. (2014).5

For the domain adaption component, we use three (x→1024→1024→2) fully connected layers, except for MNIST where we used a simpler (x→100→2) architecture to speed up the experiments. Admittedly these choices for domain classiﬁer are arbitrary, and better adaptation performance might be attained if this part of the architecture is tuned.

- 5. A 2-layer domain classiﬁer (x→1024→1024→2) is attached to the 256-dimensional bottleneck of fc7.

conv 5x5 32 maps ReLU

conv 5x5 48 maps ReLU

fully-conn 100 units ReLU

fully-conn 100 units ReLU

fully-conn 10 units Soft-max

max-pool 2x2 2x2 stride

max-pool 2x2 2x2 stride

fully-conn 1 unit Logistic

fully-conn 100 units ReLU

GRL

###### (a) MNIST architecture; inspired by the classical LeNet-5 (LeCun et al., 1998).

conv 5x5 64 maps ReLU

conv 5x5 64 maps ReLU

conv 5x5 128 maps ReLU

fully-conn 3072 units ReLU

fully-conn 2048 units ReLU

fully-conn 10 units Soft-max

max-pool 3x3 2x2 stride

max-pool 3x3 2x2 stride

fully-conn 1 unit Logistic

fully-conn 1024 units ReLU

fully-conn 1024 units ReLU

GRL

###### (b) SVHN architecture; adopted from Srivastava et al. (2014).

conv 5x5 96 maps ReLU

conv 3x3 144 maps ReLU

conv 5x5 256 maps ReLU

fully-conn 512 units ReLU

fully-conn 10 units Soft-max

max-pool 2x2 2x2 stride

max-pool 2x2 2x2 stride

max-pool 2x2 2x2 stride

fully-conn 1 unit Logistic

fully-conn 1024 units ReLU

fully-conn 1024 units ReLU

GRL

(c) GTSRB architecture; we used the single-CNN baseline from Cire¸san et al. (2012) as our starting point.

- Figure 4: CNN architectures used in the experiments. Boxes correspond to transformations applied to the data. Color-coding is the same as in Figure 1.

For the loss functions, we set Ly and Ld to be the logistic regression loss and the binomial cross-entropy respectively. Following Srivastava et al. (2014) we also use dropout and 2-norm restriction when we train the SVHN architecture.

The other hyper-parameters are not selected through a grid search as in the small scale experiments of Section 5.1, which would be computationally costly. Instead, the learning rate is adjusted during the stochastic gradient descent using the following formula:

µ0 (1 + α · p)β

µp =

,

where p is the training progress linearly changing from 0 to 1, µ0 = 0.01, α = 10 and β = 0.75 (the schedule was optimized to promote convergence and low error on the source domain). A momentum term of 0.9 is also used.

The domain adaptation parameter λ is initiated at 0 and is gradually changed to 1 using the following schedule:

2 1 + exp(−γ · p) − 1,

λp =

where γ was set to 10 in all experiments (the schedule was not optimized/tweaked). This strategy allows the domain classiﬁer to be less sensitive to noisy signal at the early stages of the training procedure. Note however that these λp were used only for updating the feature

###### MNIST → MNIST-M: top feature extractor layer

[Figure 1]

[Figure 2]

[Figure 3]

[Figure 4]

(a) Non-adapted (b) Adapted

Syn Numbers → SVHN: last hidden layer of the label predictor

[Figure 5]

[Figure 6]

[Figure 7]

[Figure 8]

(a) Non-adapted (b) Adapted

- Figure 5: The eﬀect of adaptation on the distribution of the extracted features (best viewed in color). The ﬁgure shows t-SNE (van der Maaten, 2013) visualizations of the CNN’s activations (a) in case when no adaptation was performed and (b) in case when our adaptation procedure was incorporated into training. Blue points correspond to the source domain examples, while red ones correspond to the target domain. In all cases, the adaptation in our method makes the two distributions of features much closer.

extractor component Gf. For updating the domain classiﬁcation component, we used a ﬁxed λ = 1, to ensure that the latter trains as fast as the label predictor Gy.6

Finally, note that the model is trained on 128-sized batches (images are preprocessed by the mean subtraction). A half of each batch is populated by the samples from the source domain (with known labels), the rest constitutes the target domain (with labels not revealed to the algorithms except for the train-on-target baseline).

- 5.2.3 Visualizations

We use t-SNE (van der Maaten, 2013) projection to visualize feature distributions at different points of the network, while color-coding the domains (Figure 5). As we already observed with the shallow version of DANN (see Figure 2), there is a strong correspondence

6. Equivalently, one can use the same λp for both feature extractor and domain classiﬁcation components, but use a learning rate of µ/λp for the latter.

between the success of the adaptation in terms of the classiﬁcation accuracy for the target domain, and the overlap between the domain distributions in such visualizations.

- 5.2.4 Results On Image Data Sets

We now discuss the experimental settings and the results. In each case, we train on the source data set and test on a diﬀerent target domain data set, with considerable shifts between domains (see Figure 6). The results are summarized in Table 2 and Table 3.

MNIST → MNIST-M. Our ﬁrst experiment deals with the MNIST data set (LeCun et al., 1998) (source). In order to obtain the target domain (MNIST-M) we blend digits from the original set over patches randomly extracted from color photos from BSDS500 (Arbelaez

- et al., 2011). This operation is formally deﬁned for two images I1,I2 as Iijkout = |Iijk1 − Iijk2 |, where i,j are the coordinates of a pixel and k is a channel index. In other words, an output sample is produced by taking a patch from a photo and inverting its pixels at positions corresponding to the pixels of a digit. For a human the classiﬁcation task becomes only slightly harder compared to the original data set (the digits are still clearly distinguishable) whereas for a CNN trained on MNIST this domain is quite distinct, as the background and the strokes are no longer constant. Consequently, the source-only model performs poorly. Our approach succeeded at aligning feature distributions (Figure 5), which led to successful adaptation results (considering that the adaptation is unsupervised). At the same time, the improvement over source-only model achieved by subspace alignment (SA) (Fernando et al., 2013) is quite modest, thus highlighting the diﬃculty of the adaptation task.

Synthetic numbers → SVHN. To address a common scenario of training on synthetic data and testing on real data, we use Street-View House Number data set SVHN (Netzer et al., 2011) as the target domain and synthetic digits as the source. The latter (Syn Numbers) consists of ≈ 500,000 images generated by ourselves from WindowsTM fonts by varying the text (that includes diﬀerent one-, two-, and three-digit numbers), positioning, orientation, background and stroke colors, and the amount of blur. The degrees of variation were chosen manually to simulate SVHN, however the two data sets are still rather distinct, the biggest diﬀerence being the structured clutter in the background of SVHN images.

The proposed backpropagation-based technique works well covering almost 80% of the gap between training with source data only and training on target domain data with known target labels. In contrast, SA (Fernando et al., 2013) results in a slight classiﬁcation accuracy drop (probably due to the information loss during the dimensionality reduction), indicating that the adaptation task is even more challenging than in the case of the MNIST experiment.

MNIST ↔ SVHN. In this experiment, we further increase the gap between distributions, and test on MNIST and SVHN, which are signiﬁcantly diﬀerent in appearance. Training on SVHN even without adaptation is challenging — classiﬁcation error stays high during the ﬁrst 150 epochs. In order to avoid ending up in a poor local minimum we, therefore, do not use learning rate annealing here. Obviously, the two directions (MNIST → SVHN and SVHN → MNIST) are not equally diﬃcult. As SVHN is more diverse, a model trained on SVHN is expected to be more generic and to perform reasonably on the MNIST data set. This, indeed, turns out to be the case and is supported by the appearance of the

Source Target

MNIST Syn Numbers SVHN Syn Signs

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

[Figure 25]

[Figure 26]

[Figure 27]

[Figure 28]

[Figure 29]

[Figure 30]

[Figure 31]

[Figure 32]

MNIST-M SVHN MNIST GTSRB

- Figure 6: Examples of domain pairs used in the experiments. See Section 5.2.4 for details.

|Method Source Target|MNIST Syn Numbers SVHN Syn Signs<br><br>MNIST-M SVHN MNIST GTSRB<br><br>|
|---|---|
|Source only SA (Fernando et al., 2013) DANN Train on target|.5225 .8674 .5490 .7900 .5690 (4.1%) .8644 (−5.5%) .5932 (9.9%) .8165 (12.7%)<br><br>.7666 (52.9%) .9109 (79.7%) .7385 (42.6%) .8865 (46.4%) .9596 .9220 .9942 .9980<br><br>|

- Table 2: Classiﬁcation accuracies for digit image classiﬁcations for diﬀerent source and target domains. MNIST-M corresponds to diﬀerence-blended digits over nonuniform background. The ﬁrst row corresponds to the lower performance bound (i.e., if no adaptation is performed). The last row corresponds to training on the target domain data with known class labels (upper bound on the DA performance). For each of the two DA methods (ours and Fernando et al., 2013) we show how much of the gap between the lower and the upper bounds was covered (in brackets). For all ﬁve cases, our approach outperforms Fernando et al. (2013) considerably, and covers a big portion of the gap.

|Method Source Target|Amazon DSLR Webcam<br><br>Webcam Webcam DSLR<br><br>|
|---|---|
|GFK(PLS, PCA) (Gong et al., 2012) SA* (Fernando et al., 2013) DLID (Chopra et al., 2013) DDC (Tzeng et al., 2014) DAN (Long and Wang, 2015)<br><br>|.197 .497 .6631<br><br>.450 .648 .699 .519 .782 .899 .618 .950 .985 .685 .960 .990<br><br>|
|Source only DANN|.642 .961 .978 .730 .964 .992<br><br>|

- Table 3: Accuracy evaluation of diﬀerent DA approaches on the standard Office (Saenko et al., 2010) data set. All methods (except SA) are evaluated in the “fullytransductive” protocol (some results are reproduced from Long and Wang, 2015). Our method (last row) outperforms competitors setting the new state-of-the-art.

Validationerror

Real

0.2

Syn

Syn Adapted

Syn + Real

0.15

Syn + Real Adapted

0.1

0 1 2 3 4 5 ·105

Batches seen

- Figure 7: Results for the traﬃc signs classiﬁcation in the semi-supervised setting. Syn and Real denote available labeled data (100,000 synthetic and 430 real images respectively); Adapted means that ≈ 31,000 unlabeled target domain images were used for adaptation. The best performance is achieved by employing both the labeled samples and the large unlabeled corpus in the target domain.

feature distributions. We observe a quite strong separation between the domains when we feed them into the CNN trained solely on MNIST, whereas for the SVHN-trained network the features are much more intermixed. This diﬀerence probably explains why our method succeeded in improving the performance by adaptation in the SVHN → MNIST scenario (see Table 2) but not in the opposite direction (SA is not able to perform adaptation in this case either). Unsupervised adaptation from MNIST to SVHN gives a failure example for our approach: it doesn’t manage to improve upon the performance of the non-adapted model which achieves ≈ 0.25 accuracy (we are unaware of any unsupervised DA methods capable of performing such adaptation).

Synthetic Signs → GTSRB. Overall, this setting is similar to the Syn Numbers → SVHN experiment, except the distribution of the features is more complex due to the signiﬁcantly larger number of classes (43 instead of 10). For the source domain we obtained 100,000 synthetic images (which we call Syn Signs) simulating various imaging conditions. In the target domain, we use 31,367 random training samples for unsupervised adaptation and the rest for evaluation. Once again, our method achieves a sensible increase in performance proving its suitability for the synthetic-to-real data adaptation.

As an additional experiment, we also evaluate the proposed algorithm for semi-supervised domain adaptation, i.e., when one is additionally provided with a small amount of labeled target data. Here, we reveal 430 labeled examples (10 samples per class) and add them to the training set for the label predictor. Figure 7 shows the change of the validation error throughout the training. While the graph clearly suggests that our method can be beneﬁcial in the semi-supervised setting, thorough veriﬁcation of semi-supervised setting is left for future work.

Oﬃce data set. We ﬁnally evaluate our method on Office data set, which is a collection of three distinct domains: Amazon, DSLR, and Webcam. Unlike previously discussed data

sets, Office is rather small-scale with only 2817 labeled images spread across 31 diﬀerent categories in the largest domain. The amount of available data is crucial for a successful training of a deep model, hence we opted for the ﬁne-tuning of the CNN pre-trained on the ImageNet (AlexNet from the Caffe package, see Jia et al., 2014) as it is done in some recent DA works (Donahue et al., 2014; Tzeng et al., 2014; Hoﬀman et al., 2013; Long and Wang, 2015). We make our approach more comparable with Tzeng et al. (2014) by using exactly the same network architecture replacing domain mean-based regularization with the domain classiﬁer.

Following previous works, we assess the performance of our method across three transfer tasks most commonly used for evaluation. Our training protocol is adopted from Gong et al. (2013); Chopra et al. (2013); Long and Wang (2015) as during adaptation we use all available labeled source examples and unlabeled target examples (the premise of our method is the abundance of unlabeled data in the target domain). Also, all source domain data are used for training. Under this “fully-transductive” setting, our method is able to improve previously-reported state-of-the-art accuracy for unsupervised adaptation very considerably (Table 3), especially in the most challenging Amazon → Webcam scenario (the two domains with the largest domain shift).

Interestingly, in all three experiments we observe a slight over-ﬁtting (performance on the target domain degrades while accuracy on the source continues to improve) as training progresses, however, it doesn’t ruin the validation accuracy. Moreover, switching oﬀ the domain classiﬁer branch makes this eﬀect far more apparent, from which we conclude that our technique serves as a regularizer.

##### 5.3 Experiments with Deep Image Descriptors for Re-Identiﬁcation

In this section we discuss the application of the described adaptation method to person re-identiﬁcation (re-id) problem. The task of person re-identiﬁcation is to associate people seen from diﬀerent camera views. More formally, it can be deﬁned as follows: given two sets of images from diﬀerent cameras (probe and gallery) such that each person depicted in the probe set has an image in the gallery set, for each image of a person from the probe set ﬁnd an image of the same person in the gallery set. Disjoint camera views, diﬀerent illumination conditions, various poses and low quality of data make this problem diﬃcult even for humans (e.g., Liu et al., 2013, reports human performance at Rank1=71.08%).

Unlike classiﬁcation problems that are discussed above, re-identiﬁcation problem implies that each image is mapped to a vector descriptor. The distance between descriptors is then used to match images from the probe set and the gallery set. To evaluate results of re-id methods the Cumulative Match Characteristic (CMC) curve is commonly used. It is a plot of the identiﬁcation rate (recall) at rank-k, that is the probability of the matching gallery image to be within the closest k images (in terms of descriptor distance) to the probe image.

Most existing works train descriptor mappings and evaluate them within the same data set containing images from a certain camera network with similar imaging conditions. Several papers, however, observed that the performance of the resulting re-identiﬁcation systems drops very considerably when descriptors trained on one data set and tested on another. It is therefore natural to handle such cross-domain evaluation as a domain-adaptation problem, where each camera network (data set) constitutes a domain.

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

VIPER PRID CUHK

[Figure 44]

- Figure 8: Matching and non-matching pairs of probe-gallery images from diﬀerent person re-identiﬁcation data sets. The three data sets are treated as diﬀerent domains in our experiments.

Recently, several papers with signiﬁcantly improved re-identiﬁcation performance (Zhang and Saligrama, 2014; Zhao et al., 2014; Paisitkriangkrai et al., 2015) have been presented, with Ma et al. (2015) reporting good results in cross-data-set evaluation scenario. At the moment, deep learning methods (Yi et al., 2014) do not achieve state-of-the-art results probably because of the limited size of the training sets. Domain adaptation thus represents a viable direction for improving deep re-identiﬁcation descriptors.

- 5.3.1 Data Sets and Protocols

Following Ma et al. (2015), we use PRID (Hirzer et al., 2011), VIPeR (Gray et al., 2007), CUHK (Li and Wang, 2013) as target data sets for our experiments. The PRID data set exists in two versions, and as in Ma et al. (2015) we use a single-shot variant. It contains images of 385 persons viewed from camera A and images of 749 persons viewed from camera B, 200 persons appear in both cameras. The VIPeR data set also contains images taken with two cameras, and in total 632 persons are captured, for every person there is one image for each of the two camera views. The CUHK data set consists of images from ﬁve pairs of cameras, two images for each person from each of the two cameras. We refer to the subset of this data set that includes the ﬁrst pair of cameras only as CUHK/p1 (as most papers use this subset). See Figure 8 for samples of these data sets.

We perform extensive experiments for various pairs of data sets, where one data set serves as a source domain, i.e., it is used to train a descriptor mapping in a supervised way with known correspondences between probe and gallery images. The second data set is used as a target domain, so that images from that data set are used without probe-gallery correspondence.

In more detail, CUHK/p1 is used for experiments when CUHK serves as a target domain and two settings (“whole CUHK” and CUHK/p1) are used for experiments when CUHK serves as a source domain. Given PRID as a target data set, we randomly choose 100 persons appearing in both camera views as training set. The images of the other 100 persons from camera A are used as probe, all images from camera B excluding those used in training (649 in total) are used as gallery at test time. For VIPeR, we use random 316 persons for training and all others for testing. For CUHK, 971 persons are split into 485 for training and 486 for testing. Unlike Ma et al. (2015), we use all images in the ﬁrst pair of cameras of CUHK instead of choosing one image of a person from each camera view. We also performed two

experiments with all images of the whole CUHK data set as source domain and VIPeR and PRID data sets as target domains as in the original paper (Yi et al., 2014).

Following Yi et al. (2014), we augmented our data with mirror images, and during test time we calculate similarity score between two images as the mean of the four scores corresponding to diﬀerent ﬂips of the two compared images. In case of CUHK, where there are 4 images (including mirror images) for each of the two camera views for each person, all 16 combinations’ scores are averaged.

- 5.3.2 CNN architectures and Training Procedure

In our experiments, we use siamese architecture described in Yi et al. (2014) (Deep Metric Learning or DML) for learning deep image descriptors on the source data set. This architecture incorporates two convolution layers (with 7 × 7 and 5 × 5 ﬁlter banks), followed by ReLU and max pooling, and one fully-connected layer, which gives 500-dimensional descriptors as an output. There are three parallel ﬂows within the CNN for processing three part of an image: the upper, the middle, and the lower one. The ﬁrst convolution layer shares parameters between three parts, and the outputs of the second convolution layers are concatenated. During training, we follow Yi et al. (2014) and calculate pairwise cosine similarities between 500-dimensional features within each batch and backpropagate the loss for all pairs within batch.

To perform domain-adversarial training, we construct a DANN architecture. The feature extractor includes the two convolutional layers (followed by max-pooling and ReLU) discussed above. The label predictor in this case is replaced with descriptor predictor that includes one fully-connected layer. The domain classiﬁer includes two fully-connected layers with 500 units in the intermediate representation (x→500→1).

For the veriﬁcation loss function in the descriptor predictor we used Binomial Deviance loss, deﬁned in Yi et al. (2014) with similar parameters: α = 2, β = 0.5, c = 2 (the asymmetric cost parameter for negative pairs). The domain classiﬁer is trained with logistic loss as in subsection 5.2.2.

We used learning rate ﬁxed to 0.001 and momentum of 0.9. The schedule of adaptation similar to the one described in subsection 5.2.2 was used. We also inserted dropout layer with rate 0.5 after the concatenation of outputs of the second max-pooling layer. 128-sized batches were used for source data and 128-sized batches for target data.

- 5.3.3 Results on Re-identification data sets

- Figure 9 shows results in the form of CMC-curves for eight pairs of data sets. Depending on the hardness of the annotation problem we trained either for 50,000 iterations (CUHK/p1

→ VIPeR, VIPeR → CUHK/p1, PRID → VIPeR) or for 20,000 iterations (the other ﬁve pairs).

After the suﬃcient number of iterations, domain-adversarial training consistently improves the performance of re-identiﬁcation. For the pairs that involve PRID data set, which is more dissimilar to the other two data sets, the improvement is considerable. Overall, this demonstrates the applicability of the domain-adversarial learning beyond classiﬁcation problems.

Identiﬁcationrate(%)

- 0.8
- 1

|DM DM<br><br>|L L, adapta|tion|
|---|---|---|
| | | |
| | | |
| | | |
| | | |

0.6

0.4

0.2

0

20 40

Rank

(a) Whole CUHK → VIPeR

Identiﬁcationrate(%)

- 0.8
- 1

|DM DM<br><br>|L L, adapta|tion|
|---|---|---|
| | | |
| | | |
| | | |
| | | |

0.6

0.4

0.2

0

20 40

Rank

(b) CUHK/p1 → VIPeR

Identiﬁcationrate(%)

- 0.8
- 1

|DM DM<br><br>|L L, adapta|tion|
|---|---|---|
| | | |
| | | |
| | | |
| | | |

0.6

0.4

0.2

0

20 40

Rank

###### (c) PRID → VIPeR

Identiﬁcationrate(%)

- 0.8
- 1

|DML DML<br><br>|, adaptatio|n|
|---|---|---|
| | | |
| | | |
| | | |
| | | |

0.6

0.4

0.2

0

20 40

Rank

(d) Whole CUHK → PRID

Identiﬁcationrate(%)

- 0.8
- 1

|DML DML<br><br>|, adaptatio|n|
|---|---|---|
| | | |
| | | |
| | | |
| | | |

0.6

0.4

0.2

0

20 40

Identiﬁcationrate(%)

Rank

(e) CUHK/p1 → PRID

- 0.8
- 1

DML

DML, adaptation

0.6

0.4

0.2

0

20 40

Rank

###### (f) VIPeR → PRID

Identiﬁcationrate(%)

- 0.8
- 1

|DML DML<br><br>|, adaptatio|n|
|---|---|---|
| | | |
| | | |
| | | |
| | | |

0.6

0.4

0.2

0

20 40

Identiﬁcationrate(%)

Rank

(g) VIPeR → CUHK/p1

- 0.8
- 1

|DML DML<br><br>|, adaptatio|n|
|---|---|---|
| | | |
| | | |
| | | |
| | | |

0.6

0.4

0.2

0

20 40

Rank

(h) PRID → CUHK/p1

###### Figure 9: Results on VIPeR, PRID and CUHK/p1 with and without domain-adversarial learning. Across the eight domain pairs domain-adversarial learning improves reidentiﬁcation accuracy. For some domain pairs the improvement is considerable.

[Figure 45]

[Figure 46]

(a) DML (b) DML, adaptation

- Figure 10: The eﬀect of adaptation shown by t-SNE visualizations of source and target domains descriptors in a VIPeR → CUHK/p1 experiment pair. VIPeR is depicted with green and CUHK/p1 - with red. As in the image classiﬁcation case, domain-adversarial learning ensures a closer match between the source and the target distributions.

Figure 10 further demonstrates the eﬀect of adaptation on the distributions of the learned descriptors in the source and in target sets in VIPeR → CUHK/p1 experiments, where domain adversarial learning once again achieves better intermixing of the two domains.

#### 6. Conclusion

The paper proposes a new approach to domain adaptation of feed-forward neural networks, which allows large-scale training based on large amount of annotated data in the source domain and large amount of unannotated data in the target domain. Similarly to many previous shallow and deep DA techniques, the adaptation is achieved through aligning the distributions of features across the two domains. However, unlike previous approaches, the alignment is accomplished through standard backpropagation training.

The approach is motivated and supported by the domain adaptation theory of Ben-David et al. (2006, 2010). The main idea behind DANN is to enjoin the network hidden layer to learn a representation which is predictive of the source example labels, but uninformative about the domain of the input (source or target). We implement this new approach within both shallow and deep feed-forward architectures. The latter allows simple implementation within virtually any deep learning package through the introduction of a simple gradient reversal layer. We have shown that our approach is ﬂexible and achieves state-of-the-art

results on a variety of benchmark in domain adaptation, namely for sentiment analysis and image classiﬁcation tasks.

A convenient aspect of our approach is that the domain adaptation component can be added to almost any neural network architecture that is trainable with backpropagation. Towards this end, We have demonstrated experimentally that the approach is not conﬁned to classiﬁcation tasks but can be used in other feed-forward architectures, e.g., for descriptor learning for person re-identiﬁcation.

#### Acknowledgments

This work has been supported by National Science and Engineering Research Council (NSERC) Discovery grants 262067 and 0122405 as well as the Russian Ministry of Science and Education grant RFMEFI57914X0071. Computations were performed on the Colosse supercomputer grid at Universite´ Laval, under the auspices of Calcul Qu´ebec and Compute Canada. The operations of Colosse are funded by the NSERC, the Canada Foundation for Innovation (CFI), NanoQue´bec, and the Fonds de recherche du Qu´ebec – Nature et technologies (FRQNT). We also thank the Graphics & Media Lab, Faculty of Computational Mathematics and Cybernetics, Lomonosov Moscow State University for providing the synthetic road signs data set.

#### References

Hana Ajakan, Pascal Germain, Hugo Larochelle, Franc¸ois Laviolette, and Mario Marchand. Domain-adversarial neural networks. NIPS 2014 Workshop on Transfer and Multi-task learning: Theory Meets Practice, 2014. URL http://arxiv.org/abs/1412.4446.

Pablo Arbelaez, Michael Maire, Charless Fowlkes, and Jitendra Malik. Contour detection and hierarchical image segmentation. IEEE Transaction Pattern Analysis and Machine Intelligence, 33, 2011.

Artem Babenko, Anton Slesarev, Alexander Chigorin, and Victor S. Lempitsky. Neural codes for image retrieval. In ECCV, pages 584–599, 2014.

Mahsa Baktashmotlagh, Mehrtash Tafazzoli Harandi, Brian C. Lovell, and Mathieu Salzmann. Unsupervised domain adaptation by domain invariant projection. In ICCV, pages 769–776, 2013.

Shai Ben-David, John Blitzer, Koby Crammer, and Fernando Pereira. Analysis of representations for domain adaptation. In NIPS, pages 137–144, 2006.

Shai Ben-David, John Blitzer, Koby Crammer, Alex Kulesza, Fernando Pereira, and Jennifer Wortman Vaughan. A theory of learning from diﬀerent domains. Machine Learning, 79(1-2):151–175, 2010.

John Blitzer, Ryan T. McDonald, and Fernando Pereira. Domain adaptation with structural correspondence learning. In Conference on Empirical Methods in Natural Language Processing, pages 120–128, 2006.

Karsten M. Borgwardt, Arthur Gretton, Malte J. Rasch, Hans-Peter Kriegel, Bernhard Sch¨lkopf, and Alexander J. Smola. Integrating structured biological data by kernel maximum mean discrepancy. In ISMB, pages 49–57, 2006.

Lorenzo Bruzzone and Mattia Marconcini. Domain adaptation problems: A DASVM classiﬁcation technique and a circular validation strategy. IEEE Transaction Pattern Analysis and Machine Intelligence, 32(5):770–787, 2010.

Minmin Chen, Zhixiang Eddie Xu, Kilian Q. Weinberger, and Fei Sha. Marginalized denoising autoencoders for domain adaptation. In ICML, pages 767–774, 2012.

Qiang Chen, Junshi Huang, Rogerio Feris, Lisa M. Brown, Jian Dong, and Shuicheng Yan. Deep domain adaptation for describing people based on ﬁne-grained clothing attributes. In CVPR, June 2015.

S. Chopra, S. Balakrishnan, and R. Gopalan. Dlid: Deep learning for domain adaptation by interpolating between domains. In ICML Workshop on Challenges in Representation Learning, 2013.

Dan Cire¸san, Ueli Meier, Jonathan Masci, and Ju¨rgen Schmidhuber. Multi-column deep neural network for traﬃc sign classiﬁcation. Neural Networks, 32:333–338, 2012.

Corinna Cortes and Mehryar Mohri. Domain adaptation and sample bias correction theory and algorithm for regression. Theor. Comput. Sci., 519:103–126, 2014.

Jeﬀ Donahue, Yangqing Jia, Oriol Vinyals, Judy Hoﬀman, Ning Zhang, Eric Tzeng, and Trevor Darrell. Decaf: A deep convolutional activation feature for generic visual recognition. In ICML, 2014.

John Duchi, Elad Hazan, and Yoram Singer. Adaptive subgradient methods for online learning and stochastic optimization. Technical report, EECS Department, University of California, Berkeley, Mar 2010.

Rong-En Fan, Kai-Wei Chang, Cho-Jui Hsieh, Xiang-Rui Wang, and Chih-Jen Lin. LIBLINEAR: A library for large linear classiﬁcation. Journal of Machine Learning Research, 9:1871–1874, 2008.

Basura Fernando, Amaury Habrard, Marc Sebban, and Tinne Tuytelaars. Unsupervised visual domain adaptation using subspace alignment. In ICCV, 2013.

Yaroslav Ganin and Victor Lempitsky. Unsupervised domain adaptation by backpropagation. In ICML, pages 325–333, 2015. URL http://jmlr.org/proceedings/papers/ v37/ganin15.html.

Pascal Germain, Amaury Habrard, Fran¸cois Laviolette, and Emilie Morvant. A PACBayesian approach for domain adaptation with specialization to linear classiﬁers. In ICML, pages 738–746, 2013.

Xavier Glorot, Antoine Bordes, and Yoshua Bengio. Domain adaptation for large-scale sentiment classiﬁcation: A deep learning approach. In ICML, pages 513–520, 2011.

Boqing Gong, Yuan Shi, Fei Sha, and Kristen Grauman. Geodesic ﬂow kernel for unsupervised domain adaptation. In CVPR, pages 2066–2073, 2012.

Boqing Gong, Kristen Grauman, and Fei Sha. Connecting the dots with landmarks: Discriminatively learning domain-invariant features for unsupervised domain adaptation. In ICML, pages 222–230, 2013.

Shaogang Gong, Marco Cristani, Shuicheng Yan, and Chen Change Loy. Person reidentiﬁcation. Springer, 2014.

Ian Goodfellow, Jean Pouget-Abadie, Mehdi Mirza, Bing Xu, David Warde-Farley, Sherjil Ozair, Aaron Courville, and Yoshua Bengio. Generative adversarial nets. In NIPS, 2014.

Raghuraman Gopalan, Ruonan Li, and Rama Chellappa. Domain adaptation for object recognition: An unsupervised approach. In ICCV, pages 999–1006, 2011.

Doug Gray, Shane Brennan, and Hai Tao. Evaluating appearance models for recognition, reacquisition, and tracking. In IEEE International Workshop on Performance Evaluation for Tracking and Surveillance, Rio de Janeiro, 2007.

Martin Hirzer, Csaba Beleznai, Peter M. Roth, and Horst Bischof. Person re-identiﬁcation by descriptive and discriminative classiﬁcation. In SCIA, 2011.

Judy Hoﬀman, Eric Tzeng, Jeﬀ Donahue, Yangqing Jia, Kate Saenko, and Trevor Darrell. One-shot adaptation of supervised deep convolutional models. CoRR, abs/1312.6204,

2013. URL http://arxiv.org/abs/1312.6204.

Fei Huang and Alexander Yates. Biased representation learning for domain adaptation. In Joint Conference on Empirical Methods in Natural Language Processing and Computational Natural Language Learning, pages 1313–1323, 2012.

Jiayuan Huang, Alexander J. Smola, Arthur Gretton, Karsten M. Borgwardt, and Bernhard Sch¨lkopf. Correcting sample selection bias by unlabeled data. In NIPS, pages 601–608, 2006.

Yangqing Jia, Evan Shelhamer, Jeﬀ Donahue, Sergey Karayev, Jonathan Long, Ross Girshick, Sergio Guadarrama, and Trevor Darrell. Caﬀe: Convolutional architecture for fast feature embedding. CoRR, abs/1408.5093, 2014.

Daniel Kifer, Shai Ben-David, and Johannes Gehrke. Detecting change in data streams. In Very Large Data Bases, pages 180–191, 2004.

Alex Krizhevsky, Ilya Sutskever, and Geoﬀrey Hinton. Imagenet classiﬁcation with deep convolutional neural networks. In NIPS, pages 1097–1105, 2012.

Alexandre Lacoste, Franc¸ois Laviolette, and Mario Marchand. Bayesian comparison of machine learning algorithms on single and multiple datasets. In AISTATS, pages 665– 675, 2012.

Y. LeCun, L. Bottou, Y. Bengio, and P. Haﬀner. Gradient-based learning applied to document recognition. Proceedings of the IEEE, 86(11):2278–2324, November 1998.

Wei Li and Xiaogang Wang. Locally aligned feature transforms across views. In CVPR, pages 3594–3601, 2013.

Yujia Li, Kevin Swersky, and Richard Zemel. Unsupervised domain adaptation by domain invariant projection. In NIPS 2014 Workshop on Transfer and Multitask Learning, 2014.

Joerg Liebelt and Cordelia Schmid. Multi-view object class detection with a 3d geometric model. In CVPR, 2010.

Chunxiao Liu, Chen Change Loy, Shaogang Gong, and Guijin Wang. POP: person reidentiﬁcation post-rank optimisation. In ICCV, pages 441–448, 2013.

Mingsheng Long and Jianmin Wang. Learning transferable features with deep adaptation networks. CoRR, abs/1502.02791, 2015.

Andy Jinhua Ma, Jiawei Li, Pong C. Yuen, and Ping Li. Cross-domain person reidentiﬁcation using domain adaptation ranking svms. IEEE Transactions on Image Processing, 24(5):1599–1613, 2015.

Yishay Mansour, Mehryar Mohri, and Afshin Rostamizadeh. Domain adaptation: Learning bounds and algorithms. In COLT, 2009a.

Yishay Mansour, Mehryar Mohri, and Afshin Rostamizadeh. Multiple source adaptation and the r´enyi divergence. In UAI, pages 367–374, 2009b.

Yuval Netzer, Tao Wang, Adam Coates, Alessandro Bissacco, Bo Wu, and Andrew Y. Ng. Reading digits in natural images with unsupervised feature learning. In NIPS Workshop on Deep Learning and Unsupervised Feature Learning, 2011.

M. Oquab, L. Bottou, I. Laptev, and J. Sivic. Learning and transferring mid-level image representations using convolutional neural networks. In CVPR, 2014.

Sakrapee Paisitkriangkrai, Chunhua Shen, and Anton van den Hengel. Learning to rank in person re-identiﬁcation with metric ensembles. CoRR, abs/1503.01543, 2015. URL http://arxiv.org/abs/1503.01543.

Sinno Jialin Pan, Ivor W. Tsang, James T. Kwok, and Qiang Yang. Domain adaptation via transfer component analysis. IEEE Transactions on Neural Networks, 22(2):199–210, 2011.

Kate Saenko, Brian Kulis, Mario Fritz, and Trevor Darrell. Adapting visual category models to new domains. In ECCV, pages 213–226, 2010.

Nitish Srivastava, Geoﬀrey Hinton, Alex Krizhevsky, Ilya Sutskever, and Ruslan Salakhutdinov. Dropout: A simple way to prevent neural networks from overﬁtting. The Journal of Machine Learning Research, 15(1):1929–1958, 2014.

Michael Stark, Michael Goesele, and Bernt Schiele. Back to the future: Learning shape models from 3d CAD data. In BMVC, pages 1–11, 2010.

Baochen Sun and Kate Saenko. From virtual to reality: Fast adaptation of virtual object detectors to real domains. In BMVC, 2014.

Eric Tzeng, Judy Hoﬀman, Ning Zhang, Kate Saenko, and Trevor Darrell. Deep domain confusion: Maximizing for domain invariance. CoRR, abs/1412.3474, 2014. URL http: //arxiv.org/abs/1412.3474.

Laurens van der Maaten. Barnes-Hut-SNE. CoRR, abs/1301.3342, 2013. URL http: //arxiv.org/abs/1301.3342.

David V´zquez, Antonio Manuel L´pez, Javier Marı´n, Daniel Ponsa, and David Ger´nimo Gomez. Virtual and real world adaptationfor pedestrian detection. IEEE Transaction Pattern Analysis and Machine Intelligence, 36(4):797–809, 2014.

Pascal Vincent, Hugo Larochelle, Yoshua Bengio, and Pierre-Antoine Manzagol. Extracting and composing robust features with denoising autoencoders. In ICML, pages 1096–1103, 2008.

Dong Yi, Zhen Lei, and Stan Z. Li. Deep metric learning for practical person reidentiﬁcation. CoRR, abs/1407.4979, 2014. URL http://arxiv.org/abs/1407.4979.

Matthew D. Zeiler. ADADELTA: an adaptive learning rate method. CoRR, abs/1212.5701,

2012. URL http://arxiv.org/abs/1212.5701. Matthew D. Zeiler and Rob Fergus. Visualizing and understanding convolutional networks. CoRR, abs/1311.2901, 2013. URL http://arxiv.org/abs/1311.2901. Ziming Zhang and Venkatesh Saligrama. Person re-identiﬁcation via structured prediction. CoRR, abs/1406.4444, 2014. URL http://arxiv.org/abs/1406.4444. Rui Zhao, Wanli Ouyang, and Xiaogang Wang. Person re-identiﬁcation by saliency learning. CoRR, abs/1412.1908, 2014. URL http://arxiv.org/abs/1412.1908.

Erheng Zhong, Wei Fan, Qiang Yang, Olivier Verscheure, and Jiangtao Ren. Cross validation framework to choose amongst models and datasets for transfer learning. In Machine Learning and Knowledge Discovery in Databases, pages 547–562. Springer, 2010.

