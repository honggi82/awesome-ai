# Awesome AI

[![Awesome](https://awesome.re/badge-flat.svg)](https://awesome.re)

A taxonomy-first, citation-ranked map of AI research from 2000 through 2026.

<p align="center">
  <a href="https://honggi82.github.io/awesome-ai/">
    <img src="https://img.shields.io/badge/Open_Interactive_Website-honggi82.github.io%2Fawesome--ai-0f766e?style=for-the-badge" alt="Open Interactive Website">
  </a>
</p>

Generated on 2026-06-26 from free public Semantic Scholar metadata. This edition investigates up to 1,000 AI-related candidate papers per year for 2000-2026, keeps an audited candidate pool of 27,000 records, selects the top 100 papers from each year by citation count (2,700 papers total), and reorganizes them by AI research taxonomy.

## Project Links

- Open Interactive Website: https://honggi82.github.io/awesome-ai/
- Selected dataset: `data/papers_2000_2026.csv`
- Taxonomy dataset with paper-level ideas, strengths, and limitations: `data/papers_taxonomy_2000_2026.csv`
- Precomputed period and language analysis: `data/period_analysis_2000_2026.json`
- Candidate Pool: `data/candidates_top1000_2000_2026.csv`
- English review draft: `paper/review_en.html`, `paper/review_en.docx`
- Korean review draft: `paper/review_ko.html`

## Keywords Convention

These badges define the AI keyword tags used to read and extend this collection.

- ![machine-learning](https://img.shields.io/badge/keyword-machine--learning-475569) **machine-learning**: Statistical learning, neural networks, SVMs, trees/boosting, data mining, pattern recognition, clustering, or core ML methods.
- ![foundation-models](https://img.shields.io/badge/keyword-foundation--models-2563eb) **foundation-models**: Large language models, foundation models, scaling, prompting, alignment, or retrieval-augmented systems.
- ![generative-ai](https://img.shields.io/badge/keyword-generative--ai-a855f7) **generative-ai**: Generative adversarial, diffusion, synthetic media, text-to-image, or other model-based generation work.
- ![multimodal](https://img.shields.io/badge/keyword-multimodal-0891b2) **multimodal**: Vision-language, audio-language, video-language, or cross-modal representation learning.
- ![nlp](https://img.shields.io/badge/keyword-nlp-f59e0b) **nlp**: Natural language processing, language modeling, retrieval, dialogue, summarization, or speech-language work.
- ![vision](https://img.shields.io/badge/keyword-vision-0f766e) **vision**: Computer vision, image/video understanding, object detection, segmentation, or visual recognition.
- ![reinforcement-learning](https://img.shields.io/badge/keyword-reinforcement--learning-dc2626) **reinforcement-learning**: Reinforcement learning, agents, planning, control, robotics, reward modeling, or human feedback.
- ![trustworthy-ai](https://img.shields.io/badge/keyword-trustworthy--ai-be123c) **trustworthy-ai**: Explainability, robustness, safety, fairness, uncertainty, privacy, bias, or responsible AI.
- ![graph-learning](https://img.shields.io/badge/keyword-graph--learning-4f46e5) **graph-learning**: Graph neural networks, recommender systems, knowledge graphs, graph benchmarks, or graph-based core AI methods.
- ![ai4science](https://img.shields.io/badge/keyword-ai4science-16a34a) **ai4science**: AI for science, healthcare, biology, molecules, proteins, robotics, autonomous systems, or clinical domains.

## Taxonomy Overview

- **Total selected papers**: 2,700 papers
- **Candidate pool audited**: 27,000 papers (2000: 1,000, 2001: 1,000, 2002: 1,000, 2003: 1,000, 2004: 1,000, 2005: 1,000, 2006: 1,000, 2007: 1,000, 2008: 1,000, 2009: 1,000, 2010: 1,000, 2011: 1,000, 2012: 1,000, 2013: 1,000, 2014: 1,000, 2015: 1,000, 2016: 1,000, 2017: 1,000, 2018: 1,000, 2019: 1,000, 2020: 1,000, 2021: 1,000, 2022: 1,000, 2023: 1,000, 2024: 1,000, 2025: 1,000, 2026: 1,000)
- **Citation count in selected set**: 8,567,142
- **General AI Methods and Systems**: 688 papers
- **Foundation Models and Large Language Models**: 490 papers
- **Vision and Multimodal Learning**: 477 papers
- **AI for Science, Healthcare, and Robotics**: 279 papers
- **Graph Learning, Recommendation, and Core Methods**: 195 papers
- **Reinforcement Learning and Agents**: 175 papers
- **Natural Language Processing and Knowledge**: 160 papers
- **Trustworthy, Explainable, and Responsible AI**: 98 papers
- **Generative Models and Synthetic Media**: 83 papers
- **Representation, Self-Supervised, and Transfer Learning**: 55 papers

## Taxonomy Collections

### General AI Methods and Systems

- Papers selected: **688**
- Years covered: **2000-2026**
- Citation count in selected set: **1,366,275**
- Category Overview (main research trends):
  - General AI methods consolidate architectures, benchmarks, surveys, datasets, and system-level observations that cut across subfields.
  - This category often captures high-citation survey or infrastructure work that shapes how later papers define progress.
  - Citation-ranked views can be especially useful here, but they should be read as a map of influence rather than a complete quality assessment.
- Limitations:
  - Survey and infrastructure papers can dominate citations while empirical evidence remains distributed across subfields.
  - Broad claims need careful mapping to specific tasks, datasets, and operational constraints.
  - Metadata-driven ranking cannot replace expert reading of full papers and experimental details.

<details>
<summary><strong>Show representative papers for General AI Methods and Systems</strong></summary>

<table width="100%">
<colgroup>
<col width="5%">
<col width="22%">
<col width="12%">
<col width="12%">
<col width="25%">
<col width="12%">
<col width="12%">
</colgroup>
<thead><tr>
<th align="right">Rank</th><th>Paper</th><th>Meta</th><th>Keywords</th><th>Key idea</th><th>Strengths</th><th>Limitations</th>
</tr></thead><tbody>
<tr>
<td align="right">11</td>
<td>[XGBoost: A Scalable Tree Boosting System](https://doi.org/10.1145/2939672.2939785)<br><sub>Tianqi Chen, Carlos Guestrin</sub></td>
<td>2016<br>Knowledge Discovery and Data Mining<br>55,903 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"></td>
<td>Tree boosting is a highly effective and widely used machine learning method.</td>
<td>high citation signal (55,903); influential citation signal (4,189); open-access PDF metadata</td>
<td>Survey and infrastructure papers can dominate citations while empirical evidence remains distributed across subfields.; Broad claims need careful mapping to specific tasks, datasets, and operational constraints.; Metadata-driven ranking cannot replace expert reading of full papers and experimental details.</td>
</tr>
<tr>
<td align="right">17</td>
<td>[LIBSVM: A library for support vector machines](https://doi.org/10.1145/1961189.1961199)<br><sub>Chih-Chung Chang, Chih-Jen Lin</sub></td>
<td>2011<br>TIST<br>44,933 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"></td>
<td>Positions LIBSVM: A library for support vector machines within General AI Methods and Systems.</td>
<td>high citation signal (44,933); influential citation signal (3,802)</td>
<td>Survey and infrastructure papers can dominate citations while empirical evidence remains distributed across subfields.; Broad claims need careful mapping to specific tasks, datasets, and operational constraints.; Metadata-driven ranking cannot replace expert reading of full papers and experimental details.</td>
</tr>
<tr>
<td align="right">18</td>
<td>[Dropout: a simple way to prevent neural networks from overfitting](https://doi.org/10.5555/2627435.2670313)<br><sub>Nitish Srivastava, Geoffrey E. Hinton, A. Krizhevsky, I. Sutskever, R. Salakhutdinov</sub></td>
<td>2014<br>Journal of machine learning research<br>43,470 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"></td>
<td>Positions Dropout: a simple way to prevent neural networks from overfitting within General AI Methods and Systems.</td>
<td>high citation signal (43,470); influential citation signal (3,879); recognized venue</td>
<td>Survey and infrastructure papers can dominate citations while empirical evidence remains distributed across subfields.; Broad claims need careful mapping to specific tasks, datasets, and operational constraints.; Metadata-driven ranking cannot replace expert reading of full papers and experimental details.</td>
</tr>
<tr>
<td align="right">46</td>
<td>[The Elements of Statistical Learning: Data Mining, Inference, and Prediction](https://doi.org/10.1007/978-0-387-84858-7)<br><sub>T. Hastie, J. Friedman, R. Tibshirani</sub></td>
<td>2001<br>Springer Series in Statistics<br>21,652 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"></td>
<td>Positions The Elements of Statistical Learning: Data Mining, Inference, and Prediction within General AI Methods and Systems.</td>
<td>high citation signal (21,652); influential citation signal (1,197)</td>
<td>Survey and infrastructure papers can dominate citations while empirical evidence remains distributed across subfields.; Broad claims need careful mapping to specific tasks, datasets, and operational constraints.; Metadata-driven ranking cannot replace expert reading of full papers and experimental details.</td>
</tr>
<tr>
<td align="right">48</td>
<td>[The WEKA data mining software: an update](https://doi.org/10.1145/1656274.1656278)<br><sub>M. Hall, E. Frank, G. Holmes, Bernhard Pfahringer, P. Reutemann, I. Witten</sub></td>
<td>2009<br>SKDD<br>20,731 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"></td>
<td>Positions The WEKA data mining software: an update within General AI Methods and Systems.</td>
<td>high citation signal (20,731); influential citation signal (2,167); recognized venue</td>
<td>Survey and infrastructure papers can dominate citations while empirical evidence remains distributed across subfields.; Broad claims need careful mapping to specific tasks, datasets, and operational constraints.; Metadata-driven ranking cannot replace expert reading of full papers and experimental details.</td>
</tr>
<tr>
<td align="right">53</td>
<td>[Classification and Regression by randomForest](https://www.semanticscholar.org/paper/6e633b41d93051375ef9135102d54fa097dc8cf8)<br><sub>Andy Liaw, M. Wiener</sub></td>
<td>2007<br>Unknown venue<br>19,408 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"></td>
<td>Positions Classification and Regression by randomForest within General AI Methods and Systems.</td>
<td>high citation signal (19,408); influential citation signal (1,114)</td>
<td>Survey and infrastructure papers can dominate citations while empirical evidence remains distributed across subfields.; Broad claims need careful mapping to specific tasks, datasets, and operational constraints.; Metadata-driven ranking cannot replace expert reading of full papers and experimental details.</td>
</tr>
<tr>
<td align="right">55</td>
<td>[Understanding the difficulty of training deep feedforward neural networks](https://www.semanticscholar.org/paper/ea9d2a2b4ce11aaf85136840c65f3bc9c03ab649)<br><sub>Xavier Glorot, Yoshua Bengio</sub></td>
<td>2010<br>International Conference on Artificial Intelligence and Statistics<br>19,308 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"></td>
<td>Positions Understanding the difficulty of training deep feedforward neural networks within General AI Methods and Systems.</td>
<td>high citation signal (19,308); influential citation signal (918); recognized venue</td>
<td>Survey and infrastructure papers can dominate citations while empirical evidence remains distributed across subfields.; Broad claims need careful mapping to specific tasks, datasets, and operational constraints.; Metadata-driven ranking cannot replace expert reading of full papers and experimental details.</td>
</tr>
<tr>
<td align="right">56</td>
<td>[Mastering the game of Go with deep neural networks and tree search](https://doi.org/10.1038/nature16961)<br><sub>David Silver, Aja Huang, Chris J. Maddison, A. Guez, L. Sifre, George van den Driessche, Julian Schrittwieser, Ioannis Antonoglou, et al.</sub></td>
<td>2016<br>Nature<br>18,935 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"></td>
<td>Positions Mastering the game of Go with deep neural networks and tree search within General AI Methods and Systems.</td>
<td>high citation signal (18,935); influential citation signal (617); recognized venue; open-access PDF metadata</td>
<td>Survey and infrastructure papers can dominate citations while empirical evidence remains distributed across subfields.; Broad claims need careful mapping to specific tasks, datasets, and operational constraints.; Metadata-driven ranking cannot replace expert reading of full papers and experimental details.</td>
</tr>
<tr>
<td align="right">57</td>
<td>[The Elements of Statistical Learning: Data Mining, Inference, and Prediction](https://doi.org/10.1198/jasa.2004.s339)<br><sub>D. Ruppert</sub></td>
<td>2004<br>Unknown venue<br>18,639 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"></td>
<td>Positions The Elements of Statistical Learning: Data Mining, Inference, and Prediction within General AI Methods and Systems.</td>
<td>high citation signal (18,639); influential citation signal (2,028)</td>
<td>Survey and infrastructure papers can dominate citations while empirical evidence remains distributed across subfields.; Broad claims need careful mapping to specific tasks, datasets, and operational constraints.; Metadata-driven ranking cannot replace expert reading of full papers and experimental details.</td>
</tr>
<tr>
<td align="right">63</td>
<td>[Data Mining Practical Machine Learning Tools and Techniques](https://www.semanticscholar.org/paper/730ca170962a58607e092035beb2afc4b5fa6242)<br><sub>อนิรุธ สืบสิงห์</sub></td>
<td>2014<br>Unknown venue<br>17,706 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"></td>
<td>Positions Data Mining Practical Machine Learning Tools and Techniques within General AI Methods and Systems.</td>
<td>high citation signal (17,706); influential citation signal (1,797)</td>
<td>Survey and infrastructure papers can dominate citations while empirical evidence remains distributed across subfields.; Broad claims need careful mapping to specific tasks, datasets, and operational constraints.; Metadata-driven ranking cannot replace expert reading of full papers and experimental details.</td>
</tr>
<tr><td colspan="7"><em>678 additional selected papers in this category are available in the dataset and website.</em></td></tr>
</tbody></table>

</details>

### Foundation Models and Large Language Models

- Papers selected: **490**
- Years covered: **2000-2026**
- Citation count in selected set: **1,376,019**
- Category Overview (main research trends):
  - The main trend is a shift from task-specific NLP systems toward general-purpose foundation models that transfer across tasks through prompting, retrieval, and instruction tuning.
  - Scaling laws, retrieval augmentation, alignment, and data governance are now central design axes rather than afterthoughts.
  - Citation-ranked work tends to emphasize architectures, pretraining corpora, benchmark behavior, and broad capability evaluation.
- Limitations:
  - Capability gains are difficult to separate from data scale, benchmark leakage, and evaluation prompt sensitivity.
  - Alignment and safety claims often need stronger real-world and multilingual validation.
  - Compute-intensive training can limit reproducibility and concentrate follow-up work around a small number of institutions.

<details>
<summary><strong>Show representative papers for Foundation Models and Large Language Models</strong></summary>

<table width="100%">
<colgroup>
<col width="5%">
<col width="22%">
<col width="12%">
<col width="12%">
<col width="25%">
<col width="12%">
<col width="12%">
</colgroup>
<thead><tr>
<th align="right">Rank</th><th>Paper</th><th>Meta</th><th>Keywords</th><th>Key idea</th><th>Strengths</th><th>Limitations</th>
</tr></thead><tbody>
<tr>
<td align="right">6</td>
<td>[Scikit-learn: Machine Learning in Python](https://doi.org/10.5555/1953048.2078195)<br><sub>Fabian Pedregosa, G. Varoquaux, Alexandre Gramfort, V. Michel, B. Thirion, O. Grisel, Mathieu Blondel, Gilles Louppe, et al.</sub></td>
<td>2011<br>Journal of machine learning research<br>90,486 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"></td>
<td>Scikit-learn is a Python module integrating a wide range of state-of-the-art machine learning algorithms for medium-scale supervised and unsupervised problems.</td>
<td>high citation signal (90,486); influential citation signal (7,928); recognized venue</td>
<td>Capability gains are difficult to separate from data scale, benchmark leakage, and evaluation prompt sensitivity.; Alignment and safety claims often need stronger real-world and multilingual validation.; Compute-intensive training can limit reproducibility and concentrate follow-up work around a small number of institutions.</td>
</tr>
<tr>
<td align="right">10</td>
<td>[Language Models are Few-Shot Learners](https://arxiv.org/abs/2005.14165)<br><sub>Tom B. Brown, Benjamin Mann, Nick Ryder, Melanie Subbiah, J. Kaplan, Prafulla Dhariwal, Arvind Neelakantan, Pranav Shyam, et al.</sub></td>
<td>2020<br>Neural Information Processing Systems<br>59,605 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>Recent work has demonstrated substantial gains on many NLP tasks and benchmarks by pre-training on a large corpus of text followed by fine-tuning on a specific task.</td>
<td>high citation signal (59,605); influential citation signal (5,279)</td>
<td>Capability gains are difficult to separate from data scale, benchmark leakage, and evaluation prompt sensitivity.; Alignment and safety claims often need stronger real-world and multilingual validation.; Compute-intensive training can limit reproducibility and concentrate follow-up work around a small number of institutions.</td>
</tr>
<tr>
<td align="right">12</td>
<td>[PyTorch: An Imperative Style, High-Performance Deep Learning Library](https://arxiv.org/abs/1912.01703)<br><sub>Adam Paszke, Sam Gross, Francisco Massa, Adam Lerer, James Bradbury, Gregory Chanan, Trevor Killeen, Zeming Lin, et al.</sub></td>
<td>2019<br>Neural Information Processing Systems<br>52,984 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"></td>
<td>Deep learning frameworks have often focused on either usability or speed, but not both.</td>
<td>high citation signal (52,984); influential citation signal (5,672)</td>
<td>Capability gains are difficult to separate from data scale, benchmark leakage, and evaluation prompt sensitivity.; Alignment and safety claims often need stronger real-world and multilingual validation.; Compute-intensive training can limit reproducibility and concentrate follow-up work around a small number of institutions.</td>
</tr>
<tr>
<td align="right">30</td>
<td>[Language Models are Unsupervised Multitask Learners](https://www.semanticscholar.org/paper/9405cc0d6169988371b2755e573cc28650d14dfe)<br><sub>Alec Radford, Jeff Wu, R. Child, D. Luan, Dario Amodei, I. Sutskever</sub></td>
<td>2019<br>Unknown venue<br>29,070 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"></td>
<td>Positions Language Models are Unsupervised Multitask Learners within Foundation Models and Large Language Models.</td>
<td>high citation signal (29,070); influential citation signal (4,029)</td>
<td>Capability gains are difficult to separate from data scale, benchmark leakage, and evaluation prompt sensitivity.; Alignment and safety claims often need stronger real-world and multilingual validation.; Compute-intensive training can limit reproducibility and concentrate follow-up work around a small number of institutions.</td>
</tr>
<tr>
<td align="right">37</td>
<td>[Communication-Efficient Learning of Deep Networks from Decentralized Data](https://arxiv.org/abs/1602.05629)<br><sub>H. B. McMahan, Eider Moore, Daniel Ramage, S.C.D. Hampson, B. A. Y. Arcas</sub></td>
<td>2016<br>International Conference on Artificial Intelligence and Statistics<br>24,984 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>Modern mobile devices have access to a wealth of data suitable for learning models, which in turn can greatly improve the user experience on the device.</td>
<td>high citation signal (24,984); influential citation signal (5,037); recognized venue</td>
<td>Capability gains are difficult to separate from data scale, benchmark leakage, and evaluation prompt sensitivity.; Alignment and safety claims often need stronger real-world and multilingual validation.; Compute-intensive training can limit reproducibility and concentrate follow-up work around a small number of institutions.</td>
</tr>
<tr>
<td align="right">38</td>
<td>[Distilling the Knowledge in a Neural Network](https://arxiv.org/abs/1503.02531)<br><sub>Geoffrey E. Hinton, O. Vinyals, J. Dean</sub></td>
<td>2015<br>arXiv.org<br>24,671 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"></td>
<td>A very simple way to improve the performance of almost any machine learning algorithm is to train many different models on the same data and then to average their predictions.</td>
<td>high citation signal (24,671); influential citation signal (2,790)</td>
<td>Capability gains are difficult to separate from data scale, benchmark leakage, and evaluation prompt sensitivity.; Alignment and safety claims often need stronger real-world and multilingual validation.; Compute-intensive training can limit reproducibility and concentrate follow-up work around a small number of institutions.</td>
</tr>
<tr>
<td align="right">45</td>
<td>[Training language models to follow instructions with human feedback](https://doi.org/10.52202/068431-2011)<br><sub>Long Ouyang, Jeff Wu, Xu Jiang, Diogo Almeida, Carroll L. Wainwright, Pamela Mishkin, Chong Zhang, S. Agarwal, et al.</sub></td>
<td>2022<br>Neural Information Processing Systems<br>21,755 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"></td>
<td>Making language models bigger does not inherently make them better at following a user&#x27;s intent.</td>
<td>high citation signal (21,755); influential citation signal (2,276)</td>
<td>Capability gains are difficult to separate from data scale, benchmark leakage, and evaluation prompt sensitivity.; Alignment and safety claims often need stronger real-world and multilingual validation.; Compute-intensive training can limit reproducibility and concentrate follow-up work around a small number of institutions.</td>
</tr>
<tr>
<td align="right">50</td>
<td>[LLaMA: Open and Efficient Foundation Language Models](https://arxiv.org/abs/2302.13971)<br><sub>Hugo Touvron, Thibaut Lavril, Gautier Izacard, X. Martinet, M. Lachaux, Timothée Lacroix, Baptiste Rozière, Naman Goyal, et al.</sub></td>
<td>2023<br>arXiv.org<br>20,427 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"></td>
<td>We introduce LLaMA, a collection of foundation language models ranging from 7B to 65B parameters.</td>
<td>high citation signal (20,427); influential citation signal (2,131)</td>
<td>Capability gains are difficult to separate from data scale, benchmark leakage, and evaluation prompt sensitivity.; Alignment and safety claims often need stronger real-world and multilingual validation.; Compute-intensive training can limit reproducibility and concentrate follow-up work around a small number of institutions.</td>
</tr>
<tr>
<td align="right">51</td>
<td>[LoRA: Low-Rank Adaptation of Large Language Models](https://arxiv.org/abs/2106.09685)<br><sub>J. Hu, Yelong Shen, Phillip Wallis, Zeyuan Allen-Zhu, Yuanzhi Li, Shean Wang, Weizhu Chen</sub></td>
<td>2021<br>International Conference on Learning Representations<br>20,108 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>An important paradigm of natural language processing consists of large-scale pre-training on general domain data and adaptation to particular tasks or domains.</td>
<td>high citation signal (20,108); influential citation signal (2,862)</td>
<td>Capability gains are difficult to separate from data scale, benchmark leakage, and evaluation prompt sensitivity.; Alignment and safety claims often need stronger real-world and multilingual validation.; Compute-intensive training can limit reproducibility and concentrate follow-up work around a small number of institutions.</td>
</tr>
<tr>
<td align="right">54</td>
<td>[Chain of Thought Prompting Elicits Reasoning in Large Language Models](https://doi.org/10.52202/068431-1800)<br><sub>Jason Wei, Xuezhi Wang, Dale Schuurmans, Maarten Bosma, Ed H. Chi, F. Xia, Quoc Le, Denny Zhou</sub></td>
<td>2022<br>Neural Information Processing Systems<br>19,316 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>We explore how generating a chain of thought -- a series of intermediate reasoning steps -- significantly improves the ability of large language models to perform complex reasoning.</td>
<td>high citation signal (19,316); influential citation signal (1,316)</td>
<td>Capability gains are difficult to separate from data scale, benchmark leakage, and evaluation prompt sensitivity.; Alignment and safety claims often need stronger real-world and multilingual validation.; Compute-intensive training can limit reproducibility and concentrate follow-up work around a small number of institutions.</td>
</tr>
<tr><td colspan="7"><em>480 additional selected papers in this category are available in the dataset and website.</em></td></tr>
</tbody></table>

</details>

### Vision and Multimodal Learning

- Papers selected: **477**
- Years covered: **2000-2026**
- Citation count in selected set: **2,784,705**
- Category Overview (main research trends):
  - Vision research is increasingly organized around transformer backbones, self-supervised pretraining, segmentation/detection foundation models, and vision-language alignment.
  - The strongest papers often combine large-scale data, reusable architectures, and transfer to multiple downstream tasks.
  - Multimodal work is pushing vision beyond single-task recognition toward retrieval, grounding, robotics, and generative interfaces.
- Limitations:
  - Large-scale benchmark success can overstate robustness under distribution shift, rare classes, and real deployment constraints.
  - Multimodal alignment may inherit biases and spurious correlations from web-scale data.
  - High-performing systems often require data and compute resources that are hard for smaller labs to reproduce.

<details>
<summary><strong>Show representative papers for Vision and Multimodal Learning</strong></summary>

<table width="100%">
<colgroup>
<col width="5%">
<col width="22%">
<col width="12%">
<col width="12%">
<col width="25%">
<col width="12%">
<col width="12%">
</colgroup>
<thead><tr>
<th align="right">Rank</th><th>Paper</th><th>Meta</th><th>Keywords</th><th>Key idea</th><th>Strengths</th><th>Limitations</th>
</tr></thead><tbody>
<tr>
<td align="right">1</td>
<td>[Deep Residual Learning for Image Recognition](https://doi.org/10.1109/cvpr.2016.90)<br><sub>Kaiming He, X. Zhang, Shaoqing Ren, Jian Sun</sub></td>
<td>2015<br>Computer Vision and Pattern Recognition<br>231,401 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>Deeper neural networks are more difficult to train.</td>
<td>high citation signal (231,401); influential citation signal (32,345); recognized venue; open-access PDF metadata</td>
<td>Large-scale benchmark success can overstate robustness under distribution shift, rare classes, and real deployment constraints.; Multimodal alignment may inherit biases and spurious correlations from web-scale data.; High-performing systems often require data and compute resources that are hard for smaller labs to reproduce.</td>
</tr>
<tr>
<td align="right">3</td>
<td>[ImageNet classification with deep convolutional neural networks](https://doi.org/10.1145/3065386)<br><sub>A. Krizhevsky, I. Sutskever, Geoffrey E. Hinton</sub></td>
<td>2012<br>Communications of the ACM<br>129,676 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"></td>
<td>Positions ImageNet classification with deep convolutional neural networks within Vision and Multimodal Learning.</td>
<td>high citation signal (129,676); influential citation signal (13,395); open-access PDF metadata</td>
<td>Large-scale benchmark success can overstate robustness under distribution shift, rare classes, and real deployment constraints.; Multimodal alignment may inherit biases and spurious correlations from web-scale data.; High-performing systems often require data and compute resources that are hard for smaller labs to reproduce.</td>
</tr>
<tr>
<td align="right">5</td>
<td>[Very Deep Convolutional Networks for Large-Scale Image Recognition](https://arxiv.org/abs/1409.1556)<br><sub>K. Simonyan, Andrew Zisserman</sub></td>
<td>2014<br>International Conference on Learning Representations<br>112,194 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>In this work we investigate the effect of the convolutional network depth on its accuracy in the large-scale image recognition setting.</td>
<td>high citation signal (112,194); influential citation signal (14,543)</td>
<td>Large-scale benchmark success can overstate robustness under distribution shift, rare classes, and real deployment constraints.; Multimodal alignment may inherit biases and spurious correlations from web-scale data.; High-performing systems often require data and compute resources that are hard for smaller labs to reproduce.</td>
</tr>
<tr>
<td align="right">7</td>
<td>[ImageNet: A large-scale hierarchical image database](https://doi.org/10.1109/cvpr.2009.5206848)<br><sub>Jia Deng, Wei Dong, R. Socher, Li-Jia Li, K. Li, Li Fei-Fei</sub></td>
<td>2009<br>2009 IEEE Conference on Computer Vision and Pattern Recognition<br>73,960 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>Positions ImageNet: A large-scale hierarchical image database within Vision and Multimodal Learning.</td>
<td>high citation signal (73,960); influential citation signal (10,493); recognized venue; open-access PDF metadata</td>
<td>Large-scale benchmark success can overstate robustness under distribution shift, rare classes, and real deployment constraints.; Multimodal alignment may inherit biases and spurious correlations from web-scale data.; High-performing systems often require data and compute resources that are hard for smaller labs to reproduce.</td>
</tr>
<tr>
<td align="right">8</td>
<td>[Faster R-CNN: Towards Real-Time Object Detection with Region Proposal Networks](https://doi.org/10.1109/tpami.2016.2577031)<br><sub>Shaoqing Ren, Kaiming He, Ross B. Girshick, Jian Sun</sub></td>
<td>2015<br>IEEE Transactions on Pattern Analysis and Machine Intelligence<br>73,399 citations</td>
<td><img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>State-of-the-art object detection networks depend on region proposal algorithms to hypothesize object locations.</td>
<td>high citation signal (73,399); influential citation signal (9,719); recognized venue; open-access PDF metadata</td>
<td>Large-scale benchmark success can overstate robustness under distribution shift, rare classes, and real deployment constraints.; Multimodal alignment may inherit biases and spurious correlations from web-scale data.; High-performing systems often require data and compute resources that are hard for smaller labs to reproduce.</td>
</tr>
<tr>
<td align="right">9</td>
<td>[An Image is Worth 16x16 Words: Transformers for Image Recognition at Scale](https://arxiv.org/abs/2010.11929)<br><sub>Alexey Dosovitskiy, Lucas Beyer, Alexander Kolesnikov, Dirk Weissenborn, Xiaohua Zhai, Thomas Unterthiner, Mostafa Dehghani, M. Minderer, et al.</sub></td>
<td>2020<br>International Conference on Learning Representations<br>64,585 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>While the Transformer architecture has become the de-facto standard for natural language processing tasks, its applications to computer vision remain limited.</td>
<td>high citation signal (64,585); influential citation signal (7,105)</td>
<td>Large-scale benchmark success can overstate robustness under distribution shift, rare classes, and real deployment constraints.; Multimodal alignment may inherit biases and spurious correlations from web-scale data.; High-performing systems often require data and compute resources that are hard for smaller labs to reproduce.</td>
</tr>
<tr>
<td align="right">13</td>
<td>[Learning Transferable Visual Models From Natural Language Supervision](https://arxiv.org/abs/2103.00020)<br><sub>Alec Radford, Jong Wook Kim, Chris Hallacy, A. Ramesh, Gabriel Goh, S. Agarwal, G. Sastry, Amanda Askell, et al.</sub></td>
<td>2021<br>International Conference on Machine Learning<br>50,664 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="multimodal" src="https://img.shields.io/badge/keyword-multimodal-0891b2"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>State-of-the-art computer vision systems are trained to predict a fixed set of predetermined object categories.</td>
<td>high citation signal (50,664); influential citation signal (9,732); recognized venue</td>
<td>Large-scale benchmark success can overstate robustness under distribution shift, rare classes, and real deployment constraints.; Multimodal alignment may inherit biases and spurious correlations from web-scale data.; High-performing systems often require data and compute resources that are hard for smaller labs to reproduce.</td>
</tr>
<tr>
<td align="right">14</td>
<td>[Going deeper with convolutions](https://doi.org/10.1109/cvpr.2015.7298594)<br><sub>Christian Szegedy, Wei Liu, Yangqing Jia, P. Sermanet, Scott E. Reed, Dragomir Anguelov, D. Erhan, Vincent Vanhoucke, et al.</sub></td>
<td>2014<br>Computer Vision and Pattern Recognition<br>47,471 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>We propose a deep convolutional neural network architecture codenamed Inception that achieves the new state of the art for classification and detection in the ImageNet Large-Scale Visual Recognition Challenge 2014 (ILSVRC14).</td>
<td>high citation signal (47,471); influential citation signal (4,438); recognized venue; open-access PDF metadata</td>
<td>Large-scale benchmark success can overstate robustness under distribution shift, rare classes, and real deployment constraints.; Multimodal alignment may inherit biases and spurious correlations from web-scale data.; High-performing systems often require data and compute resources that are hard for smaller labs to reproduce.</td>
</tr>
<tr>
<td align="right">15</td>
<td>[Batch Normalization: Accelerating Deep Network Training by Reducing Internal Covariate Shift](https://arxiv.org/abs/1502.03167)<br><sub>Sergey Ioffe, Christian Szegedy</sub></td>
<td>2015<br>International Conference on Machine Learning<br>46,995 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>Training Deep Neural Networks is complicated by the fact that the distribution of each layer&#x27;s inputs changes during training, as the parameters of the previous layers change.</td>
<td>high citation signal (46,995); influential citation signal (2,264); recognized venue</td>
<td>Large-scale benchmark success can overstate robustness under distribution shift, rare classes, and real deployment constraints.; Multimodal alignment may inherit biases and spurious correlations from web-scale data.; High-performing systems often require data and compute resources that are hard for smaller labs to reproduce.</td>
</tr>
<tr>
<td align="right">16</td>
<td>[You Only Look Once: Unified, Real-Time Object Detection](https://doi.org/10.1109/cvpr.2016.91)<br><sub>J. Redmon, S. Divvala, Ross B. Girshick, Ali Farhadi</sub></td>
<td>2015<br>Computer Vision and Pattern Recognition<br>46,088 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>We present YOLO, a new approach to object detection.</td>
<td>high citation signal (46,088); influential citation signal (3,280); recognized venue; open-access PDF metadata</td>
<td>Large-scale benchmark success can overstate robustness under distribution shift, rare classes, and real deployment constraints.; Multimodal alignment may inherit biases and spurious correlations from web-scale data.; High-performing systems often require data and compute resources that are hard for smaller labs to reproduce.</td>
</tr>
<tr><td colspan="7"><em>467 additional selected papers in this category are available in the dataset and website.</em></td></tr>
</tbody></table>

</details>

### AI for Science, Healthcare, and Robotics

- Papers selected: **279**
- Years covered: **2000-2026**
- Citation count in selected set: **633,472**
- Category Overview (main research trends):
  - Applied AI for science and healthcare is shifting from proof-of-concept prediction toward validated workflows for biology, medicine, molecules, and robotics.
  - The most visible work couples domain data with deep learning architectures that can transfer into laboratory, clinical, or embodied settings.
  - Evaluation increasingly needs external validation, prospective testing, reproducible datasets, and domain-specific safety constraints.
- Limitations:
  - External validation, prospective testing, and domain expert review are often more important than retrospective benchmark scores.
  - Clinical, biological, or robotic deployment can fail when data collection protocols differ from training assumptions.
  - Safety, interpretability, uncertainty, and regulatory evidence remain essential for translation.

<details>
<summary><strong>Show representative papers for AI for Science, Healthcare, and Robotics</strong></summary>

<table width="100%">
<colgroup>
<col width="5%">
<col width="22%">
<col width="12%">
<col width="12%">
<col width="25%">
<col width="12%">
<col width="12%">
</colgroup>
<thead><tr>
<th align="right">Rank</th><th>Paper</th><th>Meta</th><th>Keywords</th><th>Key idea</th><th>Strengths</th><th>Limitations</th>
</tr></thead><tbody>
<tr>
<td align="right">21</td>
<td>[Highly accurate protein structure prediction with AlphaFold](https://doi.org/10.1038/s41586-021-03819-2)<br><sub>J. Jumper, Richard Evans, A. Pritzel, Tim Green, Michael Figurnov, O. Ronneberger, Kathryn Tunyasuvunakool, Russ Bates, et al.</sub></td>
<td>2021<br>Nature<br>36,737 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>Proteins are essential to life, and understanding their structure can facilitate a mechanistic understanding of their function.</td>
<td>high citation signal (36,737); influential citation signal (3,767); recognized venue; open-access PDF metadata</td>
<td>External validation, prospective testing, and domain expert review are often more important than retrospective benchmark scores.; Clinical, biological, or robotic deployment can fail when data collection protocols differ from training assumptions.; Safety, interpretability, uncertainty, and regulatory evidence remain essential for translation.</td>
</tr>
<tr>
<td align="right">33</td>
<td>[Graph Attention Networks](https://doi.org/10.17863/cam.48429)<br><sub>Petar Velickovic, Guillem Cucurull, Arantxa Casanova, Adriana Romero, Pietro Liò, Yoshua Bengio</sub></td>
<td>2017<br>International Conference on Learning Representations<br>26,745 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="graph-learning" src="https://img.shields.io/badge/keyword-graph--learning-4f46e5"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>We present graph attention networks (GATs), novel neural network architectures that operate on graph-structured data, leveraging masked self-attentional layers to address the shortcomings of prior methods based on graph convolutions or their approximations.</td>
<td>high citation signal (26,745); influential citation signal (3,772)</td>
<td>External validation, prospective testing, and domain expert review are often more important than retrospective benchmark scores.; Clinical, biological, or robotic deployment can fail when data collection protocols differ from training assumptions.; Safety, interpretability, uncertainty, and regulatory evidence remain essential for translation.</td>
</tr>
<tr>
<td align="right">74</td>
<td>[Are we ready for autonomous driving? The KITTI vision benchmark suite](https://doi.org/10.1109/cvpr.2012.6248074)<br><sub>Andreas Geiger, Philip Lenz, R. Urtasun</sub></td>
<td>2012<br>2012 IEEE Conference on Computer Vision and Pattern Recognition<br>15,202 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>Positions Are we ready for autonomous driving? The KITTI vision benchmark suite within AI for Science, Healthcare, and Robotics.</td>
<td>high citation signal (15,202); influential citation signal (2,668); recognized venue</td>
<td>External validation, prospective testing, and domain expert review are often more important than retrospective benchmark scores.; Clinical, biological, or robotic deployment can fail when data collection protocols differ from training assumptions.; Safety, interpretability, uncertainty, and regulatory evidence remain essential for translation.</td>
</tr>
<tr>
<td align="right">91</td>
<td>[A survey on deep learning in medical image analysis](https://doi.org/10.1016/j.media.2017.07.005)<br><sub>G. Litjens, Thijs Kooi, B. Bejnordi, A. Setio, F. Ciompi, Mohsen Ghafoorian, J. Laak, B. Ginneken, et al.</sub></td>
<td>2017<br>Medical Image Anal.<br>13,570 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>Deep learning algorithms, in particular convolutional networks, have rapidly become a methodology of choice for analyzing medical images.</td>
<td>high citation signal (13,570); influential citation signal (314); open-access PDF metadata</td>
<td>External validation, prospective testing, and domain expert review are often more important than retrospective benchmark scores.; Clinical, biological, or robotic deployment can fail when data collection protocols differ from training assumptions.; Safety, interpretability, uncertainty, and regulatory evidence remain essential for translation.</td>
</tr>
<tr>
<td align="right">92</td>
<td>[K/DOQI clinical practice guidelines for chronic kidney disease: evaluation, classification, and stratification.](https://www.semanticscholar.org/paper/82ebe5479edf45c47a02e0d7d5e7e18ebea16417)<br><sub>A. Levey, J. Coresh, K. Bolton, B. Culleton, K. Harvey, T. Ikizler, C. Johnson, A. Kausz, et al.</sub></td>
<td>2002<br>American Journal of Kidney Diseases<br>13,177 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>Positions K/DOQI clinical practice guidelines for chronic kidney disease: evaluation, classification, and stratification. within AI for Science, Healthcare, and Robotics.</td>
<td>high citation signal (13,177); influential citation signal (154)</td>
<td>External validation, prospective testing, and domain expert review are often more important than retrospective benchmark scores.; Clinical, biological, or robotic deployment can fail when data collection protocols differ from training assumptions.; Safety, interpretability, uncertainty, and regulatory evidence remain essential for translation.</td>
</tr>
<tr>
<td align="right">93</td>
<td>[Pattern Classification](https://doi.org/10.1002/9781118142882.ch8)<br><sub>Katherine L. Silversides</sub></td>
<td>2021<br>Encyclopedia of Mathematical Geosciences<br>13,174 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"></td>
<td>The computational neural-network structures described in the literature are often based on the concept of linear neural units (LNUs).</td>
<td>high citation signal (13,174); influential citation signal (198); recognized venue; open-access PDF metadata</td>
<td>External validation, prospective testing, and domain expert review are often more important than retrospective benchmark scores.; Clinical, biological, or robotic deployment can fail when data collection protocols differ from training assumptions.; Safety, interpretability, uncertainty, and regulatory evidence remain essential for translation.</td>
</tr>
<tr>
<td align="right">103</td>
<td>[TensorFlow: Large-Scale Machine Learning on Heterogeneous Distributed Systems](https://arxiv.org/abs/1603.04467)<br><sub>Martín Abadi, Ashish Agarwal, P. Barham, E. Brevdo, Z. Chen, C. Citro, G. Corrado, Andy Davis, et al.</sub></td>
<td>2016<br>arXiv.org<br>11,751 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>TensorFlow is an interface for expressing machine learning algorithms, and an implementation for executing such algorithms.</td>
<td>high citation signal (11,751); influential citation signal (1,207)</td>
<td>External validation, prospective testing, and domain expert review are often more important than retrospective benchmark scores.; Clinical, biological, or robotic deployment can fail when data collection protocols differ from training assumptions.; Safety, interpretability, uncertainty, and regulatory evidence remain essential for translation.</td>
</tr>
<tr>
<td align="right">105</td>
<td>[A survey on Image Data Augmentation for Deep Learning](https://doi.org/10.1186/s40537-019-0197-0)<br><sub>Connor Shorten, T. Khoshgoftaar</sub></td>
<td>2019<br>Journal of Big Data<br>11,666 citations</td>
<td><img alt="generative-ai" src="https://img.shields.io/badge/keyword-generative--ai-a855f7"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>Deep convolutional neural networks have performed remarkably well on many Computer Vision tasks.</td>
<td>high citation signal (11,666); influential citation signal (300); open-access PDF metadata</td>
<td>External validation, prospective testing, and domain expert review are often more important than retrospective benchmark scores.; Clinical, biological, or robotic deployment can fail when data collection protocols differ from training assumptions.; Safety, interpretability, uncertainty, and regulatory evidence remain essential for translation.</td>
</tr>
<tr>
<td align="right">111</td>
<td>[V-Net: Fully Convolutional Neural Networks for Volumetric Medical Image Segmentation](https://doi.org/10.1109/3dv.2016.79)<br><sub>Fausto Milletarì, N. Navab, Seyed-Ahmad Ahmadi</sub></td>
<td>2016<br>International Conference on 3D Vision<br>10,842 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>Convolutional Neural Networks (CNNs) have been recently employed to solve problems from both the computer vision and medical image analysis fields.</td>
<td>high citation signal (10,842); influential citation signal (843); open-access PDF metadata</td>
<td>External validation, prospective testing, and domain expert review are often more important than retrospective benchmark scores.; Clinical, biological, or robotic deployment can fail when data collection protocols differ from training assumptions.; Safety, interpretability, uncertainty, and regulatory evidence remain essential for translation.</td>
</tr>
<tr>
<td align="right">148</td>
<td>[Stop Explaining Black Box Machine Learning Models for High Stakes Decisions and Use Interpretable Models Instead](https://doi.org/10.1038/s42256-019-0048-x)<br><sub>C. Rudin</sub></td>
<td>2018<br>Nature Machine Intelligence<br>9,180 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>Black box machine learning models are currently being used for high-stakes decision making throughout society, causing problems in healthcare, criminal justice and other domains.</td>
<td>high citation signal (9,180); influential citation signal (463); recognized venue; open-access PDF metadata</td>
<td>External validation, prospective testing, and domain expert review are often more important than retrospective benchmark scores.; Clinical, biological, or robotic deployment can fail when data collection protocols differ from training assumptions.; Safety, interpretability, uncertainty, and regulatory evidence remain essential for translation.</td>
</tr>
<tr><td colspan="7"><em>269 additional selected papers in this category are available in the dataset and website.</em></td></tr>
</tbody></table>

</details>

### Graph Learning, Recommendation, and Core Methods

- Papers selected: **195**
- Years covered: **2000-2026**
- Citation count in selected set: **441,156**
- Category Overview (main research trends):
  - Core AI methods include graph neural networks, recommender systems, optimization, neural architecture search, Bayesian methods, and efficient training recipes.
  - Many papers in this category become reusable algorithmic infrastructure for applied AI systems.
  - The dominant trend is stronger inductive bias for non-Euclidean data, sparse interaction data, and efficient hyperparameter or architecture search.
- Limitations:
  - Graph and recommender benchmarks can contain temporal leakage, popularity bias, or unrealistic train/test splits.
  - Algorithmic gains may be sensitive to hyperparameter budgets and implementation details.
  - Core methods need careful ablations before broad claims about generality or efficiency are accepted.

<details>
<summary><strong>Show representative papers for Graph Learning, Recommendation, and Core Methods</strong></summary>

<table width="100%">
<colgroup>
<col width="5%">
<col width="22%">
<col width="12%">
<col width="12%">
<col width="25%">
<col width="12%">
<col width="12%">
</colgroup>
<thead><tr>
<th align="right">Rank</th><th>Paper</th><th>Meta</th><th>Keywords</th><th>Key idea</th><th>Strengths</th><th>Limitations</th>
</tr></thead><tbody>
<tr>
<td align="right">22</td>
<td>[Semi-Supervised Classification with Graph Convolutional Networks](https://arxiv.org/abs/1609.02907)<br><sub>Thomas Kipf, M. Welling</sub></td>
<td>2016<br>International Conference on Learning Representations<br>35,590 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="graph-learning" src="https://img.shields.io/badge/keyword-graph--learning-4f46e5"></td>
<td>We present a scalable approach for semi-supervised learning on graph-structured data that is based on an efficient variant of convolutional neural networks which operate directly on graphs.</td>
<td>high citation signal (35,590); influential citation signal (7,363)</td>
<td>Graph and recommender benchmarks can contain temporal leakage, popularity bias, or unrealistic train/test splits.; Algorithmic gains may be sensitive to hyperparameter budgets and implementation details.; Core methods need careful ablations before broad claims about generality or efficiency are accepted.</td>
</tr>
<tr>
<td align="right">42</td>
<td>[“Why Should I Trust You?”: Explaining the Predictions of Any Classifier](https://doi.org/10.1145/2939672.2939778)<br><sub>Marco Tulio Ribeiro, Sameer Singh, Carlos Guestrin</sub></td>
<td>2016<br>North American Chapter of the Association for Computational Linguistics<br>22,598 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>Despite widespread adoption, machine learning models remain mostly black boxes.</td>
<td>high citation signal (22,598); influential citation signal (2,170); open-access PDF metadata</td>
<td>Graph and recommender benchmarks can contain temporal leakage, popularity bias, or unrealistic train/test splits.; Algorithmic gains may be sensitive to hyperparameter budgets and implementation details.; Core methods need careful ablations before broad claims about generality or efficiency are accepted.</td>
</tr>
<tr>
<td align="right">52</td>
<td>[TensorFlow: A system for large-scale machine learning](https://arxiv.org/abs/1605.08695)<br><sub>Martín Abadi, P. Barham, Jianmin Chen, Z. Chen, Andy Davis, J. Dean, M. Devin, S. Ghemawat, et al.</sub></td>
<td>2016<br>USENIX Symposium on Operating Systems Design and Implementation<br>19,730 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"></td>
<td>TensorFlow is a machine learning system that operates at large scale and in heterogeneous environments.</td>
<td>high citation signal (19,730); influential citation signal (2,228)</td>
<td>Graph and recommender benchmarks can contain temporal leakage, popularity bias, or unrealistic train/test splits.; Algorithmic gains may be sensitive to hyperparameter budgets and implementation details.; Core methods need careful ablations before broad claims about generality or efficiency are accepted.</td>
</tr>
<tr>
<td align="right">109</td>
<td>[A Comprehensive Survey on Graph Neural Networks](https://doi.org/10.1109/tnnls.2020.2978386)<br><sub>Zonghan Wu, Shirui Pan, Fengwen Chen, Guodong Long, Chengqi Zhang, Philip S. Yu</sub></td>
<td>2019<br>IEEE Transactions on Neural Networks and Learning Systems<br>11,346 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="graph-learning" src="https://img.shields.io/badge/keyword-graph--learning-4f46e5"></td>
<td>Deep learning has revolutionized many machine learning tasks in recent years, ranging from image classification and video processing to speech recognition and natural language understanding.</td>
<td>high citation signal (11,346); influential citation signal (506); recognized venue; open-access PDF metadata</td>
<td>Graph and recommender benchmarks can contain temporal leakage, popularity bias, or unrealistic train/test splits.; Algorithmic gains may be sensitive to hyperparameter budgets and implementation details.; Core methods need careful ablations before broad claims about generality or efficiency are accepted.</td>
</tr>
<tr>
<td align="right">127</td>
<td>[How Powerful are Graph Neural Networks?](https://arxiv.org/abs/1810.00826)<br><sub>Keyulu Xu, Weihua Hu, J. Leskovec, S. Jegelka</sub></td>
<td>2018<br>International Conference on Learning Representations<br>9,953 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="graph-learning" src="https://img.shields.io/badge/keyword-graph--learning-4f46e5"></td>
<td>Graph Neural Networks (GNNs) are an effective framework for representation learning of graphs.</td>
<td>high citation signal (9,953); influential citation signal (1,771)</td>
<td>Graph and recommender benchmarks can contain temporal leakage, popularity bias, or unrealistic train/test splits.; Algorithmic gains may be sensitive to hyperparameter budgets and implementation details.; Core methods need careful ablations before broad claims about generality or efficiency are accepted.</td>
</tr>
<tr>
<td align="right">131</td>
<td>[Learning with Kernels: Support Vector Machines, Regularization, Optimization, and Beyond](https://doi.org/10.1198/jasa.2003.s270)<br><sub>Christopher K. I. Williams</sub></td>
<td>2003<br>IEEE Transactions on Neural Networks<br>9,760 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"></td>
<td>Positions Learning with Kernels: Support Vector Machines, Regularization, Optimization, and Beyond within Graph Learning, Recommendation, and Core Methods.</td>
<td>high citation signal (9,760); influential citation signal (1,174); recognized venue; open-access PDF metadata</td>
<td>Graph and recommender benchmarks can contain temporal leakage, popularity bias, or unrealistic train/test splits.; Algorithmic gains may be sensitive to hyperparameter budgets and implementation details.; Core methods need careful ablations before broad claims about generality or efficiency are accepted.</td>
</tr>
<tr>
<td align="right">138</td>
<td>[The Graph Neural Network Model](https://doi.org/10.1109/tnn.2008.2005605)<br><sub>F. Scarselli, M. Gori, A. Tsoi, M. Hagenbuchner, G. Monfardini</sub></td>
<td>2009<br>IEEE Transactions on Neural Networks<br>9,468 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="graph-learning" src="https://img.shields.io/badge/keyword-graph--learning-4f46e5"></td>
<td>Positions The Graph Neural Network Model within Graph Learning, Recommendation, and Core Methods.</td>
<td>high citation signal (9,468); influential citation signal (448); recognized venue; open-access PDF metadata</td>
<td>Graph and recommender benchmarks can contain temporal leakage, popularity bias, or unrealistic train/test splits.; Algorithmic gains may be sensitive to hyperparameter budgets and implementation details.; Core methods need careful ablations before broad claims about generality or efficiency are accepted.</td>
</tr>
<tr>
<td align="right">139</td>
<td>[Practical Bayesian Optimization of Machine Learning Algorithms](https://arxiv.org/abs/1206.2944)<br><sub>Jasper Snoek, H. Larochelle, Ryan P. Adams</sub></td>
<td>2012<br>Neural Information Processing Systems<br>9,467 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"></td>
<td>The use of machine learning algorithms frequently involves careful tuning of learning parameters and model hyperparameters.</td>
<td>high citation signal (9,467); influential citation signal (630)</td>
<td>Graph and recommender benchmarks can contain temporal leakage, popularity bias, or unrealistic train/test splits.; Algorithmic gains may be sensitive to hyperparameter budgets and implementation details.; Core methods need careful ablations before broad claims about generality or efficiency are accepted.</td>
</tr>
<tr>
<td align="right">151</td>
<td>[An Introduction to Support Vector Machines and Other Kernel-Based Learning Methods](https://doi.org/10.1609/aimag.v22i2.1566)<br><sub>Tong Zhang</sub></td>
<td>2001<br>The AI Magazine<br>9,078 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"></td>
<td>Positions An Introduction to Support Vector Machines and Other Kernel-Based Learning Methods within Graph Learning, Recommendation, and Core Methods.</td>
<td>high citation signal (9,078); influential citation signal (906)</td>
<td>Graph and recommender benchmarks can contain temporal leakage, popularity bias, or unrealistic train/test splits.; Algorithmic gains may be sensitive to hyperparameter budgets and implementation details.; Core methods need careful ablations before broad claims about generality or efficiency are accepted.</td>
</tr>
<tr>
<td align="right">174</td>
<td>[An Introduction to Support Vector Machines and Other Kernel-based Learning Methods](https://doi.org/10.1017/cbo9780511801389.013)<br><sub>N. Cristianini, J. Shawe-Taylor</sub></td>
<td>2000<br>Unknown venue<br>8,367 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"></td>
<td>Positions An Introduction to Support Vector Machines and Other Kernel-based Learning Methods within Graph Learning, Recommendation, and Core Methods.</td>
<td>high citation signal (8,367); influential citation signal (331); open-access PDF metadata</td>
<td>Graph and recommender benchmarks can contain temporal leakage, popularity bias, or unrealistic train/test splits.; Algorithmic gains may be sensitive to hyperparameter budgets and implementation details.; Core methods need careful ablations before broad claims about generality or efficiency are accepted.</td>
</tr>
<tr><td colspan="7"><em>185 additional selected papers in this category are available in the dataset and website.</em></td></tr>
</tbody></table>

</details>

### Reinforcement Learning and Agents

- Papers selected: **175**
- Years covered: **2000-2026**
- Citation count in selected set: **456,581**
- Category Overview (main research trends):
  - Reinforcement learning is converging with human feedback, offline datasets, robotics, planning, and agentic tool-use settings.
  - A major thread is reducing sample inefficiency while improving robustness under distribution shift and sparse rewards.
  - The field is increasingly judged by transfer, safety, and real-world interaction rather than benchmark score alone.
- Limitations:
  - Sample efficiency, reward misspecification, simulator bias, and safety under exploration remain persistent barriers.
  - Benchmark performance may not transfer to physical robots, human-facing tools, or open-ended environments.
  - Agentic systems need stronger evidence on reliability, recovery from errors, and long-horizon oversight.

<details>
<summary><strong>Show representative papers for Reinforcement Learning and Agents</strong></summary>

<table width="100%">
<colgroup>
<col width="5%">
<col width="22%">
<col width="12%">
<col width="12%">
<col width="25%">
<col width="12%">
<col width="12%">
</colgroup>
<thead><tr>
<th align="right">Rank</th><th>Paper</th><th>Meta</th><th>Keywords</th><th>Key idea</th><th>Strengths</th><th>Limitations</th>
</tr></thead><tbody>
<tr>
<td align="right">27</td>
<td>[Human-level control through deep reinforcement learning](https://doi.org/10.1038/nature14236)<br><sub>Volodymyr Mnih, K. Kavukcuoglu, David Silver, Andrei A. Rusu, J. Veness, Marc G. Bellemare, Alex Graves, Martin A. Riedmiller, et al.</sub></td>
<td>2015<br>Nature<br>32,039 citations</td>
<td><img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"></td>
<td>Positions Human-level control through deep reinforcement learning within Reinforcement Learning and Agents.</td>
<td>high citation signal (32,039); influential citation signal (3,413); recognized venue</td>
<td>Sample efficiency, reward misspecification, simulator bias, and safety under exploration remain persistent barriers.; Benchmark performance may not transfer to physical robots, human-facing tools, or open-ended environments.; Agentic systems need stronger evidence on reliability, recovery from errors, and long-horizon oversight.</td>
</tr>
<tr>
<td align="right">31</td>
<td>[Proximal Policy Optimization Algorithms](https://arxiv.org/abs/1707.06347)<br><sub>John Schulman, Filip Wolski, Prafulla Dhariwal, Alec Radford, Oleg Klimov</sub></td>
<td>2017<br>arXiv.org<br>28,532 citations</td>
<td><img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"></td>
<td>We propose a new family of policy gradient methods for reinforcement learning, which alternate between sampling data through interaction with the environment, and optimizing a &quot;surrogate&quot; objective function using stochastic gradient ascent.</td>
<td>high citation signal (28,532); influential citation signal (4,891)</td>
<td>Sample efficiency, reward misspecification, simulator bias, and safety under exploration remain persistent barriers.; Benchmark performance may not transfer to physical robots, human-facing tools, or open-ended environments.; Agentic systems need stronger evidence on reliability, recovery from errors, and long-horizon oversight.</td>
</tr>
<tr>
<td align="right">65</td>
<td>[Deep learning in neural networks: An overview](https://doi.org/10.1016/j.neunet.2014.09.003)<br><sub>J. Schmidhuber</sub></td>
<td>2014<br>Neural Networks<br>17,547 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"></td>
<td>In recent years, deep artificial neural networks (including recurrent ones) have won numerous contests in pattern recognition and machine learning.</td>
<td>high citation signal (17,547); influential citation signal (467); open-access PDF metadata</td>
<td>Sample efficiency, reward misspecification, simulator bias, and safety under exploration remain persistent barriers.; Benchmark performance may not transfer to physical robots, human-facing tools, or open-ended environments.; Agentic systems need stronger evidence on reliability, recovery from errors, and long-horizon oversight.</td>
</tr>
<tr>
<td align="right">73</td>
<td>[Continuous control with deep reinforcement learning](https://arxiv.org/abs/1509.02971)<br><sub>T. Lillicrap, Jonathan J. Hunt, A. Pritzel, N. Heess, Tom Erez, Yuval Tassa, David Silver, Daan Wierstra</sub></td>
<td>2015<br>International Conference on Learning Representations<br>15,535 citations</td>
<td><img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"></td>
<td>We adapt the ideas underlying the success of Deep Q-Learning to the continuous action domain.</td>
<td>high citation signal (15,535); influential citation signal (2,203)</td>
<td>Sample efficiency, reward misspecification, simulator bias, and safety under exploration remain persistent barriers.; Benchmark performance may not transfer to physical robots, human-facing tools, or open-ended environments.; Agentic systems need stronger evidence on reliability, recovery from errors, and long-horizon oversight.</td>
</tr>
<tr>
<td align="right">82</td>
<td>[Model-Agnostic Meta-Learning for Fast Adaptation of Deep Networks](https://arxiv.org/abs/1703.03400)<br><sub>Chelsea Finn, P. Abbeel, S. Levine</sub></td>
<td>2017<br>International Conference on Machine Learning<br>14,605 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"></td>
<td>We propose an algorithm for meta-learning that is model-agnostic, in the sense that it is compatible with any model trained with gradient descent and applicable to a variety of different learning problems, including classification, regression, and reinforcement learning.</td>
<td>high citation signal (14,605); influential citation signal (2,715); recognized venue</td>
<td>Sample efficiency, reward misspecification, simulator bias, and safety under exploration remain persistent barriers.; Benchmark performance may not transfer to physical robots, human-facing tools, or open-ended environments.; Agentic systems need stronger evidence on reliability, recovery from errors, and long-horizon oversight.</td>
</tr>
<tr>
<td align="right">88</td>
<td>[Playing Atari with Deep Reinforcement Learning](https://arxiv.org/abs/1312.5602)<br><sub>Volodymyr Mnih, K. Kavukcuoglu, David Silver, Alex Graves, Ioannis Antonoglou, Daan Wierstra, Martin A. Riedmiller</sub></td>
<td>2013<br>arXiv.org<br>13,759 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"></td>
<td>We present the first deep learning model to successfully learn control policies directly from high-dimensional sensory input using reinforcement learning.</td>
<td>high citation signal (13,759); influential citation signal (1,487)</td>
<td>Sample efficiency, reward misspecification, simulator bias, and safety under exploration remain persistent barriers.; Benchmark performance may not transfer to physical robots, human-facing tools, or open-ended environments.; Agentic systems need stronger evidence on reliability, recovery from errors, and long-horizon oversight.</td>
</tr>
<tr>
<td align="right">99</td>
<td>[Dropout as a Bayesian Approximation: Representing Model Uncertainty in Deep Learning](https://arxiv.org/abs/1506.02142)<br><sub>Y. Gal, Zoubin Ghahramani</sub></td>
<td>2015<br>International Conference on Machine Learning<br>11,994 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>Deep learning tools have gained tremendous attention in applied machine learning.</td>
<td>high citation signal (11,994); influential citation signal (1,630); recognized venue</td>
<td>Sample efficiency, reward misspecification, simulator bias, and safety under exploration remain persistent barriers.; Benchmark performance may not transfer to physical robots, human-facing tools, or open-ended environments.; Agentic systems need stronger evidence on reliability, recovery from errors, and long-horizon oversight.</td>
</tr>
<tr>
<td align="right">108</td>
<td>[Soft Actor-Critic: Off-Policy Maximum Entropy Deep Reinforcement Learning with a Stochastic Actor](https://arxiv.org/abs/1801.01290)<br><sub>Tuomas Haarnoja, Aurick Zhou, P. Abbeel, S. Levine</sub></td>
<td>2018<br>International Conference on Machine Learning<br>11,486 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"></td>
<td>Model-free deep reinforcement learning (RL) algorithms have been demonstrated on a range of challenging decision making and control tasks.</td>
<td>high citation signal (11,486); influential citation signal (2,047); recognized venue</td>
<td>Sample efficiency, reward misspecification, simulator bias, and safety under exploration remain persistent barriers.; Benchmark performance may not transfer to physical robots, human-facing tools, or open-ended environments.; Agentic systems need stronger evidence on reliability, recovery from errors, and long-horizon oversight.</td>
</tr>
<tr>
<td align="right">118</td>
<td>[Simple Statistical Gradient-Following Algorithms for Connectionist Reinforcement Learning](https://doi.org/10.1023/a:1022672621406)<br><sub>Ronald J. Williams</sub></td>
<td>2004<br>Machine-mediated learning<br>10,344 citations</td>
<td><img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"></td>
<td>Positions Simple Statistical Gradient-Following Algorithms for Connectionist Reinforcement Learning within Reinforcement Learning and Agents.</td>
<td>high citation signal (10,344); influential citation signal (1,202); open-access PDF metadata</td>
<td>Sample efficiency, reward misspecification, simulator bias, and safety under exploration remain persistent barriers.; Benchmark performance may not transfer to physical robots, human-facing tools, or open-ended environments.; Agentic systems need stronger evidence on reliability, recovery from errors, and long-horizon oversight.</td>
</tr>
<tr>
<td align="right">123</td>
<td>[Overcoming catastrophic forgetting in neural networks](https://doi.org/10.1073/pnas.1611835114)<br><sub>J. Kirkpatrick, Razvan Pascanu, Neil C. Rabinowitz, J. Veness, Guillaume Desjardins, Andrei A. Rusu, Kieran Milan, John Quan, et al.</sub></td>
<td>2016<br>Proceedings of the National Academy of Sciences of the United States of America<br>10,109 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"></td>
<td>Significance Deep neural networks are currently the most successful machine-learning technique for solving a variety of tasks, including language translation, image classification, and image generation.</td>
<td>high citation signal (10,109); influential citation signal (1,410); recognized venue; open-access PDF metadata</td>
<td>Sample efficiency, reward misspecification, simulator bias, and safety under exploration remain persistent barriers.; Benchmark performance may not transfer to physical robots, human-facing tools, or open-ended environments.; Agentic systems need stronger evidence on reliability, recovery from errors, and long-horizon oversight.</td>
</tr>
<tr><td colspan="7"><em>165 additional selected papers in this category are available in the dataset and website.</em></td></tr>
</tbody></table>

</details>

### Natural Language Processing and Knowledge

- Papers selected: **160**
- Years covered: **2000-2024**
- Citation count in selected set: **746,046**
- Category Overview (main research trends):
  - NLP is moving from supervised task pipelines toward pretrained language models, retrieval-augmented methods, and knowledge-intensive reasoning benchmarks.
  - Search, retrieval, summarization, dialogue, and domain adaptation are increasingly evaluated as integrated knowledge workflows.
  - Citation-ranked NLP papers often become shared components, datasets, or baseline methods for later foundation model research.
- Limitations:
  - Benchmark scores can hide brittle reasoning, retrieval failures, hallucination, and domain transfer issues.
  - Language coverage is often uneven, with English and high-resource domains overrepresented.
  - Evaluation can be sensitive to annotation protocols, prompt wording, and changing model APIs.

<details>
<summary><strong>Show representative papers for Natural Language Processing and Knowledge</strong></summary>

<table width="100%">
<colgroup>
<col width="5%">
<col width="22%">
<col width="12%">
<col width="12%">
<col width="25%">
<col width="12%">
<col width="12%">
</colgroup>
<thead><tr>
<th align="right">Rank</th><th>Paper</th><th>Meta</th><th>Keywords</th><th>Key idea</th><th>Strengths</th><th>Limitations</th>
</tr></thead><tbody>
<tr>
<td align="right">2</td>
<td>[Attention is All you Need](https://arxiv.org/abs/1706.03762)<br><sub>Ashish Vaswani, Noam Shazeer, Niki Parmar, Jakob Uszkoreit, Llion Jones, Aidan N. Gomez, Lukasz Kaiser, I. Polosukhin</sub></td>
<td>2017<br>Neural Information Processing Systems<br>181,426 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>The dominant sequence transduction models are based on complex recurrent or convolutional neural networks in an encoder-decoder configuration.</td>
<td>high citation signal (181,426); influential citation signal (20,067)</td>
<td>Benchmark scores can hide brittle reasoning, retrieval failures, hallucination, and domain transfer issues.; Language coverage is often uneven, with English and high-resource domains overrepresented.; Evaluation can be sensitive to annotation protocols, prompt wording, and changing model APIs.</td>
</tr>
<tr>
<td align="right">4</td>
<td>[BERT: Pre-training of Deep Bidirectional Transformers for Language Understanding](https://doi.org/10.18653/v1/n19-1423)<br><sub>Jacob Devlin, Ming-Wei Chang, Kenton Lee, Kristina Toutanova</sub></td>
<td>2019<br>North American Chapter of the Association for Computational Linguistics<br>116,382 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>We introduce a new language representation model called BERT, which stands for Bidirectional Encoder Representations from Transformers.</td>
<td>high citation signal (116,382); influential citation signal (22,457)</td>
<td>Benchmark scores can hide brittle reasoning, retrieval failures, hallucination, and domain transfer issues.; Language coverage is often uneven, with English and high-resource domains overrepresented.; Evaluation can be sensitive to annotation protocols, prompt wording, and changing model APIs.</td>
</tr>
<tr>
<td align="right">34</td>
<td>[Learning Phrase Representations using RNN Encoder–Decoder for Statistical Machine Translation](https://doi.org/10.3115/v1/d14-1179)<br><sub>Kyunghyun Cho, B. V. Merrienboer, Çaglar Gülçehre, Dzmitry Bahdanau, Fethi Bougares, Holger Schwenk, Yoshua Bengio</sub></td>
<td>2014<br>Conference on Empirical Methods in Natural Language Processing<br>26,531 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>In this paper, we propose a novel neural network model called RNN Encoder‐ Decoder that consists of two recurrent neural networks (RNN).</td>
<td>high citation signal (26,531); influential citation signal (3,130); open-access PDF metadata</td>
<td>Benchmark scores can hide brittle reasoning, retrieval failures, hallucination, and domain transfer issues.; Language coverage is often uneven, with English and high-resource domains overrepresented.; Evaluation can be sensitive to annotation protocols, prompt wording, and changing model APIs.</td>
</tr>
<tr>
<td align="right">35</td>
<td>[Exploring the Limits of Transfer Learning with a Unified Text-to-Text Transformer](https://arxiv.org/abs/1910.10683)<br><sub>Colin Raffel, Noam Shazeer, Adam Roberts, Katherine Lee, Sharan Narang, Michael Matena, Yanqi Zhou, Wei Li, et al.</sub></td>
<td>2019<br>Journal of machine learning research<br>26,182 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>Transfer learning, where a model is first pre-trained on a data-rich task before being fine-tuned on a downstream task, has emerged as a powerful technique in natural language processing (NLP).</td>
<td>high citation signal (26,182); influential citation signal (2,550); recognized venue</td>
<td>Benchmark scores can hide brittle reasoning, retrieval failures, hallucination, and domain transfer issues.; Language coverage is often uneven, with English and high-resource domains overrepresented.; Evaluation can be sensitive to annotation protocols, prompt wording, and changing model APIs.</td>
</tr>
<tr>
<td align="right">44</td>
<td>[Sequence to Sequence Learning with Neural Networks](https://arxiv.org/abs/1409.3215)<br><sub>I. Sutskever, O. Vinyals, Quoc V. Le</sub></td>
<td>2014<br>Neural Information Processing Systems<br>22,110 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>Deep Neural Networks (DNNs) are powerful models that have achieved excellent performance on difficult learning tasks.</td>
<td>high citation signal (22,110); influential citation signal (1,414)</td>
<td>Benchmark scores can hide brittle reasoning, retrieval failures, hallucination, and domain transfer issues.; Language coverage is often uneven, with English and high-resource domains overrepresented.; Evaluation can be sensitive to annotation protocols, prompt wording, and changing model APIs.</td>
</tr>
<tr>
<td align="right">84</td>
<td>[Convolutional Neural Networks for Sentence Classification](https://doi.org/10.3115/v1/d14-1181)<br><sub>Yoon Kim</sub></td>
<td>2014<br>Conference on Empirical Methods in Natural Language Processing<br>14,275 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>We report on a series of experiments with convolutional neural networks (CNN) trained on top of pre-trained word vectors for sentence-level classification tasks.</td>
<td>high citation signal (14,275); influential citation signal (2,136); open-access PDF metadata</td>
<td>Benchmark scores can hide brittle reasoning, retrieval failures, hallucination, and domain transfer issues.; Language coverage is often uneven, with English and high-resource domains overrepresented.; Evaluation can be sensitive to annotation protocols, prompt wording, and changing model APIs.</td>
</tr>
<tr>
<td align="right">136</td>
<td>[Thumbs up? Sentiment Classification using Machine Learning Techniques](https://doi.org/10.3115/1118693.1118704)<br><sub>B. Pang, Lillian Lee, Shivakumar Vaithyanathan</sub></td>
<td>2002<br>Conference on Empirical Methods in Natural Language Processing<br>9,570 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>We consider the problem of classifying documents not by topic, but by overall sentiment, e.g., determining whether a review is positive or negative.</td>
<td>high citation signal (9,570); influential citation signal (818); open-access PDF metadata</td>
<td>Benchmark scores can hide brittle reasoning, retrieval failures, hallucination, and domain transfer issues.; Language coverage is often uneven, with English and high-resource domains overrepresented.; Evaluation can be sensitive to annotation protocols, prompt wording, and changing model APIs.</td>
</tr>
<tr>
<td align="right">137</td>
<td>[Recursive Deep Models for Semantic Compositionality Over a Sentiment Treebank](https://doi.org/10.18653/v1/d13-1170)<br><sub>R. Socher, Alex Perelygin, Jean Wu, Jason Chuang, Christopher D. Manning, A. Ng, Christopher Potts</sub></td>
<td>2013<br>Conference on Empirical Methods in Natural Language Processing<br>9,491 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>Semantic word spaces have been very useful but cannot express the meaning of longer phrases in a principled way.</td>
<td>high citation signal (9,491); influential citation signal (1,505)</td>
<td>Benchmark scores can hide brittle reasoning, retrieval failures, hallucination, and domain transfer issues.; Language coverage is often uneven, with English and high-resource domains overrepresented.; Evaluation can be sensitive to annotation protocols, prompt wording, and changing model APIs.</td>
</tr>
<tr>
<td align="right">154</td>
<td>[Speech recognition with deep recurrent neural networks](https://doi.org/10.1109/icassp.2013.6638947)<br><sub>Alex Graves, Abdel-rahman Mohamed, Geoffrey E. Hinton</sub></td>
<td>2013<br>IEEE International Conference on Acoustics, Speech, and Signal Processing<br>9,003 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>Recurrent neural networks (RNNs) are a powerful model for sequential data.</td>
<td>high citation signal (9,003); influential citation signal (432); open-access PDF metadata</td>
<td>Benchmark scores can hide brittle reasoning, retrieval failures, hallucination, and domain transfer issues.; Language coverage is often uneven, with English and high-resource domains overrepresented.; Evaluation can be sensitive to annotation protocols, prompt wording, and changing model APIs.</td>
</tr>
<tr>
<td align="right">182</td>
<td>[Spatial Transformer Networks](https://arxiv.org/abs/1506.02025)<br><sub>Max Jaderberg, K. Simonyan, Andrew Zisserman, K. Kavukcuoglu</sub></td>
<td>2015<br>Neural Information Processing Systems<br>8,100 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>Convolutional Neural Networks define an exceptionally powerful class of models, but are still limited by the lack of ability to be spatially invariant to the input data in a computationally and parameter efficient manner.</td>
<td>high citation signal (8,100); influential citation signal (764)</td>
<td>Benchmark scores can hide brittle reasoning, retrieval failures, hallucination, and domain transfer issues.; Language coverage is often uneven, with English and high-resource domains overrepresented.; Evaluation can be sensitive to annotation protocols, prompt wording, and changing model APIs.</td>
</tr>
<tr><td colspan="7"><em>150 additional selected papers in this category are available in the dataset and website.</em></td></tr>
</tbody></table>

</details>

### Trustworthy, Explainable, and Responsible AI

- Papers selected: **98**
- Years covered: **2000-2026**
- Citation count in selected set: **239,459**
- Category Overview (main research trends):
  - Trustworthy AI work is broadening from post-hoc explanations to robustness, fairness, privacy, calibration, uncertainty, and safety-aware evaluation.
  - Highly cited papers provide taxonomies, metrics, attacks, or toolkits that make system behavior easier to inspect and compare.
  - The area is increasingly coupled to foundation model deployment, high-stakes domains, and governance requirements.
- Limitations:
  - Explanations can be persuasive without being faithful to model internals or decision processes.
  - Fairness, robustness, privacy, and safety metrics can conflict and require domain-specific tradeoffs.
  - Responsible AI results often need stronger deployment evidence beyond benchmark or synthetic settings.

<details>
<summary><strong>Show representative papers for Trustworthy, Explainable, and Responsible AI</strong></summary>

<table width="100%">
<colgroup>
<col width="5%">
<col width="22%">
<col width="12%">
<col width="12%">
<col width="25%">
<col width="12%">
<col width="12%">
</colgroup>
<thead><tr>
<th align="right">Rank</th><th>Paper</th><th>Meta</th><th>Keywords</th><th>Key idea</th><th>Strengths</th><th>Limitations</th>
</tr></thead><tbody>
<tr>
<td align="right">79</td>
<td>[Towards Deep Learning Models Resistant to Adversarial Attacks](https://arxiv.org/abs/1706.06083)<br><sub>A. Ma̧dry, Aleksandar Makelov, Ludwig Schmidt, Dimitris Tsipras, Adrian Vladu</sub></td>
<td>2017<br>International Conference on Learning Representations<br>14,919 citations</td>
<td><img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>Recent work has demonstrated that deep neural networks are vulnerable to adversarial examples---inputs that are almost indistinguishable from natural data and yet classified incorrectly by the network.</td>
<td>high citation signal (14,919); influential citation signal (3,852)</td>
<td>Explanations can be persuasive without being faithful to model internals or decision processes.; Fairness, robustness, privacy, and safety metrics can conflict and require domain-specific tradeoffs.; Responsible AI results often need stronger deployment evidence beyond benchmark or synthetic settings.</td>
</tr>
<tr>
<td align="right">94</td>
<td>[Layer Normalization](https://arxiv.org/abs/1607.06450)<br><sub>Jimmy Ba, J. Kiros, Geoffrey E. Hinton</sub></td>
<td>2016<br>arXiv.org<br>12,696 citations</td>
<td><img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>Training state-of-the-art, deep neural networks is computationally expensive.</td>
<td>high citation signal (12,696); influential citation signal (549)</td>
<td>Explanations can be persuasive without being faithful to model internals or decision processes.; Fairness, robustness, privacy, and safety metrics can conflict and require domain-specific tradeoffs.; Responsible AI results often need stronger deployment evidence beyond benchmark or synthetic settings.</td>
</tr>
<tr>
<td align="right">128</td>
<td>[Towards Evaluating the Robustness of Neural Networks](https://doi.org/10.1109/sp.2017.49)<br><sub>Nicholas Carlini, D. Wagner</sub></td>
<td>2016<br>IEEE Symposium on Security and Privacy<br>9,937 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>Neural networks provide state-of-the-art results for most machine learning tasks.</td>
<td>high citation signal (9,937); influential citation signal (1,361); open-access PDF metadata</td>
<td>Explanations can be persuasive without being faithful to model internals or decision processes.; Fairness, robustness, privacy, and safety metrics can conflict and require domain-specific tradeoffs.; Responsible AI results often need stronger deployment evidence beyond benchmark or synthetic settings.</td>
</tr>
<tr>
<td align="right">140</td>
<td>[The Algorithmic Foundations of Differential Privacy](https://doi.org/10.1561/0400000042)<br><sub>C. Dwork, Aaron Roth</sub></td>
<td>2014<br>Foundations and Trends® in Theoretical Computer Science<br>9,457 citations</td>
<td><img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>Positions The Algorithmic Foundations of Differential Privacy within Trustworthy, Explainable, and Responsible AI.</td>
<td>high citation signal (9,457); influential citation signal (1,622); recognized venue; open-access PDF metadata</td>
<td>Explanations can be persuasive without being faithful to model internals or decision processes.; Fairness, robustness, privacy, and safety metrics can conflict and require domain-specific tradeoffs.; Responsible AI results often need stronger deployment evidence beyond benchmark or synthetic settings.</td>
</tr>
<tr>
<td align="right">160</td>
<td>[Explainable Artificial Intelligence (XAI): Concepts, Taxonomies, Opportunities and Challenges toward Responsible AI](https://doi.org/10.1016/j.inffus.2019.12.012)<br><sub>Alejandro Barredo Arrieta, Natalia Díaz Rodríguez, J. Ser, Adrien Bennetot, S. Tabik, A. Barbado, S. García, S. Gil-Lopez, et al.</sub></td>
<td>2019<br>Information Fusion<br>8,760 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>In the last years, Artificial Intelligence (AI) has achieved a notable momentum that may deliver the best of expectations over many application sectors across the field.</td>
<td>high citation signal (8,760); influential citation signal (441); open-access PDF metadata</td>
<td>Explanations can be persuasive without being faithful to model internals or decision processes.; Fairness, robustness, privacy, and safety metrics can conflict and require domain-specific tradeoffs.; Responsible AI results often need stronger deployment evidence beyond benchmark or synthetic settings.</td>
</tr>
<tr>
<td align="right">188</td>
<td>[Deep Learning with Differential Privacy](https://doi.org/10.1145/2976749.2978318)<br><sub>Martín Abadi, Andy Chu, I. Goodfellow, H. B. McMahan, Ilya Mironov, Kunal Talwar, Li Zhang</sub></td>
<td>2016<br>Conference on Computer and Communications Security<br>7,901 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>Machine learning techniques based on neural networks are achieving remarkable results in a wide variety of domains.</td>
<td>high citation signal (7,901); influential citation signal (1,428); open-access PDF metadata</td>
<td>Explanations can be persuasive without being faithful to model internals or decision processes.; Fairness, robustness, privacy, and safety metrics can conflict and require domain-specific tradeoffs.; Responsible AI results often need stronger deployment evidence beyond benchmark or synthetic settings.</td>
</tr>
<tr>
<td align="right">248</td>
<td>[Fast and Accurate Deep Network Learning by Exponential Linear Units (ELUs)](https://arxiv.org/abs/1511.07289)<br><sub>Djork-Arné Clevert, Thomas Unterthiner, Sepp Hochreiter</sub></td>
<td>2015<br>International Conference on Learning Representations<br>6,108 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>We introduce the &quot;exponential linear unit&quot; (ELU) which speeds up learning in deep neural networks and leads to higher classification accuracies.</td>
<td>high citation signal (6,108); influential citation signal (569)</td>
<td>Explanations can be persuasive without being faithful to model internals or decision processes.; Fairness, robustness, privacy, and safety metrics can conflict and require domain-specific tradeoffs.; Responsible AI results often need stronger deployment evidence beyond benchmark or synthetic settings.</td>
</tr>
<tr>
<td align="right">251</td>
<td>[Federated Learning: Challenges, Methods, and Future Directions](https://doi.org/10.1109/msp.2020.2975749)<br><sub>Tian Li, Anit Kumar Sahu, Ameet Talwalkar, Virginia Smith</sub></td>
<td>2019<br>IEEE Signal Processing Magazine<br>6,030 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>Federated learning involves training statistical models over remote devices or siloed data centers, such as mobile phones or hospitals, while keeping data localized.</td>
<td>high citation signal (6,030); influential citation signal (312); open-access PDF metadata</td>
<td>Explanations can be persuasive without being faithful to model internals or decision processes.; Fairness, robustness, privacy, and safety metrics can conflict and require domain-specific tradeoffs.; Responsible AI results often need stronger deployment evidence beyond benchmark or synthetic settings.</td>
</tr>
<tr>
<td align="right">267</td>
<td>[A Survey on Bias and Fairness in Machine Learning](https://doi.org/10.1145/3457607)<br><sub>Ninareh Mehrabi, Fred Morstatter, N. Saxena, Kristina Lerman, A. Galstyan</sub></td>
<td>2019<br>ACM Computing Surveys<br>5,934 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>With the widespread use of artificial intelligence (AI) systems and applications in our everyday lives, accounting for fairness has gained significant importance in designing and engineering of such systems.</td>
<td>high citation signal (5,934); influential citation signal (390); open-access PDF metadata</td>
<td>Explanations can be persuasive without being faithful to model internals or decision processes.; Fairness, robustness, privacy, and safety metrics can conflict and require domain-specific tradeoffs.; Responsible AI results often need stronger deployment evidence beyond benchmark or synthetic settings.</td>
</tr>
<tr>
<td align="right">293</td>
<td>[Explanation in Artificial Intelligence: Insights from the Social Sciences](https://doi.org/10.1016/j.artint.2018.07.007)<br><sub>Tim Miller</sub></td>
<td>2017<br>Artificial Intelligence<br>5,342 citations</td>
<td><img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>There has been a recent resurgence in the area of explainable artificial intelligence as researchers and practitioners seek to make their algorithms more understandable.</td>
<td>high citation signal (5,342); influential citation signal (510); recognized venue; open-access PDF metadata</td>
<td>Explanations can be persuasive without being faithful to model internals or decision processes.; Fairness, robustness, privacy, and safety metrics can conflict and require domain-specific tradeoffs.; Responsible AI results often need stronger deployment evidence beyond benchmark or synthetic settings.</td>
</tr>
<tr><td colspan="7"><em>88 additional selected papers in this category are available in the dataset and website.</em></td></tr>
</tbody></table>

</details>

### Generative Models and Synthetic Media

- Papers selected: **83**
- Years covered: **2000-2026**
- Citation count in selected set: **277,971**
- Category Overview (main research trends):
  - Generative AI research has moved from GAN-centered image synthesis toward diffusion, score-based modeling, and controllable multimodal generation.
  - The area increasingly connects generation quality with data curation, safety, copyright, controllability, and evaluation reliability.
  - Highly cited papers often introduce reusable model families, training objectives, or evaluation protocols that become infrastructure for later systems.
- Limitations:
  - Image and media quality metrics may not capture factuality, controllability, provenance, or downstream harms.
  - Training data provenance and copyright constraints can be under-specified in highly cited generation work.
  - Robust evaluation across cultures, modalities, and adversarial uses remains difficult.

<details>
<summary><strong>Show representative papers for Generative Models and Synthetic Media</strong></summary>

<table width="100%">
<colgroup>
<col width="5%">
<col width="22%">
<col width="12%">
<col width="12%">
<col width="25%">
<col width="12%">
<col width="12%">
</colgroup>
<thead><tr>
<th align="right">Rank</th><th>Paper</th><th>Meta</th><th>Keywords</th><th>Key idea</th><th>Strengths</th><th>Limitations</th>
</tr></thead><tbody>
<tr>
<td align="right">64</td>
<td>[Physics-informed neural networks: A deep learning framework for solving forward and inverse problems involving nonlinear partial differential equations](https://doi.org/10.1016/j.jcp.2018.10.045)<br><sub>M. Raissi, P. Perdikaris, G. Karniadakis</sub></td>
<td>2019<br>Journal of Computational Physics<br>17,614 citations</td>
<td><img alt="generative-ai" src="https://img.shields.io/badge/keyword-generative--ai-a855f7"></td>
<td>Abstract We introduce physics-informed neural networks – neural networks that are trained to solve supervised learning tasks while respecting any given laws of physics described by general nonlinear partial differential equations.</td>
<td>high citation signal (17,614); influential citation signal (1,077); open-access PDF metadata</td>
<td>Image and media quality metrics may not capture factuality, controllability, provenance, or downstream harms.; Training data provenance and copyright constraints can be under-specified in highly cited generation work.; Robust evaluation across cultures, modalities, and adversarial uses remains difficult.</td>
</tr>
<tr>
<td align="right">75</td>
<td>[Unsupervised Representation Learning with Deep Convolutional Generative Adversarial Networks](https://arxiv.org/abs/1511.06434)<br><sub>Alec Radford, Luke Metz, Soumith Chintala</sub></td>
<td>2015<br>International Conference on Learning Representations<br>15,122 citations</td>
<td><img alt="generative-ai" src="https://img.shields.io/badge/keyword-generative--ai-a855f7"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>In recent years, supervised learning with convolutional networks (CNNs) has seen huge adoption in computer vision applications.</td>
<td>high citation signal (15,122); influential citation signal (1,751)</td>
<td>Image and media quality metrics may not capture factuality, controllability, provenance, or downstream harms.; Training data provenance and copyright constraints can be under-specified in highly cited generation work.; Robust evaluation across cultures, modalities, and adversarial uses remains difficult.</td>
</tr>
<tr>
<td align="right">98</td>
<td>[Photo-Realistic Single Image Super-Resolution Using a Generative Adversarial Network](https://doi.org/10.1109/cvpr.2017.19)<br><sub>C. Ledig, Lucas Theis, Ferenc Huszár, Jose Caballero, Andrew P. Aitken, Alykhan Tejani, J. Totz, Zehan Wang, et al.</sub></td>
<td>2016<br>Computer Vision and Pattern Recognition<br>12,152 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="generative-ai" src="https://img.shields.io/badge/keyword-generative--ai-a855f7"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>Despite the breakthroughs in accuracy and speed of single image super-resolution using faster and deeper convolutional neural networks, one central problem remains largely unsolved: how do we recover the finer texture details when we super-resolve at large upscaling factors?</td>
<td>high citation signal (12,152); influential citation signal (1,373); recognized venue; open-access PDF metadata</td>
<td>Image and media quality metrics may not capture factuality, controllability, provenance, or downstream harms.; Training data provenance and copyright constraints can be under-specified in highly cited generation work.; Robust evaluation across cultures, modalities, and adversarial uses remains difficult.</td>
</tr>
<tr>
<td align="right">100</td>
<td>[mixup: Beyond Empirical Risk Minimization](https://arxiv.org/abs/1710.09412)<br><sub>Hongyi Zhang, Moustapha Cissé, Yann Dauphin, David Lopez-Paz</sub></td>
<td>2017<br>International Conference on Learning Representations<br>11,909 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="generative-ai" src="https://img.shields.io/badge/keyword-generative--ai-a855f7"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>Large deep neural networks are powerful, but exhibit undesirable behaviors such as memorization and sensitivity to adversarial examples.</td>
<td>high citation signal (11,909); influential citation signal (1,764)</td>
<td>Image and media quality metrics may not capture factuality, controllability, provenance, or downstream harms.; Training data provenance and copyright constraints can be under-specified in highly cited generation work.; Robust evaluation across cultures, modalities, and adversarial uses remains difficult.</td>
</tr>
<tr>
<td align="right">110</td>
<td>[Score-Based Generative Modeling through Stochastic Differential Equations](https://arxiv.org/abs/2011.13456)<br><sub>Yang Song, Jascha Narain Sohl-Dickstein, Diederik P. Kingma, Abhishek Kumar, Stefano Ermon, Ben Poole</sub></td>
<td>2020<br>International Conference on Learning Representations<br>11,057 citations</td>
<td><img alt="generative-ai" src="https://img.shields.io/badge/keyword-generative--ai-a855f7"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>Creating noise from data is easy; creating data from noise is generative modeling.</td>
<td>high citation signal (11,057); influential citation signal (1,881)</td>
<td>Image and media quality metrics may not capture factuality, controllability, provenance, or downstream harms.; Training data provenance and copyright constraints can be under-specified in highly cited generation work.; Robust evaluation across cultures, modalities, and adversarial uses remains difficult.</td>
</tr>
<tr>
<td align="right">121</td>
<td>[Deep Unsupervised Learning using Nonequilibrium Thermodynamics](https://arxiv.org/abs/1503.03585)<br><sub>Jascha Narain Sohl-Dickstein, Eric A. Weiss, Niru Maheswaranathan, S. Ganguli</sub></td>
<td>2015<br>International Conference on Machine Learning<br>10,158 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="generative-ai" src="https://img.shields.io/badge/keyword-generative--ai-a855f7"></td>
<td>A central problem in machine learning involves modeling complex data-sets using highly flexible families of probability distributions in which learning, sampling, inference, and evaluation are still analytically or computationally tractable.</td>
<td>high citation signal (10,158); influential citation signal (525); recognized venue</td>
<td>Image and media quality metrics may not capture factuality, controllability, provenance, or downstream harms.; Training data provenance and copyright constraints can be under-specified in highly cited generation work.; Robust evaluation across cultures, modalities, and adversarial uses remains difficult.</td>
</tr>
<tr>
<td align="right">135</td>
<td>[Wasserstein Generative Adversarial Networks](https://www.semanticscholar.org/paper/acd87843a451d18b4dc6474ddce1ae946429eaf1)<br><sub>Martín Arjovsky, Soumith Chintala, L. Bottou</sub></td>
<td>2017<br>International Conference on Machine Learning<br>9,588 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="generative-ai" src="https://img.shields.io/badge/keyword-generative--ai-a855f7"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>Positions Wasserstein Generative Adversarial Networks within Generative Models and Synthetic Media.</td>
<td>high citation signal (9,588); influential citation signal (1,220); recognized venue</td>
<td>Image and media quality metrics may not capture factuality, controllability, provenance, or downstream harms.; Training data provenance and copyright constraints can be under-specified in highly cited generation work.; Robust evaluation across cultures, modalities, and adversarial uses remains difficult.</td>
</tr>
<tr>
<td align="right">152</td>
<td>[Machine learning in automated text categorization](https://doi.org/10.1145/505282.505283)<br><sub>F. Sebastiani</sub></td>
<td>2001<br>CSUR<br>9,067 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>The automated categorization (or classification) of texts into predefined categories has witnessed a booming interest in the last 10 years, due to the increased availability of documents in digital form and the ensuing need to organize them.</td>
<td>high citation signal (9,067); influential citation signal (745); open-access PDF metadata</td>
<td>Image and media quality metrics may not capture factuality, controllability, provenance, or downstream harms.; Training data provenance and copyright constraints can be under-specified in highly cited generation work.; Robust evaluation across cultures, modalities, and adversarial uses remains difficult.</td>
</tr>
<tr>
<td align="right">159</td>
<td>[Advances and Open Problems in Federated Learning](https://doi.org/10.1561/2200000083)<br><sub>P. Kairouz, H. B. McMahan, Brendan Avent, A. Bellet, M. Bennis, A. Bhagoji, Keith Bonawitz, Zachary B. Charles, et al.</sub></td>
<td>2019<br>Found. Trends Mach. Learn.<br>8,772 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>Federated learning (FL) is a machine learning setting where many clients (e.g.</td>
<td>high citation signal (8,772); influential citation signal (560); open-access PDF metadata</td>
<td>Image and media quality metrics may not capture factuality, controllability, provenance, or downstream harms.; Training data provenance and copyright constraints can be under-specified in highly cited generation work.; Robust evaluation across cultures, modalities, and adversarial uses remains difficult.</td>
</tr>
<tr>
<td align="right">201</td>
<td>[Neural Discrete Representation Learning](https://arxiv.org/abs/1711.00937)<br><sub>Aäron van den Oord, O. Vinyals, K. Kavukcuoglu</sub></td>
<td>2017<br>Neural Information Processing Systems<br>7,422 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="generative-ai" src="https://img.shields.io/badge/keyword-generative--ai-a855f7"></td>
<td>Learning useful representations without supervision remains a key challenge in machine learning.</td>
<td>high citation signal (7,422); influential citation signal (985)</td>
<td>Image and media quality metrics may not capture factuality, controllability, provenance, or downstream harms.; Training data provenance and copyright constraints can be under-specified in highly cited generation work.; Robust evaluation across cultures, modalities, and adversarial uses remains difficult.</td>
</tr>
<tr><td colspan="7"><em>73 additional selected papers in this category are available in the dataset and website.</em></td></tr>
</tbody></table>

</details>

### Representation, Self-Supervised, and Transfer Learning

- Papers selected: **55**
- Years covered: **2001-2026**
- Citation count in selected set: **245,458**
- Category Overview (main research trends):
  - Self-supervised and contrastive methods are reducing dependence on labeled data while improving transfer across tasks and domains.
  - Reusable representations, distillation, domain adaptation, and few-shot learning form the connective tissue between specialized AI subfields.
  - Citation impact is often driven by methods that become default pretraining or adaptation recipes.
- Limitations:
  - Transfer claims depend heavily on downstream task choice, data overlap, and evaluation protocol.
  - Contrastive and self-supervised methods can learn spurious shortcuts when augmentations or negatives are poorly matched.
  - Representation quality is hard to compare when model size, data scale, and training recipes differ.

<details>
<summary><strong>Show representative papers for Representation, Self-Supervised, and Transfer Learning</strong></summary>

<table width="100%">
<colgroup>
<col width="5%">
<col width="22%">
<col width="12%">
<col width="12%">
<col width="25%">
<col width="12%">
<col width="12%">
</colgroup>
<thead><tr>
<th align="right">Rank</th><th>Paper</th><th>Meta</th><th>Keywords</th><th>Key idea</th><th>Strengths</th><th>Limitations</th>
</tr></thead><tbody>
<tr>
<td align="right">25</td>
<td>[Efficient Estimation of Word Representations in Vector Space](https://arxiv.org/abs/1301.3781)<br><sub>Tomas Mikolov, Kai Chen, G. Corrado, J. Dean</sub></td>
<td>2013<br>International Conference on Learning Representations<br>34,503 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"></td>
<td>We propose two novel model architectures for computing continuous vector representations of words from very large data sets.</td>
<td>high citation signal (34,503); influential citation signal (4,335)</td>
<td>Transfer claims depend heavily on downstream task choice, data overlap, and evaluation protocol.; Contrastive and self-supervised methods can learn spurious shortcuts when augmentations or negatives are poorly matched.; Representation quality is hard to compare when model size, data scale, and training recipes differ.</td>
</tr>
<tr>
<td align="right">41</td>
<td>[A Survey on Transfer Learning](https://doi.org/10.1109/tkde.2009.191)<br><sub>Sinno Jialin Pan, Qiang Yang</sub></td>
<td>2010<br>IEEE Transactions on Knowledge and Data Engineering<br>23,383 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>A major assumption in many machine learning and data mining algorithms is that the training and future data must be in the same feature space and have the same distribution.</td>
<td>high citation signal (23,383); influential citation signal (1,041); recognized venue</td>
<td>Transfer claims depend heavily on downstream task choice, data overlap, and evaluation protocol.; Contrastive and self-supervised methods can learn spurious shortcuts when augmentations or negatives are poorly matched.; Representation quality is hard to compare when model size, data scale, and training recipes differ.</td>
</tr>
<tr>
<td align="right">43</td>
<td>[Explaining and Harnessing Adversarial Examples](https://arxiv.org/abs/1412.6572)<br><sub>I. Goodfellow, Jonathon Shlens, Christian Szegedy</sub></td>
<td>2014<br>International Conference on Learning Representations<br>22,363 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>cluding neural networks, consistently misclassify adversarial examples---inputs formed by applying small but intentionally worst-case perturbations to examples from the dataset, such that the perturbed input results in the model outputting an incorrect answer with high confidence.</td>
<td>high citation signal (22,363); influential citation signal (4,184)</td>
<td>Transfer claims depend heavily on downstream task choice, data overlap, and evaluation protocol.; Contrastive and self-supervised methods can learn spurious shortcuts when augmentations or negatives are poorly matched.; Representation quality is hard to compare when model size, data scale, and training recipes differ.</td>
</tr>
<tr>
<td align="right">86</td>
<td>[Representation Learning: A Review and New Perspectives](https://doi.org/10.1109/tpami.2013.50)<br><sub>Yoshua Bengio, Aaron C. Courville, P. Vincent</sub></td>
<td>2012<br>IEEE Transactions on Pattern Analysis and Machine Intelligence<br>13,937 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"></td>
<td>The success of machine learning algorithms generally depends on data representation, and we hypothesize that this is because different representations can entangle and hide more or less the different explanatory factors of variation behind the data.</td>
<td>high citation signal (13,937); influential citation signal (584); recognized venue; open-access PDF metadata</td>
<td>Transfer claims depend heavily on downstream task choice, data overlap, and evaluation protocol.; Contrastive and self-supervised methods can learn spurious shortcuts when augmentations or negatives are poorly matched.; Representation quality is hard to compare when model size, data scale, and training recipes differ.</td>
</tr>
<tr>
<td align="right">90</td>
<td>[Representation Learning with Contrastive Predictive Coding](https://arxiv.org/abs/1807.03748)<br><sub>Aäron van den Oord, Yazhe Li, O. Vinyals</sub></td>
<td>2018<br>arXiv.org<br>13,607 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"></td>
<td>While supervised learning has enabled great progress in many applications, unsupervised learning has not seen such widespread adoption, and remains an important and challenging endeavor for artificial intelligence.</td>
<td>high citation signal (13,607); influential citation signal (1,535)</td>
<td>Transfer claims depend heavily on downstream task choice, data overlap, and evaluation protocol.; Contrastive and self-supervised methods can learn spurious shortcuts when augmentations or negatives are poorly matched.; Representation quality is hard to compare when model size, data scale, and training recipes differ.</td>
</tr>
<tr>
<td align="right">106</td>
<td>[Domain-Adversarial Training of Neural Networks](https://doi.org/10.1007/978-3-319-58347-1_10)<br><sub>Yaroslav Ganin, E. Ustinova, Hana Ajakan, Pascal Germain, H. Larochelle, François Laviolette, M. Marchand, V. Lempitsky</sub></td>
<td>2015<br>Journal of machine learning research<br>11,560 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>We introduce a new representation learning approach for domain adaptation, in which data at training and test time come from similar but different distributions.</td>
<td>high citation signal (11,560); influential citation signal (1,660); recognized venue</td>
<td>Transfer claims depend heavily on downstream task choice, data overlap, and evaluation protocol.; Contrastive and self-supervised methods can learn spurious shortcuts when augmentations or negatives are poorly matched.; Representation quality is hard to compare when model size, data scale, and training recipes differ.</td>
</tr>
<tr>
<td align="right">130</td>
<td>[DistilBERT, a distilled version of BERT: smaller, faster, cheaper and lighter](https://arxiv.org/abs/1910.01108)<br><sub>Victor Sanh, Lysandre Debut, Julien Chaumond, Thomas Wolf</sub></td>
<td>2019<br>arXiv.org<br>9,924 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>As Transfer Learning from large-scale pre-trained models becomes more prevalent in Natural Language Processing (NLP), operating these large models in on-the-edge and/or under constrained computational training or inference budgets remains challenging.</td>
<td>high citation signal (9,924); influential citation signal (1,225)</td>
<td>Transfer claims depend heavily on downstream task choice, data overlap, and evaluation protocol.; Contrastive and self-supervised methods can learn spurious shortcuts when augmentations or negatives are poorly matched.; Representation quality is hard to compare when model size, data scale, and training recipes differ.</td>
</tr>
<tr>
<td align="right">133</td>
<td>[Deep Learning Face Attributes in the Wild](https://doi.org/10.1109/iccv.2015.425)<br><sub>Ziwei Liu, Ping Luo, Xiaogang Wang, Xiaoou Tang</sub></td>
<td>2014<br>IEEE International Conference on Computer Vision<br>9,701 citations</td>
<td><img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>Predicting face attributes in the wild is challenging due to complex face variations.</td>
<td>high citation signal (9,701); influential citation signal (1,868); open-access PDF metadata</td>
<td>Transfer claims depend heavily on downstream task choice, data overlap, and evaluation protocol.; Contrastive and self-supervised methods can learn spurious shortcuts when augmentations or negatives are poorly matched.; Representation quality is hard to compare when model size, data scale, and training recipes differ.</td>
</tr>
<tr>
<td align="right">259</td>
<td>[Distance Metric Learning for Large Margin Nearest Neighbor Classification](https://doi.org/10.5555/1577069.1577078)<br><sub>Kilian Q. Weinberger, L. Saul</sub></td>
<td>2005<br>Neural Information Processing Systems<br>5,983 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"></td>
<td>Positions Distance Metric Learning for Large Margin Nearest Neighbor Classification within Representation, Self-Supervised, and Transfer Learning.</td>
<td>high citation signal (5,983); influential citation signal (754)</td>
<td>Transfer claims depend heavily on downstream task choice, data overlap, and evaluation protocol.; Contrastive and self-supervised methods can learn spurious shortcuts when augmentations or negatives are poorly matched.; Representation quality is hard to compare when model size, data scale, and training recipes differ.</td>
</tr>
<tr>
<td align="right">266</td>
<td>[Learning Transferable Features with Deep Adaptation Networks](https://arxiv.org/abs/1502.02791)<br><sub>Mingsheng Long, Yue Cao, Jianmin Wang, Michael I. Jordan</sub></td>
<td>2015<br>International Conference on Machine Learning<br>5,954 citations</td>
<td><img alt="machine-learning" src="https://img.shields.io/badge/keyword-machine--learning-475569"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>Recent studies reveal that a deep neural network can learn transferable features which generalize well to novel tasks for domain adaptation.</td>
<td>high citation signal (5,954); influential citation signal (741); recognized venue</td>
<td>Transfer claims depend heavily on downstream task choice, data overlap, and evaluation protocol.; Contrastive and self-supervised methods can learn spurious shortcuts when augmentations or negatives are poorly matched.; Representation quality is hard to compare when model size, data scale, and training recipes differ.</td>
</tr>
<tr><td colspan="7"><em>45 additional selected papers in this category are available in the dataset and website.</em></td></tr>
</tbody></table>

</details>

## Yearly Coverage

| Year | Candidate papers audited | Selected top-100 papers | Citations in selected set | Top selected paper |
|---:|---:|---:|---:|---|
| 2000 | 1,000 | 100 | 151,750 | [Data Mining: Concepts and Techniques](https://www.semanticscholar.org/paper/c36991759325bedd19f69264f72d1cbf59a6158c) |
| 2001 | 1,000 | 100 | 199,666 | [The Elements of Statistical Learning: Data Mining, Inference, and Prediction](https://doi.org/10.1007/978-0-387-84858-7) |
| 2002 | 1,000 | 100 | 163,015 | [Data Mining - Concepts and Techniques](https://www.semanticscholar.org/paper/982b955c900b04e9da64e3b39422690c13d6b94f) |
| 2003 | 1,000 | 100 | 124,417 | [Learning with Kernels: Support Vector Machines, Regularization, Optimization, and Beyond](https://doi.org/10.1198/jasa.2003.s270) |
| 2004 | 1,000 | 100 | 142,172 | [The Elements of Statistical Learning: Data Mining, Inference, and Prediction](https://doi.org/10.1198/jasa.2004.s339) |
| 2005 | 1,000 | 100 | 124,983 | [Survey of clustering algorithms](https://doi.org/10.1109/tnn.2005.845141) |
| 2006 | 1,000 | 100 | 117,674 | [Supporting Online Material for Reducing the Dimensionality of Data with Neural Networks](https://www.semanticscholar.org/paper/02552a8b40f3a82a5353f596264db71d899a9b4a) |
| 2007 | 1,000 | 100 | 128,381 | [Classification and Regression by randomForest](https://www.semanticscholar.org/paper/6e633b41d93051375ef9135102d54fa097dc8cf8) |
| 2008 | 1,000 | 100 | 116,790 | [LIBLINEAR: A Library for Large Linear Classification](https://doi.org/10.5555/1390681.1442794) |
| 2009 | 1,000 | 100 | 247,309 | [ImageNet: A large-scale hierarchical image database](https://doi.org/10.1109/cvpr.2009.5206848) |
| 2010 | 1,000 | 100 | 184,831 | [A Survey on Transfer Learning](https://doi.org/10.1109/tkde.2009.191) |
| 2011 | 1,000 | 100 | 254,295 | [Scikit-learn: Machine Learning in Python](https://doi.org/10.5555/1953048.2078195) |
| 2012 | 1,000 | 100 | 332,579 | [ImageNet classification with deep convolutional neural networks](https://doi.org/10.1145/3065386) |
| 2013 | 1,000 | 100 | 274,215 | [Efficient Estimation of Word Representations in Vector Space](https://arxiv.org/abs/1301.3781) |
| 2014 | 1,000 | 100 | 742,024 | [Very Deep Convolutional Networks for Large-Scale Image Recognition](https://arxiv.org/abs/1409.1556) |
| 2015 | 1,000 | 100 | 960,511 | [Deep Residual Learning for Image Recognition](https://doi.org/10.1109/cvpr.2016.90) |
| 2016 | 1,000 | 100 | 738,490 | [XGBoost: A Scalable Tree Boosting System](https://doi.org/10.1145/2939672.2939785) |
| 2017 | 1,000 | 100 | 775,257 | [Attention is All you Need](https://arxiv.org/abs/1706.03762) |
| 2018 | 1,000 | 100 | 445,723 | [CBAM: Convolutional Block Attention Module](https://doi.org/10.1007/978-3-030-01234-2_1) |
| 2019 | 1,000 | 100 | 638,014 | [BERT: Pre-training of Deep Bidirectional Transformers for Language Understanding](https://doi.org/10.18653/v1/n19-1423) |
| 2020 | 1,000 | 100 | 436,445 | [An Image is Worth 16x16 Words: Transformers for Image Recognition at Scale](https://arxiv.org/abs/2010.11929) |
| 2021 | 1,000 | 100 | 425,132 | [Learning Transferable Visual Models From Natural Language Supervision](https://arxiv.org/abs/2103.00020) |
| 2022 | 1,000 | 100 | 284,273 | [Training language models to follow instructions with human feedback](https://doi.org/10.52202/068431-2011) |
| 2023 | 1,000 | 100 | 334,364 | [LLaMA: Open and Efficient Foundation Language Models](https://arxiv.org/abs/2302.13971) |
| 2024 | 1,000 | 100 | 145,505 | [The Llama 3 Herd of Models](https://arxiv.org/abs/2407.21783) |
| 2025 | 1,000 | 100 | 72,745 | [Qwen3 Technical Report](https://arxiv.org/abs/2505.09388) |
| 2026 | 1,000 | 100 | 6,582 | [Scaling Monosemanticity: Extracting Interpretable Features from Claude 3 Sonnet](https://arxiv.org/abs/2605.29358) |

## Methodology

The collection uses Semantic Scholar Academic Graph bulk search. Queries cover broad AI, machine learning, deep learning, foundation models, language, vision, reinforcement learning, generative models, graph learning, multimodal learning, trustworthy AI, and AI-for-science themes. For each year from 2000 through 2026, results are filtered to the publication year, screened with explicit AI relevance expressions in title/abstract/venue metadata, deduplicated by DOI, arXiv, PubMed, CorpusId, paperId, then title, and reduced to at most 1,000 candidates by citation count. The final awesome list selects the top 100 papers within each publication year by citation count; influential citation count and a deterministic metadata importance score are retained as tie-breakers and audit signals.

The taxonomy, key ideas, strengths, limitations, method tags, and keyword tags are generated deterministically from public metadata and rule-based domain conventions. No paid API, paid LLM, paid translation, or paid compute was used.

## Caveats

- This is a metadata-driven citation map, not a full systematic review of every PDF.
- Citation counts favor older papers; 2026 should be interpreted as a partial and still-moving year.
- Semantic Scholar metadata can omit venues, abstracts, PDFs, or influential citation counts for some records.
- Citation ranking measures influence and visibility; it does not directly measure methodological quality, safety, or reproducibility.

## License

CC-BY-4.0 for text and metadata curation; upstream paper metadata belongs to original sources.
