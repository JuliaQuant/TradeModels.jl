using MarketData


# Phi = phi_0 to phi_p or length of p + 1
# y = all the ys starting at the p index, because we need pre values
# [yp+1 yp+2 ... end]
# the numbe of rows in y == number of rows in X
# X is a big matrix with the first row of 1s and the number of columns after that equal to p for a total of p+1 columns
# the number of columns in X must match the number of rows in Phi, because that's how it lines up
# to estimate Phi  :
##     inv(X'X) * X' * y 


p = 7
logreturns = percentchange(cl, method="log")
all_y = flipud(logreturns.values)
#y = all_y[p:end] 
y = all_y[p+1:end] 
X = 

phi = zeros(p+1)

