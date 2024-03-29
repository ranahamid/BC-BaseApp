page 10457 "MX Electronic Invoice Setup"
{
    ApplicationArea = BasicMX;
    Caption = 'Electronic Invoicing Setup for Mexico';
    DeleteAllowed = false;
    InsertAllowed = false;
    SourceTable = "MX Electronic Invoicing Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            part(Control1310001; "MX Electroninc - CompanyInfo")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control1310002; "MX Electroninc - GLSetup")
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    var
        EInvoiceMgt: Codeunit "E-Invoice Mgt.";
        Notify: Notification;
    begin
        if not SMTPMail.IsEnabled then begin
            Notify.Message(SMTPMissingMsg);
            Notify.AddAction(SetupSMTPMsg, CODEUNIT::"E-Invoice Mgt.", 'OpenAssistedSetup');
            Notify.Send;
        end;
        EInvoiceMgt.SetupService;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        CompanyInformation: Record "Company Information";
        GeneralLedgerSetup: Record "General Ledger Setup";
        PACWebService: Record "PAC Web Service";
    begin
        if CompanyInformation.CheckIfMissingMXEInvRequiredFields and PACWebService.CheckIfMissingMXEInvRequiredFields and
           GeneralLedgerSetup.CheckIfMissingMXEInvRequiredFields
        then
            Enabled := false
        else
            Enabled := true;

        Modify;
    end;

    var
        SMTPMail: Codeunit "SMTP Mail";
        SMTPMissingMsg: Label 'You must set up email in Business Central before you can send electronic invoices.';
        SetupSMTPMsg: Label 'Go to Set Up Email.';
}

