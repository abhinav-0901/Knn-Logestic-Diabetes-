#import dataset

xt=read.csv('Diabetes_XTrain.csv')
yt=read.csv('Diabetes_YTrain.csv')

test_set=read.csv('Diabetes_Xtest.csv')

dataset=cbind(xt,yt)

classifier=glm(formula = Outcome~.,family = binomial, data=dataset )


prob_pred=predict(classifier, type = 'response', newdata = dataset[-9])

y_pred=ifelse(prob_pred>0.5,1,0)

cm = table(dataset[, 9], y_pred)

ypred=knn(train = dataset[, -9], test = dataset[, -9], cl = dataset[, 9], k=5)
cm