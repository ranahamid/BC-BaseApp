table 27042 "DIOT-Report Buffer"
{
    Caption = 'DIOT Report Buffer';
    ObsoleteReason = 'Moved to extension';
    ObsoleteState = Removed;

    fields
    {
        field(1; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
        }
        field(2; "Type of Operation"; Option)
        {
            Caption = 'Type of Operation';
            OptionCaption = ' ,Prof. Services,Lease and Rent,Others';
            OptionMembers = " ","Prof. Services","Lease and Rent",Others;
        }
        field(3; "DIOT Concept No."; Integer)
        {
            Caption = 'DIOT Concept No.';
        }
        field(4; Value; Decimal)
        {
            Caption = 'Value';
        }
    }

    keys
    {
        key(Key1; "Vendor No.", "Type of Operation", "DIOT Concept No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

