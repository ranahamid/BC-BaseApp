page 1029 "Job Invoices"
{
    Caption = 'Job Invoices';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = "Job Planning Line Invoice";
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the information about the type of document. There are four options:';
                }
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number associated with the document. For example, if you have created an invoice, the field Specifies the invoice number.';
                }
                field("Line No."; "Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the line number that is linked to the document. Numbers are created sequentially.';
                    Visible = ShowDetails;
                }
                field("Quantity Transferred"; "Quantity Transferred")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the quantity transferred from the job planning line to the invoice or credit memo.';
                }
                field("Transferred Date"; "Transferred Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date on which the invoice or credit document was created. The date is set to the posting date you specified when you created the invoice or credit memo.';
                    Visible = ShowDetails;
                }
                field("Invoiced Date"; "Invoiced Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date on which the invoice or credit memo was posted.';
                    Visible = ShowDetails;
                }
                field("Invoiced Amount (LCY)"; "Invoiced Amount (LCY)")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the amount (LCY) that was posted from the invoice or credit memo. The amount is calculated based on Quantity, Line Discount %, and Unit Price.';
                }
                field("Invoiced Cost Amount (LCY)"; "Invoiced Cost Amount (LCY)")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the amount of the unit costs that has been posted from the invoice or credit memo. The amount is calculated based on Quantity, Unit Cost, and Line Discount %.';
                }
                field("Job Ledger Entry No."; "Job Ledger Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a link to the job ledger entry that was created when the document was posted.';
                    Visible = ShowDetails;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(OpenSalesInvoiceCreditMemo)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Open Sales Invoice/Credit Memo';
                    Ellipsis = true;
                    Image = GetSourceDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Open the sales invoice or sales credit memo for the selected line.';

                    trigger OnAction()
                    var
                        JobCreateInvoice: Codeunit "Job Create-Invoice";
                    begin
                        JobCreateInvoice.OpenSalesInvoice(Rec);
                        JobCreateInvoice.FindInvoices(Rec, JobNo, JobTaskNo, JobPlanningLineNo, DetailLevel);
                        if Get("Job No.", "Job Task No.", "Job Planning Line No.", "Document Type", "Document No.", "Line No.") then;
                    end;
                }
            }
        }
    }

    trigger OnInit()
    begin
        ShowDetails := true;
    end;

    trigger OnOpenPage()
    var
        JobCreateInvoice: Codeunit "Job Create-Invoice";
    begin
        JobCreateInvoice.FindInvoices(Rec, JobNo, JobTaskNo, JobPlanningLineNo, DetailLevel);
    end;

    var
        JobNo: Code[20];
        JobTaskNo: Code[20];
        JobPlanningLineNo: Integer;
        DetailLevel: Option All,"Per Job","Per Job Task","Per Job Planning Line";
        ShowDetails: Boolean;

    procedure SetPrJob(Job: Record Job)
    begin
        DetailLevel := DetailLevel::"Per Job";
        JobNo := Job."No.";
    end;

    procedure SetPrJobTask(JobTask: Record "Job Task")
    begin
        DetailLevel := DetailLevel::"Per Job Task";
        JobNo := JobTask."Job No.";
        JobTaskNo := JobTask."Job Task No.";
    end;

    procedure SetPrJobPlanningLine(JobPlanningLine: Record "Job Planning Line")
    begin
        DetailLevel := DetailLevel::"Per Job Planning Line";
        JobNo := JobPlanningLine."Job No.";
        JobTaskNo := JobPlanningLine."Job Task No.";
        JobPlanningLineNo := JobPlanningLine."Line No.";
    end;

    procedure SetShowDetails(NewShowDetails: Boolean)
    begin
        ShowDetails := NewShowDetails;
    end;
}

