# Awesome AI

[![Awesome](https://awesome.re/badge-flat.svg)](https://awesome.re)

A taxonomy-first, citation-ranked map of AI research from 2020 through 2026.

Generated on 2026-06-26 from free public Semantic Scholar metadata. This edition investigates up to 1,000 AI-related candidate papers per year for 2020-2026, keeps an audited candidate pool of 7,000 records, selects the top 100 papers overall by citation count, and reorganizes them by AI research taxonomy.

## Project Links

- Website: https://honggi82.github.io/awesome-ai/
- Selected dataset: `data/papers_2020_2026.csv`
- Taxonomy dataset with paper-level ideas, strengths, and limitations: `data/papers_taxonomy_2020_2026.csv`
- Precomputed period and language analysis: `data/period_analysis_2020_2026.json`
- Candidate pool: `data/candidates_top1000_2020_2026.csv`
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

- **Total selected papers**: 100 papers
- **Candidate pool audited**: 7,000 papers (2020: 1,000, 2021: 1,000, 2022: 1,000, 2023: 1,000, 2024: 1,000, 2025: 1,000, 2026: 1,000)
- **Citation count in selected set**: 860,781
- **Foundation Models and Large Language Models**: 67 papers
- **Vision and Multimodal Learning**: 17 papers
- **AI for Science, Healthcare, and Robotics**: 8 papers
- **Generative Models and Synthetic Media**: 2 papers
- **Graph Learning, Recommendation, and Core Methods**: 2 papers
- **Reinforcement Learning and Agents**: 2 papers
- **Natural Language Processing and Knowledge**: 1 papers
- **General AI Methods and Systems**: 1 papers

## Taxonomy Collections

### Foundation Models and Large Language Models

- Papers selected: **67**
- Years covered: **2020-2025**
- Citation count in selected set: **500,006**
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
<tr><td colspan="7"><em>57 additional selected papers in this category are available in the dataset and website.</em></td></tr>
</tbody></table>

</details>

### Vision and Multimodal Learning

- Papers selected: **17**
- Years covered: **2020-2024**
- Citation count in selected set: **242,892**
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
<tr><td colspan="7"><em>7 additional selected papers in this category are available in the dataset and website.</em></td></tr>
</tbody></table>

</details>

### AI for Science, Healthcare, and Robotics

- Papers selected: **8**
- Years covered: **2020-2021**
- Citation count in selected set: **76,983**
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
</tbody></table>

</details>

### Generative Models and Synthetic Media

- Papers selected: **2**
- Years covered: **2022-2023**
- Citation count in selected set: **10,177**
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
</tbody></table>

</details>

### Graph Learning, Recommendation, and Core Methods

- Papers selected: **2**
- Years covered: **2020-2020**
- Citation count in selected set: **8,923**
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
</tbody></table>

</details>

### Reinforcement Learning and Agents

- Papers selected: **2**
- Years covered: **2023-2025**
- Citation count in selected set: **7,412**
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
</tbody></table>

</details>

### Natural Language Processing and Knowledge

- Papers selected: **1**
- Years covered: **2022-2022**
- Citation count in selected set: **7,414**
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
</tbody></table>

</details>

### General AI Methods and Systems

- Papers selected: **1**
- Years covered: **2021-2021**
- Citation count in selected set: **6,974**
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
</tbody></table>

</details>

## Yearly Coverage

| Year | Candidate papers audited | Selected top-100 papers | Citations in selected set | Top selected paper |
|---:|---:|---:|---:|---|
| 2020 | 1,000 | 15 | 205,688 | [An Image is Worth 16x16 Words: Transformers for Image Recognition at Scale](https://www.semanticscholar.org/paper/268d347e8a55b5eb82fb5e7d2f800e33c75ab18a) |
| 2021 | 1,000 | 27 | 266,905 | [Learning Transferable Visual Models From Natural Language Supervision](https://www.semanticscholar.org/paper/6f870f7f02a8c59c3e23f407f3ef00dd1dcf8fc4) |
| 2022 | 1,000 | 21 | 150,589 | [Training language models to follow instructions with human feedback](https://doi.org/10.52202/068431-2011) |
| 2023 | 1,000 | 27 | 181,522 | [LLaMA: Open and Efficient Foundation Language Models](https://www.semanticscholar.org/paper/57e849d0de13ed5f91d086936296721d4ff75a75) |
| 2024 | 1,000 | 6 | 35,822 | [The Llama 3 Herd of Models](https://www.semanticscholar.org/paper/40e8af970329135ec95057d73e239dab805ad128) |
| 2025 | 1,000 | 4 | 20,255 | [Qwen3 Technical Report](https://www.semanticscholar.org/paper/d2d84d56f730f81d276a02b48d5d44db5bde0b4a) |
| 2026 | 1,000 | 0 | 0 | - |

## Methodology

The collection uses Semantic Scholar Academic Graph bulk search. Queries cover broad AI, machine learning, deep learning, foundation models, language, vision, reinforcement learning, generative models, graph learning, multimodal learning, trustworthy AI, and AI-for-science themes. For each year from 2020 through 2026, results are filtered to the publication year, screened with explicit AI relevance expressions in title/abstract/venue metadata, deduplicated by DOI, arXiv, PubMed, CorpusId, paperId, then title, and reduced to at most 1,000 candidates by citation count. The final awesome list selects the top 100 papers overall by citation count from those audited yearly pools; influential citation count and a deterministic metadata importance score are retained as tie-breakers and audit signals.

The taxonomy, key ideas, strengths, limitations, method tags, and keyword tags are generated deterministically from public metadata and rule-based domain conventions. No paid API, paid LLM, paid translation, or paid compute was used.

## Caveats

- This is a metadata-driven citation map, not a full systematic review of every PDF.
- Citation counts favor older papers; 2026 should be interpreted as a partial and still-moving year.
- Semantic Scholar metadata can omit venues, abstracts, PDFs, or influential citation counts for some records.
- Citation ranking measures influence and visibility; it does not directly measure methodological quality, safety, or reproducibility.

## License

CC-BY-4.0 for text and metadata curation; upstream paper metadata belongs to original sources.
