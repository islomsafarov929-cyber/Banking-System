--Orders of creation tables
--1.RegulatoryReports
--2.CyberSecurity
--3.Customers
--4.Merchants
--5.Departments (create without ManagerID FK)
--6.Employees
--7.Branches (create without ManagerID FK)
--8.Accounts
--9.CreditScores
--10.MobileBanking
--11.OnlineBanking
--12.InsurancePolicies
--13.KYC
--14.Loans
--15.BillPayments
--16.DebtCollection
--17.ForeignExchange
--18.StockTrading
--19.Investments
--20.Transactions
--21.CreditCards
--22.LoanPayments
--23.FraudDetection
--24.Claims
--25.MerchantTransactions
--26.CreditCardTrans
--27.EmployeeAttendance
--28.Salaries
--29.UserAccessLog
--30.AMLCases
--Use Alter tables to add fk constraint.

-- ======================================
-- BANK SYSTEM FULL SCHEMA - 30 TABLES
-- ====================================== 

-- 1. RegulatoryReports
CREATE TABLE dbo.RegulatoryReports (
    ReportID INT IDENTITY(1,1) PRIMARY KEY,
    ReportType NVARCHAR(100) NOT NULL,
    SubmissionDate DATETIME NOT NULL
);

-- 2. CyberSecurityIncidents
CREATE TABLE dbo.CyberSecurityIncidents (
    IncidentID INT IDENTITY(1,1) PRIMARY KEY,
    AffectedSystem NVARCHAR(255),
    ReportedDate DATETIME,
    ResolutionStatus NVARCHAR(100)
);

-- 3. Customers
CREATE TABLE dbo.Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(250) NOT NULL,
    DOB DATE NULL,
    Email NVARCHAR(200),
    PhoneNumber NVARCHAR(50),
    Address NVARCHAR(500),
    NationalID NVARCHAR(50),
    TaxID NVARCHAR(50),
    EmploymentStatus NVARCHAR(100),
    AnnualIncome DECIMAL(18,2),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME
);

-- 4. Merchants
CREATE TABLE dbo.Merchants (
    MerchantID INT IDENTITY(1,1) PRIMARY KEY,
    MerchantName NVARCHAR(250) NOT NULL,
    Industry NVARCHAR(150),
    Location NVARCHAR(300),
    CustomerID INT NULL,
    CONSTRAINT FK_Merchants_Customers FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID) ON DELETE SET NULL
);

-- 5. Departments
CREATE TABLE dbo.Departments (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName NVARCHAR(150) NOT NULL,
    ManagerID INT NULL -- circular, FK added later
);

-- 6. Employees
CREATE TABLE dbo.Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    BranchID INT NULL,
    FullName NVARCHAR(250) NOT NULL,
    Position NVARCHAR(150),
    DepartmentID INT NULL,
    Salary DECIMAL(18,2),
    HireDate DATE,
    Status NVARCHAR(50),
    CONSTRAINT FK_Employees_Departments FOREIGN KEY (DepartmentID) REFERENCES dbo.Departments(DepartmentID) ON DELETE SET NULL
);

-- Departments.ManagerID circular FK
ALTER TABLE dbo.Departments
ADD CONSTRAINT FK_Departments_Manager FOREIGN KEY (ManagerID) REFERENCES dbo.Employees(EmployeeID) ON DELETE SET NULL;

-- 7. Branches
CREATE TABLE dbo.Branches (
    BranchID INT IDENTITY(1,1) PRIMARY KEY,
    BranchName NVARCHAR(200),
    Address NVARCHAR(500),
    City NVARCHAR(100),
    State NVARCHAR(100),
    Country NVARCHAR(100),
    ManagerID INT NULL, -- circular, FK added later
    ContactNumber NVARCHAR(50)
);

--Branches.ManagerID circular FK
ALTER TABLE dbo.Branches
ADD CONSTRAINT FK_Branches_Manager FOREIGN KEY (ManagerID) REFERENCES dbo.Employees(EmployeeID) ON DELETE SET NULL;


--Employees.BranchID circular FK
ALTER TABLE dbo.Employees
ADD CONSTRAINT FK_Employees_Branches FOREIGN KEY (BranchID) REFERENCES dbo.Branches(BranchID) ON DELETE SET NULL

-- 8. Accounts
CREATE TABLE dbo.Accounts (
    AccountID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    AccountType NVARCHAR(50), --(Savings, Checking, Business, etc.)
    Balance DECIMAL(18,2) DEFAULT 0,
    Currency CHAR(3) DEFAULT 'USD',
    Status NVARCHAR(50),
    BranchID INT NULL,
    CreatedDate DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Accounts_Customers FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID) ON DELETE NO ACTION,
    CONSTRAINT FK_Accounts_Branches FOREIGN KEY (BranchID) REFERENCES dbo.Branches(BranchID) ON DELETE SET NULL
);

-- 9. CreditScores
CREATE TABLE dbo.CreditScores (
    CustomerID INT PRIMARY KEY,
    CreditScore INT,
    UpdatedAt DATETIME,
    CONSTRAINT FK_CreditScores_Customers FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID) ON DELETE NO ACTION
);

-- 10. MobileBankingTransactions
CREATE TABLE dbo.MobileBankingTransactions (
    MobileTransID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    DeviceID NVARCHAR(200),
    AppVersion NVARCHAR(50),
    TransactionType NVARCHAR(50),
    Amount DECIMAL(18,2),
    [Date] DATETIME,
    CONSTRAINT FK_MobileTrans_Customers FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID) ON DELETE NO ACTION
);

-- 11. OnlineBankingUsers
CREATE TABLE dbo.OnlineBankingUsers (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    Username NVARCHAR(150) UNIQUE,
    PasswordHash NVARCHAR(512),
    LastLogin DATETIME,
    CONSTRAINT FK_OnlineUser_Customer FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID) ON DELETE NO ACTION
);

-- 12. InsurancePolicies
CREATE TABLE dbo.InsurancePolicies (
    PolicyID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    InsuranceType NVARCHAR(150),
    PremiumAmount DECIMAL(18,2),
    CoverageAmount DECIMAL(18,2),
    CONSTRAINT FK_Policy_Customers FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID) ON DELETE NO ACTION
);

-- 13. KYC
CREATE TABLE dbo.KYC (
    KYCID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    DocumentType NVARCHAR(100),
    DocumentNumber NVARCHAR(200),
    VerifiedBy NVARCHAR(200),
    CONSTRAINT FK_KYC_Customers FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID) ON DELETE NO ACTION
);

-- 14. Loans
CREATE TABLE dbo.Loans (
    LoanID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    LoanType NVARCHAR(100), --(Mortgage, Personal, Auto, Business)
    Amount DECIMAL(18,2),
    InterestRate DECIMAL(5,4),
    StartDate DATE,
    EndDate DATE,
    Status NVARCHAR(50),
    CONSTRAINT FK_Loans_Customers FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID) ON DELETE NO ACTION,
);

-- 15. BillPayments
CREATE TABLE dbo.BillPayments (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    BillerName NVARCHAR(250),
    Amount DECIMAL(18,2),
    [Date] DATETIME,
    Status NVARCHAR(50),
    CONSTRAINT FK_BillPayments_Customers FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID) ON DELETE NO ACTION
);

-- 16. DebtCollection
CREATE TABLE dbo.DebtCollection (
    DebtID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    AmountDue DECIMAL(18,2),
    DueDate DATE,
    CollectorAssigned NVARCHAR(200),
    CONSTRAINT FK_DebtCollection_Customers FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID) ON DELETE NO ACTION,
);

-- 17. ForeignExchange
CREATE TABLE dbo.ForeignExchange (
    FXID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    CurrencyPair NVARCHAR(20),
    ExchangeRate DECIMAL(18,8),
    AmountExchanged DECIMAL(18,2),
    CONSTRAINT FK_FX_Customers FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID) ON DELETE NO ACTION
);

-- 18. StockTradingAccounts
CREATE TABLE dbo.StockTradingAccounts (
    TradingAccountID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    BrokerageFirm NVARCHAR(200),
    TotalInvested DECIMAL(18,2),
    CurrentValue DECIMAL(18,2),
    CONSTRAINT FK_TradingAccounts_Customers FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID) ON DELETE NO ACTION,
);

-- 19. Investments
CREATE TABLE dbo.Investments (
    InvestmentID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    InvestmentType NVARCHAR(150),
    Amount DECIMAL(18,2),
    ROI DECIMAL(8,4),
    MaturityDate DATE,
    CONSTRAINT FK_Investments_Customers FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID) ON DELETE NO ACTION
);

 --20. Transactions
CREATE TABLE dbo.Transactions (
    TransactionID INT IDENTITY(1,1) PRIMARY KEY,
    AccountID INT NOT NULL,
    TransactionType NVARCHAR(100), --(Deposit, Withdrawal, Transfer, Payment)
    Amount DECIMAL(18,2),
    Currency CHAR(3),
    [Date] DATETIME,
    Status NVARCHAR(50),
    ReferenceNo NVARCHAR(200),
    CONSTRAINT FK_Transactions_Accounts FOREIGN KEY (AccountID) REFERENCES dbo.Accounts(AccountID) ON DELETE CASCADE
);

-- 21. CreditCards
CREATE TABLE dbo.CreditCards (
    CardID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    CardNumber CHAR(16) NOT NULL,
    CardType NVARCHAR(50),
    CVV CHAR(3),
    ExpiryDate DATE,
    [Limit] DECIMAL(18,2),
    Status NVARCHAR(50),
    CONSTRAINT FK_CreditCards_Customers FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID) ON DELETE NO ACTION
);

-- 22. LoanPayments
CREATE TABLE dbo.LoanPayments (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    LoanID INT NOT NULL,
    AmountPaid DECIMAL(18,2),
    PaymentDate DATE,
    RemainingBalance DECIMAL(18,2),
    CONSTRAINT FK_LoanPayments_Loans FOREIGN KEY (LoanID) REFERENCES dbo.Loans(LoanID) ON DELETE CASCADE
);

-- 23. FraudDetection
CREATE TABLE dbo.FraudDetection (
    FraudID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NULL,
    TransactionID INT NULL,
    RiskLevel NVARCHAR(50),
    ReportedDate DATETIME,
    CONSTRAINT FK_FraudDetection_Customers FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID) ON DELETE SET NULL,
    CONSTRAINT FK_FraudDetection_Transactions FOREIGN KEY (TransactionID) REFERENCES dbo.Transactions(TransactionID) ON DELETE SET NULL
);

-- 24. Claims
CREATE TABLE dbo.Claims (
    ClaimID INT IDENTITY(1,1) PRIMARY KEY,
    PolicyID INT NOT NULL,
    ClaimAmount DECIMAL(18,2),
    Status NVARCHAR(50),
    FiledDate DATETIME,
    CONSTRAINT FK_Claims_Policies FOREIGN KEY (PolicyID) REFERENCES dbo.InsurancePolicies(PolicyID) ON DELETE CASCADE
);

-- 25. MerchantTransactions
CREATE TABLE dbo.MerchantTransactions (
    MerchantTransID INT IDENTITY(1,1) PRIMARY KEY,
    MerchantID INT NOT NULL,
    Amount DECIMAL(18,2),
    PaymentMethod NVARCHAR(100),
    [Date] DATETIME,
    CONSTRAINT FK_MerchantTrans_Merchants FOREIGN KEY (MerchantID) REFERENCES dbo.Merchants(MerchantID) ON DELETE CASCADE
);

-- 26. CreditCardTrans
CREATE TABLE dbo.CreditCardTransactions (
    CardTransID INT IDENTITY(1,1) PRIMARY KEY,
    CardID INT NOT NULL,
    Merchant NVARCHAR(250),
    Amount DECIMAL(18,2),
    Currency CHAR(3),
    [Date] DATETIME,
    Status NVARCHAR(50),
    CONSTRAINT FK_CardTrans_CreditCards FOREIGN KEY (CardID) REFERENCES dbo.CreditCards(CardID) ON DELETE CASCADE
);

-- 27. EmployeeAttendance
CREATE TABLE dbo.EmployeeAttendance (
    AttendanceID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT NULL,
    CheckInTime DATETIME,
    CheckOutTime DATETIME,
    TotalHours DECIMAL(5,2),
    CONSTRAINT FK_EmpAttendance_Employees FOREIGN KEY (EmployeeID) REFERENCES dbo.Employees(EmployeeID) ON DELETE SET NULL
);

-- 28. Salaries
CREATE TABLE dbo.Salaries (
    SalaryID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT NULL,
    BaseSalary DECIMAL(18,2),
    Bonus DECIMAL(18,2),
    Deductions DECIMAL(18,2),
    PaymentDate DATE,
    CONSTRAINT FK_Salaries_Employees FOREIGN KEY (EmployeeID) REFERENCES dbo.Employees(EmployeeID) ON DELETE SET NULL
);

-- 29. UserAccessLogs
CREATE TABLE dbo.UserAccessLogs (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NULL, -- points to OnlineBankingUsers
    ActionType NVARCHAR(200),
    [Timestamp] DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_UserAccessLogs_OnlineBankingUsers FOREIGN KEY (UserID) REFERENCES dbo.OnlineBankingUsers(UserID) ON DELETE SET NULL
);

-- 30. AMLCases
CREATE TABLE dbo.AMLCases (
    CaseID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NULL,
    CaseType NVARCHAR(200),
    Status NVARCHAR(100),
    InvestigatorID INT NULL,
    CONSTRAINT FK_AMLCases_Customers FOREIGN KEY (CustomerID) REFERENCES dbo.Customers(CustomerID) ON DELETE SET NULL
);





