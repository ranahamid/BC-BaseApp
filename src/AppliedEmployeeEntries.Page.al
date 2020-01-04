page 63 "Applied Employee Entries"
{
    Caption = 'Applied Employee Entries';
    DataCaptionExpression = Heading;
    Editable = false;
    PageType = List;
    SourceTable = "Employee Ledger Entry";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the employee entry''s posting date.';
                }
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the employee entry''s document type.';
                }
                field("Document No."; "Document No.")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the employee entry''s document number.';
                }
                field(Description; Description)
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies a description of the employee entry.';
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                    Visible = DimVisible1;
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                    Visible = DimVisible2;
                }
                field("Salespers./Purch. Code"; "Salespers./Purch. Code")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies which purchaser is assigned to the employee.';
                    Visible = false;
                }
                field("Currency Code"; "Currency Code")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the currency code for the amount on the line.';
                }
                field("Original Amount"; "Original Amount")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the amount of the original entry.';
                }
                field(Amount; Amount)
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the amount of the entry.';
                    Visible = AmountVisible;
                }
                field("Debit Amount"; "Debit Amount")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the total of the ledger entries that represent debits.';
                    Visible = DebitCreditVisible;
                }
                field("Credit Amount"; "Credit Amount")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the total of the ledger entries that represent credits.';
                    Visible = DebitCreditVisible;
                }
                field("Closed by Amount"; "Closed by Amount")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the amount that the entry was finally applied to (closed) with.';
                }
                field("User ID"; "User ID")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the ID of the user who posted the entry, to be used, for example, in the change log.';
                    Visible = false;

                    trigger OnDrillDown()
                    var
                        UserMgt: Codeunit "User Management";
                    begin
                        UserMgt.DisplayUserInformation("User ID");
                    end;
                }
                field("Entry No."; "Entry No.")
                {
                    ApplicationArea = BasicHR;
                    ToolTip = 'Specifies the entry number that is assigned to the entry.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Ent&ry")
            {
                Caption = 'Ent&ry';
                Image = Entry;
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Alt+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        ShowDimensions;
                    end;
                }
                action("Detailed &Ledger Entries")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Detailed &Ledger Entries';
                    Image = View;
                    RunObject = Page "Detailed Empl. Ledger Entries";
                    RunPageLink = "Employee Ledger Entry No." = FIELD("Entry No."),
                                  "Employee No." = FIELD("Employee No.");
                    RunPageView = SORTING("Employee Ledger Entry No.", "Posting Date");
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View a summary of all the posted entries and adjustments related to a specific employee ledger entry.';
                }
            }
        }
        area(processing)
        {
            action("&Navigate")
            {
                ApplicationArea = BasicHR;
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Find all entries and documents that exist for the document number and posting date on the selected entry or document.';

                trigger OnAction()
                begin
                    Navigate.SetDoc("Posting Date", "Document No.");
                    Navigate.Run;
                end;
            }
        }
    }

    trigger OnInit()
    begin
        AmountVisible := true;
    end;

    trigger OnOpenPage()
    begin
        Reset;
        SetControlVisibility;

        if "Entry No." <> 0 then begin
            CreateEmplLedgEntry := Rec;
            if CreateEmplLedgEntry."Document Type" = 0 then
                Heading := DocumentTxt
            else
                Heading := Format(CreateEmplLedgEntry."Document Type");
            Heading := Heading + ' ' + CreateEmplLedgEntry."Document No.";

            FindApplnEntriesDtldtLedgEntry;
            SetCurrentKey("Entry No.");
            SetRange("Entry No.");

            if CreateEmplLedgEntry."Closed by Entry No." <> 0 then begin
                "Entry No." := CreateEmplLedgEntry."Closed by Entry No.";
                Mark(true);
            end;

            SetCurrentKey("Closed by Entry No.");
            SetRange("Closed by Entry No.", CreateEmplLedgEntry."Entry No.");
            if Find('-') then
                repeat
                    Mark(true);
                until Next = 0;

            SetCurrentKey("Entry No.");
            SetRange("Closed by Entry No.");
        end;

        MarkedOnly(true);
    end;

    var
        DocumentTxt: Label 'Document';
        CreateEmplLedgEntry: Record "Employee Ledger Entry";
        Navigate: Page Navigate;
        Heading: Text[50];
        AmountVisible: Boolean;
        DebitCreditVisible: Boolean;
        DimVisible1: Boolean;
        DimVisible2: Boolean;

    local procedure FindApplnEntriesDtldtLedgEntry()
    var
        DtldEmplLedgEntry1: Record "Detailed Employee Ledger Entry";
        DtldEmplLedgEntry2: Record "Detailed Employee Ledger Entry";
    begin
        DtldEmplLedgEntry1.SetCurrentKey("Employee Ledger Entry No.");
        DtldEmplLedgEntry1.SetRange("Employee Ledger Entry No.", CreateEmplLedgEntry."Entry No.");
        DtldEmplLedgEntry1.SetRange(Unapplied, false);
        if DtldEmplLedgEntry1.Find('-') then
            repeat
                if DtldEmplLedgEntry1."Employee Ledger Entry No." =
                   DtldEmplLedgEntry1."Applied Empl. Ledger Entry No."
                then begin
                    DtldEmplLedgEntry2.Init;
                    DtldEmplLedgEntry2.SetCurrentKey("Applied Empl. Ledger Entry No.", "Entry Type");
                    DtldEmplLedgEntry2.SetRange(
                      "Applied Empl. Ledger Entry No.", DtldEmplLedgEntry1."Applied Empl. Ledger Entry No.");
                    DtldEmplLedgEntry2.SetRange("Entry Type", DtldEmplLedgEntry2."Entry Type"::Application);
                    DtldEmplLedgEntry2.SetRange(Unapplied, false);
                    if DtldEmplLedgEntry2.Find('-') then
                        repeat
                            if DtldEmplLedgEntry2."Employee Ledger Entry No." <>
                               DtldEmplLedgEntry2."Applied Empl. Ledger Entry No."
                            then begin
                                SetCurrentKey("Entry No.");
                                SetRange("Entry No.", DtldEmplLedgEntry2."Employee Ledger Entry No.");
                                if Find('-') then
                                    Mark(true);
                            end;
                        until DtldEmplLedgEntry2.Next = 0;
                end else begin
                    SetCurrentKey("Entry No.");
                    SetRange("Entry No.", DtldEmplLedgEntry1."Applied Empl. Ledger Entry No.");
                    if Find('-') then
                        Mark(true);
                end;
            until DtldEmplLedgEntry1.Next = 0;
    end;

    local procedure SetControlVisibility()
    var
        GLSetup: Record "General Ledger Setup";
    begin
        GLSetup.Get;
        AmountVisible := not (GLSetup."Show Amounts" = GLSetup."Show Amounts"::"Debit/Credit Only");
        DebitCreditVisible := not (GLSetup."Show Amounts" = GLSetup."Show Amounts"::"Amount Only");
        DimVisible1 := GLSetup."Global Dimension 1 Code" <> '';
        DimVisible2 := GLSetup."Global Dimension 2 Code" <> '';
    end;
}

