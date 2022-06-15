pageextension 62000 "Esanpons Sales Order" extends "Sales Order"
{

    layout
    {
        addafter(General)
        {

            group(ControlAddins2)
            {
                Caption = 'Comments';
                usercontrol(SummernoteComments; "SummerNote")
                {
                    trigger ControlAddInReady()
                    begin
                        NewData := Rec.GetWorkDescription();
                        CurrPage.SummernoteComments.InitHtmlComments();
                        CurrPage.SummernoteComments.AddNewSummerNoteComments(NewData);
                        CurrPage.SummernoteComments.FinishHtmlComments();
                    end;

                    trigger OnChangeComments(Data: Text)
                    begin
                        Rec.SetWorkDescription(Data);
                    end;

                    trigger Mention(UserMention: JsonObject)
                    var
                        JToken: JsonToken;
                        JValue: JsonValue;
                    begin
                        UserMention.Get('code', JToken);
                        JValue := JToken.AsValue();
                        Message(JValue.AsText());
                    end;
                }
            }




            group(ControlAddins1)
            {
                Caption = 'Description';
                usercontrol(SummernoteDescription; "SummerNote")
                {

                    ApplicationArea = All;

                    trigger ControlAddInReady()
                    begin
                        NewData := Rec.GetWorkDescription();
                        CurrPage.SummernoteDescription.AddNewSummerNoteDescription(NewData, CreateJson());
                    end;

                    trigger OnChangeDescription(Data: Text)
                    begin
                        NewData := Data;
                        Rec.SetWorkDescription(NewData);
                    end;

                    trigger Mention(UserMention: JsonObject)
                    var
                        JToken: JsonToken;
                        JValue: JsonValue;
                    begin
                        UserMention.Get('code', JToken);
                        JValue := JToken.AsValue();
                        Message(JValue.AsText());
                    end;
                }
            }


        }
    }

    trigger OnAfterGetRecord()
    begin

        NewData := '';
        NewData := Rec.GetWorkDescription();
        CurrPage.SummernoteDescription.SetDataDescription(NewData);
        if CurrPage.Editable then
            CurrPage.SummernoteDescription.EnableDescription()
        else
            CurrPage.SummernoteDescription.DisableDescription();
    end;

    local procedure CreateJson() ReturnArrayJson: JsonArray
    var
        JObject: JsonObject;
    begin
        Clear(JObject);
        JObject.Add('name', 'Esteve Sanpons');
        JObject.Add('code', 'esanpons');

        ReturnArrayJson.Add(JObject);

        Clear(JObject);
        JObject.Add('name', 'Inda Mañas');
        JObject.Add('code', 'imanas');

        ReturnArrayJson.Add(JObject);
    end;



    var
        NewData: Text;
}
