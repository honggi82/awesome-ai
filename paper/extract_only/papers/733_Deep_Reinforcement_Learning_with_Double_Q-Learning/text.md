Proceedings of the Thirtieth AAAI Conference on Artificial Intelligence (AAAI-16)

# Deep Reinforcement Learning with Double Q-Learning

### Hado van Hasselt , Arthur Guez, and David Silver

Google DeepMind

##### Abstract

The popular Q-learning algorithm is known to overestimate action values under certain conditions. It was not previously known whether, in practice, such overestimations are common, whether they harm performance, and whether they can generally be prevented. In this paper, we answer all these questions afﬁrmatively. In particular, we ﬁrst show that the recent DQN algorithm, which combines Q-learning with a deep neural network, suffers from substantial overestimations in some games in the Atari 2600 domain. We then show that the idea behind the Double Q-learning algorithm, which was introduced in a tabular setting, can be generalized to work with large-scale function approximation. We propose a speciﬁc adaptation to the DQN algorithm and show that the resulting algorithm not only reduces the observed overestimations, as hypothesized, but that this also leads to much better performance on several games.

The goal of reinforcement learning (Sutton and Barto 1998) is to learn good policies for sequential decision problems, by optimizing a cumulative future reward signal. Q-learning (Watkins 1989) is one of the most popular reinforcement learning algorithms, but it is known to sometimes learn unrealistically high action values because it includes a maximization step over estimated action values, which tends to prefer overestimated to underestimated values.

In previous work, overestimations have been attributed to insufﬁciently ﬂexible function approximation (Thrun and Schwartz 1993) and noise (van Hasselt 2010, 2011). In this paper, we unify these views and show overestimations can occur when the action values are inaccurate, irrespective of the source of approximation error. Of course, imprecise value estimates are the norm during learning, which indicates that overestimations may be much more common than previously appreciated.

It is an open question whether, if the overestimations do occur, this negatively affects performance in practice. Overoptimistic value estimates are not necessarily a problem in and of themselves. If all values would be uniformly higher then the relative action preferences are preserved and we would not expect the resulting policy to be any worse. Furthermore, it is known that sometimes it is good to be optimistic: optimism in the face of uncertainty is a well-known

Copyright c 2016, Association for the Advancement of Artiﬁcial Intelligence (www.aaai.org). All rights reserved.

exploration technique (Kaelbling et al. 1996). If, however, the overestimations are not uniform and not concentrated at states about which we wish to learn more, then they might negatively affect the quality of the resulting policy. Thrun and Schwartz (1993) give speciﬁc examples in which this leads to suboptimal policies, even asymptotically.

To test whether overestimations occur in practice and at scale, we investigate the performance of the recent DQN algorithm (Mnih et al. 2015). DQN combines Q-learning with a ﬂexible deep neural network and was tested on a varied and large set of deterministic Atari 2600 games, reaching human-level performance on many games. In some ways, this setting is a best-case scenario for Q-learning, because the deep neural network provides ﬂexible function approximation with the potential for a low asymptotic approximation error, and the determinism of the environments prevents the harmful effects of noise. Perhaps surprisingly, we show that even in this comparatively favorable setting DQN sometimes substantially overestimates the values of the actions.

We show that the Double Q-learning algorithm (van Hasselt 2010), which was ﬁrst proposed in a tabular setting, can be generalized to arbitrary function approximation, including deep neural networks. We use this to construct a new algorithm called Double DQN. This algorithm not only yields more accurate value estimates, but leads to much higher scores on several games. This demonstrates that the overestimations of DQN indeed lead to poorer policies and that it is beneﬁcial to reduce them. In addition, by improving upon DQN we obtain state-of-the-art results on the Atari domain.

### Background

To solve sequential decision problems we can learn estimates for the optimal value of each action, deﬁned as the expected sum of future rewards when taking that action and following the optimal policy thereafter. Under a given policy π, the true value of an action a in a state s is

Qπ(s,a) ≡ E[R1 + γR2 + ... | S0 = s,A0 = a,π] ,

where γ ∈ [0,1] is a discount factor that trades off the importance of immediate and later rewards. The optimal value is then Q∗(s,a) = maxπ Qπ(s,a). An optimal policy is easily derived from the optimal values by selecting the highestvalued action in each state.

Estimates for the optimal action values can be learned using Q-learning (Watkins 1989), a form of temporal difference learning (Sutton 1988). Most interesting problems are too large to learn all action values in all states separately. Instead, we can learn a parameterized value function Q(s,a;θt). The standard Q-learning update for the parameters after taking action At in state St and observing the immediate reward Rt+1 and resulting state St+1 is then

θt+1 = θt+α(YtQ−Q(St,At;θt))∇θt

Q(St,At;θt). (1) where α is a scalar step size and the target YtQ is deﬁned as

YtQ ≡ Rt+1 + γ max

Q(St+1,a;θt). (2) This update resembles stochastic gradient descent, updating the current value Q(St,At;θt) towards a target value YtQ.

a

#### Deep Q Networks

A deep Q network (DQN) is a multi-layered neural network that for a given state s outputs a vector of action values Q(s,·;θ), where θ are the parameters of the network. For an n-dimensional state space and an action space containing m actions, the neural network is a function from Rn to Rm. Two important ingredients of the DQN algorithm as proposed by Mnih et al. (2015) are the use of a target network, and the use of experience replay. The target network, with parameters θ−, is the same as the online network except that its parameters are copied every τ steps from the online network, so that then θt− = θt, and kept ﬁxed on all other steps. The target used by DQN is then

YtDQN ≡ Rt+1 + γ max

Q(St+1,a;θt−). (3)

a

For the experience replay (Lin 1992), observed transitions are stored for some time and sampled uniformly from this memory bank to update the network. Both the target network and the experience replay dramatically improve the performance of the algorithm (Mnih et al. 2015).

#### Double Q-learning

The max operator in standard Q-learning and DQN, in (2) and (3), uses the same values both to select and to evaluate an action. This makes it more likely to select overestimated values, resulting in overoptimistic value estimates. To prevent this, we can decouple the selection from the evaluation.

In Double Q-learning (van Hasselt 2010), two value functions are learned by assigning experiences randomly to update one of the two value functions, resulting in two sets of weights, θ and θ . For each update, one set of weights is used to determine the greedy policy and the other to determine its value. For a clear comparison, we can untangle the selection and evaluation in Q-learning and rewrite its target (2) as

YtQ = Rt+1 + γQ(St+1,argmax

Q(St+1,a;θt);θt). The Double Q-learning error can then be written as YtDoubleQ≡ Rt+1 + γQ(St+1,argmax

a

Q(St+1,a;θt);θ t). (4)

a

Notice that the selection of the action, in the argmax, is still due to the online weights θt. This means that, as in Qlearning, we are still estimating the value of the greedy policy according to the current values, as deﬁned by θt. However, we use the second set of weights θ t to fairly evaluate the value of this policy. This second set of weights can be updated symmetrically by switching the roles of θ and θ .

## Overoptimism due to estimation errors

Q-learning’s overestimations were ﬁrst investigated by Thrun and Schwartz (1993), who showed that if the action values contain random errors uniformly distributed in an in-

terval [− , ] then each target is overestimated up to γ mm−+11, where m is the number of actions. In addition, Thrun and Schwartz give a concrete example in which these overestimations even asymptotically lead to sub-optimal policies, and show the overestimations manifest themselves in a small toy problem when using function approximation. Van Hasselt (2010) noted that noise in the environment can lead to overestimations even when using tabular representation, and proposed Double Q-learning as a solution.

In this section we demonstrate more generally that estimation errors of any kind can induce an upward bias, regardless of whether these errors are due to environmental noise, function approximation, non-stationarity, or any other source. This is important, because in practice any method will incur some inaccuracies during learning, simply due to the fact that the true values are initially unknown.

The result by Thrun and Schwartz (1993) cited above gives an upper bound to the overestimation for a speciﬁc setup, but it is also possible, and potentially more interesting, to derive a lower bound.

Theorem 1. Consider a state s in which all the true optimal action values are equal at Q∗(s,a) = V∗(s) for some V∗(s). Let Qt be arbitrary value estimates that are on the whole unbiased in the sense that a(Qt(s,a)−V∗(s)) = 0, but that are not all correct, such that m1 a(Qt(s,a)−V∗(s))2 = C for some C > 0, where m ≥ 2 is the number of actions in s.

Under these conditions, maxa Qt(s,a) ≥ V∗(s) + mC−1. This lower bound is tight. Under the same conditions, the lower bound on the absolute error of the Double Q-learning estimate is zero. (Proof in appendix.)

Note that we did not need to assume that estimation errors for different actions are independent. This theorem shows that even if the value estimates are on average correct, estimation errors of any source can drive the estimates up and away from the true optimal values.

The lower bound in Theorem 1 decreases with the number of actions. This is an artifact of considering the lower bound, which requires very speciﬁc values to be attained. More typically, the overoptimism increases with the number of actions as shown in Figure 1. Q-learning’s overestimations there indeed increase with the number of actions, while Double Q-learning is unbiased. As another example, if for all actions Q∗(s,a) = V∗(s) and the estimation errors Qt(s,a) − V∗(s) are uniformly random in [−1,1], then the overoptimism is m−1

m+1. (Proof in appendix.)

1.5

maxa Q(s,a) − V∗(s)

Q (s,argmaxaQ(s,a)) − V∗(s)

1.0

error

0.5

0.0

2 4 8 1632641282565121024

number of actions

- Figure 1: The orange bars show the bias in a single Qlearning update when the action values are Q(s,a) =

V∗(s) + a and the errors { a}ma=1 are independent standard normal random variables. The second set of action values Q , used for the blue bars, was generated identically and independently. All bars are the average of 100 repetitions.

We now turn to function approximation and consider a real-valued continuous state space with 10 discrete actions in each state. For simplicity, the true optimal action values in this example depend only on state so that in each state all actions have the same true value. These true values are shown in the left column of plots in Figure 2 (purple lines) and are deﬁned as either Q∗(s,a) = sin(s) (top row) or Q∗(s,a) = 2exp(−s2) (middle and bottom rows). The left plots also show an approximation for a single action (green lines) as a function of state as well as the samples the estimate is based on (green dots). The estimate is a d-degree polynomial that is ﬁt to the true values at sampled states, where d = 6 (top and middle rows) or d = 9 (bottom row). The samples match the true function exactly: there is no noise and we assume we have ground truth for the action value on these sampled states. The approximation is inexact even on the sampled states for the top two rows because the function approximation is insufﬁciently ﬂexible. In the bottom row, the function is ﬂexible enough to ﬁt the green dots, but this reduces the accuracy in unsampled states. Notice that the sampled states are spaced further apart near the left side of the left plots, resulting in larger estimation errors. In many ways this is a typical learning setting, where at each point in time we only have limited data.

The middle column of plots in Figure 2 shows estimated action values for all 10 actions (green lines), as functions of state, along with the maximum action value in each state (black dashed line). Although the true value function is the same for all actions, the approximations differ because they are based on different sets of sampled states.1 The maximum is often higher than the ground truth shown in purple on the left. This is conﬁrmed in the right plots, which shows the difference between the black and purple curves in orange. The orange line is almost always positive, indicating an upward bias. The right plots also show the estimates from Double

1Each action-value function is ﬁt with a different subset of integer states. States −6 and 6 are always included to avoid extrapolations, and for each action two adjacent integers are missing: for action a1 states −5 and −4 are not sampled, for a2 states −4 and −3 are not sampled, and so on. This causes the estimated values to differ.

Q-learning in blue2, which are on average much closer to zero. This demonstrates that Double Q-learning indeed can successfully reduce the overoptimism of Q-learning.

The different rows in Figure 2 show variations of the same experiment. The difference between the top and middle rows is the true value function, demonstrating that overestimations are not an artifact of a speciﬁc true value function. The difference between the middle and bottom rows is the ﬂexibility of the function approximation. In the left-middle plot, the estimates are even incorrect for some of the sampled states because the function is insufﬁciently ﬂexible. The function in the bottom-left plot is more ﬂexible but this causes higher estimation errors for unseen states, resulting in higher overestimations. This is important because ﬂexible parametric function approximation is often employed in reinforcement learning (see, e.g., Tesauro 1995, Sallans and Hinton 2004, Riedmiller 2005, and Mnih et al. 2015).

In contrast to van Hasselt (2010), we did not use a statistical argument to ﬁnd overestimations, the process to obtain Figure 2 is fully deterministic. In contrast to Thrun and Schwartz (1993), we did not rely on inﬂexible function approximation with irreducible asymptotic errors; the bottom row shows that a function that is ﬂexible enough to cover all samples leads to high overestimations. This indicates that the overestimations can occur quite generally.

In the examples above, overestimations occur even when assuming we have samples of the true action value at certain states. The value estimates can further deteriorate if we bootstrap off of action values that are already overoptimistic, since this causes overestimations to propagate throughout our estimates. Although uniformly overestimating values might not hurt the resulting policy, in practice overestimation errors will differ for different states and actions. Overestimation combined with bootstrapping then has the pernicious effect of propagating the wrong relative information about which states are more valuable than others, directly affecting the quality of the learned policies.

The overestimations should not be confused with optimism in the face of uncertainty (Sutton 1990, Agrawal 1995, Kaelbling et al. 1996, Auer at al. 2002, Brafman and Tennenholtz 2003, Szita and L˜orincz 2008, Strehl and Littman 2009), where an exploration bonus is given to states or actions with uncertain values. The overestimations discussed here occur only after updating, resulting in overoptimism in the face of apparent certainty. Thrun and Schwartz (1993) noted that, in contrast to optimism in the face of uncertainty, these overestimations actually can impede learning an optimal policy. We conﬁrm this negative effect on policy quality in our experiments: when we reduce the overestimations using Double Q-learning, the policies improve.

## Double DQN

The idea of Double Q-learning is to reduce overestimations by decomposing the max operation in the target into action

2We arbitrarily used the samples of action ai+5 (for i ≤ 5) or ai−5 (for i > 5) as the second set of samples for the double estimator of action ai.

###### True value and an estimate

###### All estimates and max

###### Bias as function of state Average error

2

2

maxa Qt(s,a) − maxa Q∗(s,a)

+0.61 −0.02

maxa Qt(s,a)

- 0

- 1

Q∗(s,a)

0

0

Double-Q estimate

Qt(s,a)

−1

−2

−2

maxa Qt(s,a) − maxa Q∗(s,a)

2 maxa Qt(s,a)

+0.47 +0.02

Q∗(s,a)

2

- 0

- 1

Qt(s,a)

Double-Q estimate

−1

0

0

| | | | | | |
|---|---|---|---|---|---|
| |m m|axa Q axa|t(s,a Q∗(s,a|)− )| |
| | | | | | |
| |Do|uble-Q|estim|ate| |

4

4

4

Qt(s,a)

maxa Qt(s,a)

2

2

2

+3.35 −0.02

0

0

0

Q∗(s,a)

−6 −4 −2 0 2 4 6

−6 −4 −2 0 2 4 6

−6 −4 −2 0 2 4 6

state

state

state

- Figure 2: Illustration of overestimations during learning. In each state (x-axis), there are 10 actions. The left column shows the

true values V∗(s) (purple line). All true action values are deﬁned by Q∗(s,a) = V∗(s). The green line shows estimated values Q(s,a) for one action as a function of state, ﬁtted to the true value at several sampled states (green dots). The middle column plots show all the estimated values (green), and the maximum of these values (dashed black). The maximum is higher than the true value (purple, left plot) almost everywhere. The right column plots shows the difference in orange. The blue line in the right plots is the estimate used by Double Q-learning with a second set of samples for each state. The blue line is much closer to zero, indicating less bias. The three rows correspond to different true functions (left, purple) or capacities of the ﬁtted function (left, green). (Details in the text)

selection and action evaluation. Although not fully decoupled, the target network in the DQN architecture provides a natural candidate for the second value function, without having to introduce additional networks. We therefore propose to evaluate the greedy policy according to the online network, but using the target network to estimate its value. In reference to both Double Q-learning and DQN, we refer to the resulting algorithm as Double DQN. Its update is the

same as for DQN, but replacing the target YtDQN with

YtDoubleDQN ≡ Rt+1 + γQ(St+1, argmax

Q(St+1, a; θt), θt−) .

a

In comparison to Double Q-learning (4), the weights of the second network θ t are replaced with the weights of the target network θt− for the evaluation of the current greedy policy. The update to the target network stays unchanged from DQN, and remains a periodic copy of the online network.

This version of Double DQN is perhaps the minimal possible change to DQN towards Double Q-learning. The goal is to get most of the beneﬁt of Double Q-learning, while keeping the rest of the DQN algorithm intact for a fair comparison, and with minimal computational overhead.

## Empirical results

In this section, we analyze the overestimations of DQN and show that Double DQN improves over DQN both in terms of value accuracy and in terms of policy quality. To further test the robustness of the approach we additionally evaluate the algorithms with random starts generated from expert human trajectories, as proposed by Nair et al. (2015).

Our testbed consists of Atari 2600 games, using the Arcade Learning Environment (Bellemare et al. 2013). The

goal is for a single algorithm, with a ﬁxed set of hyperparameters, to learn to play each of the games separately from interaction given only the screen pixels as input. This is a demanding testbed: not only are the inputs high-dimensional, the game visuals and game mechanics vary substantially between games. Good solutions must therefore rely heavily on the learning algorithm — it is not practically feasible to overﬁt the domain by relying only on tuning.

We closely follow the experimental setup and network architecture used by Mnih et al. (2015). Brieﬂy, the network architecture is a convolutional neural network (Fukushima 1988, Lecun et al. 1998) with 3 convolution layers and a fully-connected hidden layer (approximately 1.5M parameters in total). The network takes the last four frames as input and outputs the action value of each action. On each game, the network is trained on a single GPU for 200M frames.

#### Results on overoptimism

Figure 3 shows examples of DQN’s overestimations in six Atari games. DQN and Double DQN were both trained under the exact conditions described by Mnih et al. (2015). DQN is consistently and sometimes vastly overoptimistic about the value of the current greedy policy, as can be seen by comparing the orange learning curves in the top row of plots to the straight orange lines, which represent the actual discounted value of the best learned policy. More precisely, the (averaged) value estimates are computed regularly during training with full evaluation phases of length T = 125,000 steps as

T

1 T

argmax

Q(St,a;θ).

a

t=1

Alien

###### Space Invaders

Time Pilot

###### Zaxxon

2.5

Valueestimates

20

8 DQN estimate

8

2.0

6

15

1.5

4

6

Double DQN estimate

10

1.0

2

Double DQN true value

4

DQN true value

0

0 50 100 150 200

0 50 100 150 200

0 50 100 150 200

0 50 100 150 200 Training steps (in millions)

###### Wizard of Wor

###### Asterix

Valueestimates

100

80

(logscale)

DQN

40

10

20

DQN Double DQN

- 0 50 100 150 200

- 1

10

Double DQN

5

0 50 100 150 200

Wizard of Wor

Asterix

4000

Double DQN

6000

Double DQN

3000

###### Score

4000

2000

2000

1000

DQN

DQN

0

0

0 50 100 150 200

0 50 100 150 200

Training steps (in millions)

Training steps (in millions)

- Figure 3: The top and middle rows show value estimates by DQN (orange) and Double DQN (blue) on six Atari games. The results are obtained by running DQN and Double DQN with 6 different random seeds with the hyper-parameters employed by Mnih et al. (2015). The darker line shows the median over seeds and we average the two extreme values to obtain the shaded area (i.e., 10% and 90% quantiles with linear interpolation). The straight horizontal orange (for DQN) and blue (for Double DQN) lines in the top row are computed by running the corresponding agents after learning concluded, and averaging the actual discounted return obtained from each visited state. These straight lines would match the learning curves at the right side of the plots if there is no bias. The middle row shows the value estimates (in log scale) for two games in which DQN’s overoptimism is quite extreme. The bottom row shows the detrimental effect of this on the score achieved by the agent as it is evaluated during training: the scores drop when the overestimations begin. Learning with Double DQN is much more stable.

The ground truth averaged values are obtained by running the best learned policies for several episodes and computing the actual cumulative rewards. Without overestimations we would expect these quantities to match up (i.e., the curve to match the straight line at the right of each plot). Instead, the learning curves of DQN consistently end up much higher than the true values. The learning curves for Double DQN, shown in blue, are much closer to the blue straight line representing the true value of the ﬁnal policy. Note that the blue straight line is often higher than the orange straight line. This indicates that Double DQN does not just produce more accurate value estimates but also better policies.

More extreme overestimations are shown in the middle two plots, where DQN is highly unstable on the games Asterix and Wizard of Wor. Notice the log scale for the values on the y-axis. The bottom two plots shows the corresponding scores for these two games. Notice that the increases in value estimates for DQN in the middle plots coincide with decreasing scores in bottom plots. Again, this indicates that the overestimations are harming the quality of the resulting policies. If seen in isolation, one might perhaps be tempted to think the observed instability is related to inherent instability problems of off-policy learning with function approximation (Baird 1995, Tsitsiklis and Van Roy 1997, Maei

| |no ops<br><br>|human starts|
|---|---|---|
| |DQN DDQN<br><br>|DQN DDQN DDQN<br><br>(tuned)|
|Median|93% 115%<br><br>|47% 88% 117%|
|Mean<br><br>|241% 330%<br><br>|122% 273% 475%|

Table 1: Summarized normalized performance on 49 games for up to 5 minutes with up to 30 no ops at the start of each episode, and for up to 30 minutes with randomly selected human start points. Results for DQN are from Mnih et al. (2015) (no ops) and Nair et al. (2015) (human starts).

2011, Sutton et al. 2015). However, we see that learning is much more stable with Double DQN, suggesting that the cause for these instabilities is in fact Q-learning’s overoptimism. Figure 3 only shows a few examples, but overestimations were observed for DQN in all 49 tested Atari games, albeit in varying amounts.

#### Quality of the learned policies

Overoptimism does not always adversely affect the quality of the learned policy. For example, DQN achieves optimal

behavior in Pong despite slightly overestimating the policy value. Nevertheless, reducing overestimations can signiﬁcantly beneﬁt the stability of learning; we see clear examples of this in Figure 3. We now assess more generally how much Double DQN helps in terms of policy quality by evaluating on all 49 games that DQN was tested on.

As described by Mnih et al. (2015) each evaluation episode starts by executing a special no-op action that does not affect the environment up to 30 times, to provide different starting points for the agent. Some exploration during evaluation provides additional randomization. For Double DQN we used the exact same hyper-parameters as for DQN, to allow for a controlled experiment focused just on reducing overestimations. The learned policies are evaluated for 5 mins of emulator time (18,000 frames) with an greedy policy where = 0.05. The scores are averaged over 100 episodes. The only difference between Double DQN

and DQN is the target, using YtDoubleDQN rather than Y DQN. This evaluation is somewhat adversarial, as the used hyperparameters were tuned for DQN but not for Double DQN.

To obtain summary statistics across games, we normalize the score for each game as follows:

scoreagent − scorerandom scorehuman − scorerandom

. (5)

scorenormalized =

The ‘random’ and ‘human’ scores are the same as used by Mnih et al. (2015), and are given in the appendix.

Table 1, under no ops, shows that on the whole Double DQN clearly improves over DQN. A detailed comparison (in appendix) shows that there are several games in which Double DQN greatly improves upon DQN. Noteworthy examples include Road Runner (from 233% to 617%), Asterix (from 70% to 180%), Zaxxon (from 54% to 111%), and Double Dunk (from 17% to 397%).

The Gorila algorithm (Nair et al. 2015), which is a massively distributed version of DQN, is not included in the table because the architecture and infrastructure is sufﬁciently different to make a direct comparison unclear. For completeness, we note that Gorila obtained median and mean normalized scores of 96% and 495%, respectively.

#### Robustness to Human starts

One concern with the previous evaluation is that in deterministic games with a unique starting point the learner could potentially learn to remember sequences of actions without much need to generalize. While successful, the solution would not be particularly robust. By testing the agents from various starting points, we can test whether the found solutions generalize well, and as such provide a challenging testbed for the learned polices (Nair et al. 2015).

We obtained 100 starting points sampled for each game from a human expert’s trajectory, as proposed by Nair et al. (2015). We start an evaluation episode from each of these starting points and run the emulator for up to 108,000 frames (30 mins at 60Hz including the trajectory before the starting point). Each agent is only evaluated on the rewards accumulated after the starting point.

For this evaluation we include a tuned version of Double DQN. Some tuning is appropriate because the hyperparame-

Video Pinball

Atlantis

Demon Attack

Breakout

Assault

Double Dunk

Robotank

Gopher

Boxing

Star Gunner

Road Runner

Krull

Crazy Climber

Kangaroo

Asterix

∗∗Defender∗∗

∗∗Phoenix∗∗

Up and Down

Space Invaders

James Bond

Enduro

Kung-Fu Master

Wizard of Wor

Name This Game

Time Pilot

Bank Heist

Beam Rider

Freeway

Pong

Zaxxon

Fishing Derby

Tennis

Q*Bert

∗∗Surround∗∗

River Raid

Battle Zone

Ice Hockey

Tutankham

H.E.R.O.

∗∗Berzerk∗∗

Seaquest

Chopper Command

Frostbite

∗∗Skiing∗∗

Bowling

Centipede

Alien

∗∗Yars Revenge∗∗

Amidar

Human

Ms. Pacman

∗∗Pitfall∗∗

Asteroids

Montezuma’s Revenge

Double DQN (tuned)

Venture

Double DQN

Gravitar

Private Eye

DQN

∗∗Solaris∗∗

0% 100% 200% 300% 400% 500%1000%1500%2000%2500%5000%7500%

Normalized score

Figure 4: Normalized scores on 57 Atari games, tested for 100 episodes per game with human starts. Compared to Mnih et al. (2015), eight games additional games were tested. These are indicated with stars and a bold font.

ters were tuned for DQN, which is a different algorithm. For the tuned version of Double DQN, we increased the number of frames between each two copies of the target network from 10,000 to 30,000, to reduce overestimations further because immediately after each switch DQN and Double DQN both revert to Q-learning. In addition, we reduced the exploration during learning from = 0.1 to = 0.01, and then used = 0.001 during evaluation. Finally, the tuned version uses a single shared bias for all action values in the top layer of the network. Each of these changes improved performance and together they result in clearly better results.3

Table 1 reports summary statistics for this evaluation (under human starts) on the 49 games from Mnih et al. (2015). Double DQN obtains clearly higher median and

3Except for Tennis, where the lower during training seemed to hurt rather than help.

mean scores. Again Gorila DQN (Nair et al. 2015) is not included in the table, but for completeness note it obtained a median of 78% and a mean of 259%. Detailed results, plus results for an additional 8 games, are available in Figure 4 and in the appendix. On several games the improvements from DQN to Double DQN are striking, in some cases bringing scores much closer to human, or even surpassing these.

Double DQN appears more robust to this more challenging evaluation, suggesting that appropriate generalizations occur and that the found solutions do not exploit the determinism of the environments. This is appealing, as it indicates progress towards ﬁnding general solutions rather than a deterministic sequence of steps that would be less robust.

## Discussion

This paper has ﬁve contributions. First, we have shown why Q-learning can be overoptimistic in large-scale problems, even if these are deterministic, due to the inherent estimation errors of learning. Second, by analyzing the value estimates on Atari games we have shown that these overestimations are more common and severe in practice than previously acknowledged. Third, we have shown that Double Q-learning can be used at scale to successfully reduce this overoptimism, resulting in more stable and reliable learning. Fourth, we have proposed a speciﬁc implementation called Double DQN, that uses the existing architecture and deep neural network of the DQN algorithm without requiring additional networks or parameters. Finally, we have shown that Double DQN ﬁnds better policies, obtaining new state-ofthe-art results on the Atari 2600 domain.

## Acknowledgments

We would like to thank Tom Schaul, Volodymyr Mnih, Marc Bellemare, Thomas Degris, Georg Ostrovski, and Richard Sutton for helpful comments, and everyone at Google DeepMind for a constructive research environment.

## References

R. Agrawal. Sample mean based index policies with O(log n) regret for the multi-armed bandit problem. Advances in Applied Probability, pages 1054–1078, 1995.

P. Auer, N. Cesa-Bianchi, and P. Fischer. Finite-time analysis of the multiarmed bandit problem. Machine learning, 47(2-3):235–256, 2002.

- L. Baird. Residual algorithms: Reinforcement learning with function approximation. In Machine Learning: Proceedings of the Twelfth International Conference, pages 30–37, 1995.
- M. G. Bellemare, Y. Naddaf, J. Veness, and M. Bowling. The arcade learning environment: An evaluation platform for general agents. J. Artif. Intell. Res. (JAIR), 47:253–279, 2013.

R. I. Brafman and M. Tennenholtz. R-max-a general polynomial time algorithm for near-optimal reinforcement learning. The Journal of Machine Learning Research, 3:213–231, 2003.

- K. Fukushima. Neocognitron: A hierarchical neural network capable of visual pattern recognition. Neural networks, 1(2):119–130, 1988.
- L. P. Kaelbling, M. L. Littman, and A. W. Moore. Reinforcement learning: A survey. Journal of Artiﬁcial Intelligence Research, 4: 237–285, 1996.

Y. LeCun, L. Bottou, Y. Bengio, and P. Haffner. Gradient-based learning applied to document recognition. Proceedings of the IEEE, 86(11):2278–2324, 1998.

L. Lin. Self-improving reactive agents based on reinforcement learning, planning and teaching. Machine learning, 8(3):293–321,

- 1992.

- H. R. Maei. Gradient temporal-difference learning algorithms. PhD thesis, University of Alberta, 2011.

V. Mnih, K. Kavukcuoglu, D. Silver, A. A. Rusu, J. Veness, M. G. Bellemare, A. Graves, M. Riedmiller, A. K. Fidjeland, G. Ostrovski, S. Petersen, C. Beattie, A. Sadik, I. Antonoglou, H. King, D. Kumaran, D. Wierstra, S. Legg, and D. Hassabis. Human-level control through deep reinforcement learning. Nature, 518(7540): 529–533, 2015.

- A. Nair, P. Srinivasan, S. Blackwell, C. Alcicek, R. Fearon, A. D. Maria, V. Panneershelvam, M. Suleyman, C. Beattie, S. Petersen, S. Legg, V. Mnih, K. Kavukcuoglu, and D. Silver. Massively parallel methods for deep reinforcement learning. In Deep Learning Workshop, ICML, 2015.

M. Riedmiller. Neural ﬁtted Q iteration - ﬁrst experiences with a data efﬁcient neural reinforcement learning method. In Proceedings of the 16th European Conference on Machine Learning, pages 317–328. Springer, 2005.

- B. Sallans and G. E. Hinton. Reinforcement learning with factored states and actions. The Journal of Machine Learning Research, 5: 1063–1088, 2004.

A. L. Strehl, L. Li, and M. L. Littman. Reinforcement learning in ﬁnite MDPs: PAC analysis. The Journal of Machine Learning Research, 10:2413–2444, 2009.

R. S. Sutton. Learning to predict by the methods of temporal differences. Machine learning, 3(1):9–44, 1988.

R. S. Sutton. Integrated architectures for learning, planning, and reacting based on approximating dynamic programming. In Proceedings of the seventh international conference on machine learning, pages 216–224, 1990.

R. S. Sutton and A. G. Barto. Introduction to reinforcement learning. MIT Press, 1998.

- R. S. Sutton, A. R. Mahmood, and M. White. An emphatic approach to the problem of off-policy temporal-difference learning. arXiv preprint arXiv:1503.04269, 2015.

I. Szita and A. L˝orincz. The many faces of optimism: a unifying approach. In Proceedings of the 25th international conference on Machine learning, pages 1048–1055. ACM, 2008.

- G. Tesauro. Temporal difference learning and td-gammon. Communications of the ACM, 38(3):58–68, 1995.

S. Thrun and A. Schwartz. Issues in using function approximation for reinforcement learning. In M. Mozer, P. Smolensky, D. Touretzky, J. Elman, and A. Weigend, editors, Proceedings of the 1993 Connectionist Models Summer School, Hillsdale, NJ, 1993. Lawrence Erlbaum.

J. N. Tsitsiklis and B. Van Roy. An analysis of temporal-difference learning with function approximation. IEEE Transactions on Automatic Control, 42(5):674–690, 1997.

- H. van Hasselt. Double Q-learning. Advances in Neural Information Processing Systems, 23:2613–2621, 2010.

H. van Hasselt. Insights in Reinforcement Learning. PhD thesis, Utrecht University, 2011.

- C. J. C. H. Watkins. Learning from delayed rewards. PhD thesis, University of Cambridge England, 1989.

