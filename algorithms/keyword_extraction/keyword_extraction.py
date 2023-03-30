from keybert import KeyBERT
import csv


kw_model = KeyBERT()
keyword_frequency = dict()
with open('QuizAppQuestion.csv') as f:
    csv_reader = csv.reader(f, delimiter=',')
    count  = 0
    for row in csv_reader:
      if count == 100:
          break
      question = row[0]
      keywords_tuples = kw_model.extract_keywords(question)
      keywords = []
      for (keyword, num) in keywords_tuples:
            keywords.append(keyword)
            if keyword in keyword_frequency:
                keyword_frequency[keyword] += 1
            else:
                keyword_frequency[keyword] = 1
      count += 1

print(sorted(keyword_frequency.items(), key=lambda x:x[1]))


# kw_model = KeyBERT()
# keywords_tuples = kw_model.extract_keywords(doc)
# keywords = []
# for (keyword, num) in keywords_tuples:
#     keywords.append(keyword)

# print(keywords)


# print(kw_model.extract_keywords(doc, keyphrase_ngram_range=(1, 2), stop_words=None))
# print(kw_model.extract_keywords(doc, keyphrase_ngram_range=(3, 3), stop_words='english',
#                               use_maxsum=True, nr_candidates=20, top_n=5))
# print(kw_model.extract_keywords(doc, keyphrase_ngram_range=(3, 3), stop_words='english',
#                               use_mmr=True, diversity=0.7))
