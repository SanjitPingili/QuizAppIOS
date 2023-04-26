# This is a sample Python script.

# Press ⌃R to execute it or replace it with your code.
# Press Double ⇧ to search everywhere for classes, files, tool windows, actions, and settings.
from LDAHelpers import clean_text
from LDAHelpers import remove_stopwords
from LDA import LDA
import nltk
from LDAHelpers import printer
import csv


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press ⌘F8 to toggle the breakpoint.


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    # Sample corpus of documents
    corpus = [
        ['apple', 'banana', 'orange', 'fruit', 'juice'],
        ['banana', 'orange', 'smoothie', 'drink'],
        ['orange', 'juice', 'drink', 'refreshment'],
        ['apple', 'orange', 'juice', 'drink'],
        ['banana', 'smoothie', 'drink', 'refreshment']
    ]

    # Create an instance of the LDA class with 2 topics
    lda = LDA(num_topics=2)

    # Fit the LDA model to the corpus
    lda.fit(corpus)

    # Print the distribution over words for each topic
    print(lda.topic_word_distribution())

    # Print the distribution over topics for each document
    print(lda.document_topic_distribution())

    print_hi('PyCharm')
    text = "testing,?? a string,?? 8* and is blob"
    print(text)
    ans = clean_text(text)
    print(ans)
    no_stops = remove_stopwords(text)

    print(no_stops)
    #from LDA import LDA

    # Load the CSV file and preprocess the text
    #nltk.download('stopwords')
    #stop_words = set(nltk.corpus.stopwords.words('english'))
    stemmer = nltk.PorterStemmer()

    with open('./QuizAppQuestion.csv', newline='') as csvfile:
        reader = csv.reader(csvfile)
        documents = []
        for i, row in enumerate(reader):
            if i > 500:
                break
            text = row[0].lower()
            words = clean_text(text)
            words = remove_stopwords(words)
            words = nltk.word_tokenize(words)
            print(words)
            documents.append(words)

    # Create an instance of the LDA class and fit the model on the preprocessed text
    num_topics = 5
    lda = LDA(num_topics=num_topics)
    lda.fit(documents)

    # Get the topic-word distribution
    topic_word_dist = lda.topic_word_distribution()

    # Get the document-topic distribution
    doc_topic_dist = lda.document_topic_distribution()

    # Assign topics to documents
    topic_assignments = []
    for doc_idx, doc in enumerate(documents):
        topic_probs = doc_topic_dist[doc_idx]
        topic = topic_probs.argmax()
        topic_assignments.append(topic)

    # Print the topic assignments for each document
    for doc_idx, topic in enumerate(topic_assignments):
        print(f"Document {doc_idx}: Topic {topic}")

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
