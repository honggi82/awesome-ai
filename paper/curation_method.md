# Curation Method

## Scope

- Topic: AI research across machine learning, deep learning, foundation models, NLP, vision, reinforcement learning, generative AI, trustworthy AI, graph learning, multimodal learning, and AI for science.
- Period: 2000-2026.
- Candidate target: up to 1,000 papers per year.
- Final selection: top 100 papers per year by citation count from the audited yearly candidate pools (2,700 papers total).

## Data Source

Metadata comes from the free public Semantic Scholar Academic Graph bulk search endpoint. OpenAlex was used only as a public concept/subfield reference for the AI topic (`Artificial intelligence`, `C154945302`; Artificial Intelligence subfield `1702`).

## Ranking

Records are filtered to the requested publication year, screened for explicit AI relevance in title/abstract/venue metadata, deduplicated by DOI, arXiv, PubMed, CorpusId, paperId, and normalized title, then ranked by citation count. The selected set keeps the top 100 papers in each year. Influential citation count and a deterministic metadata importance score are retained as audit fields.

## Enrichment

Taxonomy, key ideas, strengths, limitations, method tags, and keyword convention tags are generated with deterministic rules from public metadata. No paid API, paid LLM, paid translation, or paid compute was used.
