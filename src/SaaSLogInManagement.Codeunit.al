codeunit 50 "SaaS Log In Management"
{

    trigger OnRun()
    begin
    end;

    var
        NoPermissionToEnterTrialErr: Label 'In order to open %1, your company must start a trial. You must be an administrator to enter the trial period.', Comment = '%1 = Company Name';
        RequireUserApprovalForTrialErr: Label 'Preview versions are no longer available. To continue using %1, use a web client to open the company and accept the terms and conditions.', Comment = '%1 = Company Name';
        MissingEvaluationCompanyErr: Label 'You do not have an evaluation company. To continue with the trial version, you must accept the terms and conditions.';
        AbortTrialQst: Label 'Are you sure that you want to cancel?', Comment = 'Use same string as in page 9193 textconst AbortTrialQst';
        CanNotOpenCompanyFromDevicelMsg: Label 'Sorry, you can''t create a %1 from this device.', Comment = '%1 = Company Name';

    [Scope('OnPrem')]
    procedure ShouldShowTermsAndConditions(NewCompanyName: Text[30]): Boolean
    var
        Company: Record Company;
        TenantLicenseState: Codeunit "Tenant License State";
        EnvironmentInfo: Codeunit "Environment Information";
        EnvInfoProxy: Codeunit "Env. Info Proxy";
    begin
        if not Company.Get(NewCompanyName) then
            exit(false);

        if EnvInfoProxy.IsInvoicing then
            exit(false);

        if not EnvironmentInfo.IsSaaS then
            exit(false);

        if EnvironmentInfo.IsSandbox then
            exit(false);

        if Company."Evaluation Company" then
            exit(false);

        if not TenantLicenseState.IsEvaluationMode() then
            exit;

        exit(true);
    end;

    local procedure ChangeToEvaluationCompany()
    var
        SelectedCompany: Record Company;
        SessionSetting: SessionSettings;
    begin
        SessionSetting.Init;

        SelectedCompany.SetRange("Evaluation Company", true);
        if SelectedCompany.FindFirst then
            SessionSetting.Company(SelectedCompany.Name)
        else
            Error(MissingEvaluationCompanyErr);

        SessionSetting.RequestSessionUpdate(true);

        // Commit needed as SessionSetting is saving to the Personalization
        Commit;

        // Confirm needed to force the session update
        if Confirm(AbortTrialQst) then;
    end;

    local procedure ShowTermsAndConditionsOnOpenCompany()
    var
        Company: Record Company;
        ThirtyDayTrialDialog: Page "Thirty Day Trial Dialog";
        ClientTypeManagement: Codeunit "Client Type Management";
        RoleCenterNotificationMgt: Codeunit "Role Center Notification Mgt.";
        SuppressApprovalForTrial: Boolean;
    begin
        if not (Company.Get(CompanyName) and ShouldShowTermsAndConditions(CompanyName)) then
            exit;

        if not GuiAllowed then begin
            if ClientTypeManagement.GetCurrentClientType in [CLIENTTYPE::OData, CLIENTTYPE::ODataV4] then begin
                SuppressApprovalForTrial := false;
                OnSuppressApprovalForTrial(SuppressApprovalForTrial);
                if not SuppressApprovalForTrial then
                    Error(RequireUserApprovalForTrialErr, Company.Name);
            end;
            exit;
        end;

        if ClientTypeManagement.GetCurrentClientType in [CLIENTTYPE::Tablet, CLIENTTYPE::Phone] then begin
            Message(CanNotOpenCompanyFromDevicelMsg, Company.Name);
            ChangeToEvaluationCompany;
            // Just to be sure that we do not save the Trial License State on the server side
            Error('');
        end;

        if not Company.WritePermission then
            Error(NoPermissionToEnterTrialErr, Company.Name);

        Commit;

        ThirtyDayTrialDialog.RunModal;

        if not ThirtyDayTrialDialog.Confirmed then begin
            if RoleCenterNotificationMgt.IsEvaluationNotificationClicked then
                RoleCenterNotificationMgt.ShowEvaluationNotification;
            ChangeToEvaluationCompany;
            // Just to be sure that we do not save the Trial License State on the server side
            Error('');
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 2000000006, 'OpenContactMSSales', '', false, false)]
    local procedure OpenContactMSSales()
    begin
        Page.Run(Page::"Contact MS Sales")
    end;

    [IntegrationEvent(false, false)]
    [Scope('OnPrem')]
    procedure OnSuppressApprovalForTrial(var GetSuppressApprovalForTrial: Boolean)
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, 40, 'OnShowTermsAndConditions', '', false, false)]
    local procedure OnShowTermsAndConditionsSubscriber()
    begin
        ShowTermsAndConditionsOnOpenCompany;
    end;
}