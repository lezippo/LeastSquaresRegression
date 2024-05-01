# LeastSquaresRegression

The least squares polynomial approximation is a method for finding a polynomial function that best fits a set of data points by minimizing the sum of the squares of the differences between the actual data points and the corresponding points on the polynomial curve.

1. [Theory](#theory)
- [Problem Statement](#problem-statement)
- [Polynomial Formulation](#polynomial-formulation)
- [Least Squares Criterion](#least-squares-criterion)
- [Solving the Least Squares Problem](#solving-the-least-squares-problem)
- [Degree Selection](#degree-selection)
2. [Code Structure](#code-structure)
- [myls](#myls)

# Theory

## Problem Statement

Given a set of $n$ data points $(x_i, y_i)$, we want to find a polynomial function of degree $m$ that best fits the data in the least squares sense.

## Polynomial Formulation

We seek to find a polynomial function of the form:
 $$f(x) = c_0 + c_1x + c_2x^2 + \ldots + c_mx^m$$

## Least Squares Criterion

The least squares criterion is defined as minimizing the sum of the squares of the residuals (differences between actual and predicted values) for all data points:
$$\sum_{i=1}^{n} (y_i - f(x_i))^2$$

## Solving the Least Squares Problem

To solve the least squares problem, we can use linear algebra techniques. We represent the polynomial as a system of linear equations and solve for the coefficients $c_0, c_1, \ldots, c_m$.

1. **Matrix Formulation**: Construct the Vandermonde matrix $A$ and the vector $b$ as follows:
   - $A$ is an $n \times (m+1)$ matrix with elements $a_{ij} = x_i^j$.
   - $b$ is an $n \times 1$ vector with elements $b_i = y_i$.
2. **Solving the System**: Solve the system of linear equations $Ac = b$ for the coefficients vector $c$
3. **Polynomial Evaluation**: Once we have the coefficients, we can evaluate the polynomial function $f(x)$ at any point $x$.

## Degree Selection

The choice of polynomial degree $m$ depends on the characteristics of the data and the desired trade-off between bias and variance. Higher-degree polynomials can capture more complex patterns but may also lead to overfitting.

# Code structure

## myls

### Purpose
Determine coefficients of the least squares polynomial approximation to data.

### Input
- `xdata` (vector): The vector containing the x-values of the data points.
- `ydata` (vector): The vector containing the y-values of the data points.
- `w` (integer): The degree of the polynomial.

### Output
- `coeff` (vector): The coefficients of the least squares polynomial approximation.
