import numpy as np
from collections import Counter


class LDA:
    def __init__(self, num_topics, alpha=0.1, beta=0.1, max_iter=1000):
        self.num_topics = num_topics
        self.alpha = alpha
        self.beta = beta
        self.max_iter = max_iter

    def fit(self, corpus):
        self.vocab = set(word for doc in corpus for word in doc)
        self.word2idx = {word: i for i, word in enumerate(self.vocab)}
        self.idx2word = {i: word for word, i in self.word2idx.items()}

        self.num_docs = len(corpus)
        self.doc_lengths = [len(doc) for doc in corpus]

        self.topic_assignments = [[np.random.randint(self.num_topics) for _ in range(length)] for length in
                                  self.doc_lengths]
        self.topic_counts = np.zeros((self.num_topics, len(self.vocab)))
        self.doc_topic_counts = np.zeros((self.num_docs, self.num_topics))

        for doc_idx, doc in enumerate(corpus):
            for word_idx, word in enumerate(doc):
                z = self.topic_assignments[doc_idx][word_idx]
                self.topic_counts[z, self.word2idx[word]] += 1
                self.doc_topic_counts[doc_idx, z] += 1

        for _ in range(self.max_iter):
            for doc_idx, doc in enumerate(corpus):
                for word_idx, word in enumerate(doc):
                    z = self.topic_assignments[doc_idx][word_idx]
                    self.topic_counts[z, self.word2idx[word]] -= 1
                    self.doc_topic_counts[doc_idx, z] -= 1

                    p_z = (self.doc_topic_counts[doc_idx] + self.alpha) * \
                          (self.topic_counts[:, self.word2idx[word]] + self.beta) / \
                          (self.topic_counts.sum(axis=1) + self.beta * len(self.vocab))
                    z = np.random.multinomial(1, p_z / p_z.sum()).argmax()

                    self.topic_assignments[doc_idx][word_idx] = z
                    self.topic_counts[z, self.word2idx[word]] += 1
                    self.doc_topic_counts[doc_idx, z] += 1

    def bag_of_words(self, doc):
        bag = np.zeros(len(self.vocab))
        for word in doc:
            if word in self.vocab:
                bag[self.word2idx[word]] += 1
        return bag

    def topic_word_distribution(self):
        return (self.topic_counts + self.beta) / \
            (self.topic_counts.sum(axis=1)[:, np.newaxis] + self.beta * len(self.vocab))

    def document_topic_distribution(self):
        return (self.doc_topic_counts + self.alpha) / \
            (self.doc_topic_counts.sum(axis=1)[:, np.newaxis] + self.alpha * self.num_topics)
