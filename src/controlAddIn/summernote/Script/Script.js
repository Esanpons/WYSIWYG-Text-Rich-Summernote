var controlAddIn;
var GlobalNum;

function InitHtml() {
    controlAddIn = document.getElementById('controlAddIn');
    controlAddIn.innerHTML = '';
}

function AddNewSummerNote(Data, IsAirMode) {
    GlobalNum = 1;
    controlAddIn.innerHTML += '<textarea class="summernote" id="summernote' + GlobalNum + '"></textarea>';
    CreateSummerNote(Data, IsAirMode);
}


function CreateSummerNote(Data, IsAirMode) {
    //Initialize editor only once when DOM is loaded
    $(document).ready(function () {
        editor = $('#summernote' + GlobalNum);

        editor.summernote({
            height: ($(window).height() - 55),
            focus: true,
            lang: 'es-ES',
            airMode: IsAirMode,
            //Esto permitirá tabular a través de los campos en Formularios.
            tabDisable: true,
            callbacks: {
                //Bind onChange callback with our OnChange BC event
                onChange: function (contents, $editable) {
                    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("OnChange", [contents]);
                }
            },
            //esto es la configuracion de la barra cuando esta el air actvado

            popover: {
                air: [
                    ['style', ['style']],
                    ['font', ['bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear']],
                    ['fontname', ['fontname']],
                    ['fontsize', ['fontsize']],
                    ['color', ['color']],
                    ['Misc', ['undo', 'redo']],
                    ['para', ['ul', 'ol', 'paragraph', 'height']],
                    ['insert', ['picture', 'link', 'video', 'table', 'hr']],
                    ['view', ['codeview', 'help']]
                ]
            },

            //esto es la configuracion de la bara cuando no esta el air activado
            toolbar: [

                ['style', ['style']],
                ['font', ['bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear']],
                ['fontname', ['fontname']],
                ['fontsize', ['fontsize']],
                ['color', ['color']],
                ['Misc', ['undo', 'redo']],
                ['para', ['ul', 'ol', 'paragraph', 'height']],
                ['insert', ['picture', 'link', 'video', 'table', 'hr']],
                ['view', ['codeview', 'help']]

            ]
        });

        //Set init data
        $('.note-editable').html(Data);
    });
}

//recuperamos los datos
function GetData(Data) {
    Data = $('#summernote' + GlobalNum).summernote('code');
}

//añadimos nuevamente los datos insertados
function SetData(Data) {
    $('#summernote' + GlobalNum).summernote('code', Data);
}

//pone no editable el area
function Disable() {
    $('#summernote' + GlobalNum).summernote('disable');
}

//pone editable el area
function Enable() {
    $('#summernote' + GlobalNum).summernote('enable');
}

//funcion para añadir notas debajo del cuadrado de edicion
function Enable(Data) {
    $('.note-status-output').html(
        Data
    );
}
