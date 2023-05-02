from keybert import KeyBERT
import csv


"""keyword_extraction

This function allows us to extract the first maxCount question's keywords
and outputs them into the console in a format where we can see the most frequently
appearing keywords and the percent of questions that they appear in.

Parameters
    ----------
    maxCount: specifies how many questions to parse through.

    Returns
    -------
    a sorted list of the most frequently occuring keywords
"""

def keyword_extraction(maxCount):
    kw_model = KeyBERT()
    keyword_frequency = dict()
    with open('QuizAppQuestion.csv') as f:
        csv_reader = csv.reader(f, delimiter=',')
        count  = 0
        for row in csv_reader:
            if count == maxCount:
                break
            question = row[0]
            keywords_tuples = kw_model.extract_keywords(question)
            for (keyword, num) in keywords_tuples:
                    if keyword in keyword_frequency:
                        keyword_frequency[keyword] += 1
                    else:
                        keyword_frequency[keyword] = 1
            count += 1
    for (keyword, frequency) in keyword_frequency.items():
        keyword_frequency[keyword] = frequency / maxCount
    return (sorted(keyword_frequency.items(), key=lambda x:x[1])[::-1])

"""maxSumDistance

This function allows us to implement maxSumDistance in order to make the results as 
diverse as possible. We use (1, 1) n-grams since we need to divide each question into a list
composed of each word in the question.

    Returns
    -------
    keywords based on a given question using maximal sum distance
"""

def maxSumDistance():
    kw_model = KeyBERT()
    question = "What is the purpose of finding any positive peak of the sinusoid?"
    
    return (kw_model.extract_keywords(question, keyphrase_ngram_range=(1, 1)))


"""minimalMarginalRelevance

This function allows us to implement minimal marginal relevance to further improve how
diverse our results are. This is present and used in other functions to ensure that the 
keywords we obtain are not synonyms.

    Returns
    -------
    ranked list of keywords using minimal marginal relevance
"""

def minimalMarginalRelevance():
    kw_model = KeyBERT()
    question = "after being stimulated by the single input sample from the impulse, the system continues indefinitely to produce what?"
    
    return kw_model.extract_keywords(question, keyphrase_ngram_range=(1,1), use_mmr=True, diversity=0.7)



