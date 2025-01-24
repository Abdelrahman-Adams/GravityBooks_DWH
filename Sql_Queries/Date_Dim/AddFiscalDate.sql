--This script will add Fiscal columns to the DimDate Table
--This script will set the Start date and end below to the first and last date on your dim date table
--The following Colums wil be created: Fiscal Year, FiscalQuarter, FiscalQuarterName, FiscalMonth

USE gravity_books_DWH
--SET THE @DaysOffSet VARIABLE TO OFFSET THE DATE
Alter Table [DimDate] add FiscalDay Char(2)
Alter Table [DimDate] Add FiscalMonth Char(2)
Alter Table [DimDate] Add FiscalMonthName Varchar(9)
Alter Table [DimDate] Add FiscalQuarter tinyint
Alter Table [DimDate] Add FiscalQuarterName Varchar(6)
Alter Table [DimDate] Add FiscalYear char(4)

Go
Declare @DaysOffSet int
--If your Fiscal Year starts on January 7 then set this variable to negative 6 --------------------------
--If your Fiscal Year starts before the start of the calendar year set it to a postive number------------
Select @DaysOffSet = -6

DECLARE @StartDate datetime
 , @EndDate datetime
 , @Date datetime
 , @FiscalDate datetime
 , @WDofMonth INT
 , @QuarterName varchar(6)
 , @MonthName varchar(9)

SELECT @StartDate = (Select Min([Date]) from [DimDate])
 , @EndDate = (Select Max([Date]) from [DimDate])

SELECT @Date = @StartDate
Select @FiscalDate = Dateadd(DAY,@DaysOffSet,@StartDate)


WHILE @Date < @EndDate
 BEGIN
 
 Select @QuarterName =
 Case DATEPART(QUARTER,@FiscalDate)
	 When 1
		 Then 'First'
	 When 2 
		Then 'Second'
	 When 3 
		Then 'Third'
	 When 4 
		Then  'Forth'
	 Else 'Error'
 End
  
Update [DimDate]
 Set 
 FiscalDay = DATEPART(DAY,@FiscalDate),
 FiscalMonth = Right('0'+Convert(char(2),DATEPART(MONTH,@FiscalDate)),2),
 FiscalMonthName = DATENAME(MONTH,@FiscalDate),
 FiscalQuarter = DATEPART(QUARTER,@FiscalDate),
 FiscalQuarterName = @QuarterName,
 FiscalYear = DATEPART(YEAR,@FiscalDate)
 Where Date = @Date
 
  SELECT @Date = DATEADD(dd,1,@Date)
  Select @FiscalDate = DATEADD(dd,1,@FiscalDate)
 END

PRINT CONVERT(VARCHAR,GETDATE(),113)--USED FOR CHECKING RUN TIME.

--DimDate indexes---------------------------------------------------------------------------------------------

CREATE NONCLUSTERED INDEX [IDX_DimDate_FiscalMonth] ON [dbo].[DimDate] 
(
[FiscalMonth] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IDX_DimDate_FiscalMonthName] ON [dbo].[DimDate] 
(
[MonthName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IDX_DimDate_FiscalQuarter] ON [dbo].[DimDate] 
(
[FiscalQuarter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IDX_DimDate_FiscalQuarterName] ON [dbo].[DimDate] 
(
[FiscalQuarterName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IDX_DimDate_FiscalYear] ON [dbo].[DimDate] 
(
[FiscalYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]

PRINT convert(varchar,getdate(),113)--USED FOR CHECKING RUN TIME.