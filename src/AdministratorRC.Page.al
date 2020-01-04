page 8900 "Administrator Main Role Center"
{
    Caption = 'Administrator Role Center';
    PageType = RoleCenter;
    actions
    {
        area(Sections)
        {
            group("Group")
            {
                Caption = 'General';
                group("Group1")
                {
                    Caption = 'System';
                    action("System Information")
                    {
                        ApplicationArea = All;
                        Caption = 'System Information';
                        RunObject = page "Latest Error";
                    }
                    action("Extension Management")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Extension Management';
                        RunObject = page "Extension Management";
                    }
                    action("Profiles")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Profiles';
                        RunObject = page "Profile List";
                    }
                    action("Devices")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Devices';
                        RunObject = page "Devices";
                    }
                    action("Control Add-ins")
                    {
                        ApplicationArea = All;
                        Caption = 'Control Add-ins';
                        RunObject = page "Control Add-ins";
                    }
                    action("Get the Mobile Device App (Tablet and Phone activatation code)")
                    {
                        ApplicationArea = All;
                        Caption = 'Mobile device activation and app';
                        RunObject = page "O365 Device Setup";
                    }
                }
                group("Group2")
                {
                    Caption = 'Application';
                    action("MapPoint Setup")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Online Map Setup';
                        RunObject = page "Online Map Setup";
                    }
                    action("Bank Export/Import Setup")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Bank Export/Import Setup';
                        RunObject = page "Bank Export/Import Setup";
                    }
                    action("Cue Setup")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Cue Setup';
                        RunObject = page "Cue Setup Administrator";
                    }
                    action("Document Sending Profiles")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Document Sending Profiles';
                        RunObject = page "Document Sending Profiles";
                    }
                    action("Printer Selections")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Printer Selections';
                        RunObject = page "Printer Selections";
                    }
                    action("Electronic Document Formats")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Electronic Document Formats';
                        RunObject = page "Electronic Document Format";
                    }
                    action("Assisted Setup")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Assisted Setup';
                        RunObject = page "Assisted Setup";
                    }
                    action("Application Area")
                    {
                        ApplicationArea = All;
                        Caption = 'Application Area';
                        RunObject = page "Application Area";
                    }
                    action("Set Up Customer/Vendor/Item Templates")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Customer/Vendor/Item Templates';
                        RunObject = page "Config Templates";
                    }
                    action("Transformation Rules")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Transformation Rules';
                        RunObject = page "Transformation Rules";
                    }
                    action("Business Setup")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Business Setup';
                        RunObject = page "Manual Setup";
                        AccessByPermission = tabledata 1875 = R;
                    }
                    action("Image Analysis Setup")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Image Analysis Setup';
                        RunObject = page "Image Analysis Setup";
                    }
                }
                group("Group3")
                {
                    Caption = 'Microsoft Outlook';
                    action("Outlook Synch. Entities")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Outlook Synch. Entities';
                        RunObject = page "Outlook Synch. Entity List";
                    }
                    action("Outlook Synch. User Setup")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Outlook Synch. User Setup';
                        RunObject = page "Outlook Synch. User Setup";
                    }
                }
                group("Group4")
                {
                    Caption = 'Job Queue';
                    action("Job Queue Entries")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Job Queue Entries';
                        RunObject = page "Job Queue Entries";
                    }
                    action("Job Queue Log Entries")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Job Queue Log Entries';
                        RunObject = page "Job Queue Log Entries";
                    }
                    action("Job Queue Category List")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Job Queue Category List';
                        RunObject = page "Job Queue Category List";
                    }
                }
                group("Group5")
                {
                    Caption = 'Change Log';
                    action("Change Log Setup")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Change Log Setup';
                        RunObject = page "Change Log Setup";
                    }
                    action("Change Log")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Change Log Entries';
                        RunObject = page "Change Log Entries";
                    }
                }
                group("Group6")
                {
                    Caption = 'Reporting';
                    action("Report Layouts")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Report Layout Selection';
                        RunObject = page "Report Layout Selection";
                    }
                    action("Report Configuration")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Report Settings';
                        RunObject = page "Report Settings";
                        AccessByPermission = tabledata 2000000196 = IMD;
                    }
                    action("Report Inbox")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Report Inbox';
                        RunObject = page "Report Inbox";
                    }
                    action("Custom Report Layouts")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Custom Report Layouts';
                        RunObject = page "Custom Report Layouts";
                    }
                    action("Report Selection Purchase")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Report Selections Purchase';
                        RunObject = page "Report Selection - Purchase";
                    }
                    action("Report Selection Reminder and")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Report Selections Reminder/Fin. Charge';
                        RunObject = page "Report Selection - Reminder";
                    }
                    action("Report Selection Service")
                    {
                        ApplicationArea = Service;
                        Caption = 'Report Selections Service';
                        RunObject = page "Report Selection - Service";
                    }
                    action("Report Selection Sales")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Report Selections Sales';
                        RunObject = page "Report Selection - Sales";
                    }
                    action("Report Selection - Bank Acc.")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Report Selections Bank Account';
                        RunObject = page "Report Selection - Bank Acc.";
                    }
                    action("Report Selections Inventory")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Report Selections Inventory';
                        RunObject = page "Report Selection - Inventory";
                    }
                    action("Report Selections Prod. Order")
                    {
                        ApplicationArea = Manufacturing;
                        Caption = 'Report Selections Prod. Order';
                        RunObject = page "Report Selection - Prod. Order";
                    }
                }
                group("Group7")
                {
                    Caption = 'Developer';
                    action("Sandbox Environment")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Sandbox Environment';
                        RunObject = page "Sandbox Environment";
                    }
                    action("Sandbox Environment1")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Container Sandbox Environment';
                        RunObject = page "Container Sandbox Environment";
                    }
                    action("Test Tool")
                    {
                        ApplicationArea = All;
                        Caption = 'Test Tool';
                        RunObject = page "CAL Test Tool";
                    }
                    action("Code Coverage")
                    {
                        ApplicationArea = All;
                        Caption = 'Code Coverage';
                        RunObject = page "Code Coverage";
                    }
                    // action("Sessions")
                    // {
                    //	 ApplicationArea = All;
                    //	 Caption = 'Sessions';
                    //	 RunObject = codeunit 9500;
                    // }
                }
            }
            group("Group8")
            {
                Caption = 'Data';
                group("Group9")
                {
                    Caption = 'Reference Data';
                    action("Company Information")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Company Information';
                        RunObject = page "Company Information";
                    }
                    action("Companies")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Companies';
                        RunObject = page "Companies";
                    }
                    action("No. Series")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'No. Series';
                        RunObject = page "No. Series";
                    }
                    action("Post Codes")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Post Codes';
                        RunObject = page "Post Codes";
                    }
                    action("Territories")
                    {
                        ApplicationArea = RelationshipMgmt;
                        Caption = 'Territories';
                        RunObject = page "Territories";
                    }
                    action("Languages")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Languages';
                        RunObject = page "Languages";
                    }
                    action("Countries/Regions")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Countries/Regions';
                        RunObject = page "Countries/Regions";
                    }
                    action("Base Calendar Entries Subform")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Base Calendar';
                        RunObject = page "Base Calendar List";
                    }
                    action("Responsibility Centers")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Responsibility Centers';
                        RunObject = page "Responsibility Center List";
                    }
                }
                group("Group10")
                {
                    Caption = 'Data Management';
                    action("Field Encryption Setup")
                    {
                        ApplicationArea = All;
                        Caption = 'Data Encryption Management';
                        RunObject = page "Data Encryption Management";
                        // AccessByPermission = System 5420 = X;
                    }
                    action("Data Classification Worksheet")
                    {
                        ApplicationArea = All;
                        Caption = 'Data Classification Worksheet';
                        RunObject = page "Data Classification Worksheet";
                        AccessByPermission = tabledata 2000000159 = R;
                    }
                    action("XML Schemas")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'XML Schemas';
                        RunObject = page "XML Schemas";
                    }
                    action("SEPA Schema Viewer")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'SEPA Schema Viewer';
                        RunObject = page "XML Schema Viewer";
                    }
                }
                group("Group11")
                {
                    Caption = 'Data Migration';
                    action("Data Migration Overview")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Data Migration Overview';
                        RunObject = page "Data Migration Overview";
                    }
                    action("Data Migration")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Data Migration';
                        RunObject = page "Data Migration Wizard";
                    }
                    action("Data Migration Settings")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Data Migration Settings';
                        RunObject = page "Data Migration Settings";
                        AccessByPermission = tabledata 1806 = R;
                    }
                }
                group("Group12")
                {
                    Caption = 'Data Exchange';
                    action("Import from a Data File")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Import from a Data File';
                        RunObject = page "Import Data";
                    }
                    action("Export to a Data File")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Export to a Data File';
                        RunObject = page "Export Data";
                    }
                    action("Data Exchange Types")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Data Exchange Types';
                        RunObject = page "Data Exchange Types";
                    }
                    action("Data Exchange Definition")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Data Exchange Definitions';
                        RunObject = page "Data Exch Def List";
                    }
                }
                group("Group13")
                {
                    Caption = 'Data Creation';
                    group("Group14")
                    {
                        Caption = 'Contact Creation';
                        action("Create Contacts from Customers")
                        {
                            ApplicationArea = RelationshipMgmt;
                            Caption = 'Create Contacts from Customers...';
                            RunObject = report "Create Conts. from Customers";
                        }
                        action("Create Contacts from Vendors")
                        {
                            ApplicationArea = RelationshipMgmt;
                            Caption = 'Create Contacts from Vendors...';
                            RunObject = report "Create Conts. from Vendors";
                        }
                        action("Create Contacts from Bank Acco")
                        {
                            ApplicationArea = RelationshipMgmt;
                            Caption = 'Create Contacts from Bank Accounts...';
                            RunObject = report "Create Conts. from Bank Accs.";
                        }
                    }
                }
                group("Group15")
                {
                    Caption = 'Data Deletion';
                    group("Group16")
                    {
                        Caption = 'Date Compression';
                        action("Registers")
                        {
                            ApplicationArea = Suite;
                            Caption = 'Date Compr. Registers';
                            RunObject = page "Date Compr. Registers";
                        }
                    }
                    group("Group17")
                    {
                        Caption = 'Record Links';
                        action("Delete Orphaned Record Links")
                        {
                            ApplicationArea = All;
                            Caption = 'Delete Orphaned Record Links';
                            RunObject = codeunit "Remove Orphaned Record Links";
                        }
                    }
                    group("Group18")
                    {
                        Caption = 'Customizations and Personalization';
                        action("Profile Customizations")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'Profile Customizations';
                            RunObject = page "Profile Customization List";
                        }
                        action("User Page Personalizations")
                        {
                            ApplicationArea = Basic, Suite;
                            Caption = 'User Page Personalizations';
                            RunObject = page "User Page Personalization List";
                        }
                    }
                }
            }
            group("Group19")
            {
                Caption = 'Users';
                action("Users")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Users';
                    RunObject = page "Users";
                }
                action("User Groups")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'User Groups';
                    RunObject = page "User Groups";
                }
                action("User Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'User Setup';
                    RunObject = page "User Setup";
                }
                action("Permission Sets")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Permission Sets';
                    RunObject = page "Permission Sets";
                }
                // action("Change Password")
                // {
                //     ApplicationArea = Basic, Suite;
                //     Caption = 'Change Password';
                //     RunObject = page 9809;
                // }
                action("User Security Status")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'User Security Status';
                    RunObject = page "User Security Status List";
                    AccessByPermission = tabledata 2000000120 = R;
                }
                action("User Tasks")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'User Tasks';
                    RunObject = page "User Task List";
                }
                action("User Personalization")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'User Personalization';
                    RunObject = page "User Personalization List";
                }
                action("User Time Registers")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Time Registers';
                    RunObject = page "User Time Registers";
                }
            }
            group("Group20")
            {
                Caption = 'Workflow';
                action("Workflows")
                {
                    ApplicationArea = Suite;
                    Caption = 'Workflows';
                    RunObject = page "Workflows";
                }
                action("Workflow User Group")
                {
                    ApplicationArea = Suite;
                    Caption = 'Workflow User Groups';
                    RunObject = page "Workflow User Groups";
                }
                action("Approval User Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approval User Setup';
                    RunObject = page "Approval User Setup";
                }
                action("Incoming Documents Setup")
                {
                    ApplicationArea = Suite;
                    Caption = 'Incoming Documents Setup';
                    RunObject = page "Incoming Documents Setup";
                }
                action("Send Overdue Appr. Notif.")
                {
                    ApplicationArea = Suite;
                    Caption = 'Send Overdue Approval Notifications';
                    RunObject = report "Send Overdue Appr. Notif.";
                }
                group("Group21")
                {
                    Caption = 'Templates';
                    action("Workflow Templates")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Workflow Templates';
                        RunObject = page "Workflow Templates";
                    }
                    action("Workflow Categories")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Workflow Categories';
                        RunObject = page "Workflow Categories";
                    }
                }
                group("Group22")
                {
                    Caption = 'Workflow Events';
                    action("WF Event/Event Combinations")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Workflow Event Hierarchies';
                        RunObject = page "Workflow Event Hierarchies";
                    }
                    action("WF Event/Response Combinations")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Workflow Event/Response Combinations';
                        RunObject = page "WF Event/Response Combinations";
                    }
                    action("Workflow - Table Relations")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Workflow - Table Relations';
                        RunObject = page "Workflow - Table Relations";
                    }
                }
                group("Group23")
                {
                    Caption = 'Notifications';
                    action("Notification Setup")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Notification Setup';
                        RunObject = page "Notification Setup";
                    }
                    action("Notification Entries")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Notification Entries';
                        RunObject = page "Notification Entries";
                    }
                    action("Sent Notification Entries")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Sent Notification Entries';
                        RunObject = page "Sent Notification Entries";
                    }
                }
                group("Group24")
                {
                    Caption = 'Entries/Archived';
                    action("Approval Entries")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Approval Entries';
                        RunObject = page "Approval Entries";
                    }
                    action("Posted Approval Entries")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Posted Approval Entries';
                        RunObject = page "Posted Approval Entries";
                    }
                    action("Overdue Approval Entries")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Overdue Approval Entries';
                        RunObject = page "Overdue Approval Entries";
                    }
                    action("Restricted Records")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Restricted Records';
                        RunObject = page "Restricted Records";
                    }
                    action("Workflow Step Instances")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Workflow Step Instances';
                        RunObject = page "Workflow Step Instances";
                    }
                    action("Archived Workflow Step Instances")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Archived Workflow Step Instances';
                        RunObject = page "Archived WF Step Instances";
                    }
                }
                group("Group25")
                {
                    Caption = 'Microsoft Flow';
                    action("Workflows1")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Manage Flows';
                        RunObject = page "Flow Selector";
                    }
                    action("Workflows2")
                    {
                        ApplicationArea = Suite;
                        Caption = 'Flow Entries';
                        RunObject = page "Workflow Webhook Entries";
                    }
                }
                group("Group26")
                {
                    Caption = 'Dynamic Request Pages';
                    action("Dynamic Request page Entities")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Dynamic Request page Entities';
                        RunObject = page "Dynamic Request page Entities";
                    }
                    action("Dynamic Request page Fields")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Dynamic Request page Fields';
                        RunObject = page "Dynamic Request page Fields";
                    }
                }
            }
            group("Group27")
            {
                Caption = 'Services';
                action("Web Services")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Web Services';
                    RunObject = page "Web Services";
                }
                action("Microsoft Dynamics 365 Connection Setup")
                {
                    ApplicationArea = Suite;
                    Caption = 'Microsoft Dynamics 365 Connection Setup';
                    RunObject = page "CRM Connection Setup";
                    AccessByPermission = tabledata 5330 = IM;
                }
                action("Social Listening Setup")
                {
                    ApplicationArea = All;
                    Caption = 'Social Engagement Setup';
                    RunObject = page "Social Listening Setup";
                }
                action("SMTP Mail Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'SMTP Mail Setup';
                    RunObject = page "SMTP Mail Setup";
                }
                action("SharePoint Connection Setup")
                {
                    ApplicationArea = All;
                    Caption = 'SharePoint Connection Setup';
                    RunObject = page "Document Service Config";
                }
                action("OCR Service Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'OCR Service Setup';
                    RunObject = page "OCR Service Setup";
                }
                action("Currency Exchange Rate Services")
                {
                    ApplicationArea = Suite;
                    Caption = 'Currency Exchange Rate Services';
                    RunObject = page "Curr. Exch. Rate Service List";
                }
                action("Service Connections Overview")
                {
                    Caption = 'Service Connections';
                    RunObject = page "Service Connections";
                }
                action("Doc. Exch. Service Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Document Exchange Service Setup';
                    RunObject = page "Doc. Exch. Service Setup";
                }
                action("Integration Table Mappings")
                {
                    Caption = 'Integration Table Mappings';
                    RunObject = page "Integration Table Mapping List";
                }
                action("Integration Synchronization Jobs")
                {
                    Caption = 'Integration Synchronization Jobs';
                    RunObject = page "Integration Synch. Job List";
                }
                action("Integration Synchronization Errors")
                {
                    Caption = 'Integration Synchronization Errors';
                    RunObject = page "Integration Synch. Error List";
                }
                action("Online Payments")
                {
                    Caption = 'Payment Services';
                    RunObject = page "Payment Services";
                }
                action("Office Add-In Management")
                {
                    Caption = 'Office Add-in Management';
                    RunObject = page "Office Add-in Management";
                }
                action("Exchange Sync. Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Exchange Sync. Setup';
                    RunObject = page "Exchange Sync. Setup";
                }
                action("API Setup")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'API Setup';
                    RunObject = page "API Setup";
                }
                action("Account Schedule KPI Web Servi")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Account Schedule KPI Web Service Setup';
                    RunObject = page "Acc. Sched. KPI Web Srv. Setup";
                }
                action("Acc. Sched. KPI Web Service")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Account Schedule KPI Web Service';
                    RunObject = page "Acc. Sched. KPI Web Service";
                }
                action("PAC Web Services")
                {
                    ApplicationArea = BasicMX;
                    Caption = 'PAC Web Services';
                    RunObject = page "PAC Web Services";
                }
            }
            group("Group28")
            {
                Caption = 'RapidStart';
                action("Config. Questionnaire")
                {
                    ApplicationArea = Suite;
                    Caption = 'Configuration Questionnaire';
                    RunObject = page "Config. Questionnaire";
                }
                action("Data Migration1")
                {
                    ApplicationArea = Suite;
                    Caption = 'Configuration Packages';
                    RunObject = page "Config. Packages";
                }
                action("Setup Master Templates")
                {
                    ApplicationArea = Suite, Basic;
                    Caption = 'Configuration Templates';
                    RunObject = page "Config. Template List";
                }
                action("Create G/L acc. Journal Lines")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Create G/L Acc. Journal Lines';
                    RunObject = report "Create G/L Acc. Journal Lines";
                }
                action("Create Customer Journal Lines")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Create Customer Journal Lines';
                    RunObject = report "Create Customer Journal Lines";
                }
                action("Create Vendor Journal Lines")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Create Vendor Journal Lines';
                    RunObject = report "Create Vendor Journal Lines";
                }
                action("Create Item Journal Lines")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Create Item Journal Lines';
                    RunObject = report "Create Item Journal Lines";
                }
                action("Configuration Worksheet")
                {
                    ApplicationArea = Suite;
                    Caption = 'Configuration Worksheet';
                    RunObject = page "Config. Worksheet";
                }
            }
        }
    }
}