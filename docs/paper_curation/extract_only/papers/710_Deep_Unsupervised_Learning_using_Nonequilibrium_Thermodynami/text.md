## arXiv:1503.03585v8[cs.LG]18Nov2015

### Deep Unsupervised Learning using Nonequilibrium Thermodynamics

Jascha Sohl-Dickstein JASCHA@STANFORD.EDU Stanford University

Eric A. Weiss EAWEISS@BERKELEY.EDU University of California, Berkeley

Niru Maheswaranathan NIRUM@STANFORD.EDU Stanford University

Surya Ganguli SGANGULI@STANFORD.EDU Stanford University

#### Abstract

A central problem in machine learning involves modeling complex data-sets using highly ﬂexible families of probability distributions in which learning, sampling, inference, and evaluation are still analytically or computationally tractable. Here, we develop an approach that simultaneously achieves both ﬂexibility and tractability. The essential idea, inspired by non-equilibrium statistical physics, is to systematically and slowly destroy structure in a data distribution through an iterative forward diffusion process. We then learn a reverse diffusion process that restores structure in data, yielding a highly ﬂexible and tractable generative model of the data. This approach allows us to rapidly learn, sample from, and evaluate probabilities in deep generative models with thousands of layers or time steps, as well as to compute conditional and posterior probabilities under the learned model. We additionally release an open source reference implementation of the algorithm.

#### 1. Introduction

Historically, probabilistic models suffer from a tradeoff between two conﬂicting objectives: tractability and ﬂexibility. Models that are tractable can be analytically evaluated and easily ﬁt to data (e.g. a Gaussian or Laplace). However,

Proceedings of the 32nd International Conference on Machine Learning, Lille, France, 2015. JMLR: W&CP volume 37. Copyright 2015 by the author(s).

these models are unable to aptly describe structure in rich datasets. On the other hand, models that are ﬂexible can be molded to ﬁt structure in arbitrary data. For example, we can deﬁne models in terms of any (non-negative) function

φ(x) yielding the ﬂexible distribution p(x) = φ(Zx), where Z is a normalization constant. However, computing this

normalization constant is generally intractable. Evaluating, training, or drawing samples from such ﬂexible models typically requires a very expensive Monte Carlo process.

A variety of analytic approximations exist which ameliorate, but do not remove, this tradeoff–for instance mean ﬁeld theory and its expansions (T, 1982; Tanaka, 1998), variational Bayes (Jordan et al., 1999), contrastive divergence (Welling & Hinton, 2002; Hinton, 2002), minimum probability ﬂow (Sohl-Dickstein et al., 2011b;a), minimum KL contraction (Lyu, 2011), proper scoring rules (Gneiting & Raftery, 2007; Parry et al., 2012), score matching (Hyv¨arinen, 2005), pseudolikelihood (Besag, 1975), loopy belief propagation (Murphy et al., 1999), and many, many more. Non-parametric methods (Gershman & Blei, 2012) can also be very effective1.

##### 1.1. Diffusion probabilistic models

We present a novel way to deﬁne probabilistic models that allows:

- 1. extreme ﬂexibility in model structure,
- 2. exact sampling,

1Non-parametric methods can be seen as transitioning smoothly between tractable and ﬂexible models. For instance, a non-parametric Gaussian mixture model will represent a small amount of data using a single Gaussian, but may represent inﬁnite data as a mixture of an inﬁnite number of Gaussians.

- 3. easy multiplication with other distributions, e.g. in order to compute a posterior, and
- 4. the model log likelihood, and the probability of individual states, to be cheaply evaluated.

Our method uses a Markov chain to gradually convert one distribution into another, an idea used in non-equilibrium statistical physics (Jarzynski, 1997) and sequential Monte Carlo (Neal, 2001). We build a generative Markov chain which converts a simple known distribution (e.g. a Gaussian) into a target (data) distribution using a diffusion process. Rather than use this Markov chain to approximately evaluate a model which has been otherwise deﬁned, we explicitly deﬁne the probabilistic model as the endpoint of the Markov chain. Since each step in the diffusion chain has an analytically evaluable probability, the full chain can also be analytically evaluated.

Learning in this framework involves estimating small perturbations to a diffusion process. Estimating small perturbations is more tractable than explicitly describing the full distribution with a single, non-analytically-normalizable, potential function. Furthermore, since a diffusion process exists for any smooth target distribution, this method can capture data distributions of arbitrary form.

We demonstrate the utility of these diffusion probabilistic models by training high log likelihood models for a twodimensional swiss roll, binary sequence, handwritten digit (MNIST), and several natural image (CIFAR-10, bark, and dead leaves) datasets.

##### 1.2. Relationship to other work

The wake-sleep algorithm (Hinton, 1995; Dayan et al., 1995) introduced the idea of training inference and generative probabilistic models against each other. This approach remained largely unexplored for nearly two decades, though with some exceptions (Sminchisescu et al., 2006; Kavukcuoglu et al., 2010). There has been a recent explosion of work developing this idea. In (Kingma & Welling, 2013; Gregor et al., 2013; Rezende et al., 2014; Ozair & Bengio, 2014) variational learning and inference algorithms were developed which allow a ﬂexible generative model and posterior distribution over latent variables to be directly trained against each other.

The variational bound in these papers is similar to the one used in our training objective and in the earlier work of (Sminchisescu et al., 2006). However, our motivation and model form are both quite different, and the present work retains the following differences and advantages relative to these techniques:

- 1. We develop our framework using ideas from physics, quasi-static processes, and annealed importance sampling rather than from variational Bayesian methods.

- 2. We show how to easily multiply the learned distribution with another probability distribution (eg with a conditional distribution in order to compute a posterior)
- 3. We address the difﬁculty that training the inference model can prove particularly challenging in variational inference methods, due to the asymmetry in the objective between the inference and generative models. We restrict the forward (inference) process to a simple functional form, in such a way that the reverse (generative) process will have the same functional form.
- 4. We train models with thousands of layers (or time steps), rather than only a handful of layers.
- 5. We provide upper and lower bounds on the entropy production in each layer (or time step)

There are a number of related techniques for training probabilistic models (summarized below) that develop highly ﬂexible forms for generative models, train stochastic trajectories, or learn the reversal of a Bayesian network. Reweighted wake-sleep (Bornschein & Bengio, 2015) develops extensions and improved learning rules for the original wake-sleep algorithm. Generative stochastic networks (Bengio & Thibodeau-Laufer, 2013; Yao et al., 2014) train a Markov kernel to match its equilibrium distribution to the data distribution. Neural autoregressive distribution estimators (Larochelle & Murray, 2011) (and their recurrent (Uria et al., 2013a) and deep (Uria et al., 2013b) extensions) decompose a joint distribution into a sequence of tractable conditional distributions over each dimension. Adversarial networks (Goodfellow et al., 2014) train a generative model against a classiﬁer which attempts to distinguish generated samples from true data. A similar objective in (Schmidhuber, 1992) learns a two-way mapping to a representation with marginally independent units. In (Rippel & Adams, 2013; Dinh et al., 2014) bijective deterministic maps are learned to a latent representation with a simple factorial density function. In (Stuhlm¨uller et al., 2013) stochastic inverses are learned for Bayesian networks. Mixtures of conditional Gaussian scale mixtures (MCGSMs) (Theis et al., 2012) describe a dataset using Gaussian scale mixtures, with parameters which depend on a sequence of causal neighborhoods. There is additionally signiﬁcant work learning ﬂexible generative mappings from simple latent distributions to data distributions – early examples including (MacKay, 1995) where neural networks are introduced as generative models, and (Bishop et al., 1998) where a stochastic manifold mapping is learned from a latent space to the data space. We will compare experimentally against adversarial networks and MCGSMs.

Related ideas from physics include the Jarzynski equality (Jarzynski, 1997), known in machine learning as An-

2

2

2

0

0

0

###### q x(0···T)

2

2

2

2 0 2

2 0 2

2 0 2

2

2

2

0

0

0

###### p x(0···T)

2

2

2

2 0 2

2 0 2

2 0 2

[Figure 1]

[Figure 2]

[Figure 3]

###### fµ x(t),t − x(t)

- Figure 1. The proposed modeling framework trained on 2-d swiss roll data. The top row shows time slices from the forward trajectory q x(0···T) . The data distribution (left) undergoes Gaussian diffusion, which gradually transforms it into an identity-covariance Gaus-

sian (right). The middle row shows the corresponding time slices from the trained reverse trajectory p x(0···T) . An identity-covariance Gaussian (right) undergoes a Gaussian diffusion process with learned mean and covariance functions, and is gradually transformed back into the data distribution (left). The bottom row shows the drift term, fµ x(t), t − x(t), for the same reverse diffusion process.

nealed Importance Sampling (AIS) (Neal, 2001), which uses a Markov chain which slowly converts one distribution into another to compute a ratio of normalizing constants. In (Burda et al., 2014) it is shown that AIS can also be performed using the reverse rather than forward trajectory. Langevin dynamics (Langevin, 1908), which are the stochastic realization of the Fokker-Planck equation, show how to deﬁne a Gaussian diffusion process which has any target distribution as its equilibrium. In (Suykens & Vandewalle, 1995) the Fokker-Planck equation is used to perform stochastic optimization. Finally, the Kolmogorov forward and backward equations (Feller, 1949) show that for many forward diffusion processes, the reverse diffusion processes can be described using the same functional form.

#### 2. Algorithm

Our goal is to deﬁne a forward (or inference) diffusion process which converts any complex data distribution into a simple, tractable, distribution, and then learn a ﬁnite-time reversal of this diffusion process which deﬁnes our generative model distribution (See Figure 1). We ﬁrst describe the forward, inference diffusion process. We then show

how the reverse, generative diffusion process can be trained and used to evaluate probabilities. We also derive entropy bounds for the reverse process, and show how the learned distributions can be multiplied by any second distribution (e.g. as would be done to compute a posterior when inpainting or denoising an image).

##### 2.1. Forward Trajectory

We label the data distribution q x(0) . The data distribution is gradually converted into a well behaved (analytically tractable) distribution π (y) by repeated application of a Markov diffusion kernel Tπ (y|y ;β) for π (y), where β is the diffusion rate,

###### π (y) = dy Tπ (y|y ;β)π (y ) (1) q x(t)|x(t−1) = Tπ x(t)|x(t−1);βt . (2)

0

0

0

[Figure 4]

[Figure 5]

[Figure 6]

5

5

5

Sample

Sample

Sample

10

10

10

###### p x(0···T)

15

15

15

20

20

20

0 5 10 15 Bin

0 5 10 15 Bin

0 5 10 15 Bin

- Figure 2. Binary sequence learning via binomial diffusion. A binomial diffusion model was trained on binary ‘heartbeat’ data, where a pulse occurs every 5th bin. Generated samples (left) are identical to the training data. The sampling procedure consists of initialization at independent binomial noise (right), which is then transformed into the data distribution by a binomial diffusion process, with trained bit ﬂip probabilities. Each row contains an independent sample. For ease of visualization, all samples have been shifted so that a pulse occurs in the ﬁrst column. In the raw sequence data, the ﬁrst pulse is uniformly distributed over the ﬁrst ﬁve bins.

(a) (b)

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

[Figure 65]

[Figure 66]

[Figure 67]

[Figure 68]

[Figure 69]

[Figure 70]

[Figure 71]

[Figure 72]

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

[Figure 90]

[Figure 91]

[Figure 92]

[Figure 93]

[Figure 94]

[Figure 95]

[Figure 96]

[Figure 97]

[Figure 98]

[Figure 99]

[Figure 100]

[Figure 101]

[Figure 102]

[Figure 103]

[Figure 104]

(c) (d)

[Figure 105]

[Figure 106]

[Figure 107]

[Figure 108]

[Figure 109]

[Figure 110]

[Figure 111]

[Figure 112]

[Figure 113]

[Figure 114]

[Figure 115]

[Figure 116]

[Figure 117]

[Figure 118]

[Figure 119]

[Figure 120]

[Figure 121]

[Figure 122]

[Figure 123]

[Figure 124]

[Figure 125]

[Figure 126]

[Figure 127]

[Figure 128]

[Figure 129]

[Figure 130]

[Figure 131]

[Figure 132]

[Figure 133]

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

[Figure 144]

[Figure 145]

[Figure 146]

[Figure 147]

[Figure 148]

[Figure 149]

[Figure 150]

[Figure 151]

[Figure 152]

[Figure 153]

[Figure 154]

[Figure 155]

[Figure 156]

[Figure 157]

[Figure 158]

[Figure 159]

[Figure 160]

[Figure 161]

[Figure 162]

[Figure 163]

[Figure 164]

[Figure 165]

[Figure 166]

[Figure 167]

[Figure 168]

[Figure 169]

[Figure 170]

[Figure 171]

[Figure 172]

[Figure 173]

[Figure 174]

[Figure 175]

[Figure 176]

[Figure 177]

[Figure 178]

[Figure 179]

[Figure 180]

[Figure 181]

[Figure 182]

[Figure 183]

[Figure 184]

[Figure 185]

[Figure 186]

[Figure 187]

[Figure 188]

[Figure 189]

[Figure 190]

[Figure 191]

[Figure 192]

[Figure 193]

[Figure 194]

[Figure 195]

[Figure 196]

[Figure 197]

[Figure 198]

[Figure 199]

[Figure 200]

[Figure 201]

[Figure 202]

- Figure 3. The proposed framework trained on the CIFAR-10 (Krizhevsky & Hinton, 2009) dataset. (a) Example holdout data (similar to training data). (b) Holdout data corrupted with Gaussian noise of variance 1 (SNR = 1). (c) Denoised images, generated by sampling from the posterior distribution over denoised images conditioned on the images in (b). (d) Samples generated by the diffusion model.

The forward trajectory, corresponding to starting at the data distribution and performing T steps of diffusion, is thus

q x(0···T) = q x(0)

T

q x(t)|x(t−1) (3)

t=1

For the experiments shown below, q x(t)|x(t−1) corresponds to either Gaussian diffusion into a Gaussian distribution with identity-covariance, or binomial diffusion into an independent binomial distribution. Table App.1 gives the diffusion kernels for both Gaussian and binomial distributions.

##### 2.2. Reverse Trajectory

The generative distribution will be trained to describe the same trajectory, but in reverse,

p x(T) = π x(T) (4)

p x(0···T) = p x(T)

T

p x(t−1)|x(t) . (5)

t=1

For both Gaussian and binomial diffusion, for continuous diffusion (limit of small step size β) the reversal of the diffusion process has the identical functional form as the forward process (Feller, 1949). Since q x(t)|x(t−1) is a Gaussian (binomial) distribution, and if βt is small, then q x(t−1)|x(t) will also be a Gaussian (binomial) distribution. The longer the trajectory the smaller the diffusion rate β can be made.

During learning only the mean and covariance for a Gaussian diffusion kernel, or the bit ﬂip probability for a binomial kernel, need be estimated. As shown in Table App.1, fµ x(t),t and fΣ x(t),t are functions deﬁning the mean and covariance of the reverse Markov transitions for a Gaussian, and fb x(t),t is a function providing the bit ﬂip probability for a binomial distribution. The computational cost of running this algorithm is the cost of these functions, times the number of time-steps. For all results in this paper, multi-layer perceptrons are used to deﬁne these functions. A wide range of regression or function ﬁtting techniques would be applicable however, including nonparameteric methods.

###### 2.3. Model Probability The probability the generative model assigns to the data is

###### p x(0) = dx(1···T)p x(0···T) . (6)

Naively this integral is intractable – but taking a cue from annealed importance sampling and the Jarzynski equality, we instead evaluate the relative probability of the forward and reverse trajectories, averaged over forward trajectories,

q x(1···T)|x(0) q x(1···T)|x(0)

- p x(0) = dx(1···T)p x(0···T)

(7)

- p x(0···T)

- q x(1···T)|x(0)

= dx(1···T)q x(1···T)|x(0)

(8)

= dx(1···T)q x(1···T)|x(0) ·

T

- p x(t−1)|x(t)

- q x(t)|x(t−1) . (9)

p x(T)

t=1

This can be evaluated rapidly by averaging over samples from the forward trajectory q x(1···T)|x(0) . For inﬁnitesimal β the forward and reverse distribution over trajectories can be made identical (see Section 2.2). If they are identical then only a single sample from q x(1···T)|x(0) is required to exactly evaluate the above integral, as can be seen by substitution. This corresponds to the case of a quasi-static process in statistical physics (Spinney & Ford, 2013; Jarzynski, 2011).

2.4. Training Training amounts to maximizing the model log likelihood,

L = dx(0)q x(0) log p x(0) (10)

= dx(0)q x(0) ·

 

 , (11)

dx(1···T)q x(1···T)|x(0) · p x(T) Tt=1 p

log

(x(t−1)|x(t)) q(x(t)|x(t−1)

)

which has a lower bound provided by Jensen’s inequality,

L ≥ dx(0···T)q x(0···T) ·

T

- p x(t−1)|x(t)

- q x(t)|x(t−1) . (12)

log p x(T)

t=1

As described in Appendix B, for our diffusion trajectories this reduces to,

L ≥ K (13)

T

dx(0)dx(t)q x(0),x(t) ·

K = −

t=2

DKL q x(t−1)|x(t),x(0) p x(t−1)|x(t)

+ Hq X(T)|X(0) − Hq X(1)|X(0) − Hp X(T) .

(14)

where the entropies and KL divergences can be analytically computed. The derivation of this bound parallels the derivation of the log likelihood bound in variational Bayesian methods.

As in Section 2.3 if the forward and reverse trajectories are identical, corresponding to a quasi-static process, then the inequality in Equation 13 becomes an equality.

Training consists of ﬁnding the reverse Markov transitions which maximize this lower bound on the log likelihood,

pˆ x(t−1)|x(t) = argmax p(x(t−1)|x(t))

K. (15)

The speciﬁc targets of estimation for Gaussian and binomial diffusion are given in Table App.1.

Thus, the task of estimating a probability distribution has been reduced to the task of performing regression on the functions which set the mean and covariance of a sequence of Gaussians (or set the state ﬂip probability for a sequence of Bernoulli trials).

- 2.4.1. SETTING THE DIFFUSION RATE βt

The choice of βt in the forward trajectory is important for the performance of the trained model. In AIS, the right schedule of intermediate distributions can greatly improve the accuracy of the log partition function estimate (Grosse et al., 2013). In thermodynamics the schedule taken when moving between equilibrium distributions determines how much free energy is lost (Spinney & Ford, 2013; Jarzynski, 2011).

In the case of Gaussian diffusion, we learn2 the forward diffusion schedule β2···T by gradient ascent on K. The variance β1 of the ﬁrst step is ﬁxed to a small constant to prevent overﬁtting. The dependence of samples from

- q x(1···T)|x(0) on β1···T is made explicit by using ‘frozen noise’ – as in (Kingma & Welling, 2013) the noise is treated as an additional auxiliary variable, and held constant while computing partial derivatives of K with respect to the parameters.

For binomial diffusion, the discrete state space makes gradient ascent with frozen noise impossible. We instead choose the forward diffusion schedule β1···T to erase a constant fraction T1 of the original signal per diffusion step, yielding a diffusion rate of βt = (T − t + 1)−1.

- 2.5. Multiplying Distributions, and Computing Posteriors

Tasks such as computing a posterior in order to do signal denoising or inference of missing values requires multiplication of the model distribution p x(0) with a second distribution, or bounded positive function, r x(0) , producing a new distribution p˜ x(0) ∝ p x(0) r x(0) .

Multiplying distributions is costly and difﬁcult for many techniques, including variational autoencoders, GSNs, NADEs, and most graphical models. However, under a diffusion model it is straightforward, since the second distribution can be treated either as a small perturbation to each step in the diffusion process, or often exactly multiplied into each diffusion step. Figures 3 and 5 demonstrate the use of a diffusion model to perform denoising and inpainting of natural images. The following sections describe how

2Recent experiments suggest that it is just as effective to instead use the same ﬁxed βt schedule as for binomial diffusion.

to multiply distributions in the context of diffusion probabilistic models.

2.5.1. MODIFIED MARGINAL DISTRIBUTIONS

First, in order to compute p˜ x(0) , we multiply each of the intermediate distributions by a corresponding function r x(t) . We use a tilde above a distribution or Markov transition to denote that it belongs to a trajectory that has been modiﬁed in this way. p˜ x(0···T) is the modiﬁed reverse trajectory, which starts at the distribution p˜ x(T) =

- 1

Z˜T p x(T) r x(T) and proceeds through the sequence of intermediate distributions

p˜ x(t) =

1 Z˜t

p x(t) r x(t) , (16)

where Z˜t is the normalizing constant for the tth intermediate distribution.

- 2.5.2. MODIFIED DIFFUSION STEPS

The Markov kernel p x(t) | x(t+1) for the reverse diffusion process obeys the equilibrium condition

###### p x(t = dx(t+1)p xt) | x(t+1) p xt+1) . (17)

We wish the perturbed Markov kernel p˜ x(t) | x(t+1) to instead obey the equilibrium condition for the perturbed distribution,

p˜ x(t) = dx(t+1)p˜ x(t) | x(t+1) p ˜ xt+1) ,

(18) p x(t) r x(t)

= dx(t+1)p˜ x(t) | x(t+1) · p x(t+1) r x(t+1) Z˜t+1

Z˜t

, (19)

###### p x(t) = dx(t+1)p˜ x(t) | x(t+1) ·

Z˜tr x(t+1) Z˜t+1r x(t)

p x(t+1) .

(20)

- Equation 20 will be satisﬁed if

p˜ x(t)|x(t+1) = p x(t)|x(t+1)

Z ˜t+1r x(t) Z˜tr x(t+1)

. (21)

- Equation 21 may not correspond to a normalized probability distribution, so we choose p˜ x(t)|x(t+1) to be the corresponding normalized distribution

1 Z˜t x(t+1)

p˜ x(t)|x(t+1) =

p x(t)|x(t+1) r x(t) ,

(22)

0

0

0

[Figure 203]

[Figure 204]

[Figure 205]

50

50

50

100

100

100

150

150

150

200

200

200

250

250

250

(a) 0 50 100 150 200 250

(b) 0 50 100 150 200 250

(c) 0 50 100 150 200 250

- Figure 4. The proposed framework trained on dead leaf images (Jeulin, 1997; Lee et al., 2001). (a) Example training image. (b) A sample from the previous state of the art natural image model (Theis et al., 2012) trained on identical data, reproduced here with permission. (c) A sample generated by the diffusion model. Note that it demonstrates fairly consistent occlusion relationships, displays a multiscale distribution over object sizes, and produces circle-like objects, especially at smaller scales. As shown in Table 2, the diffusion model has the highest log likelihood on the test set.

where Z˜t x(t+1) is the normalization constant.

For a Gaussian, each diffusion step is typically very sharply peaked relative to r x(t) , due to its small variance. This

means that r(x(t))

can be treated as a small perturbation

r(x(t+1))

to p x(t)|x(t+1) . A small perturbation to a Gaussian effects the mean, but not the normalization constant, so in this case Equations 21 and 22 are equivalent (see Appendix C).

- 2.5.3. APPLYING r x(t)

If r x(t) is sufﬁciently smooth, then it can be treated as a small perturbation to the reverse diffusion kernel p x(t)|x(t+1) . In this case p˜ x(t)|x(t+1) will have an identical functional form to p x(t)|x(t+1) , but with perturbed mean for the Gaussian kernel, or with perturbed ﬂip rate for the binomial kernel. The perturbed diffusion kernels are given in Table App.1, and are derived for the Gaussian in Appendix C.

If r x(t) can be multiplied with a Gaussian (or binomial) distribution in closed form, then it can be directly multiplied with the reverse diffusion kernel p x(t)|x(t+1) in closed form. This applies in the case where r x(t) consists of a delta function for some subset of coordinates, as in the inpainting example in Figure 5.

- 2.5.4. CHOOSING r x(t)

Typically, r x(t) should be chosen to change slowly over the course of the trajectory. For the experiments in this paper we chose it to be constant,

r x(t) = r x(0) . (23)

T −t

Another convenient choice is r x(t) = r x(0)

T . Under this second choice r x(t) makes no contribution to the starting distribution for the reverse trajectory. This guarantees that drawing the initial sample from p˜ x(T) for the reverse trajectory remains straightforward.

##### 2.6. Entropy of Reverse Process

Since the forward process is known, we can derive upper and lower bounds on the conditional entropy of each step in the reverse trajectory, and thus on the log likelihood,

Hq X(t)|X(t−1) + Hq X(t−1)|X(0) − Hq X(t)|X(0) ≤ Hq X(t−1)|X(t) ≤ Hq X(t)|X(t−1) ,

(24)

where both the upper and lower bounds depend only on q x(1···T)|x(0) , and can be analytically computed. The derivation is provided in Appendix A.

#### 3. Experiments

We train diffusion probabilistic models on a variety of continuous datasets, and a binary dataset. We then demonstrate sampling from the trained model and inpainting of missing data, and compare model performance against other techniques. In all cases the objective function and gradient were computed using Theano (Bergstra & Breuleux, 2010). Model training was with SFO (Sohl-Dickstein et al., 2014), except for CIFAR-10. CIFAR-10 results used the

3 An earlier version of this paper reported higher log likelihood bounds on CIFAR-10. These were the result of the model learning the 8-bit quantization of pixel values in the CIFAR-10 dataset. The log likelihood bounds reported here are instead for data that has been pre-processed by adding uniform noise to remove pixel quantization, as recommended in (Theis et al., 2015).

0

0

0

[Figure 206]

[Figure 207]

[Figure 208]

50

50

50

100

100

100

150

150

150

200

200

200

250

250

250

(a) 0 50 100 150 200 250 300

(b) 0 50 100 150 200 250 300

(c) 0 50 100 150 200 250 300

300

300

300

- Figure 5. Inpainting. (a) A bark image from (Lazebnik et al., 2005). (b) The same image with the central 100×100 pixel region replaced with isotropic Gaussian noise. This is the initialization p˜ x(T) for the reverse trajectory. (c) The central 100×100 region has been inpainted using a diffusion probabilistic model trained on images of bark, by sampling from the posterior distribution over the missing region conditioned on the rest of the image. Note the long-range spatial structure, for instance in the crack entering on the left side of the inpainted region. The sample from the posterior was generated as described in Section 2.5, where r x(0) was set to a delta function for known data, and a constant for missing data.

|Model|Log Likelihood<br><br>|
|---|---|
|Dead Leaves MCGSM Diffusion|1.244 bits/pixel<br><br>1.489 bits/pixel<br><br>|
|MNIST Stacked CAE DBN Deep GSN Diffusion Adversarial net Perfect model|174 ± 2.3 bits 199 ± 2.9 bits 309 ± 1.6 bits 317 ± 2.7 bits<br><br>325 ± 2.9 bits 349 ± 3.3 bits<br><br>|

Dataset K K − Lnull Swiss Roll 2.35 bits 6.45 bits Binary Heartbeat -2.414 bits/seq. 12.024 bits/seq. Bark -0.55 bits/pixel 1.5 bits/pixel Dead Leaves 1.489 bits/pixel 3.536 bits/pixel CIFAR-103 5.4 ± 0.2 bits/pixel 11.5 ± 0.2 bits/pixel MNIST See table 2

Table 1. The lower bound K on the log likelihood, computed on a holdout set, for each of the trained models. See Equation 12. The right column is the improvement relative to an isotropic Gaussian or independent binomial distribution. Lnull is the log likelihood of π x(0) . All datasets except for Binary Heartbeat were scaled by a constant to give them variance 1 before computing log likelihood.

Table 2. Log likelihood comparisons to other algorithms. Dead leaves images were evaluated using identical training and test data as in (Theis et al., 2012). MNIST log likelihoods were estimated using the Parzen-window code from (Goodfellow et al., 2014), with values given in bits, and show that our performance is comparable to other recent techniques. The perfect model entry was computed by applying the Parzen code to samples from the training data.

open source implementation of the algorithm, and RMSprop for optimization. The lower bound on the log likelihood provided by our model is reported for all datasets in Table 1. A reference implementation of the algorithm utilizing Blocks (van Merri¨enboer et al., 2015) is available at https://github.com/Sohl-Dickstein/ Diffusion-Probabilistic-Models.

- 3.1. Toy Problems

- 3.1.1. SWISS ROLL

A diffusion probabilistic model was built of a two dimensional swiss roll distribution, using a radial basis function network to generate fµ x(t),t and fΣ x(t),t . As illustrated in Figure 1, the swiss roll distribution was successfully learned. See Appendix Section D.1.1 for more details.

- 3.1.2. BINARY HEARTBEAT DISTRIBUTION

A diffusion probabilistic model was trained on simple binary sequences of length 20, where a 1 occurs every 5th time bin, and the remainder of the bins are 0, using a multilayer perceptron to generate the Bernoulli rates fb x(t),t of the reverse trajectory. The log likelihood under the true distribution is log2 15 = −2.322 bits per sequence. As can be seen in Figure 2 and Table 1 learning was nearly perfect. See Appendix Section D.1.2 for more details.

- 3.2. Images

We trained Gaussian diffusion probabilistic models on several image datasets. The multi-scale convolutional archi-

tecture shared by these experiments is described in Appendix Section D.2.1, and illustrated in Figure D.1.

- 3.2.1. DATASETS

MNIST In order to allow a direct comparison against previous work on a simple dataset, we trained on MNIST digits (LeCun & Cortes, 1998). Log likelihoods relative to (Bengio et al., 2012; Bengio & Thibodeau-Laufer, 2013; Goodfellow et al., 2014) are given in Table 2. Samples from the MNIST model are given in Appendix Figure App.1. Our training algorithm provides an asymptotically consistent lower bound on the log likelihood. However most previous reported results on continuous MNIST log likelihood rely on Parzen-window based estimates computed from model samples. For this comparison we therefore estimate MNIST log likelihood using the Parzenwindow code released with (Goodfellow et al., 2014).

CIFAR-10 A probabilistic model was ﬁt to the training images for the CIFAR-10 challenge dataset (Krizhevsky & Hinton, 2009). Samples from the trained model are provided in Figure 3.

Dead Leaf Images Dead leaf images (Jeulin, 1997; Lee et al., 2001) consist of layered occluding circles, drawn from a power law distribution over scales. They have an analytically tractable structure, but capture many of the statistical complexities of natural images, and therefore provide a compelling test case for natural image models. As illustrated in Table 2 and Figure 4, we achieve state of the art performance on the dead leaves dataset.

Bark Texture Images A probabilistic model was trained on bark texture images (T01-T04) from (Lazebnik et al., 2005). For this dataset we demonstrate that it is straightforward to evaluate or generate from a posterior distribution, by inpainting a large region of missing data using a sample from the model posterior in Figure 5.

#### 4. Conclusion

We have introduced a novel algorithm for modeling probability distributions that enables exact sampling and evaluation of probabilities and demonstrated its effectiveness on a variety of toy and real datasets, including challenging natural image datasets. For each of these tests we used a similar basic algorithm, showing that our method can accurately model a wide variety of distributions. Most existing density estimation techniques must sacriﬁce modeling power in order to stay tractable and efﬁcient, and sampling or evaluation are often extremely expensive. The core of our algorithm consists of estimating the reversal of a Markov diffusion chain which maps data to a noise distribution; as

the number of steps is made large, the reversal distribution of each diffusion step becomes simple and easy to estimate. The result is an algorithm that can learn a ﬁt to any data distribution, but which remains tractable to train, exactly sample from, and evaluate, and under which it is straightforward to manipulate conditional and posterior distributions.

#### Acknowledgements

We thank Lucas Theis, Subhaneil Lahiri, Ben Poole, Diederik P. Kingma, Taco Cohen, Philip Bachman, and A¨aron van den Oord for extremely helpful discussion, and Ian Goodfellow for Parzen-window code. We thank Khan Academy and the Ofﬁce of Naval Research for funding Jascha Sohl-Dickstein, and we thank the Ofﬁce of Naval Research and the Burroughs-Wellcome, Sloan, and James S. McDonnell foundations for funding Surya Ganguli.

#### References

Barron, J. T., Biggin, M. D., Arbelaez, P., Knowles, D. W., Keranen, S. V., and Malik, J. Volumetric Semantic Segmentation Using Pyramid Context Features. In 2013 IEEE International Conference on Computer Vision, pp. 3448–3455. IEEE, December 2013. ISBN 978-1-47992840-8. doi: 10.1109/ICCV.2013.428.

Bengio, Y. and Thibodeau-Laufer, E. Deep generative stochastic networks trainable by backprop. arXiv preprint arXiv:1306.1091, 2013.

Bengio, Y., Mesnil, G., Dauphin, Y., and Rifai, S. Better Mixing via Deep Representations. arXiv preprint arXiv:1207.4404, July 2012.

Bergstra, J. and Breuleux, O. Theano: a CPU and GPU math expression compiler. Proceedings of the Python for Scientiﬁc Computing Conference (SciPy), 2010.

Besag, J. Statistical Analysis of Non-Lattice Data. The Statistician, 24(3), 179-195, 1975.

Bishop, C., Svens´en, M., and Williams, C. GTM: The generative topographic mapping. Neural computation, 1998.

Bornschein, J. and Bengio, Y. Reweighted Wake-Sleep. International Conference on Learning Representations, June 2015.

Burda, Y., Grosse, R. B., and Salakhutdinov, R. Accurate and Conservative Estimates of MRF Log-likelihood using Reverse Annealing. arXiv:1412.8566, December 2014.

Dayan, P., Hinton, G. E., Neal, R. M., and Zemel, R. S. The helmholtz machine. Neural computation, 7(5):889–904, 1995.

Dinh, L., Krueger, D., and Bengio, Y. NICE: Non-linear Independent Components Estimation. arXiv:1410.8516, pp. 11, October 2014.

Feller, W. On the theory of stochastic processes, with particular reference to applications. In Proceedings of the [First] Berkeley Symposium on Mathematical Statistics and Probability. The Regents of the University of California, 1949.

Gershman, S. J. and Blei, D. M. A tutorial on Bayesian nonparametric models. Journal of Mathematical Psychology, 56(1):1–12, 2012.

Gneiting, T. and Raftery, A. E. Strictly proper scoring rules, prediction, and estimation. Journal of the American Statistical Association, 102(477):359–378, 2007.

Goodfellow, I. J., Pouget-Abadie, J., Mirza, M., Xu, B., Warde-Farley, D., Ozair, S., Courville, A., and Bengio, Y. Generative Adversarial Nets. Advances in Neural Information Processing Systems, 2014.

Gregor, K., Danihelka, I., Mnih, A., Blundell, C., and Wierstra, D. Deep AutoRegressive Networks. arXiv preprint arXiv:1310.8499, October 2013.

Grosse, R. B., Maddison, C. J., and Salakhutdinov, R. Annealing between distributions by averaging moments. In Advances in Neural Information Processing Systems, pp. 2769–2777, 2013.

Hinton, G. E. Training products of experts by minimizing contrastive divergence. Neural Computation, 14(8): 1771–1800, 2002.

Hinton, G. E. The wake-sleep algorithm for unsupervised neural networks ). Science, 1995.

Hyv¨arinen, A. Estimation of non-normalized statistical models using score matching. Journal of Machine Learning Research, 6:695–709, 2005.

Jarzynski, C. Equilibrium free-energy differences from nonequilibrium measurements: A master-equation approach. Physical Review E, January 1997.

Jarzynski, C. Equalities and inequalities: irreversibility and the second law of thermodynamics at the nanoscale. Annu. Rev. Condens. Matter Phys., 2011.

Jeulin, D. Dead leaves models: from space tesselation to random functions. Proc. of the Symposium on the Advances in the Theory and Applications of Random Sets, 1997.

Jordan, M. I., Ghahramani, Z., Jaakkola, T. S., and Saul, L. K. An introduction to variational methods for graphical models. Machine learning, 37(2):183–233, 1999.

Kavukcuoglu, K., Ranzato, M., and LeCun, Y. Fast inference in sparse coding algorithms with applications to object recognition. arXiv preprint arXiv:1010.3467, 2010.

Kingma, D. P. and Welling, M. Auto-Encoding Variational Bayes. International Conference on Learning Representations, December 2013.

Krizhevsky, A. and Hinton, G. Learning multiple layers of features from tiny images. Computer Science Department University of Toronto Tech. Rep., 2009.

Langevin, P. Sur la th´eorie du mouvement brownien. CR Acad. Sci. Paris, 146(530-533), 1908.

Larochelle, H. and Murray, I. The neural autoregressive distribution estimator. Journal of Machine Learning Research, 2011.

Lazebnik, S., Schmid, C., and Ponce, J. A sparse texture representation using local afﬁne regions. Pattern Analysis and Machine Intelligence, IEEE Transactions on, 27 (8):1265–1278, 2005.

LeCun, Y. and Cortes, C. The MNIST database of handwritten digits. 1998.

Lee, A., Mumford, D., and Huang, J. Occlusion models for natural images: A statistical study of a scale-invariant dead leaves model. International Journal of Computer Vision, 2001.

Lyu, S. Unifying Non-Maximum Likelihood Learning Objectives with Minimum KL Contraction. Advances in Neural Information Processing Systems 24, pp. 64–72, 2011.

MacKay, D. Bayesian neural networks and density networks. Nuclear Instruments and Methods in Physics Research Section A: Accelerators, Spectrometers, Detectors and Associated Equipment, 1995.

Murphy, K. P., Weiss, Y., and Jordan, M. I. Loopy belief propagation for approximate inference: An empirical study. In Proceedings of the Fifteenth conference on Uncertainty in artiﬁcial intelligence, pp. 467–475. Morgan Kaufmann Publishers Inc., 1999.

Neal, R. Annealed importance sampling. Statistics and Computing, January 2001.

Ozair, S. and Bengio, Y. Deep Directed Generative Autoencoders. arXiv:1410.0630, October 2014.

Parry, M., Dawid, A. P., Lauritzen, S., and Others. Proper local scoring rules. The Annals of Statistics, 40(1):561– 592, 2012.

Rezende, D. J., Mohamed, S., and Wierstra, D. Stochastic Backpropagation and Approximate Inference in Deep Generative Models. Proceedings of the 31st International Conference on Machine Learning (ICML-14), January 2014.

Rippel, O. and Adams, R. P. High-Dimensional Probability Estimation with Deep Density Models. arXiv:1410.8516, pp. 12, February 2013.

Schmidhuber, J. Learning factorial codes by predictability minimization. Neural Computation, 1992.

Sminchisescu, C., Kanaujia, A., and Metaxas, D. Learning joint top-down and bottom-up processes for 3D visual inference. In Computer Vision and Pattern Recognition, 2006 IEEE Computer Society Conference on, volume 2, pp. 1743–1752. IEEE, 2006.

Sohl-Dickstein, J., Battaglino, P., and DeWeese, M. New Method for Parameter Estimation in Probabilistic Models: Minimum Probability Flow. Physical Review Letters, 107(22):11–14, November 2011a. ISSN 00319007. doi: 10.1103/PhysRevLett.107.220601.

Sohl-Dickstein, J., Battaglino, P. B., and DeWeese, M. R. Minimum Probability Flow Learning. International Conference on Machine Learning, 107(22):11– 14, November 2011b. ISSN 0031-9007. doi: 10.1103/ PhysRevLett.107.220601.

Sohl-Dickstein, J., Poole, B., and Ganguli, S. Fast largescale optimization by unifying stochastic gradient and quasi-Newton methods. In Proceedings of the 31st International Conference on Machine Learning (ICML-14), pp. 604–612, 2014.

Spinney, R. and Ford, I. Fluctuation Relations : A Pedagogical Overview. arXiv preprint arXiv:1201.6381, pp. 3–56, 2013.

Stuhlm¨uller, A., Taylor, J., and Goodman, N. Learning stochastic inverses. Advances in Neural Information Processing Systems, 2013.

Suykens, J. and Vandewalle, J. Nonconvex optimization using a Fokker-Planck learning machine. In 12th European Conference on Circuit Theory and Design, 1995.

T, P. Convergence condition of the TAP equation for the inﬁnite-ranged Ising spin glass model. J. Phys. A: Math. Gen. 15 1971, 1982.

Tanaka, T. Mean-ﬁeld theory of Boltzmann machine learning. Physical Review Letters E, January 1998.

Theis, L., Hosseini, R., and Bethge, M. Mixtures of conditional Gaussian scale mixtures applied to multiscale image representations. PloS one, 7(7):e39857, 2012.

Theis, L., van den Oord, A., and Bethge, M. A note on the evaluation of generative models. arXiv preprint arXiv:1511.01844, 2015.

Uria, B., Murray, I., and Larochelle, H. RNADE: The real-valued neural autoregressive density-estimator. Advances in Neural Information Processing Systems, 2013a.

Uria, B., Murray, I., and Larochelle, H. A Deep and Tractable Density Estimator. arXiv:1310.1757, pp. 9, October 2013b.

van Merri¨enboer, B., Chorowski, J., Serdyuk, D., Bengio, Y., Bogdanov, D., Dumoulin, V., and Warde-Farley, D. Blocks and Fuel. Zenodo, May 2015. doi: 10.5281/ zenodo.17721.

Welling, M. and Hinton, G. A new learning algorithm for mean ﬁeld Boltzmann machines. Lecture Notes in Computer Science, January 2002.

Yao, L., Ozair, S., Cho, K., and Bengio, Y. On the Equivalence Between Deep NADE and Generative Stochastic Networks. In Machine Learning and Knowledge Discovery in Databases, pp. 322–336. Springer, 2014.

# Appendix

- A. Conditional Entropy Bounds Derivation The conditional entropy Hq X(t−1)|X(t) of a step in the reverse trajectory is

Hq X(t−1),X(t) = Hq X(t),X(t−1) (25) Hq X(t−1)|X(t) + Hq X(t) = Hq X(t)|X(t−1) + Hq X(t−1) (26)

Hq X(t−1)|X(t) = Hq X(t)|X(t−1) + Hq X(t−1) − Hq X(t) (27)

An upper bound on the entropy change can be constructed by observing that π (y) is the maximum entropy distribution. This holds without qualiﬁcation for the binomial distribution, and holds for variance 1 training data for the Gaussian case. For the Gaussian case, training data must therefore be scaled to have unit norm for the following equalities to hold. It need not be whitened. The upper bound is derived as follows,

Hq X(t) ≥ Hq X(t−1) (28) Hq X(t−1) − Hq X(t) ≤ 0 (29)

Hq X(t−1)|X(t) ≤ Hq X(t)|X(t−1) . (30)

- A lower bound on the entropy difference can be established by observing that additional steps in a Markov chain do not increase the information available about the initial state in the chain, and thus do not decrease the conditional entropy of the initial state,

Hq X(0)|X(t) ≥ Hq X(0)|X(t−1) (31) Hq X(t−1) − Hq X(t) ≥ Hq X(0)|X(t−1) + Hq X(t−1) − Hq X(0)|X(t) − Hq X(t) (32) Hq X(t−1) − Hq X(t) ≥ Hq X(0),X(t−1) − Hq X(0),X(t) (33) Hq X(t−1) − Hq X(t) ≥ Hq X(t−1)|X(0) − Hq X(t)|X(0) (34)

Hq X(t−1)|X(t) ≥ Hq X(t)|X(t−1) + Hq X(t−1)|X(0) − Hq X(t)|X(0) . (35)

Combining these expressions, we bound the conditional entropy for a single step,

Hq X(t)|X(t−1) ≥ Hq X(t−1)|X(t) ≥ Hq X(t)|X(t−1) + Hq X(t−1)|X(0) − Hq X(t)|X(0) , (36)

where both the upper and lower bounds depend only on the conditional forward trajectory q x(1···T)|x(0) , and can be analytically computed.

- B. Log Likelihood Lower Bound The lower bound on the log likelihood is

L ≥ K (37)

T

- p x(t−1)|x(t)

- q x(t)|x(t−1) (38)

K = dx(0···T)q x(0···T) log p x(T)

t=1

(39)

- B.1. Entropy of p X(T) We can peel off the contribution from p X(T) , and rewrite it as an entropy,

T

- p x(t−1)|x(t)

- q x(t)|x(t−1) + dx(T)q x(T) log p x(T) (40)

K = dx(0···T)q x(0···T)

log

t=1

T

- p x(t−1)|x(t)

- q x(t)|x(t−1) + dx(T)q x(T) log π xT (41)

= dx(0···T)q x(0···T)

log

t=1

. (42)

By design, the cross entropy to π x(t) is constant under our diffusion kernels, and equal to the entropy of p x(T) . Therefore,

T

K =

t=1

dx(0···T)q x(0···T) log

- p x(t−1)|x(t)

- q x(t)|x(t−1) − Hp X(T) . (43)

##### B.2. Remove the edge effect at t = 0

In order to avoid edge effects, we set the ﬁnal step of the reverse trajectory to be identical to the corresponding forward diffusion step,

p x(0)|x(1) = q x(1)|x(0)

- π x(0)

- π x(1)

= Tπ x(0)|x(1);β1 . (44)

We then use this equivalence to remove the contribution of the ﬁrst time-step in the sum,

T

K =

t=2

T

=

t=2

dx(0···T)q x(0···T) log

dx(0···T)q x(0···T) log

- p x(t−1)|x(t)

- q x(t)|x(t−1) + dx(0)dx(1)q x(0),x(1) log

q x(1)|x(0) π x(0) q x(1)|x(0) π x(1) − Hp X(T)

(45)

p x(t−1)|x(t) q x(t)|x(t−1) − Hp X(T) , (46)

where we again used the fact that by design − dx(t)q x(t) log π x(t) = Hp X(T) is a constant for all t.

###### B.3. Rewrite in terms of posterior q x(t−1)|x(0) Because the forward trajectory is a Markov process,

T

K =

t=2

dx(0···T)q x(0···T) log

- p x(t−1)|x(t)

- q x(t)|x(t−1),x(0) − Hp X(T) . (47)

Using Bayes’ rule we can rewrite this in terms of a posterior and marginals from the forward trajectory,

T

K =

t=2

dx(0···T)q x(0···T) log

- p x(t−1)|x(t)

- q x(t−1)|x(t),x(0)

q x(t−1)|x(0) q x(t)|x(0) − Hp X(T) . (48)

[Figure 209]

[Figure 210]

[Figure 211]

[Figure 212]

[Figure 213]

[Figure 214]

[Figure 215]

[Figure 216]

[Figure 217]

[Figure 218]

[Figure 219]

[Figure 220]

[Figure 221]

[Figure 222]

[Figure 223]

[Figure 224]

[Figure 225]

[Figure 226]

[Figure 227]

[Figure 228]

[Figure 229]

[Figure 230]

[Figure 231]

[Figure 232]

[Figure 233]

[Figure 234]

[Figure 235]

[Figure 236]

[Figure 237]

[Figure 238]

[Figure 239]

[Figure 240]

[Figure 241]

[Figure 242]

[Figure 243]

[Figure 244]

[Figure 245]

[Figure 246]

[Figure 247]

[Figure 248]

[Figure 249]

[Figure 250]

[Figure 251]

[Figure 252]

[Figure 253]

[Figure 254]

[Figure 255]

[Figure 256]

[Figure 257]

[Figure 258]

[Figure 259]

[Figure 260]

[Figure 261]

[Figure 262]

[Figure 263]

[Figure 264]

[Figure 265]

[Figure 266]

[Figure 267]

[Figure 268]

[Figure 269]

[Figure 270]

[Figure 271]

[Figure 272]

[Figure 273]

[Figure 274]

[Figure 275]

[Figure 276]

[Figure 277]

[Figure 278]

[Figure 279]

[Figure 280]

[Figure 281]

[Figure 282]

[Figure 283]

[Figure 284]

[Figure 285]

[Figure 286]

[Figure 287]

[Figure 288]

[Figure 289]

[Figure 290]

[Figure 291]

[Figure 292]

[Figure 293]

[Figure 294]

[Figure 295]

[Figure 296]

[Figure 297]

[Figure 298]

[Figure 299]

[Figure 300]

[Figure 301]

[Figure 302]

[Figure 303]

[Figure 304]

[Figure 305]

[Figure 306]

[Figure 307]

[Figure 308]

Figure App.1. Samples from a diffusion probabilistic model trained on MNIST digits. Note that unlike many MNIST sample ﬁgures, these are true samples rather than the mean of the Gaussian or binomial distribution from which samples would be drawn.

- B.4. Rewrite in terms of KL divergences and entropies We then recognize that several terms are conditional entropies,

T

K =

t=2

dx(0···T)q x(0···T) log

- p x(t−1)|x(t)

- q x(t−1)|x(t),x(0)

T

+

t=2

Hq X(t)|X(0) − Hq X(t−1)|X(0) − Hp X(T)

(49)

T

- p x(t−1)|x(t)

- q x(t−1)|x(t),x(0)

dx(0···T)q x(0···T) log

+ Hq X(T)|X(0) − Hq X(1)|X(0) − Hp X(T) .

=

t=2

(50) Finally we transform the log ratio of probability distributions into a KL divergence,

T

K = −

t=2

dx(0)dx(t)q x(0),x(t) DKL q x(t−1)|x(t),x(0) p x(t−1)|x(t) (51)

+ Hq X(T)|X(0) − Hq X(1)|X(0) − Hp X(T) .

Note that the entropies can be analytically computed, and the KL divergence can be analytically computed given x(0) and x(t).

Gaussian Binomial

Well behaved (analytically tractable) distribution

π x(T) = N x(T);0,I B x(T);0.5

Forward diffusion kernel q x(t)|x(t−1) = N x(t);x(t−1)√1 − βt,Iβt B x(t);x(t−1) (1 − βt) + 0.5βt Reverse diffusion kernel p x(t−1)|x(t) = N x(t−1);fµ x(t),t ,fΣ x(t),t B x(t−1);fb x(t),t Training targets fµ x(t),t , fΣ x(t),t , β1···T fb x(t),t

Forward distribution q x(0···T) = q x(0) Tt=1 q x(t)|x(t−1) Reverse distribution p x(0···T) = π x(T) Tt=1 p x(t−1)|x(t) Log likelihood L = dx(0)q x(0) log p x(0)

Lower bound on log likelihood K = − Tt=2 Eq(x(0),x(t)) DKL q x(t−1)|x(t),x(0) p x(t−1)|x(t) + Hq X(T)|X(0) − Hq X(1)|X(0) − Hp X(T) Perturbed reverse diffusion kernel p˜ x(t−1)|x(t) = N x(t−1);fµ x(t),t + fΣ x(t),t ∂ logr x

(t−1) ∂x(t−1)

t−1 i dti−1

,fΣ x(t),t B x(it−1); c

xti−1dti−1+(1−cti−1)(1−dti−1)

x(t−1) =fµ(x(t),t)

Table App.1. The key equations in this paper for the speciﬁc cases of Gaussian and binomial diffusion processes. N (u; µ, Σ) is a Gaussian distribution with mean µ and covariance Σ. B (u; r) is the distribution for a single Bernoulli trial, with u = 1 occurring with probability r, and u = 0 occurring with probability 1 − r. Finally, for the perturbed Bernoulli

, and dti = r x(it) = 1 , and the distribution is given for a single bit i.

trials bti = x(t−1) (1 − βt) + 0.5βt, cti = fb x(t+1), t

i

#### C. Perturbed Gaussian Transition

We wish to compute p˜ x(t−1) | x(t) . For notational simplicity, let µ = fµ x(t),t , Σ = fΣ x(t),t , and y = x(t−1). Using this notation,

p˜ y | x(t) ∝ p y | x(t) r (y) (52)

= N (y;µ,Σ)r (y). (53) We can rewrite this in terms of energy functions, where Er (y) = −log r (y),

p˜ y | x(t) ∝ exp[−E (y)] (54) E (y) =

- 1

- 2

(y − µ)T Σ−1 (y − µ) + Er (y). (55)

If Er (y) is smooth relative to 21 (y − µ)T Σ−1 (y − µ), then we can approximate it using its Taylor expansion around µ. One sufﬁcient condition is that the eigenvalues of the Hessian of Er (y) are everywhere much smaller magnitude than the eigenvalues of Σ−1. We then have

(y ) ∂y

where g = ∂Er

Er (y) ≈ Er (µ) + (y − µ)g (56)

. Plugging this in to the full energy,

y =µ

- 1

- 2

(y − µ)T Σ−1 (y − µ) + (y − µ)T g + constant (57)

E (y) ≈

- 1

- 2

- 1

- 2

- 1

- 2

- 1

- 2

- 1

- 2

yTΣ−1y −

yTΣ−1µ −

µTΣ−1y +

yTΣ−1Σg +

gTΣΣ−1y + constant (58)

=

1 2

(y − µ + Σg)T Σ−1 (y − µ + Σg) + constant. (59)

=

This corresponds to a Gaussian,

p˜ y | x(t) ≈ N (y;µ − Σg,Σ). (60) Substituting back in the original formalism, this is,

 x(t−1);fµ x(t),t + fΣ x(t),t

 . (61)

∂ log r x(t−1) ∂x(t−1)

p˜ x(t−1) | x(t) ≈ N

,fΣ x(t),t

x(t−1) =fµ(x(t),t)

#### D. Experimental Details

##### D.1. Toy Problems

- D.1.1. SWISS ROLL

A probabilistic model was built of a two dimensional swiss roll distribution. The generative model p x(0···T) consisted of 40 time steps of Gaussian diffusion initialized at an identity-covariance Gaussian distribution. A (normalized) radial basis function network with a single hidden layer and 16 hidden units was trained to generate the mean and covariance functions fµ x(t),t and a diagonal fΣ x(t),t for the reverse trajectory. The top, readout, layer for each function was learned independently for each time step, but for all other layers weights were shared across all time steps and both functions. The top layer output of fΣ x(t),t was passed through a sigmoid to restrict it between 0 and 1. As can be seen in Figure 1, the swiss roll distribution was successfully learned.

- D.1.2. BINARY HEARTBEAT DISTRIBUTION

A probabilistic model was trained on simple binary sequences of length 20, where a 1 occurs every 5th time bin, and the remainder of the bins are 0. The generative model consisted of 2000 time steps of binomial diffusion initialized at an independent binomial distribution with the

same mean activity as the data (p x(iT) = 1 = 0.2). A multilayer perceptron with sigmoid nonlinearities, 20 input units and three hidden layers with 50 units each was trained to generate the Bernoulli rates fb x(t),t of the reverse trajectory. The top, readout, layer was learned independently for each time step, but for all other layers weights were shared across all time steps. The top layer output was passed through a sigmoid to restrict it between 0 and 1. As can be seen in Figure 2, the heartbeat distribution was successfully learned. The log likelihood under the true generating process is log2 5 1 = −2.322 bits per sequence. As can be seen in Figure 2 and Table 1 learning was nearly perfect.

###### D.2. Images D.2.1. ARCHITECTURE

Readout In all cases, a convolutional network was used to produce a vector of outputs yi ∈ R2J for each image pixel i. The entries in yi are divided into two equal sized subsets, yµ and yΣ.

Temporal Dependence The convolution output yµ is used as per-pixel weighting coefﬁcients in a sum over timedependent “bump” functions, generating an output zµi ∈ R

for each pixel i,

zµi =

J

yijµ gj (t). (62)

j=1

The bump functions consist of

exp −2w12 (t − τj)2

, (63)

gj (t) =

J k=1 exp −2w12 (t − τk)2

where τj ∈ (0,T) is the bump center, and w is the spacing between bump centers. zΣ is generated in an identical way, but using yΣ.

For all image experiments a number of timesteps T = 1000 was used, except for the bark dataset which used T = 500.

Mean and Variance Finally, these outputs are combined to produce a diffusion mean and variance prediction for each pixel i,

Σii = σ ziΣ + σ−1 (βt) , (64) µi = (xi − ziµ)(1 − Σii) + ziµ. (65)

where both Σ and µ are parameterized as a perturbation around the forward diffusion kernel Tπ x(t)|x(t−1);βt , and ziµ is the mean of the equilibrium distribution that would result from applying p x(t−1)|x(t) many times. Σ is restricted to be a diagonal matrix.

Multi-Scale Convolution We wish to accomplish goals that are often achieved with pooling networks – specifically, we wish to discover and make use of long-range and multi-scale dependencies in the training data. However, since the network output is a vector of coefﬁcients for every pixel it is important to generate a full resolution rather than down-sampled feature map. We therefore deﬁne multi-scale-convolution layers that consist of the following steps:

- 1. Perform mean pooling to downsample the image to multiple scales. Downsampling is performed in powers of two.
- 2. Performing convolution at each scale.
- 3. Upsample all scales to full resolution, and sum the resulting images.
- 4. Perform a pointwise nonlinear transformation, consisting of a soft relu (log [1 + exp(·)]).

The composition of the ﬁrst three linear operations resembles convolution by a multiscale convolution kernel, up to blocking artifacts introduced by upsampling. This method of achieving multiscale convolution was described in (Barron et al., 2013).

Mean image

Temporal coefficients

Convolution 1x1 kernel

Convolution 1x1 kernel

Dense

Dense

Input

Covariance image

Temporal coefficients

Multi-scale convolution

Multi-scale convolution

Figure D.1. Network architecture for mean function fµ x(t), t and covariance function fΣ x(t), t , for experiments in Section

- 3.2. The input image x(t) passes through several layers of multiscale convolution (Section D.2.1). It then passes through several convolutional layers with 1 × 1 kernels. This is equivalent to a dense transformation performed on each pixel. A linear transformation generates coefﬁcients for readout of both mean µ(t) and covariance Σ(t) for each pixel. Finally, a time dependent readout function converts those coefﬁcients into mean and covariance images, as described in Section D.2.1. For CIFAR-10 a dense (or fully connected) pathway was used in parallel to the multi-scale convolutional pathway. For MNIST, the dense pathway was used to the exclusion of the multi-scale convolutional pathway.

Dense Layers Dense (acting on the full image vector) and kernel-width-1 convolutional (acting separately on the feature vector for each pixel) layers share the same form. They consist of a linear transformation, followed by a tanh nonlinearity.

