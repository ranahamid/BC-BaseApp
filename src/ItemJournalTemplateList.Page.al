page 261 "Item Journal Template List"
{
    Caption = 'Item Journal Template List';
    Editable = false;
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = "Item Journal Template";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Name; Name)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the name of the item journal you are creating.';
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies a brief description of the item journal template you are creating.';
                }
                field(Recurring; Recurring)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies whether the item journal template will be a recurring journal.';
                    Visible = false;
                }
                field("Source Code"; "Source Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the source code that specifies where the entry was created.';
                    Visible = false;
                }
                field("Reason Code"; "Reason Code")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the reason code, a supplementary source code that enables you to trace the entry.';
                    Visible = false;
                }
                field("Page ID"; "Page ID")
                {
                    ApplicationArea = Basic, Suite;
                    LookupPageID = Objects;
                    ToolTip = 'Specifies the number of the page that is used to show the journal or worksheet that uses the template.';
                    Visible = false;
                }
                field("Page Caption"; "Page Caption")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = false;
                    ToolTip = 'Specifies the displayed name of the journal or worksheet that uses the template.';
                    Visible = false;
                }
                field("Test Report ID"; "Test Report ID")
                {
                    ApplicationArea = Basic, Suite;
                    LookupPageID = Objects;
                    ToolTip = 'Specifies the test report that is printed when you click Actions, point to Posting, and then click Test Report.';
                    Visible = false;
                }
                field("Test Report Caption"; "Test Report Caption")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = false;
                    ToolTip = 'Specifies the name of the test report that is printed when you print the item journal.';
                    Visible = false;
                }
                field("Posting Report ID"; "Posting Report ID")
                {
                    ApplicationArea = Basic, Suite;
                    LookupPageID = Objects;
                    ToolTip = 'Specifies the posting report that is printed when you click Post and Print.';
                    Visible = false;
                }
                field("Posting Report Caption"; "Posting Report Caption")
                {
                    ApplicationArea = Basic, Suite;
                    DrillDown = false;
                    ToolTip = 'Specifies the name of the report that is printed when you print the item journal.';
                    Visible = false;
                }
                field("Force Posting Report"; "Force Posting Report")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies whether a report is printed automatically when you post.';
                    Visible = false;
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
    }
}

