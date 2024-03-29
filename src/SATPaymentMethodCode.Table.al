table 27001 "SAT Payment Method Code"
{
    Caption = 'SAT Payment Method Code';
    DrillDownPageID = "SAT Payment Method Codes";
    LookupPageID = "SAT Payment Method Codes";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

