erDiagram

    CONTACTS {
      string ContactID PK
      string FirstName
      string LastName
      string PartnerName
      string PartnerContactID FK
      string Mobile1
      string Mobile2
      string Email
      string Suburb
      string Birthday
      string AgeBracket
      string HousingStatus
      string EmploymentStatus
      string HouseholdIncomeRange
      string SuperType
      string SuperBalanceRange
      string Notes
      string JourneyStage
      datetime CreatedDate
      datetime LastUpdated
      datetime LastContacted
    }

    LEADS {
      string LeadID PK
      string ContactID FK
      string Source
      string RepName
      string Address
      string Notes
      date   DateCaptured
      string Stage
      datetime LastUpdated
    }

    APPOINTMENTS {
      string AppointmentID PK
      string ContactID FK
      string AppointmentType
      date   Date
      time   Time
      string Format
      string Status
      string Outcome
      string Notes
      string GoogleCalendarEventID
    }

    DEALS {
      string DealID PK
      string ContactID FK
      string PartnerContactID FK
      string ProjectID FK
      decimal InvestmentAmount
      decimal EstimatedCommission
      decimal ActualCommission
      string OpportunityStage
      date   OfferDate
      date   AcceptanceDate
      date   SettlementDate
      string CaseManager
      date   ROL_ETA
      string AccountingNotes
      string Notes
    }

    PROPERTYINVESTORS {
      string InvestorID PK
      string ContactID FK
      string PartnerContactID FK
      string ProjectID FK
      string PropertyType
      decimal DepositAmount
      date   SettlementDate
      decimal CommissionAmount
      string Notes
    }

    SMSFENTITIES {
      string SMSFID PK
      string ContactID FK
      string SMSFName
      string Trustees
      string ABN
      string Notes
    }

    ACTIVITYLOG {
      string ActivityID PK
      string ContactID FK
      datetime Timestamp
      string ActivityType
      string StageChangedTo
      string Notes
      string Rep
    }

    TASKS {
      string TaskID PK
      string ContactID FK
      string TaskType
      date   DueDate
      string Status
      string Owner
      string Notes
    }

    PROJECTS {
      string ProjectID PK
      string Developer
      string ProjectName
      string Location
      string Status
    }

    %% RELATIONSHIPS

    CONTACTS ||--o{ LEADS : "has leads"
    CONTACTS ||--o{ APPOINTMENTS : "has appointments"
    CONTACTS ||--o{ DEALS : "has deals"
    CONTACTS ||--o{ PROPERTYINVESTORS : "has investments"
    CONTACTS ||--o{ SMSFENTITIES : "has SMSF"
    CONTACTS ||--o{ ACTIVITYLOG : "has activities"
    CONTACTS ||--o{ TASKS : "has tasks"

    %% self partner
    CONTACTS ||--o| CONTACTS : "partner (PartnerContactID)"

    PROJECTS ||--o{ DEALS : "project for"
    PROJECTS ||--o{ PROPERTYINVESTORS : "project for"
