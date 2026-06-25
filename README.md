# Awesome AI

[![Awesome](https://awesome.re/badge-flat.svg)](https://awesome.re)

<p align="center">
  <a href="https://honggi82.github.io/awesome-ai/">
    <img src="https://img.shields.io/badge/Open_Interactive_Website-honggi82.github.io%2Fawesome--ai-0f766e?style=for-the-badge" alt="Open Interactive Website">
  </a>
</p>

> Browse the full interactive taxonomy site with period, language, keyword, chart, and paper-card filters: https://honggi82.github.io/awesome-ai/

A taxonomy-first, citation-ranked map of AI research from 2020 through 2026.

Generated on 2026-06-26 from free public Semantic Scholar metadata. This edition investigates up to 1,000 AI-related candidate papers per year for 2020-2026, keeps an audited candidate pool of 7,000 records, selects the top 100 papers from each year by citation count (700 papers total), and reorganizes them by AI research taxonomy.

## Project Links

- Open Interactive Website: https://honggi82.github.io/awesome-ai/
- Selected dataset: `data/papers_2020_2026.csv`
- Taxonomy dataset with paper-level ideas, strengths, and limitations: `data/papers_taxonomy_2020_2026.csv`
- Precomputed period and language analysis: `data/period_analysis_2020_2026.json`
- Candidate Pool: `data/candidates_top1000_2020_2026.csv`
- English review draft: `paper/review_en.html`, `paper/review_en.docx`
- Korean review draft: `paper/review_ko.html`

## Keywords Convention

These badges define the AI keyword tags used to read and extend this collection.

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

- **Total selected papers**: 700 papers
- **Candidate pool audited**: 7,000 papers (2020: 1,000, 2021: 1,000, 2022: 1,000, 2023: 1,000, 2024: 1,000, 2025: 1,000, 2026: 1,000)
- **Citation count in selected set**: 1,584,599
- **Foundation Models and Large Language Models**: 417 papers
- **AI for Science, Healthcare, and Robotics**: 70 papers
- **Vision and Multimodal Learning**: 67 papers
- **Reinforcement Learning and Agents**: 33 papers
- **General AI Methods and Systems**: 27 papers
- **Graph Learning, Recommendation, and Core Methods**: 24 papers
- **Generative Models and Synthetic Media**: 19 papers
- **Natural Language Processing and Knowledge**: 16 papers
- **Trustworthy, Explainable, and Responsible AI**: 15 papers
- **Representation, Self-Supervised, and Transfer Learning**: 12 papers

## Taxonomy Collections

### Foundation Models and Large Language Models

- Papers selected: **417**
- Years covered: **2020-2026**
- Citation count in selected set: **879,746**
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
<td align="right">2</td>
<td>[Language Models are Few-Shot Learners](https://www.semanticscholar.org/paper/90abbc2cf38462b954ae1b772fac9532e2ccd8b0)<br><sub>Tom B. Brown, Benjamin Mann, Nick Ryder, Melanie Subbiah, J. Kaplan, Prafulla Dhariwal, Arvind Neelakantan, Pranav Shyam, et al.</sub></td>
<td>2020<br>Neural Information Processing Systems<br>59,605 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>Recent work has demonstrated substantial gains on many NLP tasks and benchmarks by pre-training on a large corpus of text followed by fine-tuning on a specific task.</td>
<td>high citation signal (59,605); influential citation signal (5,279)</td>
<td>Capability gains are difficult to separate from data scale, benchmark leakage, and evaluation prompt sensitivity.; Alignment and safety claims often need stronger real-world and multilingual validation.; Compute-intensive training can limit reproducibility and concentrate follow-up work around a small number of institutions.</td>
</tr>
<tr>
<td align="right">6</td>
<td>[Training language models to follow instructions with human feedback](https://doi.org/10.52202/068431-2011)<br><sub>Long Ouyang, Jeff Wu, Xu Jiang, Diogo Almeida, Carroll L. Wainwright, Pamela Mishkin, Chong Zhang, S. Agarwal, et al.</sub></td>
<td>2022<br>Neural Information Processing Systems<br>21,755 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"></td>
<td>Making language models bigger does not inherently make them better at following a user&#x27;s intent.</td>
<td>high citation signal (21,755); influential citation signal (2,276)</td>
<td>Capability gains are difficult to separate from data scale, benchmark leakage, and evaluation prompt sensitivity.; Alignment and safety claims often need stronger real-world and multilingual validation.; Compute-intensive training can limit reproducibility and concentrate follow-up work around a small number of institutions.</td>
</tr>
<tr>
<td align="right">7</td>
<td>[LLaMA: Open and Efficient Foundation Language Models](https://www.semanticscholar.org/paper/57e849d0de13ed5f91d086936296721d4ff75a75)<br><sub>Hugo Touvron, Thibaut Lavril, Gautier Izacard, X. Martinet, M. Lachaux, Timothée Lacroix, Baptiste Rozière, Naman Goyal, et al.</sub></td>
<td>2023<br>arXiv.org<br>20,427 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"></td>
<td>We introduce LLaMA, a collection of foundation language models ranging from 7B to 65B parameters.</td>
<td>high citation signal (20,427); influential citation signal (2,131)</td>
<td>Capability gains are difficult to separate from data scale, benchmark leakage, and evaluation prompt sensitivity.; Alignment and safety claims often need stronger real-world and multilingual validation.; Compute-intensive training can limit reproducibility and concentrate follow-up work around a small number of institutions.</td>
</tr>
<tr>
<td align="right">8</td>
<td>[LoRA: Low-Rank Adaptation of Large Language Models](https://www.semanticscholar.org/paper/a8ca46b171467ceb2d7652fbfb67fe701ad86092)<br><sub>J. Hu, Yelong Shen, Phillip Wallis, Zeyuan Allen-Zhu, Yuanzhi Li, Shean Wang, Weizhu Chen</sub></td>
<td>2021<br>International Conference on Learning Representations<br>20,108 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>An important paradigm of natural language processing consists of large-scale pre-training on general domain data and adaptation to particular tasks or domains.</td>
<td>high citation signal (20,108); influential citation signal (2,862)</td>
<td>Capability gains are difficult to separate from data scale, benchmark leakage, and evaluation prompt sensitivity.; Alignment and safety claims often need stronger real-world and multilingual validation.; Compute-intensive training can limit reproducibility and concentrate follow-up work around a small number of institutions.</td>
</tr>
<tr>
<td align="right">9</td>
<td>[Chain of Thought Prompting Elicits Reasoning in Large Language Models](https://doi.org/10.52202/068431-1800)<br><sub>Jason Wei, Xuezhi Wang, Dale Schuurmans, Maarten Bosma, Ed H. Chi, F. Xia, Quoc Le, Denny Zhou</sub></td>
<td>2022<br>Neural Information Processing Systems<br>19,316 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>We explore how generating a chain of thought -- a series of intermediate reasoning steps -- significantly improves the ability of large language models to perform complex reasoning.</td>
<td>high citation signal (19,316); influential citation signal (1,316)</td>
<td>Capability gains are difficult to separate from data scale, benchmark leakage, and evaluation prompt sensitivity.; Alignment and safety claims often need stronger real-world and multilingual validation.; Compute-intensive training can limit reproducibility and concentrate follow-up work around a small number of institutions.</td>
</tr>
<tr>
<td align="right">10</td>
<td>[Llama 2: Open Foundation and Fine-Tuned Chat Models](https://www.semanticscholar.org/paper/104b0bb1da562d53cbda87aec79ef6a2827d191a)<br><sub>Hugo Touvron, Louis Martin, Kevin R. Stone, Peter Albert, Amjad Almahairi, Yasmine Babaei, Niko-lay Bashlykov, Soumya Batra, et al.</sub></td>
<td>2023<br>arXiv.org<br>17,320 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>In this work, we develop and release Llama 2, a collection of pretrained and fine-tuned large language models (LLMs) ranging in scale from 7 billion to 70 billion parameters.</td>
<td>high citation signal (17,320); influential citation signal (2,177)</td>
<td>Capability gains are difficult to separate from data scale, benchmark leakage, and evaluation prompt sensitivity.; Alignment and safety claims often need stronger real-world and multilingual validation.; Compute-intensive training can limit reproducibility and concentrate follow-up work around a small number of institutions.</td>
</tr>
<tr>
<td align="right">11</td>
<td>[The Llama 3 Herd of Models](https://www.semanticscholar.org/paper/40e8af970329135ec95057d73e239dab805ad128)<br><sub>Abhimanyu Dubey, Abhinav Jauhri, Abhinav Pandey, Abhishek Kadian, Ahmad Al-Dahle, Aiesha Letman, Akhil Mathur, A. Schelten, et al.</sub></td>
<td>2024<br>Unknown venue<br>16,216 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>Modern artificial intelligence (AI) systems are powered by foundation models.</td>
<td>high citation signal (16,216); influential citation signal (3,038)</td>
<td>Capability gains are difficult to separate from data scale, benchmark leakage, and evaluation prompt sensitivity.; Alignment and safety claims often need stronger real-world and multilingual validation.; Compute-intensive training can limit reproducibility and concentrate follow-up work around a small number of institutions.</td>
</tr>
<tr>
<td align="right">12</td>
<td>[Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks](https://www.semanticscholar.org/paper/659bf9ce7175e1ec266ff54359e2bd76e0b7ff31)<br><sub>Patrick Lewis, Ethan Perez, Aleksandara Piktus, F. Petroni, Vladimir Karpukhin, Naman Goyal, Heinrich Kuttler, M. Lewis, et al.</sub></td>
<td>2020<br>Neural Information Processing Systems<br>15,004 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>Large pre-trained language models have been shown to store factual knowledge in their parameters, and achieve state-of-the-art results when fine-tuned on downstream NLP tasks.</td>
<td>high citation signal (15,004); influential citation signal (1,402)</td>
<td>Capability gains are difficult to separate from data scale, benchmark leakage, and evaluation prompt sensitivity.; Alignment and safety claims often need stronger real-world and multilingual validation.; Compute-intensive training can limit reproducibility and concentrate follow-up work around a small number of institutions.</td>
</tr>
<tr>
<td align="right">16</td>
<td>[Evaluating Large Language Models Trained on Code](https://www.semanticscholar.org/paper/acbdbf49f9bc3f151b93d9ca9a06009f4f6eb269)<br><sub>Mark Chen, Jerry Tworek, Heewoo Jun, Qiming Yuan, Henrique Pondé, Jared Kaplan, Harrison Edwards, Yura Burda, et al.</sub></td>
<td>2021<br>arXiv.org<br>10,122 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>We introduce Codex, a GPT language model fine-tuned on publicly available code from GitHub, and study its Python code-writing capabilities.</td>
<td>high citation signal (10,122); influential citation signal (1,555)</td>
<td>Capability gains are difficult to separate from data scale, benchmark leakage, and evaluation prompt sensitivity.; Alignment and safety claims often need stronger real-world and multilingual validation.; Compute-intensive training can limit reproducibility and concentrate follow-up work around a small number of institutions.</td>
</tr>
<tr>
<td align="right">17</td>
<td>[Visual Instruction Tuning](https://doi.org/10.48550/arXiv.2304.08485)<br><sub>Haotian Liu, Chunyuan Li, Qingyang Wu, Yong Jae Lee</sub></td>
<td>2023<br>Neural Information Processing Systems<br>9,932 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"> <img alt="generative-ai" src="https://img.shields.io/badge/keyword-generative--ai-a855f7"> <img alt="multimodal" src="https://img.shields.io/badge/keyword-multimodal-0891b2"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>Instruction tuning large language models (LLMs) using machine-generated instruction-following data has improved zero-shot capabilities on new tasks, but the idea is less explored in the multimodal field.</td>
<td>high citation signal (9,932); influential citation signal (1,598); open-access PDF metadata</td>
<td>Capability gains are difficult to separate from data scale, benchmark leakage, and evaluation prompt sensitivity.; Alignment and safety claims often need stronger real-world and multilingual validation.; Compute-intensive training can limit reproducibility and concentrate follow-up work around a small number of institutions.</td>
</tr>
<tr><td colspan="7"><em>407 additional selected papers in this category are available in the dataset and website.</em></td></tr>
</tbody></table>

</details>

### AI for Science, Healthcare, and Robotics

- Papers selected: **70**
- Years covered: **2020-2026**
- Citation count in selected set: **168,581**
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
<td align="right">4</td>
<td>[Highly accurate protein structure prediction with AlphaFold](https://doi.org/10.1038/s41586-021-03819-2)<br><sub>J. Jumper, Richard Evans, A. Pritzel, Tim Green, Michael Figurnov, O. Ronneberger, Kathryn Tunyasuvunakool, Russ Bates, et al.</sub></td>
<td>2021<br>Nature<br>36,697 citations</td>
<td><img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>Proteins are essential to life, and understanding their structure can facilitate a mechanistic understanding of their function.</td>
<td>high citation signal (36,697); influential citation signal (3,767); recognized venue; open-access PDF metadata</td>
<td>External validation, prospective testing, and domain expert review are often more important than retrospective benchmark scores.; Clinical, biological, or robotic deployment can fail when data collection protocols differ from training assumptions.; Safety, interpretability, uncertainty, and regulatory evidence remain essential for translation.</td>
</tr>
<tr>
<td align="right">21</td>
<td>[nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation](https://doi.org/10.1038/s41592-020-01008-z)<br><sub>Fabian Isensee, P. Jaeger, Simon A. A. Kohl, Jens Petersen, Klaus Hermann Maier-Hein</sub></td>
<td>2020<br>Nature Methods<br>9,048 citations</td>
<td><img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>Positions nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation within AI for Science, Healthcare, and Robotics.</td>
<td>high citation signal (9,048); influential citation signal (859); recognized venue; open-access PDF metadata</td>
<td>External validation, prospective testing, and domain expert review are often more important than retrospective benchmark scores.; Clinical, biological, or robotic deployment can fail when data collection protocols differ from training assumptions.; Safety, interpretability, uncertainty, and regulatory evidence remain essential for translation.</td>
</tr>
<tr>
<td align="right">28</td>
<td>[From Local Explanations to Global Understanding with Explainable AI for Trees](https://doi.org/10.1038/s42256-019-0138-9)<br><sub>Scott M. Lundberg, Gabriel Erion-Barner, Hugh Chen, A. DeGrave, J. Prutkin, Bala G. Nair, R. Katz, J. Himmelfarb, et al.</sub></td>
<td>2020<br>Nature Machine Intelligence<br>7,955 citations</td>
<td><img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>Tree-based machine learning models such as random forests, decision trees and gradient boosted trees are popular nonlinear predictive models, yet comparatively little attention has been paid to explaining their predictions.</td>
<td>high citation signal (7,955); influential citation signal (474); recognized venue; open-access PDF metadata</td>
<td>External validation, prospective testing, and domain expert review are often more important than retrospective benchmark scores.; Clinical, biological, or robotic deployment can fail when data collection protocols differ from training assumptions.; Safety, interpretability, uncertainty, and regulatory evidence remain essential for translation.</td>
</tr>
<tr>
<td align="right">36</td>
<td>[Review of deep learning: concepts, CNN architectures, challenges, applications, future directions](https://doi.org/10.1186/s40537-021-00444-8)<br><sub>Laith Alzubaidi, Jinglan Zhang, A. Humaidi, Ayad Al-dujaili, Y. Duan, O. Al-Shamma, José I. Santamaría, M. Fadhel, et al.</sub></td>
<td>2021<br>Journal of Big Data<br>6,602 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>In the last few years, the deep learning (DL) computing paradigm has been deemed the Gold Standard in the machine learning (ML) community.</td>
<td>high citation signal (6,602); influential citation signal (207); open-access PDF metadata</td>
<td>External validation, prospective testing, and domain expert review are often more important than retrospective benchmark scores.; Clinical, biological, or robotic deployment can fail when data collection protocols differ from training assumptions.; Safety, interpretability, uncertainty, and regulatory evidence remain essential for translation.</td>
</tr>
<tr>
<td align="right">49</td>
<td>[Swin-Unet: Unet-like Pure Transformer for Medical Image Segmentation](https://doi.org/10.1007/978-3-031-25066-8_9)<br><sub>Hu Cao, Yueyue Wang, Jieneng Chen, Dongsheng Jiang, Xiaopeng Zhang, Qi Tian, Manning Wang</sub></td>
<td>2021<br>ECCV Workshops<br>5,179 citations</td>
<td><img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>In the past few years, convolutional neural networks (CNNs) have achieved milestones in medical image analysis.</td>
<td>high citation signal (5,179); influential citation signal (498); recognized venue</td>
<td>External validation, prospective testing, and domain expert review are often more important than retrospective benchmark scores.; Clinical, biological, or robotic deployment can fail when data collection protocols differ from training assumptions.; Safety, interpretability, uncertainty, and regulatory evidence remain essential for translation.</td>
</tr>
<tr>
<td align="right">60</td>
<td>[Machine Learning: Algorithms, Real-World Applications and Research Directions](https://doi.org/10.1007/s42979-021-00592-x)<br><sub>Iqbal H. Sarker</sub></td>
<td>2021<br>SN Computer Science<br>4,424 citations</td>
<td><img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>In the current age of the Fourth Industrial Revolution (4IR or Industry 4.0), the digital world has a wealth of data, such as Internet of Things (IoT) data, cybersecurity data, mobile data, business data, social media data, health data, etc.</td>
<td>high citation signal (4,424); influential citation signal (166); recognized venue; open-access PDF metadata</td>
<td>External validation, prospective testing, and domain expert review are often more important than retrospective benchmark scores.; Clinical, biological, or robotic deployment can fail when data collection protocols differ from training assumptions.; Safety, interpretability, uncertainty, and regulatory evidence remain essential for translation.</td>
</tr>
<tr>
<td align="right">80</td>
<td>[Image Segmentation Using Deep Learning: A Survey](https://doi.org/10.1109/TPAMI.2021.3059968)<br><sub>Shervin Minaee, Yuri Boykov, F. Porikli, A. Plaza, N. Kehtarnavaz, Demetri Terzopoulos</sub></td>
<td>2020<br>IEEE Transactions on Pattern Analysis and Machine Intelligence<br>3,751 citations</td>
<td><img alt="generative-ai" src="https://img.shields.io/badge/keyword-generative--ai-a855f7"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>n computer vision and image processing with important applications such as scene understanding, medical image analysis, robotic perception, video surveillance, augmented reality, and image compression, among others, and numerous segmentation algorithms are found in the literature.</td>
<td>high citation signal (3,751); influential citation signal (94); recognized venue; open-access PDF metadata</td>
<td>External validation, prospective testing, and domain expert review are often more important than retrospective benchmark scores.; Clinical, biological, or robotic deployment can fail when data collection protocols differ from training assumptions.; Safety, interpretability, uncertainty, and regulatory evidence remain essential for translation.</td>
</tr>
<tr>
<td align="right">98</td>
<td>[Accurate prediction of protein structures and interactions using a 3-track neural network](https://doi.org/10.1126/science.abj8754)<br><sub>B. M, D. f, A. I, D. J, O. S, Lee Gr, W. J, C. Q., et al.</sub></td>
<td>2021<br>Science<br>3,327 citations</td>
<td><img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>Deep learning takes on protein folding In 1972, Anfinsen won a Nobel prize for demonstrating a connection between a protein&#x27;s amino acid sequence and its three-dimensional structure.</td>
<td>high citation signal (3,327); influential citation signal (146); recognized venue; open-access PDF metadata</td>
<td>External validation, prospective testing, and domain expert review are often more important than retrospective benchmark scores.; Clinical, biological, or robotic deployment can fail when data collection protocols differ from training assumptions.; Safety, interpretability, uncertainty, and regulatory evidence remain essential for translation.</td>
</tr>
<tr>
<td align="right">119</td>
<td>[Improved protein structure prediction using potentials from deep learning](https://doi.org/10.1038/s41586-019-1923-7)<br><sub>A. Senior, Richard Evans, J. Jumper, J. Kirkpatrick, L. Sifre, Tim Green, Chongli Qin, Augustin Žídek, et al.</sub></td>
<td>2020<br>Nature<br>2,913 citations</td>
<td><img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>Positions Improved protein structure prediction using potentials from deep learning within AI for Science, Healthcare, and Robotics.</td>
<td>high citation signal (2,913); influential citation signal (99); recognized venue</td>
<td>External validation, prospective testing, and domain expert review are often more important than retrospective benchmark scores.; Clinical, biological, or robotic deployment can fail when data collection protocols differ from training assumptions.; Safety, interpretability, uncertainty, and regulatory evidence remain essential for translation.</td>
</tr>
<tr>
<td align="right">126</td>
<td>[The future of digital health with federated learning](https://doi.org/10.1038/s41746-020-00323-1)<br><sub>Nicola Rieke, Jonny Hancox, Wenqi Li, Fausto Milletarì, H. Roth, Shadi Albarqouni, S. Bakas, M. Galtier, et al.</sub></td>
<td>2020<br>npj Digital Medicine<br>2,831 citations</td>
<td><img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>Data-driven machine learning (ML) has emerged as a promising approach for building accurate and robust statistical models from medical data, which is collected in huge volumes by modern healthcare systems.</td>
<td>high citation signal (2,831); influential citation signal (81); open-access PDF metadata</td>
<td>External validation, prospective testing, and domain expert review are often more important than retrospective benchmark scores.; Clinical, biological, or robotic deployment can fail when data collection protocols differ from training assumptions.; Safety, interpretability, uncertainty, and regulatory evidence remain essential for translation.</td>
</tr>
<tr><td colspan="7"><em>60 additional selected papers in this category are available in the dataset and website.</em></td></tr>
</tbody></table>

</details>

### Vision and Multimodal Learning

- Papers selected: **67**
- Years covered: **2020-2026**
- Citation count in selected set: **322,698**
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
<td>[An Image is Worth 16x16 Words: Transformers for Image Recognition at Scale](https://www.semanticscholar.org/paper/268d347e8a55b5eb82fb5e7d2f800e33c75ab18a)<br><sub>Alexey Dosovitskiy, Lucas Beyer, Alexander Kolesnikov, Dirk Weissenborn, Xiaohua Zhai, Thomas Unterthiner, Mostafa Dehghani, M. Minderer, et al.</sub></td>
<td>2020<br>International Conference on Learning Representations<br>64,585 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>While the Transformer architecture has become the de-facto standard for natural language processing tasks, its applications to computer vision remain limited.</td>
<td>high citation signal (64,585); influential citation signal (7,105)</td>
<td>Large-scale benchmark success can overstate robustness under distribution shift, rare classes, and real deployment constraints.; Multimodal alignment may inherit biases and spurious correlations from web-scale data.; High-performing systems often require data and compute resources that are hard for smaller labs to reproduce.</td>
</tr>
<tr>
<td align="right">3</td>
<td>[Learning Transferable Visual Models From Natural Language Supervision](https://www.semanticscholar.org/paper/6f870f7f02a8c59c3e23f407f3ef00dd1dcf8fc4)<br><sub>Alec Radford, Jong Wook Kim, Chris Hallacy, A. Ramesh, Gabriel Goh, S. Agarwal, G. Sastry, Amanda Askell, et al.</sub></td>
<td>2021<br>International Conference on Machine Learning<br>50,664 citations</td>
<td><img alt="multimodal" src="https://img.shields.io/badge/keyword-multimodal-0891b2"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>State-of-the-art computer vision systems are trained to predict a fixed set of predetermined object categories.</td>
<td>high citation signal (50,664); influential citation signal (9,732); recognized venue</td>
<td>Large-scale benchmark success can overstate robustness under distribution shift, rare classes, and real deployment constraints.; Multimodal alignment may inherit biases and spurious correlations from web-scale data.; High-performing systems often require data and compute resources that are hard for smaller labs to reproduce.</td>
</tr>
<tr>
<td align="right">5</td>
<td>[Swin Transformer: Hierarchical Vision Transformer using Shifted Windows](https://doi.org/10.1109/ICCV48922.2021.00986)<br><sub>Ze Liu, Yutong Lin, Yue Cao, Han Hu, Yixuan Wei, Zheng Zhang, Stephen Lin, B. Guo</sub></td>
<td>2021<br>IEEE International Conference on Computer Vision<br>33,057 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>This paper presents a new vision Transformer, called Swin Transformer, that capably serves as a general-purpose backbone for computer vision.</td>
<td>high citation signal (33,057); influential citation signal (3,952); open-access PDF metadata</td>
<td>Large-scale benchmark success can overstate robustness under distribution shift, rare classes, and real deployment constraints.; Multimodal alignment may inherit biases and spurious correlations from web-scale data.; High-performing systems often require data and compute resources that are hard for smaller labs to reproduce.</td>
</tr>
<tr>
<td align="right">13</td>
<td>[Segment Anything](https://doi.org/10.1109/ICCV51070.2023.00371)<br><sub>A. Kirillov, Eric Mintun, Nikhila Ravi, Hanzi Mao, Chloé Rolland, Laura Gustafson, Tete Xiao, Spencer Whitehead, et al.</sub></td>
<td>2023<br>IEEE International Conference on Computer Vision<br>14,026 citations</td>
<td><img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>We introduce the Segment Anything (SA) project: a new task, model, and dataset for image segmentation.</td>
<td>high citation signal (14,026); influential citation signal (1,884)</td>
<td>Large-scale benchmark success can overstate robustness under distribution shift, rare classes, and real deployment constraints.; Multimodal alignment may inherit biases and spurious correlations from web-scale data.; High-performing systems often require data and compute resources that are hard for smaller labs to reproduce.</td>
</tr>
<tr>
<td align="right">14</td>
<td>[Masked Autoencoders Are Scalable Vision Learners](https://doi.org/10.1109/CVPR52688.2022.01553)<br><sub>Kaiming He, Xinlei Chen, Saining Xie, Yanghao Li, Piotr Doll&#x27;ar, Ross B. Girshick</sub></td>
<td>2021<br>Computer Vision and Pattern Recognition<br>11,814 citations</td>
<td><img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>This paper shows that masked autoencoders (MAE) are scalable self-supervised learners for computer vision.</td>
<td>high citation signal (11,814); influential citation signal (1,984); recognized venue; open-access PDF metadata</td>
<td>Large-scale benchmark success can overstate robustness under distribution shift, rare classes, and real deployment constraints.; Multimodal alignment may inherit biases and spurious correlations from web-scale data.; High-performing systems often require data and compute resources that are hard for smaller labs to reproduce.</td>
</tr>
<tr>
<td align="right">15</td>
<td>[YOLOv7: Trainable Bag-of-Freebies Sets New State-of-the-Art for Real-Time Object Detectors](https://doi.org/10.1109/CVPR52729.2023.00721)<br><sub>Chien-Yao Wang, Alexey Bochkovskiy, H. Liao</sub></td>
<td>2022<br>Computer Vision and Pattern Recognition<br>10,472 citations</td>
<td><img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>Real-time object detection is one of the most important research topics in computer vision.</td>
<td>high citation signal (10,472); influential citation signal (823); recognized venue; open-access PDF metadata</td>
<td>Large-scale benchmark success can overstate robustness under distribution shift, rare classes, and real deployment constraints.; Multimodal alignment may inherit biases and spurious correlations from web-scale data.; High-performing systems often require data and compute resources that are hard for smaller labs to reproduce.</td>
</tr>
<tr>
<td align="right">18</td>
<td>[Training data-efficient image transformers &amp; distillation through attention](https://www.semanticscholar.org/paper/ad7ddcc14984caae308c397f1a589aae75d4ab71)<br><sub>Hugo Touvron, M. Cord, Matthijs Douze, Francisco Massa, Alexandre Sablayrolles, Hervé Jégou</sub></td>
<td>2020<br>International Conference on Machine Learning<br>9,283 citations</td>
<td><img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>Recently, neural networks purely based on attention were shown to address image understanding tasks such as image classification.</td>
<td>high citation signal (9,283); influential citation signal (1,210); recognized venue</td>
<td>Large-scale benchmark success can overstate robustness under distribution shift, rare classes, and real deployment constraints.; Multimodal alignment may inherit biases and spurious correlations from web-scale data.; High-performing systems often require data and compute resources that are hard for smaller labs to reproduce.</td>
</tr>
<tr>
<td align="right">22</td>
<td>[DINOv2: Learning Robust Visual Features without Supervision](https://doi.org/10.48550/arXiv.2304.07193)<br><sub>M. Oquab, Timothée Darcet, Théo Moutakanni, Huy V. Vo, Marc Szafraniec, Vasil Khalidov, Pierre Fernandez, Daniel Haziza, et al.</sub></td>
<td>2023<br>Trans. Mach. Learn. Res.<br>8,740 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>The recent breakthroughs in natural language processing for model pretraining on large quantities of data have opened the way for similar foundation models in computer vision.</td>
<td>high citation signal (8,740); influential citation signal (1,307); open-access PDF metadata</td>
<td>Large-scale benchmark success can overstate robustness under distribution shift, rare classes, and real deployment constraints.; Multimodal alignment may inherit biases and spurious correlations from web-scale data.; High-performing systems often require data and compute resources that are hard for smaller labs to reproduce.</td>
</tr>
<tr>
<td align="right">24</td>
<td>[A ConvNet for the 2020s](https://doi.org/10.1109/CVPR52688.2022.01167)<br><sub>Zhuang Liu, Hanzi Mao, Chaozheng Wu, Christoph Feichtenhofer, Trevor Darrell, Saining Xie</sub></td>
<td>2022<br>Computer Vision and Pattern Recognition<br>8,457 citations</td>
<td><img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>The “Roaring 20s” of visual recognition began with the introduction of Vision Transformers (ViTs), which quickly superseded ConvNets as the state-of-the-art image classification model.</td>
<td>high citation signal (8,457); influential citation signal (971); recognized venue</td>
<td>Large-scale benchmark success can overstate robustness under distribution shift, rare classes, and real deployment constraints.; Multimodal alignment may inherit biases and spurious correlations from web-scale data.; High-performing systems often require data and compute resources that are hard for smaller labs to reproduce.</td>
</tr>
<tr>
<td align="right">51</td>
<td>[Pyramid Vision Transformer: A Versatile Backbone for Dense Prediction without Convolutions](https://doi.org/10.1109/ICCV48922.2021.00061)<br><sub>Wenhai Wang, Enze Xie, Xiang Li, Deng-Ping Fan, Kaitao Song, Ding Liang, Tong Lu, P. Luo, et al.</sub></td>
<td>2021<br>IEEE International Conference on Computer Vision<br>5,064 citations</td>
<td><img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>Although convolutional neural networks (CNNs) have achieved great success in computer vision, this work investigates a simpler, convolution-free backbone network use-fid for many dense prediction tasks.</td>
<td>high citation signal (5,064); influential citation signal (554); open-access PDF metadata</td>
<td>Large-scale benchmark success can overstate robustness under distribution shift, rare classes, and real deployment constraints.; Multimodal alignment may inherit biases and spurious correlations from web-scale data.; High-performing systems often require data and compute resources that are hard for smaller labs to reproduce.</td>
</tr>
<tr><td colspan="7"><em>57 additional selected papers in this category are available in the dataset and website.</em></td></tr>
</tbody></table>

</details>

### Reinforcement Learning and Agents

- Papers selected: **33**
- Years covered: **2020-2026**
- Citation count in selected set: **38,128**
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
<td align="right">72</td>
<td>[DeepSeek-R1: Incentivizing Reasoning Capability in LLMs via Reinforcement Learning](https://doi.org/10.48550/arXiv.2501.12948)<br><sub>Adam Suma, Sam Dauncey</sub></td>
<td>2025<br>arXiv.org<br>4,015 citations</td>
<td><img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"></td>
<td>Positions DeepSeek-R1: Incentivizing Reasoning Capability in LLMs via Reinforcement Learning within Reinforcement Learning and Agents.</td>
<td>high citation signal (4,015); influential citation signal (709)</td>
<td>Sample efficiency, reward misspecification, simulator bias, and safety under exploration remain persistent barriers.; Benchmark performance may not transfer to physical robots, human-facing tools, or open-ended environments.; Agentic systems need stronger evidence on reliability, recovery from errors, and long-horizon oversight.</td>
</tr>
<tr>
<td align="right">95</td>
<td>[Diffusion policy: Visuomotor policy learning via action diffusion](https://doi.org/10.1177/02783649241273668)<br><sub>Cheng Chi, S. Feng, Yilun Du, Zhenjia Xu, Eric Cousineau, B. Burchfiel, Shuran Song</sub></td>
<td>2023<br>Robotics: Science and Systems<br>3,397 citations</td>
<td><img alt="generative-ai" src="https://img.shields.io/badge/keyword-generative--ai-a855f7"> <img alt="multimodal" src="https://img.shields.io/badge/keyword-multimodal-0891b2"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>This paper introduces Diffusion Policy, a new way of generating robot behavior by representing a robot’s visuomotor policy as a conditional denoising diffusion process.</td>
<td>high citation signal (3,397); influential citation signal (729); recognized venue; open-access PDF metadata</td>
<td>Sample efficiency, reward misspecification, simulator bias, and safety under exploration remain persistent barriers.; Benchmark performance may not transfer to physical robots, human-facing tools, or open-ended environments.; Agentic systems need stronger evidence on reliability, recovery from errors, and long-horizon oversight.</td>
</tr>
<tr>
<td align="right">105</td>
<td>[Constitutional AI: Harmlessness from AI Feedback](https://doi.org/10.48550/arXiv.2212.08073)<br><sub>Yuntao Bai, Saurav Kadavath, Sandipan Kundu, Amanda Askell, John Kernion, Andy Jones, A. Chen, Anna Goldie, et al.</sub></td>
<td>2022<br>arXiv.org<br>3,186 citations</td>
<td><img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"></td>
<td>As AI systems become more capable, we would like to enlist their help to supervise other AIs.</td>
<td>high citation signal (3,186); influential citation signal (237); open-access PDF metadata</td>
<td>Sample efficiency, reward misspecification, simulator bias, and safety under exploration remain persistent barriers.; Benchmark performance may not transfer to physical robots, human-facing tools, or open-ended environments.; Agentic systems need stronger evidence on reliability, recovery from errors, and long-horizon oversight.</td>
</tr>
<tr>
<td align="right">116</td>
<td>[Shortcut learning in deep neural networks](https://doi.org/10.1038/s42256-020-00257-z)<br><sub>Robert Geirhos, J. Jacobsen, Claudio Michaelis, R. Zemel, Wieland Brendel, M. Bethge, Felix Wichmann</sub></td>
<td>2020<br>Nature Machine Intelligence<br>2,990 citations</td>
<td><img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>Deep learning has triggered the current rise of artificial intelligence and is the workhorse of today’s machine intelligence.</td>
<td>high citation signal (2,990); influential citation signal (143); recognized venue; open-access PDF metadata</td>
<td>Sample efficiency, reward misspecification, simulator bias, and safety under exploration remain persistent barriers.; Benchmark performance may not transfer to physical robots, human-facing tools, or open-ended environments.; Agentic systems need stronger evidence on reliability, recovery from errors, and long-horizon oversight.</td>
</tr>
<tr>
<td align="right">120</td>
<td>[Stable-Baselines3: Reliable Reinforcement Learning Implementations](https://www.semanticscholar.org/paper/e3fc5b5627af62ee6981a02090cf6bae368202d7)<br><sub>A. Raffin, Ashley Hill, A. Gleave, A. Kanervisto, M. Ernestus, Noah Dormann</sub></td>
<td>2021<br>Journal of machine learning research<br>2,896 citations</td>
<td><img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"></td>
<td>Positions Stable-Baselines3: Reliable Reinforcement Learning Implementations within Reinforcement Learning and Agents.</td>
<td>high citation signal (2,896); influential citation signal (187); recognized venue</td>
<td>Sample efficiency, reward misspecification, simulator bias, and safety under exploration remain persistent barriers.; Benchmark performance may not transfer to physical robots, human-facing tools, or open-ended environments.; Agentic systems need stronger evidence on reliability, recovery from errors, and long-horizon oversight.</td>
</tr>
<tr>
<td align="right">143</td>
<td>[Conservative Q-Learning for Offline Reinforcement Learning](https://www.semanticscholar.org/paper/28db20a81eec74a50204686c3cf796c42a020d2e)<br><sub>Aviral Kumar, Aurick Zhou, G. Tucker, S. Levine</sub></td>
<td>2020<br>Neural Information Processing Systems<br>2,600 citations</td>
<td><img alt="multimodal" src="https://img.shields.io/badge/keyword-multimodal-0891b2"> <img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"></td>
<td>Effectively leveraging large, previously collected datasets in reinforcement learning (RL) is a key challenge for large-scale real-world applications.</td>
<td>high citation signal (2,600); influential citation signal (629)</td>
<td>Sample efficiency, reward misspecification, simulator bias, and safety under exploration remain persistent barriers.; Benchmark performance may not transfer to physical robots, human-facing tools, or open-ended environments.; Agentic systems need stronger evidence on reliability, recovery from errors, and long-horizon oversight.</td>
</tr>
<tr>
<td align="right">217</td>
<td>[Gradient Surgery for Multi-Task Learning](https://www.semanticscholar.org/paper/449c5660d637741f7aa7ff42549c32b43c9968bf)<br><sub>Tianhe Yu, Saurabh Kumar, Abhishek Gupta, S. Levine, Karol Hausman, Chelsea Finn</sub></td>
<td>2020<br>Neural Information Processing Systems<br>1,891 citations</td>
<td><img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"></td>
<td>While deep learning and deep reinforcement learning (RL) systems have demonstrated impressive results in domains such as image classification, game playing, and robotic control, data efficiency remains a major challenge.</td>
<td>high citation signal (1,891); influential citation signal (367)</td>
<td>Sample efficiency, reward misspecification, simulator bias, and safety under exploration remain persistent barriers.; Benchmark performance may not transfer to physical robots, human-facing tools, or open-ended environments.; Agentic systems need stronger evidence on reliability, recovery from errors, and long-horizon oversight.</td>
</tr>
<tr>
<td align="right">222</td>
<td>[Introduction to Reinforcement Learning](https://doi.org/10.1007/978-981-13-8285-7_1)<br><sub>Mohit Sewak</sub></td>
<td>2020<br>Deep Reinforcement Learning in Unity<br>1,869 citations</td>
<td><img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"></td>
<td>Positions Introduction to Reinforcement Learning within Reinforcement Learning and Agents.</td>
<td>high citation signal (1,869); influential citation signal (152)</td>
<td>Sample efficiency, reward misspecification, simulator bias, and safety under exploration remain persistent barriers.; Benchmark performance may not transfer to physical robots, human-facing tools, or open-ended environments.; Agentic systems need stronger evidence on reliability, recovery from errors, and long-horizon oversight.</td>
</tr>
<tr>
<td align="right">231</td>
<td>[D4RL: Datasets for Deep Data-Driven Reinforcement Learning](https://www.semanticscholar.org/paper/a326d9f2d2d351001fece788165dbcbb524da2e4)<br><sub>Justin Fu, Aviral Kumar, Ofir Nachum, G. Tucker, S. Levine</sub></td>
<td>2020<br>arXiv.org<br>1,826 citations</td>
<td><img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"></td>
<td>The offline reinforcement learning (RL) problem, also known as batch RL, refers to the setting where a policy must be learned from a static dataset, without additional online data collection.</td>
<td>high citation signal (1,826); influential citation signal (605)</td>
<td>Sample efficiency, reward misspecification, simulator bias, and safety under exploration remain persistent barriers.; Benchmark performance may not transfer to physical robots, human-facing tools, or open-ended environments.; Agentic systems need stronger evidence on reliability, recovery from errors, and long-horizon oversight.</td>
</tr>
<tr>
<td align="right">277</td>
<td>[Learning quadrupedal locomotion over challenging terrain](https://doi.org/10.1126/scirobotics.abc5986)<br><sub>Joonho Lee, Jemin Hwangbo, Lorenz Wellhausen, V. Koltun, Marco Hutter</sub></td>
<td>2020<br>Science Robotics<br>1,644 citations</td>
<td><img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>A learning-based locomotion controller enables a quadrupedal ANYmal robot to traverse challenging natural environments.</td>
<td>high citation signal (1,644); influential citation signal (100); recognized venue; open-access PDF metadata</td>
<td>Sample efficiency, reward misspecification, simulator bias, and safety under exploration remain persistent barriers.; Benchmark performance may not transfer to physical robots, human-facing tools, or open-ended environments.; Agentic systems need stronger evidence on reliability, recovery from errors, and long-horizon oversight.</td>
</tr>
<tr><td colspan="7"><em>23 additional selected papers in this category are available in the dataset and website.</em></td></tr>
</tbody></table>

</details>

### General AI Methods and Systems

- Papers selected: **27**
- Years covered: **2020-2026**
- Citation count in selected set: **34,189**
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
<td align="right">33</td>
<td>[Physics-informed machine learning](https://doi.org/10.1038/s42254-021-00314-5)<br><sub>G. Karniadakis, I. Kevrekidis, Lu Lu, P. Perdikaris, Sifan Wang, Liu Yang</sub></td>
<td>2021<br>Nature Reviews Physics<br>6,974 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"></td>
<td>Positions Physics-informed machine learning within General AI Methods and Systems.</td>
<td>high citation signal (6,974); influential citation signal (186); recognized venue; open-access PDF metadata</td>
<td>Survey and infrastructure papers can dominate citations while empirical evidence remains distributed across subfields.; Broad claims need careful mapping to specific tasks, datasets, and operational constraints.; Metadata-driven ranking cannot replace expert reading of full papers and experimental details.</td>
</tr>
<tr>
<td align="right">114</td>
<td>[A review on the attention mechanism of deep learning](https://doi.org/10.1016/J.NEUCOM.2021.03.091)<br><sub>Zhaoyang Niu, G. Zhong, Hui Yu</sub></td>
<td>2021<br>Neurocomputing<br>3,013 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"></td>
<td>Positions A review on the attention mechanism of deep learning within General AI Methods and Systems.</td>
<td>high citation signal (3,013); influential citation signal (35)</td>
<td>Survey and infrastructure papers can dominate citations while empirical evidence remains distributed across subfields.; Broad claims need careful mapping to specific tasks, datasets, and operational constraints.; Metadata-driven ranking cannot replace expert reading of full papers and experimental details.</td>
</tr>
<tr>
<td align="right">135</td>
<td>[International evaluation of an AI system for breast cancer screening](https://doi.org/10.1038/s41586-019-1799-6)<br><sub>S. McKinney, Marcin Sieniek, Varun Godbole, Jonathan Godwin, Natasha Antropova, H. Ashrafian, T. Back, Mary Chesus, et al.</sub></td>
<td>2020<br>Nature<br>2,665 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"></td>
<td>Positions International evaluation of an AI system for breast cancer screening within General AI Methods and Systems.</td>
<td>high citation signal (2,665); influential citation signal (103); recognized venue</td>
<td>Survey and infrastructure papers can dominate citations while empirical evidence remains distributed across subfields.; Broad claims need careful mapping to specific tasks, datasets, and operational constraints.; Metadata-driven ranking cannot replace expert reading of full papers and experimental details.</td>
</tr>
<tr>
<td align="right">164</td>
<td>[AI in health and medicine](https://doi.org/10.1038/s41591-021-01614-0)<br><sub>P. Rajpurkar, E. Chen, Oishi Banerjee, E. Topol</sub></td>
<td>2022<br>Nature Medicine<br>2,308 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"></td>
<td>Positions AI in health and medicine within General AI Methods and Systems.</td>
<td>high citation signal (2,308); influential citation signal (41); recognized venue</td>
<td>Survey and infrastructure papers can dominate citations while empirical evidence remains distributed across subfields.; Broad claims need careful mapping to specific tasks, datasets, and operational constraints.; Metadata-driven ranking cannot replace expert reading of full papers and experimental details.</td>
</tr>
<tr>
<td align="right">198</td>
<td>[Human Trust in Artificial Intelligence: Review of Empirical Research](https://doi.org/10.5465/annals.2018.0057)<br><sub>Ella Glikson, A. Woolley</sub></td>
<td>2020<br>The Academy of Management Annals<br>2,037 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"></td>
<td>Artificial intelligence (AI) characterizes a new generation of technologies capable of interacting with the environment and aiming to simulate human intelligence.</td>
<td>high citation signal (2,037); influential citation signal (141)</td>
<td>Survey and infrastructure papers can dominate citations while empirical evidence remains distributed across subfields.; Broad claims need careful mapping to specific tasks, datasets, and operational constraints.; Metadata-driven ranking cannot replace expert reading of full papers and experimental details.</td>
</tr>
<tr>
<td align="right">209</td>
<td>[Simple and Deep Graph Convolutional Networks](https://www.semanticscholar.org/paper/1d81e7f428fea2b2e15ee3a96fe843ca603acc4c)<br><sub>Ming Chen, Zhewei Wei, Zengfeng Huang, Bolin Ding, Yaliang Li</sub></td>
<td>2020<br>International Conference on Machine Learning<br>1,969 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"></td>
<td>Graph convolutional networks (GCNs) are a powerful deep learning approach for graph-structured data.</td>
<td>high citation signal (1,969); influential citation signal (341); recognized venue</td>
<td>Survey and infrastructure papers can dominate citations while empirical evidence remains distributed across subfields.; Broad claims need careful mapping to specific tasks, datasets, and operational constraints.; Metadata-driven ranking cannot replace expert reading of full papers and experimental details.</td>
</tr>
<tr>
<td align="right">214</td>
<td>[Time-series forecasting with deep learning: a survey](https://doi.org/10.1098/rsta.2020.0209)<br><sub>Bryan Lim, Stefan Zohren</sub></td>
<td>2020<br>Philosophical Transactions of the Royal Society A<br>1,931 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"></td>
<td>Numerous deep learning architectures have been developed to accommodate the diversity of time-series datasets across different domains.</td>
<td>high citation signal (1,931); influential citation signal (39); open-access PDF metadata</td>
<td>Survey and infrastructure papers can dominate citations while empirical evidence remains distributed across subfields.; Broad claims need careful mapping to specific tasks, datasets, and operational constraints.; Metadata-driven ranking cannot replace expert reading of full papers and experimental details.</td>
</tr>
<tr>
<td align="right">247</td>
<td>[Machine learning and deep learning](https://doi.org/10.1007/s12525-021-00475-2)<br><sub>Christian Janiesch, Patrick Zschech, K. Heinrich</sub></td>
<td>2021<br>Electronic Markets<br>1,769 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"></td>
<td>Today, intelligent systems that offer artificial intelligence capabilities often rely on machine learning.</td>
<td>high citation signal (1,769); influential citation signal (25); open-access PDF metadata</td>
<td>Survey and infrastructure papers can dominate citations while empirical evidence remains distributed across subfields.; Broad claims need careful mapping to specific tasks, datasets, and operational constraints.; Metadata-driven ranking cannot replace expert reading of full papers and experimental details.</td>
</tr>
<tr>
<td align="right">262</td>
<td>[A review on the long short-term memory model](https://doi.org/10.1007/s10462-020-09838-1)<br><sub>G. V. Houdt, Carlos Mosquera, Gonzalo Nápoles</sub></td>
<td>2020<br>Artificial Intelligence Review<br>1,704 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"></td>
<td>Positions A review on the long short-term memory model within General AI Methods and Systems.</td>
<td>high citation signal (1,704); influential citation signal (30); recognized venue; open-access PDF metadata</td>
<td>Survey and infrastructure papers can dominate citations while empirical evidence remains distributed across subfields.; Broad claims need careful mapping to specific tasks, datasets, and operational constraints.; Metadata-driven ranking cannot replace expert reading of full papers and experimental details.</td>
</tr>
<tr>
<td align="right">267</td>
<td>[Artificial Intelligence and Management: The Automation–Augmentation Paradox](https://doi.org/10.5465/2018.0072)<br><sub>Sebastian Raisch, Sebastian Krakowski</sub></td>
<td>2020<br>Academy of Management Review<br>1,675 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"></td>
<td>Taking three recent business books on artificial intelligence (AI) as a starting point, we explore the automation and augmentation concepts in the management domain.</td>
<td>high citation signal (1,675); influential citation signal (96); open-access PDF metadata</td>
<td>Survey and infrastructure papers can dominate citations while empirical evidence remains distributed across subfields.; Broad claims need careful mapping to specific tasks, datasets, and operational constraints.; Metadata-driven ranking cannot replace expert reading of full papers and experimental details.</td>
</tr>
<tr><td colspan="7"><em>17 additional selected papers in this category are available in the dataset and website.</em></td></tr>
</tbody></table>

</details>

### Graph Learning, Recommendation, and Core Methods

- Papers selected: **24**
- Years covered: **2020-2026**
- Citation count in selected set: **41,649**
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
<td align="right">48</td>
<td>[LightGCN: Simplifying and Powering Graph Convolution Network for Recommendation](https://doi.org/10.1145/3397271.3401063)<br><sub>Xiangnan He, Kuan Deng, Xiang Wang, Yan Li, Yongdong Zhang, Meng Wang</sub></td>
<td>2020<br>Annual International ACM SIGIR Conference on Research and Development in Information Retrieval<br>5,278 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="graph-learning" src="https://img.shields.io/badge/keyword-graph--learning-4f46e5"></td>
<td>Graph Convolution Network (GCN) has become new state-of-the-art for collaborative filtering.</td>
<td>high citation signal (5,278); influential citation signal (888); recognized venue</td>
<td>Graph and recommender benchmarks can contain temporal leakage, popularity bias, or unrealistic train/test splits.; Algorithmic gains may be sensitive to hyperparameter budgets and implementation details.; Core methods need careful ablations before broad claims about generality or efficiency are accepted.</td>
</tr>
<tr>
<td align="right">85</td>
<td>[Open Graph Benchmark: Datasets for Machine Learning on Graphs](https://www.semanticscholar.org/paper/597bd2e45427563cdf025e53a3239006aa364cfc)<br><sub>Weihua Hu, Matthias Fey, M. Zitnik, Yuxiao Dong, Hongyu Ren, Bowen Liu, Michele Catasta, J. Leskovec</sub></td>
<td>2020<br>Neural Information Processing Systems<br>3,645 citations</td>
<td><img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"> <img alt="graph-learning" src="https://img.shields.io/badge/keyword-graph--learning-4f46e5"></td>
<td>We present the Open Graph Benchmark (OGB), a diverse set of challenging and realistic benchmark datasets to facilitate scalable, robust, and reproducible graph machine learning (ML) research.</td>
<td>high citation signal (3,645); influential citation signal (646)</td>
<td>Graph and recommender benchmarks can contain temporal leakage, popularity bias, or unrealistic train/test splits.; Algorithmic gains may be sensitive to hyperparameter budgets and implementation details.; Core methods need careful ablations before broad claims about generality or efficiency are accepted.</td>
</tr>
<tr>
<td align="right">124</td>
<td>[On Hyperparameter Optimization of Machine Learning Algorithms: Theory and Practice](https://doi.org/10.1016/j.neucom.2020.07.061)<br><sub>Li Yang, A. Shami</sub></td>
<td>2020<br>Neurocomputing<br>2,835 citations</td>
<td><img alt="graph-learning" src="https://img.shields.io/badge/keyword-graph--learning-4f46e5"></td>
<td>Abstract Machine learning algorithms have been used widely in various applications and areas.</td>
<td>high citation signal (2,835); influential citation signal (85); open-access PDF metadata</td>
<td>Graph and recommender benchmarks can contain temporal leakage, popularity bias, or unrealistic train/test splits.; Algorithmic gains may be sensitive to hyperparameter budgets and implementation details.; Core methods need careful ablations before broad claims about generality or efficiency are accepted.</td>
</tr>
<tr>
<td align="right">125</td>
<td>[Graph Contrastive Learning with Augmentations](https://www.semanticscholar.org/paper/76c124786ccf4263e6403a15a8e350ac28be4e65)<br><sub>Yuning You, Tianlong Chen, Yongduo Sui, Ting Chen, Zhangyang Wang, Yang Shen</sub></td>
<td>2020<br>Neural Information Processing Systems<br>2,833 citations</td>
<td><img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"> <img alt="graph-learning" src="https://img.shields.io/badge/keyword-graph--learning-4f46e5"></td>
<td>Generalizable, transferrable, and robust representation learning on graph-structured data remains a challenge for current graph neural networks (GNNs).</td>
<td>high citation signal (2,833); influential citation signal (461)</td>
<td>Graph and recommender benchmarks can contain temporal leakage, popularity bias, or unrealistic train/test splits.; Algorithmic gains may be sensitive to hyperparameter budgets and implementation details.; Core methods need careful ablations before broad claims about generality or efficiency are accepted.</td>
</tr>
<tr>
<td align="right">188</td>
<td>[E(3)-equivariant graph neural networks for data-efficient and accurate interatomic potentials](https://doi.org/10.1038/s41467-022-29939-5)<br><sub>Simon L. Batzner, Albert Musaelian, Lixin Sun, M. Geiger, J. Mailoa, M. Kornbluth, Nicola Molinari, T. Smidt, et al.</sub></td>
<td>2021<br>Nature Communications<br>2,115 citations</td>
<td><img alt="graph-learning" src="https://img.shields.io/badge/keyword-graph--learning-4f46e5"></td>
<td>This work presents Neural Equivariant Interatomic Potentials (NequIP), an E(3)-equivariant neural network approach for learning interatomic potentials from ab-initio calculations for molecular dynamics simulations.</td>
<td>high citation signal (2,115); influential citation signal (130); recognized venue; open-access PDF metadata</td>
<td>Graph and recommender benchmarks can contain temporal leakage, popularity bias, or unrealistic train/test splits.; Algorithmic gains may be sensitive to hyperparameter budgets and implementation details.; Core methods need careful ablations before broad claims about generality or efficiency are accepted.</td>
</tr>
<tr>
<td align="right">189</td>
<td>[Connecting the Dots: Multivariate Time Series Forecasting with Graph Neural Networks](https://doi.org/10.1145/3394486.3403118)<br><sub>Zonghan Wu, Shirui Pan, Guodong Long, Jing Jiang, Xiaojun Chang, Chengqi Zhang</sub></td>
<td>2020<br>Knowledge Discovery and Data Mining<br>2,108 citations</td>
<td><img alt="graph-learning" src="https://img.shields.io/badge/keyword-graph--learning-4f46e5"></td>
<td>Modeling multivariate time series has long been a subject that has attracted researchers from a diverse range of fields including economics, finance, and traffic.</td>
<td>high citation signal (2,108); influential citation signal (197); open-access PDF metadata</td>
<td>Graph and recommender benchmarks can contain temporal leakage, popularity bias, or unrealistic train/test splits.; Algorithmic gains may be sensitive to hyperparameter budgets and implementation details.; Core methods need careful ablations before broad claims about generality or efficiency are accepted.</td>
</tr>
<tr>
<td align="right">196</td>
<td>[Tabular Data: Deep Learning is Not All You Need](https://doi.org/10.1016/j.inffus.2021.11.011)<br><sub>Ravid Shwartz-Ziv, Amitai Armon</sub></td>
<td>2021<br>Information Fusion<br>2,040 citations</td>
<td><img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>A key element in solving real-life data science problems is selecting the types of models to use.</td>
<td>high citation signal (2,040); influential citation signal (64); open-access PDF metadata</td>
<td>Graph and recommender benchmarks can contain temporal leakage, popularity bias, or unrealistic train/test splits.; Algorithmic gains may be sensitive to hyperparameter budgets and implementation details.; Core methods need careful ablations before broad claims about generality or efficiency are accepted.</td>
</tr>
<tr>
<td align="right">207</td>
<td>[Ensemble deep learning: A review](https://doi.org/10.1016/j.engappai.2022.105151)<br><sub>M. A. Ganaie, Minghui Hu, M. Tanveer, P. Suganthan</sub></td>
<td>2021<br>Engineering applications of artificial intelligence<br>1,975 citations</td>
<td><img alt="graph-learning" src="https://img.shields.io/badge/keyword-graph--learning-4f46e5"></td>
<td>Ensemble learning combines several individual models to obtain better generalization performance.</td>
<td>high citation signal (1,975); influential citation signal (40); recognized venue; open-access PDF metadata</td>
<td>Graph and recommender benchmarks can contain temporal leakage, popularity bias, or unrealistic train/test splits.; Algorithmic gains may be sensitive to hyperparameter budgets and implementation details.; Core methods need careful ablations before broad claims about generality or efficiency are accepted.</td>
</tr>
<tr>
<td align="right">210</td>
<td>[Adaptive Graph Convolutional Recurrent Network for Traffic Forecasting](https://www.semanticscholar.org/paper/8b163b75a6b833911c4e958f8bd52124205382ec)<br><sub>Lei Bai, Lina Yao, Can Li, Xianzhi Wang, Can Wang</sub></td>
<td>2020<br>Neural Information Processing Systems<br>1,962 citations</td>
<td><img alt="graph-learning" src="https://img.shields.io/badge/keyword-graph--learning-4f46e5"></td>
<td>Modeling complex spatial and temporal correlations in the correlated time series data is indispensable for understanding the traffic dynamics and predicting the future status of an evolving traffic system.</td>
<td>high citation signal (1,962); influential citation signal (243)</td>
<td>Graph and recommender benchmarks can contain temporal leakage, popularity bias, or unrealistic train/test splits.; Algorithmic gains may be sensitive to hyperparameter budgets and implementation details.; Core methods need careful ablations before broad claims about generality or efficiency are accepted.</td>
</tr>
<tr>
<td align="right">241</td>
<td>[Graph Neural Networks in Recommender Systems: A Survey](https://doi.org/10.1145/3535101)<br><sub>Shiwen Wu, Fei Sun, Fei Sun, Bin Cui</sub></td>
<td>2020<br>ACM Computing Surveys<br>1,788 citations</td>
<td><img alt="graph-learning" src="https://img.shields.io/badge/keyword-graph--learning-4f46e5"></td>
<td>With the explosive growth of online information, recommender systems play a key role to alleviate such information overload.</td>
<td>high citation signal (1,788); influential citation signal (39); open-access PDF metadata</td>
<td>Graph and recommender benchmarks can contain temporal leakage, popularity bias, or unrealistic train/test splits.; Algorithmic gains may be sensitive to hyperparameter budgets and implementation details.; Core methods need careful ablations before broad claims about generality or efficiency are accepted.</td>
</tr>
<tr><td colspan="7"><em>14 additional selected papers in this category are available in the dataset and website.</em></td></tr>
</tbody></table>

</details>

### Generative Models and Synthetic Media

- Papers selected: **19**
- Years covered: **2020-2026**
- Citation count in selected set: **29,855**
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
<td align="right">47</td>
<td>[LAION-5B: An open large-scale dataset for training next generation image-text models](https://doi.org/10.48550/arXiv.2210.08402)<br><sub>Christoph Schuhmann, R. Beaumont, R. Vencu, Cade Gordon, Ross Wightman, Mehdi Cherti, Theo Coombes, Aarush Katta, et al.</sub></td>
<td>2022<br>Neural Information Processing Systems<br>5,281 citations</td>
<td><img alt="generative-ai" src="https://img.shields.io/badge/keyword-generative--ai-a855f7"> <img alt="multimodal" src="https://img.shields.io/badge/keyword-multimodal-0891b2"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>Groundbreaking language-vision architectures like CLIP and DALL-E proved the utility of training on large amounts of noisy image-text data, without relying on expensive accurate labels used in standard vision unimodal supervised learning.</td>
<td>high citation signal (5,281); influential citation signal (494); open-access PDF metadata</td>
<td>Image and media quality metrics may not capture factuality, controllability, provenance, or downstream harms.; Training data provenance and copyright constraints can be under-specified in highly cited generation work.; Robust evaluation across cultures, modalities, and adversarial uses remains difficult.</td>
</tr>
<tr>
<td align="right">53</td>
<td>[SDXL: Improving Latent Diffusion Models for High-Resolution Image Synthesis](https://www.semanticscholar.org/paper/d7890d1906d95c4ae4c430b350455156d6d8aed9)<br><sub>Dustin Podell, Zion English, Kyle Lacey, A. Blattmann, Tim Dockhorn, Jonas Muller, Joe Penna, Robin Rombach</sub></td>
<td>2023<br>International Conference on Learning Representations<br>4,896 citations</td>
<td><img alt="generative-ai" src="https://img.shields.io/badge/keyword-generative--ai-a855f7"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>We present SDXL, a latent diffusion model for text-to-image synthesis.</td>
<td>high citation signal (4,896); influential citation signal (893)</td>
<td>Image and media quality metrics may not capture factuality, controllability, provenance, or downstream harms.; Training data provenance and copyright constraints can be under-specified in highly cited generation work.; Robust evaluation across cultures, modalities, and adversarial uses remains difficult.</td>
</tr>
<tr>
<td align="right">141</td>
<td>[Stable Video Diffusion: Scaling Latent Video Diffusion Models to Large Datasets](https://doi.org/10.48550/arXiv.2311.15127)<br><sub>A. Blattmann, Tim Dockhorn, Sumith Kulal, Daniel Mendelevitch, Maciej Kilian, Dominik Lorenz</sub></td>
<td>2023<br>arXiv.org<br>2,607 citations</td>
<td><img alt="generative-ai" src="https://img.shields.io/badge/keyword-generative--ai-a855f7"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>We present Stable Video Diffusion - a latent video diffusion model for high-resolution, state-of-the-art text-to-video and image-to-video generation.</td>
<td>high citation signal (2,607); influential citation signal (318)</td>
<td>Image and media quality metrics may not capture factuality, controllability, provenance, or downstream harms.; Training data provenance and copyright constraints can be under-specified in highly cited generation work.; Robust evaluation across cultures, modalities, and adversarial uses remains difficult.</td>
</tr>
<tr>
<td align="right">162</td>
<td>[What is AI Literacy? Competencies and Design Considerations](https://doi.org/10.1145/3313831.3376727)<br><sub>D. Long, Brian Magerko</sub></td>
<td>2020<br>International Conference on Human Factors in Computing Systems<br>2,347 citations</td>
<td><img alt="generative-ai" src="https://img.shields.io/badge/keyword-generative--ai-a855f7"></td>
<td>Artificial intelligence (AI) is becoming increasingly integrated in user-facing technology, but public understanding of these technologies is often limited.</td>
<td>high citation signal (2,347); influential citation signal (228)</td>
<td>Image and media quality metrics may not capture factuality, controllability, provenance, or downstream harms.; Training data provenance and copyright constraints can be under-specified in highly cited generation work.; Robust evaluation across cultures, modalities, and adversarial uses remains difficult.</td>
</tr>
<tr>
<td align="right">186</td>
<td>[Diffusion Models in Vision: A Survey](https://doi.org/10.1109/TPAMI.2023.3261988)<br><sub>Florinel-Alin Croitoru, Vlad Hondru, Radu Tudor Ionescu, M. Shah</sub></td>
<td>2022<br>IEEE Transactions on Pattern Analysis and Machine Intelligence<br>2,153 citations</td>
<td><img alt="generative-ai" src="https://img.shields.io/badge/keyword-generative--ai-a855f7"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>Denoising diffusion models represent a recent emerging topic in computer vision, demonstrating remarkable results in the area of generative modeling.</td>
<td>high citation signal (2,153); influential citation signal (45); recognized venue; open-access PDF metadata</td>
<td>Image and media quality metrics may not capture factuality, controllability, provenance, or downstream harms.; Training data provenance and copyright constraints can be under-specified in highly cited generation work.; Robust evaluation across cultures, modalities, and adversarial uses remains difficult.</td>
</tr>
<tr>
<td align="right">190</td>
<td>[GShard: Scaling Giant Models with Conditional Computation and Automatic Sharding](https://www.semanticscholar.org/paper/1882f194cb43828852cc052887671e55a80f945a)<br><sub>Dmitry Lepikhin, HyoukJoong Lee, Yuanzhong Xu, Dehao Chen, Orhan Firat, Yanping Huang, M. Krikun, Noam Shazeer, et al.</sub></td>
<td>2020<br>International Conference on Learning Representations<br>2,098 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>Neural network scaling has been critical for improving the model quality in many real-world machine learning applications with vast amounts of training data and compute.</td>
<td>high citation signal (2,098); influential citation signal (207)</td>
<td>Image and media quality metrics may not capture factuality, controllability, provenance, or downstream harms.; Training data provenance and copyright constraints can be under-specified in highly cited generation work.; Robust evaluation across cultures, modalities, and adversarial uses remains difficult.</td>
</tr>
<tr>
<td align="right">297</td>
<td>[A Survey of Quantization Methods for Efficient Neural Network Inference](https://doi.org/10.1201/9781003162810-13)<br><sub>A. Gholami, Sehoon Kim, Zhen Dong, Z. Yao, Michael W. Mahoney, K. Keutzer</sub></td>
<td>2021<br>Low-Power Computer Vision<br>1,595 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>As soon as abstract mathematical computations were adapted to computation on digital computers, the problem of efficient representation, manipulation, and communication of the numerical values in those computations arose.</td>
<td>high citation signal (1,595); influential citation signal (103); open-access PDF metadata</td>
<td>Image and media quality metrics may not capture factuality, controllability, provenance, or downstream harms.; Training data provenance and copyright constraints can be under-specified in highly cited generation work.; Robust evaluation across cultures, modalities, and adversarial uses remains difficult.</td>
</tr>
<tr>
<td align="right">310</td>
<td>[Efficient Transformers: A Survey](https://doi.org/10.1145/3530811)<br><sub>Yi Tay, Mostafa Dehghani, Dara Bahri, Donald Metzler</sub></td>
<td>2020<br>ACM Computing Surveys<br>1,537 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"></td>
<td>Transformer model architectures have garnered immense interest lately due to their effectiveness across a range of domains like language, vision, and reinforcement learning.</td>
<td>high citation signal (1,537); influential citation signal (88); open-access PDF metadata</td>
<td>Image and media quality metrics may not capture factuality, controllability, provenance, or downstream harms.; Training data provenance and copyright constraints can be under-specified in highly cited generation work.; Robust evaluation across cultures, modalities, and adversarial uses remains difficult.</td>
</tr>
<tr>
<td align="right">360</td>
<td>[Generative AI](https://doi.org/10.1007/s12599-023-00834-7)<br><sub>S. Feuerriegel, Jochen Hartmann, Christian Janiesch, Patrick Zschech</sub></td>
<td>2023<br>Business &amp; Information Systems Engineering<br>1,402 citations</td>
<td><img alt="generative-ai" src="https://img.shields.io/badge/keyword-generative--ai-a855f7"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>Recent advancements in generative artificial intelligence (AI) have made it possible for machines to independently produce a variety of creative content.</td>
<td>high citation signal (1,402); influential citation signal (47); open-access PDF metadata</td>
<td>Image and media quality metrics may not capture factuality, controllability, provenance, or downstream harms.; Training data provenance and copyright constraints can be under-specified in highly cited generation work.; Robust evaluation across cultures, modalities, and adversarial uses remains difficult.</td>
</tr>
<tr>
<td align="right">410</td>
<td>[MaskGIT: Masked Generative Image Transformer](https://doi.org/10.1109/CVPR52688.2022.01103)<br><sub>Huiwen Chang, Han Zhang, Lu Jiang, Ce Liu, W. Freeman</sub></td>
<td>2022<br>Computer Vision and Pattern Recognition<br>1,201 citations</td>
<td><img alt="generative-ai" src="https://img.shields.io/badge/keyword-generative--ai-a855f7"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>Generative transformers have experienced rapid popularity growth in the computer vision community in synthesizing high-fidelity and high-resolution images.</td>
<td>high citation signal (1,201); influential citation signal (224); recognized venue; open-access PDF metadata</td>
<td>Image and media quality metrics may not capture factuality, controllability, provenance, or downstream harms.; Training data provenance and copyright constraints can be under-specified in highly cited generation work.; Robust evaluation across cultures, modalities, and adversarial uses remains difficult.</td>
</tr>
<tr><td colspan="7"><em>9 additional selected papers in this category are available in the dataset and website.</em></td></tr>
</tbody></table>

</details>

### Natural Language Processing and Knowledge

- Papers selected: **16**
- Years covered: **2020-2024**
- Citation count in selected set: **30,397**
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
<td align="right">31</td>
<td>[Robust Speech Recognition via Large-Scale Weak Supervision](https://www.semanticscholar.org/paper/a02fbaf22237a1aedacb1320b6007cd70c1fe6ec)<br><sub>Alec Radford, Jong Wook Kim, Tao Xu, Greg Brockman, Christine McLeavey, I. Sutskever</sub></td>
<td>2022<br>International Conference on Machine Learning<br>7,414 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>We study the capabilities of speech processing systems trained simply to predict large amounts of transcripts of audio on the internet.</td>
<td>high citation signal (7,414); influential citation signal (1,015); recognized venue</td>
<td>Benchmark scores can hide brittle reasoning, retrieval failures, hallucination, and domain transfer issues.; Language coverage is often uneven, with English and high-resource domains overrepresented.; Evaluation can be sensitive to annotation protocols, prompt wording, and changing model APIs.</td>
</tr>
<tr>
<td align="right">121</td>
<td>[Big Bird: Transformers for Longer Sequences](https://www.semanticscholar.org/paper/044e13d7dd4e0655eb76f0bd00b2c1bdb44e2be3)<br><sub>M. Zaheer, Guru Guruganesh, Kumar Avinava Dubey, J. Ainslie, Chris Alberti, Santiago Ontañón, Philip Pham, Anirudh Ravula, et al.</sub></td>
<td>2020<br>Neural Information Processing Systems<br>2,875 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>Transformers-based models, such as BERT, have been one of the most successful deep learning models for NLP.</td>
<td>high citation signal (2,875); influential citation signal (320)</td>
<td>Benchmark scores can hide brittle reasoning, retrieval failures, hallucination, and domain transfer issues.; Language coverage is often uneven, with English and high-resource domains overrepresented.; Evaluation can be sensitive to annotation protocols, prompt wording, and changing model APIs.</td>
</tr>
<tr>
<td align="right">160</td>
<td>[Scientific Machine Learning Through Physics–Informed Neural Networks: Where we are and What’s Next](https://doi.org/10.1007/s10915-022-01939-z)<br><sub>S. Cuomo, Vincenzo Schiano Di Cola, F. Giampaolo, G. Rozza, Maizar Raissi, F. Piccialli</sub></td>
<td>2022<br>Journal of Scientific Computing<br>2,358 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>Physics-Informed Neural Networks (PINN) are neural networks (NNs) that encode model equations, like Partial Differential Equations (PDE), as a component of the neural network itself.</td>
<td>high citation signal (2,358); influential citation signal (37); open-access PDF metadata</td>
<td>Benchmark scores can hide brittle reasoning, retrieval failures, hallucination, and domain transfer issues.; Language coverage is often uneven, with English and high-resource domains overrepresented.; Evaluation can be sensitive to annotation protocols, prompt wording, and changing model APIs.</td>
</tr>
<tr>
<td align="right">166</td>
<td>[Linformer: Self-Attention with Linear Complexity](https://www.semanticscholar.org/paper/c0b79e6a5fd88ef13aa4780df5aae0aaa6b2be87)<br><sub>Sinong Wang, Belinda Z. Li, Madian Khabsa, Han Fang, Hao Ma</sub></td>
<td>2020<br>arXiv.org<br>2,296 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>Large transformer models have shown extraordinary success in achieving state-of-the-art results in many natural language processing applications.</td>
<td>high citation signal (2,296); influential citation signal (185)</td>
<td>Benchmark scores can hide brittle reasoning, retrieval failures, hallucination, and domain transfer issues.; Language coverage is often uneven, with English and high-resource domains overrepresented.; Evaluation can be sensitive to annotation protocols, prompt wording, and changing model APIs.</td>
</tr>
<tr>
<td align="right">192</td>
<td>[Stanza: A Python Natural Language Processing Toolkit for Many Human Languages](https://doi.org/10.18653/v1/2020.acl-demos.14)<br><sub>Peng Qi, Yuhao Zhang, Yuhui Zhang, Jason Bolton, Christopher D. Manning</sub></td>
<td>2020<br>Annual Meeting of the Association for Computational Linguistics<br>2,082 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>We introduce Stanza, an open-source Python natural language processing toolkit supporting 66 human languages.</td>
<td>high citation signal (2,082); influential citation signal (233); open-access PDF metadata</td>
<td>Benchmark scores can hide brittle reasoning, retrieval failures, hallucination, and domain transfer issues.; Language coverage is often uneven, with English and high-resource domains overrepresented.; Evaluation can be sensitive to annotation protocols, prompt wording, and changing model APIs.</td>
</tr>
<tr>
<td align="right">263</td>
<td>[Pre-trained models for natural language processing: A survey](https://doi.org/10.1007/s11431-020-1647-3)<br><sub>Xipeng Qiu, Tianxiang Sun, Yige Xu, Yunfan Shao, Ning Dai, Xuanjing Huang</sub></td>
<td>2020<br>Science China Technological Sciences<br>1,703 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>Recently, the emergence of pre-trained models (PTMs) has brought natural language processing (NLP) to a new era.</td>
<td>high citation signal (1,703); influential citation signal (53); recognized venue</td>
<td>Benchmark scores can hide brittle reasoning, retrieval failures, hallucination, and domain transfer issues.; Language coverage is often uneven, with English and high-resource domains overrepresented.; Evaluation can be sensitive to annotation protocols, prompt wording, and changing model APIs.</td>
</tr>
<tr>
<td align="right">278</td>
<td>[A Survey of the Usages of Deep Learning for Natural Language Processing](https://doi.org/10.1109/TNNLS.2020.2979670)<br><sub>Dan Otter, Julian R. Medina, J. Kalita</sub></td>
<td>2020<br>IEEE Transactions on Neural Networks and Learning Systems<br>1,636 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>Over the last several years, the field of natural language processing has been propelled forward by an explosion in the use of deep learning models.</td>
<td>high citation signal (1,636); influential citation signal (35); recognized venue; open-access PDF metadata</td>
<td>Benchmark scores can hide brittle reasoning, retrieval failures, hallucination, and domain transfer issues.; Language coverage is often uneven, with English and high-resource domains overrepresented.; Evaluation can be sensitive to annotation protocols, prompt wording, and changing model APIs.</td>
</tr>
<tr>
<td align="right">316</td>
<td>[Deep Learning Enabled Semantic Communication Systems](https://doi.org/10.1109/TSP.2021.3071210)<br><sub>Huiqiang Xie, Zhijin Qin, Geoffrey Y. Li, B. Juang</sub></td>
<td>2020<br>IEEE Transactions on Signal Processing<br>1,524 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>Recently, deep learned enabled end-to-end communication systems have been developed to merge all physical layer blocks in the traditional communication systems, which make joint transceiver optimization possible.</td>
<td>high citation signal (1,524); influential citation signal (182); recognized venue; open-access PDF metadata</td>
<td>Benchmark scores can hide brittle reasoning, retrieval failures, hallucination, and domain transfer issues.; Language coverage is often uneven, with English and high-resource domains overrepresented.; Evaluation can be sensitive to annotation protocols, prompt wording, and changing model APIs.</td>
</tr>
<tr>
<td align="right">371</td>
<td>[A survey on security and privacy of federated learning](https://doi.org/10.1016/j.future.2020.10.007)<br><sub>Viraaji Mothukuri, R. Parizi, Seyedamin Pouriyeh, Yan-ping Huang, A. Dehghantanha, Gautam Srivastava</sub></td>
<td>2021<br>Future generations computer systems<br>1,359 citations</td>
<td><img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>Abstract Federated learning (FL) is a new breed of Artificial Intelligence (AI) that builds upon decentralized data and training that brings learning to the edge or directly on-device.</td>
<td>high citation signal (1,359); influential citation signal (43)</td>
<td>Benchmark scores can hide brittle reasoning, retrieval failures, hallucination, and domain transfer issues.; Language coverage is often uneven, with English and high-resource domains overrepresented.; Evaluation can be sensitive to annotation protocols, prompt wording, and changing model APIs.</td>
</tr>
<tr>
<td align="right">412</td>
<td>[SUPERB: Speech processing Universal PERformance Benchmark](https://doi.org/10.21437/interspeech.2021-1775)<br><sub>Shu-Wen Yang, Po-Han Chi, Yung-Sung Chuang, Cheng-I Lai, Kushal Lakhotia, Yist Y. Lin, Andy T. Liu, Jiatong Shi, et al.</sub></td>
<td>2021<br>Interspeech<br>1,190 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>Self-supervised learning (SSL) has proven vital for advancing research in natural language processing (NLP) and computer vision (CV).</td>
<td>high citation signal (1,190); influential citation signal (200); open-access PDF metadata</td>
<td>Benchmark scores can hide brittle reasoning, retrieval failures, hallucination, and domain transfer issues.; Language coverage is often uneven, with English and high-resource domains overrepresented.; Evaluation can be sensitive to annotation protocols, prompt wording, and changing model APIs.</td>
</tr>
<tr><td colspan="7"><em>6 additional selected papers in this category are available in the dataset and website.</em></td></tr>
</tbody></table>

</details>

### Trustworthy, Explainable, and Responsible AI

- Papers selected: **15**
- Years covered: **2020-2026**
- Citation count in selected set: **18,586**
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
<td align="right">154</td>
<td>[Reliable evaluation of adversarial robustness with an ensemble of diverse parameter-free attacks](https://www.semanticscholar.org/paper/18939eadc9c4460c8385e0591cde214a1ead067b)<br><sub>Francesco Croce, Matthias Hein</sub></td>
<td>2020<br>International Conference on Machine Learning<br>2,404 citations</td>
<td><img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>The field of defense strategies against adversarial attacks has significantly grown over the last years, but progress is hampered as the evaluation of adversarial defenses is often insufficient and thus gives a wrong impression of robustness.</td>
<td>high citation signal (2,404); influential citation signal (507); recognized venue</td>
<td>Explanations can be persuasive without being faithful to model internals or decision processes.; Fairness, robustness, privacy, and safety metrics can conflict and require domain-specific tradeoffs.; Responsible AI results often need stronger deployment evidence beyond benchmark or synthetic settings.</td>
</tr>
<tr>
<td align="right">194</td>
<td>[Transparency In The reporting of Artificial INtelligence – the TITAN guideline](https://doi.org/10.70389/pjs.100082)<br><sub>R. Agha, Ginimol Mathew, Rasha Rashid, Ahmed Kerwan, A. Al-Jabir, C. Sohrabi, T. Franchi, Maria Nicola, et al.</sub></td>
<td>2025<br>Premier Journal of Science<br>2,052 citations</td>
<td><img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>The use of AI in research and the literature is increasing.</td>
<td>high citation signal (2,052); influential citation signal (21); recognized venue</td>
<td>Explanations can be persuasive without being faithful to model internals or decision processes.; Fairness, robustness, privacy, and safety metrics can conflict and require domain-specific tradeoffs.; Responsible AI results often need stronger deployment evidence beyond benchmark or synthetic settings.</td>
</tr>
<tr>
<td align="right">276</td>
<td>[Why do tree-based models still outperform deep learning on typical tabular data?](https://doi.org/10.52202/068431-0037)<br><sub>Léo Grinsztajn, Edouard Oyallon, G. Varoquaux</sub></td>
<td>2022<br>Neural Information Processing Systems<br>1,646 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>While deep learning has enabled tremendous progress on text and image datasets, its superiority on tabular data is not clear.</td>
<td>high citation signal (1,646); influential citation signal (107)</td>
<td>Explanations can be persuasive without being faithful to model internals or decision processes.; Fairness, robustness, privacy, and safety metrics can conflict and require domain-specific tradeoffs.; Responsible AI results often need stronger deployment evidence beyond benchmark or synthetic settings.</td>
</tr>
<tr>
<td align="right">330</td>
<td>[Ensemble Distillation for Robust Model Fusion in Federated Learning](https://www.semanticscholar.org/paper/053f4d6715a4dba6f8103456fc1bb5fd6a5266c4)<br><sub>Tao Lin, Lingjing Kong, Sebastian U. Stich, Martin Jaggi</sub></td>
<td>2020<br>Neural Information Processing Systems<br>1,489 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>Federated Learning (FL) is a machine learning setting where many devices collaboratively train a machine learning model while keeping the training data decentralized.</td>
<td>high citation signal (1,489); influential citation signal (153)</td>
<td>Explanations can be persuasive without being faithful to model internals or decision processes.; Fairness, robustness, privacy, and safety metrics can conflict and require domain-specific tradeoffs.; Responsible AI results often need stronger deployment evidence beyond benchmark or synthetic settings.</td>
</tr>
<tr>
<td align="right">358</td>
<td>[Personalized Federated Learning with Moreau Envelopes](https://www.semanticscholar.org/paper/70f1b279f96a9ba8e15f599635ba0e3ec449ef5f)<br><sub>Canh T. Dinh, N. H. Tran, Tuan Dung Nguyen</sub></td>
<td>2020<br>Neural Information Processing Systems<br>1,407 citations</td>
<td><img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>Federated learning (FL) is a decentralized and privacy-preserving machine learning technique in which a group of clients collaborate with a server to learn a global model without sharing clients&#x27; data.</td>
<td>high citation signal (1,407); influential citation signal (132)</td>
<td>Explanations can be persuasive without being faithful to model internals or decision processes.; Fairness, robustness, privacy, and safety metrics can conflict and require domain-specific tradeoffs.; Responsible AI results often need stronger deployment evidence beyond benchmark or synthetic settings.</td>
</tr>
<tr>
<td align="right">366</td>
<td>[Explainable Artificial Intelligence (XAI): What we know and what is left to attain Trustworthy Artificial Intelligence](https://doi.org/10.1016/j.inffus.2023.101805)<br><sub>Sajid Ali, T. Abuhmed, Shaker El-Sappagh, Khan Muhammad, J. Alonso-Moral, R. Confalonieri, Riccardo Guidotti, J. Ser, et al.</sub></td>
<td>2023<br>Information Fusion<br>1,379 citations</td>
<td><img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>Positions Explainable Artificial Intelligence (XAI): What we know and what is left to attain Trustworthy Artificial Intelligence within Trustworthy, Explainable, and Responsible AI.</td>
<td>high citation signal (1,379); influential citation signal (51); open-access PDF metadata</td>
<td>Explanations can be persuasive without being faithful to model internals or decision processes.; Fairness, robustness, privacy, and safety metrics can conflict and require domain-specific tradeoffs.; Responsible AI results often need stronger deployment evidence beyond benchmark or synthetic settings.</td>
</tr>
<tr>
<td align="right">388</td>
<td>[Loss of Life Transformer Prediction Based on Stacking Ensemble Improved by Genetic Algorithm By IJISRT](https://doi.org/10.38124/ijisrt/ijisrt24mar1125)<br><sub>R. Shintabella, Catur Edi Widodo, Adi Wibowo</sub></td>
<td>2024<br>International Journal of Innovative Science and Research Technology<br>1,319 citations</td>
<td><img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"> <img alt="ai4science" src="https://img.shields.io/badge/keyword-ai4science-16a34a"></td>
<td>Prediction for loss of life transfomer is very important to ensure the reliability and efficiency of the power system.</td>
<td>high citation signal (1,319); recognized venue; open-access PDF metadata</td>
<td>Explanations can be persuasive without being faithful to model internals or decision processes.; Fairness, robustness, privacy, and safety metrics can conflict and require domain-specific tradeoffs.; Responsible AI results often need stronger deployment evidence beyond benchmark or synthetic settings.</td>
</tr>
<tr>
<td align="right">389</td>
<td>[Federated Learning on Non-IID Data: A Survey](https://doi.org/10.1016/j.neucom.2021.07.098)<br><sub>Hangyu Zhu, Jinjin Xu, Shiqing Liu, Yaochu Jin</sub></td>
<td>2021<br>Neurocomputing<br>1,310 citations</td>
<td><img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>Federated learning is an emerging distributed machine learning framework for privacy preservation.</td>
<td>high citation signal (1,310); influential citation signal (40); open-access PDF metadata</td>
<td>Explanations can be persuasive without being faithful to model internals or decision processes.; Fairness, robustness, privacy, and safety metrics can conflict and require domain-specific tradeoffs.; Responsible AI results often need stronger deployment evidence beyond benchmark or synthetic settings.</td>
</tr>
<tr>
<td align="right">403</td>
<td>[PyTorch 2: Faster Machine Learning Through Dynamic Python Bytecode Transformation and Graph Compilation](https://doi.org/10.1145/3620665.3640366)<br><sub>Jason Ansel, Edward Yang, Horace He, N. Gimelshein, Animesh Jain, Michael Voznesensky, Bin Bao, Peter Bell, et al.</sub></td>
<td>2024<br>International Conference on Architectural Support for Programming Languages and Operating Systems<br>1,215 citations</td>
<td><img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>This paper introduces two extensions to the popular PyTorch machine learning framework, TorchDynamo and TorchInductor, which implement the torch.compile feature released in PyTorch 2.</td>
<td>high citation signal (1,215); influential citation signal (150)</td>
<td>Explanations can be persuasive without being faithful to model internals or decision processes.; Fairness, robustness, privacy, and safety metrics can conflict and require domain-specific tradeoffs.; Responsible AI results often need stronger deployment evidence beyond benchmark or synthetic settings.</td>
</tr>
<tr>
<td align="right">405</td>
<td>[Explaining Deep Neural Networks and Beyond: A Review of Methods and Applications](https://doi.org/10.1109/JPROC.2021.3060483)<br><sub>W. Samek, G. Montavon, S. Lapuschkin, Christopher J. Anders, K. Müller</sub></td>
<td>2021<br>Proceedings of the IEEE<br>1,212 citations</td>
<td><img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>With the broader and highly successful usage of machine learning (ML) in industry and the sciences, there has been a growing demand for explainable artificial intelligence (XAI).</td>
<td>high citation signal (1,212); influential citation signal (33); open-access PDF metadata</td>
<td>Explanations can be persuasive without being faithful to model internals or decision processes.; Fairness, robustness, privacy, and safety metrics can conflict and require domain-specific tradeoffs.; Responsible AI results often need stronger deployment evidence beyond benchmark or synthetic settings.</td>
</tr>
<tr><td colspan="7"><em>5 additional selected papers in this category are available in the dataset and website.</em></td></tr>
</tbody></table>

</details>

### Representation, Self-Supervised, and Transfer Learning

- Papers selected: **12**
- Years covered: **2020-2023**
- Citation count in selected set: **20,770**
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
<td align="right">103</td>
<td>[Sigmoid Loss for Language Image Pre-Training](https://doi.org/10.1109/ICCV51070.2023.01100)<br><sub>Xiaohua Zhai, Basil Mustafa, Alexander Kolesnikov, Lucas Beyer</sub></td>
<td>2023<br>IEEE International Conference on Computer Vision<br>3,223 citations</td>
<td><img alt="multimodal" src="https://img.shields.io/badge/keyword-multimodal-0891b2"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>We propose a simple pairwise sigmoid loss for imagetext pre-training.</td>
<td>high citation signal (3,223); influential citation signal (349)</td>
<td>Transfer claims depend heavily on downstream task choice, data overlap, and evaluation protocol.; Contrastive and self-supervised methods can learn spurious shortcuts when augmentations or negatives are poorly matched.; Representation quality is hard to compare when model size, data scale, and training recipes differ.</td>
</tr>
<tr>
<td align="right">133</td>
<td>[Meta-Learning in Neural Networks: A Survey](https://doi.org/10.1109/TPAMI.2021.3079209)<br><sub>Timothy M. Hospedales, Antreas Antoniou, P. Micaelli, A. Storkey</sub></td>
<td>2020<br>IEEE Transactions on Pattern Analysis and Machine Intelligence<br>2,682 citations</td>
<td><img alt="reinforcement-learning" src="https://img.shields.io/badge/keyword-reinforcement--learning-dc2626"></td>
<td>The field of meta-learning, or learning-to-learn, has seen a dramatic rise in interest in recent years.</td>
<td>high citation signal (2,682); influential citation signal (108); recognized venue; open-access PDF metadata</td>
<td>Transfer claims depend heavily on downstream task choice, data overlap, and evaluation protocol.; Contrastive and self-supervised methods can learn spurious shortcuts when augmentations or negatives are poorly matched.; Representation quality is hard to compare when model size, data scale, and training recipes differ.</td>
</tr>
<tr>
<td align="right">182</td>
<td>[Self-Supervised Learning: Generative or Contrastive](https://doi.org/10.1109/TKDE.2021.3090866)<br><sub>Xiao Liu, Fanjin Zhang, Zhenyu Hou, Zhaoyu Wang, Li Mian, Jing Zhang, Jie Tang</sub></td>
<td>2020<br>IEEE Transactions on Knowledge and Data Engineering<br>2,181 citations</td>
<td><img alt="generative-ai" src="https://img.shields.io/badge/keyword-generative--ai-a855f7"> <img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"> <img alt="trustworthy-ai" src="https://img.shields.io/badge/keyword-trustworthy--ai-be123c"></td>
<td>Deep supervised learning has achieved great success in the last decade.</td>
<td>high citation signal (2,181); influential citation signal (98); recognized venue; open-access PDF metadata</td>
<td>Transfer claims depend heavily on downstream task choice, data overlap, and evaluation protocol.; Contrastive and self-supervised methods can learn spurious shortcuts when augmentations or negatives are poorly matched.; Representation quality is hard to compare when model size, data scale, and training recipes differ.</td>
</tr>
<tr>
<td align="right">252</td>
<td>[Generalizing to Unseen Domains: A Survey on Domain Generalization](https://doi.org/10.1109/TKDE.2022.3178128)<br><sub>Jindong Wang, Cuiling Lan, Chang Liu, Yidong Ouyang, Tao Qin</sub></td>
<td>2021<br>IEEE Transactions on Knowledge and Data Engineering<br>1,749 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"></td>
<td>Machine learning systems generally assume that the training and testing distributions are the same.</td>
<td>high citation signal (1,749); influential citation signal (86); recognized venue; open-access PDF metadata</td>
<td>Transfer claims depend heavily on downstream task choice, data overlap, and evaluation protocol.; Contrastive and self-supervised methods can learn spurious shortcuts when augmentations or negatives are poorly matched.; Representation quality is hard to compare when model size, data scale, and training recipes differ.</td>
</tr>
<tr>
<td align="right">265</td>
<td>[Model-Contrastive Federated Learning](https://doi.org/10.1109/CVPR46437.2021.01057)<br><sub>Qinbin Li, Bingsheng He, D. Song</sub></td>
<td>2021<br>Computer Vision and Pattern Recognition<br>1,696 citations</td>
<td><img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>Federated learning enables multiple parties to collaboratively train a machine learning model without communicating their local data.</td>
<td>high citation signal (1,696); influential citation signal (250); recognized venue; open-access PDF metadata</td>
<td>Transfer claims depend heavily on downstream task choice, data overlap, and evaluation protocol.; Contrastive and self-supervised methods can learn spurious shortcuts when augmentations or negatives are poorly matched.; Representation quality is hard to compare when model size, data scale, and training recipes differ.</td>
</tr>
<tr>
<td align="right">312</td>
<td>[Unsupervised Dense Information Retrieval with Contrastive Learning](https://www.semanticscholar.org/paper/4f4a409f701f7552d45c46a5b0fea69dca6f8e84)<br><sub>Gautier Izacard, Mathilde Caron, Lucas Hosseini, Sebastian Riedel, Piotr Bojanowski, Armand Joulin, Edouard Grave</sub></td>
<td>2021<br>Trans. Mach. Learn. Res.<br>1,531 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"></td>
<td>Recently, information retrieval has seen the emergence of dense retrievers, using neural networks, as an alternative to classical sparse methods based on term-frequency.</td>
<td>high citation signal (1,531); influential citation signal (248)</td>
<td>Transfer claims depend heavily on downstream task choice, data overlap, and evaluation protocol.; Contrastive and self-supervised methods can learn spurious shortcuts when augmentations or negatives are poorly matched.; Representation quality is hard to compare when model size, data scale, and training recipes differ.</td>
</tr>
<tr>
<td align="right">324</td>
<td>[A Survey of Transformers](https://doi.org/10.1016/j.aiopen.2022.10.001)<br><sub>Tianyang Lin, Yuxin Wang, Xiangyang Liu, Xipeng Qiu</sub></td>
<td>2021<br>AI Open<br>1,505 citations</td>
<td><img alt="nlp" src="https://img.shields.io/badge/keyword-nlp-f59e0b"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>Transformers have achieved great success in many artificial intelligence fields, such as natural language processing, computer vision, and audio processing.</td>
<td>high citation signal (1,505); influential citation signal (37); open-access PDF metadata</td>
<td>Transfer claims depend heavily on downstream task choice, data overlap, and evaluation protocol.; Contrastive and self-supervised methods can learn spurious shortcuts when augmentations or negatives are poorly matched.; Representation quality is hard to compare when model size, data scale, and training recipes differ.</td>
</tr>
<tr>
<td align="right">337</td>
<td>[Toward Causal Representation Learning](https://doi.org/10.1109/JPROC.2021.3058954)<br><sub>Bernhard Schölkopf, Francesco Locatello, Stefan Bauer, Nan Rosemary Ke, Nal Kalchbrenner, Anirudh Goyal, Y. Bengio</sub></td>
<td>2021<br>Proceedings of the IEEE<br>1,460 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"></td>
<td>The two fields of machine learning and graphical causality arose and are developed separately.</td>
<td>high citation signal (1,460); influential citation signal (134); open-access PDF metadata</td>
<td>Transfer claims depend heavily on downstream task choice, data overlap, and evaluation protocol.; Contrastive and self-supervised methods can learn spurious shortcuts when augmentations or negatives are poorly matched.; Representation quality is hard to compare when model size, data scale, and training recipes differ.</td>
</tr>
<tr>
<td align="right">338</td>
<td>[Do Transformers Really Perform Badly for Graph Representation?](https://www.semanticscholar.org/paper/acf87283fa8ae426f1a4987b345b401bf2913f61)<br><sub>Chengxuan Ying, Tianle Cai, Shengjie Luo, Shuxin Zheng, Guolin Ke, Di He, Yanming Shen, Tie-Yan Liu</sub></td>
<td>2021<br>Neural Information Processing Systems<br>1,455 citations</td>
<td><img alt="foundation-models" src="https://img.shields.io/badge/keyword-foundation--models-2563eb"></td>
<td>Positions Do Transformers Really Perform Badly for Graph Representation? within Representation, Self-Supervised, and Transfer Learning.</td>
<td>high citation signal (1,455); influential citation signal (182)</td>
<td>Transfer claims depend heavily on downstream task choice, data overlap, and evaluation protocol.; Contrastive and self-supervised methods can learn spurious shortcuts when augmentations or negatives are poorly matched.; Representation quality is hard to compare when model size, data scale, and training recipes differ.</td>
</tr>
<tr>
<td align="right">415</td>
<td>[CutPaste: Self-Supervised Learning for Anomaly Detection and Localization](https://doi.org/10.1109/CVPR46437.2021.00954)<br><sub>Chun-Liang Li, Kihyuk Sohn, Jinsung Yoon, Tomas Pfister</sub></td>
<td>2021<br>Computer Vision and Pattern Recognition<br>1,182 citations</td>
<td><img alt="generative-ai" src="https://img.shields.io/badge/keyword-generative--ai-a855f7"> <img alt="vision" src="https://img.shields.io/badge/keyword-vision-0f766e"></td>
<td>We aim at constructing a high performance model for defect detection that detects unknown anomalous patterns of an image without anomalous data.</td>
<td>high citation signal (1,182); influential citation signal (176); recognized venue; open-access PDF metadata</td>
<td>Transfer claims depend heavily on downstream task choice, data overlap, and evaluation protocol.; Contrastive and self-supervised methods can learn spurious shortcuts when augmentations or negatives are poorly matched.; Representation quality is hard to compare when model size, data scale, and training recipes differ.</td>
</tr>
<tr><td colspan="7"><em>2 additional selected papers in this category are available in the dataset and website.</em></td></tr>
</tbody></table>

</details>

## Yearly Coverage

| Year | Candidate papers audited | Selected top-100 papers | Citations in selected set | Top selected paper |
|---:|---:|---:|---:|---|
| 2020 | 1,000 | 100 | 384,464 | [An Image is Worth 16x16 Words: Transformers for Image Recognition at Scale](https://www.semanticscholar.org/paper/268d347e8a55b5eb82fb5e7d2f800e33c75ab18a) |
| 2021 | 1,000 | 100 | 389,229 | [Learning Transferable Visual Models From Natural Language Supervision](https://www.semanticscholar.org/paper/6f870f7f02a8c59c3e23f407f3ef00dd1dcf8fc4) |
| 2022 | 1,000 | 100 | 274,691 | [Training language models to follow instructions with human feedback](https://doi.org/10.52202/068431-2011) |
| 2023 | 1,000 | 100 | 319,073 | [LLaMA: Open and Efficient Foundation Language Models](https://www.semanticscholar.org/paper/57e849d0de13ed5f91d086936296721d4ff75a75) |
| 2024 | 1,000 | 100 | 138,468 | [The Llama 3 Herd of Models](https://www.semanticscholar.org/paper/40e8af970329135ec95057d73e239dab805ad128) |
| 2025 | 1,000 | 100 | 72,294 | [Qwen3 Technical Report](https://www.semanticscholar.org/paper/d2d84d56f730f81d276a02b48d5d44db5bde0b4a) |
| 2026 | 1,000 | 100 | 6,380 | [Scaling Monosemanticity: Extracting Interpretable Features from Claude 3 Sonnet](https://www.semanticscholar.org/paper/1b6e16cc72aee038eb1879b8686b53776be3d51f) |

## Methodology

The collection uses Semantic Scholar Academic Graph bulk search. Queries cover broad AI, machine learning, deep learning, foundation models, language, vision, reinforcement learning, generative models, graph learning, multimodal learning, trustworthy AI, and AI-for-science themes. For each year from 2020 through 2026, results are filtered to the publication year, screened with explicit AI relevance expressions in title/abstract/venue metadata, deduplicated by DOI, arXiv, PubMed, CorpusId, paperId, then title, and reduced to at most 1,000 candidates by citation count. The final awesome list selects the top 100 papers within each publication year by citation count; influential citation count and a deterministic metadata importance score are retained as tie-breakers and audit signals.

The taxonomy, key ideas, strengths, limitations, method tags, and keyword tags are generated deterministically from public metadata and rule-based domain conventions. No paid API, paid LLM, paid translation, or paid compute was used.

## Caveats

- This is a metadata-driven citation map, not a full systematic review of every PDF.
- Citation counts favor older papers; 2026 should be interpreted as a partial and still-moving year.
- Semantic Scholar metadata can omit venues, abstracts, PDFs, or influential citation counts for some records.
- Citation ranking measures influence and visibility; it does not directly measure methodological quality, safety, or reproducibility.

## License

CC-BY-4.0 for text and metadata curation; upstream paper metadata belongs to original sources.
