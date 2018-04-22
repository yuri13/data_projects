#multiple regression
#create subset of variables
input <- mtcars[, c("mpg", "disp", "hp", "wt")]
print(head(input))

#create the relationship model
model <- lm(mpg~disp+hp+wt, data = input)

#show the model
print(model)

#get the Intercept and coefficients as vector elements
cat("# # # # The Coefficient Values # # #","\n")

a <- coef(model)[1]
print(a)

Xdisp <- coef(model)[2]
Xhp <- coef(model)[3]
Xwt <- coef(model)[4]

print(Xdisp)
print(Xhp)
print(Xwt)

Y = a + Xdisp*x1 + Xhp*x2 + Xwt*x3
x1 = 221
x2 = 102
x3 = 2.91
print(Y)
