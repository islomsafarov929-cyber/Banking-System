--1.RegulatoryReports
BULK INSERT [dbo].RegulatoryReports
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\RegulatoryReports.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM RegulatoryReports

--2.CyberSecurityIncidents
BULK INSERT [dbo].CyberSecurityIncidents
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\CyberSecurityIncidents.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM CyberSecurityIncidents

--3.Customers
BULK INSERT [dbo].Customers
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\Customers.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM Customers

--4.Merchants
BULK INSERT [dbo].Merchants
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\Merchants.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM Merchants

--5.Departments
BULK INSERT [dbo].Departments
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\Departments.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM Departments

--6.Employees
BULK INSERT [dbo].Employees
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\Employees.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM Employees

--7.Branches
BULK INSERT [dbo].Branches
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\Branches.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM Branches

--8.Accounts
BULK INSERT [dbo].Accounts
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\Accounts.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM Accounts

--9.CreditScores
BULK INSERT [dbo].CreditScores
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\CreditScores.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM CreditScores

--10. MobileBankingTransactions
BULK INSERT [dbo]. MobileBankingTransactions
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\MobileBankingTransactions.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM  MobileBankingTransactions

--11.OnlineBankingUsers
BULK INSERT [dbo].OnlineBankingUsers
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\OnlineBankingUsers.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM OnlineBankingUsers

--12.InsurancePolicies
BULK INSERT [dbo].InsurancePolicies
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\InsurancePolicies.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM InsurancePolicies

--13.KYC
BULK INSERT [dbo].KYC
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\KYC.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM KYC

--14.Loans
BULK INSERT [dbo].Loans
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\Loans.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM Loans

--15.BillPayments
BULK INSERT [dbo].BillPayments
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\BillPayments.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM BillPayments

--16.
BULK INSERT [dbo].DebtCollection
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\DebtCollection.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM DebtCollection

--17.ForeignExchange
BULK INSERT [dbo].ForeignExchange
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\ForeignExchange1.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM ForeignExchange

--18.StockTradingAccounts
BULK INSERT [dbo].StockTradingAccounts
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\StockTradingAccounts.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM StockTradingAccounts

--19.Investments
BULK INSERT [dbo].Investments
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\Investments.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM Investments

--20.Transactions
BULK INSERT [dbo].Transactions
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\Transactions.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM Transactions

--21.CreditCards
BULK INSERT [dbo].CreditCards
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\CreditCards.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM CreditCards

--22.LoanPayments
BULK INSERT [dbo].LoanPayments
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\LoanPayments.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM LoanPayments

--23.FraudDetection
BULK INSERT [dbo].FraudDetection
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\FraudDetection.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM FraudDetection

--24.Claims
BULK INSERT [dbo].Claims
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\Claims.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM Claims

--25.MerchantTransactions
BULK INSERT [dbo].MerchantTransactions
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\MerchantTransactions.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM MerchantTransactions

--26.CreditCardTransactions
BULK INSERT [dbo].CreditCardTransactions
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\CreditCardTransactions.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM CreditCardTransactions

--27.EmployeeAttendance
BULK INSERT [dbo].EmployeeAttendance
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\EmployeeAttendance.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM EmployeeAttendance

--28.Salaries
BULK INSERT [dbo].Salaries
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\Salaries.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM Salaries

--29.UserAccessLogs
BULK INSERT [dbo].UserAccessLogs
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\UserAccessLogs.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM UserAccessLogs

--30.AMLCases
BULK INSERT [dbo].AMLCases
FROM 'C:\Users\user\OneDrive\Desktop\Project\Datas\AMLCases.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT * FROM AMLCases