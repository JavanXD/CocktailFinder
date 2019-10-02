url = "https://cocktailfinder.yaaw.de";
path = url + "/core/control/";

var elt = $('input.zutat');

function initTagsinput() {

    elt.tagsinput('destroy');

    $.getJSON(path + 'getZutatenTextJson.php', function (data) {

        var zutatenJson = new Bloodhound({
            local: data,
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            datumTokenizer: Bloodhound.tokenizers.whitespace
        });
        console.log(data);

        elt.tagsinput({
            tagClass: "label label-info",
            cancelConfirmKeysOnEmpty: true,
            trimValue: true,
            maxTags: 1,
            typeaheadjs: {
                source: zutatenJson.ttAdapter()
            },
            freeInput: true
        });
    });
}

function addCocktail(form, usedPassword) {

    var addCocktail = window.confirm("Cocktail speichern?");
    if (addCocktail) {
        var cocktail = {};
        cocktail["Name"] = $(form).find('input[name="Name"]').val();
        cocktail["Kommentar"] = $(form).find('textarea[name="Kommentar"]').val();
        var zutatenElemente = $(form).find('.zutat');
        var mengeElemente = $(form).find('input[name="Menge"]');

        var zutaten = {};
        zutaten["Titel"] = new Array();
        zutaten["Menge"] = new Array();
        $.each(zutatenElemente, function (key, val) {
            zutaten["Titel"].push($(val).val());
        });
        $.each(mengeElemente, function (key, val) {
            zutaten["Menge"].push($(val).val());
        });
        cocktail["Zutaten"] = zutaten;
        console.log(cocktail);

        $.ajax
        ({
            type: "POST",
            url: path + 'saveCocktail.php',
            dataType: 'json',
            async: false,
            data: {
                cocktail: JSON.stringify(cocktail),
                password: usedPassword
            },
            success: function (response) {

                if (typeof response["error"] != "undefined") {
                    alert(response["error"]);

                } else {
                    alert("Gespeichert!");
                    // maybe new tags added
                    initTagsinput();
                }
                return false;
            }
        });
    }
    return false;
}

$(function() {
    initTagsinput();
    initTagsinput();
});