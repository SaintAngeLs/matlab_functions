function tests = tests_xsin3
tests = functiontests(localfunctions);
end

function testNonZero(testCase)
x = [1, -1, 2, -2];
expectedY = (sin(x) - x).*x.^(-3);
y = xsin3(x);
verifyEqual(testCase, y, expectedY, 'RelTol', 1e-4);
end

function testZero(testCase)
x = [1e-10, 1e-10, 1e-10];
expectedY = (sin(x) - x).*x.^(-3);
y = xsin3(x);
verifyEqual(testCase, y, expectedY, 'RelTol', eps);
end

function testLarge(testCase)
x = [-8*pi, 8*pi];
expectedY = (sin(x) - x).*x.^(-3);
y = xsin3(x);
verifyEqual(testCase, y, expectedY, 'RelTol', 1e-10);
end