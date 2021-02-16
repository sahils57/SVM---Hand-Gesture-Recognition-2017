Assignment - CS 542 Boston University

Support Vector Machines for Hand Print Recognition

(a) Develop code for training and testing an SVM classier with nonlinear kernel. You
are welcome to use either formulation described in the textbook (chapter 7). You
cannot use an SVM library to complete this assignment. You can use quadratic
programming library if you like. Using your implementation of the SVM classier,
compare multi-class classication performance of two dierent voting schemes:
i. one versus the rest
ii. one versus one
Be sure to specify your voting scheme using a method described in the book . To
analyze accuracy, you will nd it helpful to produce and analyze the multiclass confu-
sion matrix (http://en.wikipedia.org/wiki/Confusion matrix), in addition to
examining the overall error rate.
For all the codes below.
the variable "acc" is the accuracy rate.
while the confusion matrix is under the name confusion_matrix
(b) Use the same one versus one classiers from the previous problem in a
DAGSVM approach. A paper describing the approach, DAGSVM.pdf, is attached.
Compare multi- class classication performance with the other two voting schemes.
(c)  A baseline implementation of the DAGSVM with 6th degree polyno-
mial kernels achieves 95% accuracy on the test set. See if you can do better than this
baseline, using the DAGSVM approach. baseline-CM.pdf contains the confusion
matrix of the baseline implementation:


1 vs 1 kernel :

it is under the file main_1vs1.m. run that. (6 minutes)



1 vs all kernel :

it is under the file main_1vsAll.m. run that (it takes about half an hour to run)



DAGSVM :

it is under the name dagvsm_rbf.m run that(6 minutes)
