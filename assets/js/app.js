url = "https://cocktailfinder.yaaw.de";
path = url + "/core/control/";

var zutaten = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('text'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    prefetch: path + 'getZutatenJson.php'
});
zutaten.initialize();

var elt = $('input#filter');
elt.tagsinput({
    tagClass: function(item) {
        switch (item.kategorie) {
            case '1'    : return 'label label-primary';
            case '2'    : return 'label label-danger label-important';
            case '3'    : return 'label label-success';
            case '4'    : return 'label label-default';
            case '5'    : return 'label label-warning';
            default     : return 'label label-primary label-selectbar';
        }
    },
    trimValue: true,
    itemValue: 'value',
    itemText: 'text',
    typeaheadjs: {
        name: 'zutaten',
        displayKey: 'text',
        source: zutaten.ttAdapter()
    },
    freeInput: false,
    onTagExists: function(item, $tag) {
        $tag.hide().fadeIn();
    }
});

elt.tagsinput('add', { "value": 6 , "text": "Limette"   , "kategorie": ""    });

/* onload */
loadCocktails(elt.val());

elt.on('itemRemoved', function(event) {
    // event.item: contains the item
    loadCocktails(event.target.value);
});

elt.on('itemAdded', function(event) {
    // event.item: contains the item
    loadCocktails(event.target.value);
});

function loadCocktails(zutaten){
    console.log(zutaten);
    $.getJSON( path + 'getCocktailsJson.php', { zutaten: zutaten }, function( response ) {
        if(typeof response["error"] != "undefined"){
            console.log(response["error"]);

            if(response["error"] == "Empty.")
            {
                $('.list-zutaten').show();
                $('.list-empty').hide();
                $(".card").remove();
            }
        }else {
            $('.list-zutaten').hide();
            $('.list-empty').hide();
            var objs = response;
            function compare(a,b) {
                if (a["Ranking"] > b["Ranking"])
                    return -1;
                if (a["Ranking"] < b["Ranking"])
                    return 1;
                return 0;
            }
            objs.sort(compare);
            showCocktailsOnLayout(zutaten, objs);
        }

    })
        .done(function() {
        })
        .fail(function() {
            alert( "error" );
        });
}

function showList(id) {
    switch(id) {
        case 1 :
            $('.bootstrap-tagsinput').hide();
            loadCocktailsByID(localStorage.getItem('hiddens'));
        break;
        case 2 :
            $('.bootstrap-tagsinput').hide();
            loadCocktailsByID(localStorage.getItem('favorits'));
        break;
        default :
            $('.bootstrap-tagsinput').show();
            loadCocktails(elt.val());
    }
}

function loadCocktailsByID(cocktails){
    if (cocktails == null) {
        alert('Keine Cocktails in der Liste.');
        return;
    }
    console.log(cocktails);
    $.getJSON( path + 'getCocktailsByIDJson.php', { cocktails: cocktails }, function( response ) {
        if(typeof response["error"] != "undefined"){
            console.log(response["error"]);

            if(response["error"] == "Empty.")
            {
                $('.list-zutaten').hide();
                $('.list-empty').show();
                $(".card").remove();
            }
        }else {
            $('.list-zutaten').hide();
            $('.list-empty').hide();
            var objs = response;
            showCocktailsOnLayout("", objs);
        }

    })
        .done(function() {
        })
        .fail(function() {
            alert( "error" );
        });
}

function showCocktailsOnLayout(zutatenValue, data) {
    var items = [];
    $.each( data, function( key, val ) {
        var zutaten = '';
        $.each(val['zutaten'] , function (index) {

            var zutatColor = "label-warning";
            if ( $.inArray(this["ZutatID"], zutatenValue.split(",")) != -1) {
                zutatColor = "label-primary";
            }
            zutaten += '<span class="label '+zutatColor+'"><strong>' + this["Menge"] + '</strong> ' + this["Titel"] + '</span> ';
        });


        var cocktail = ''
            +'<div class="card" id="card_' + key + '">'
            +'<h4 class="card-header" style="margin-top:0;">'
            +'<a href="javascript:void(0);" onclick="$(\'#toggle_\' + ' + key + ').toggle();">'
            + val["Name"]
            +'</a>'
            +'<button role="button" title="Favorit markieren" class="pull-right btn btn-outline-secondary fa fa-heart ' + (isFavorit(val['CocktailID']) ? "text-danger" : "") + '" onclick="favoriteCocktail(this, ' + val['CocktailID'] + ')"></button>'
            +'<button role="button" title="Verstecken/Ausblenden" class="pull-right btn btn-outline-secondary fa fa-ban" onclick="hideCocktail(this, ' + val['CocktailID'] + ')"></button>'
            +'</h4>'
            +'<div class="card-block" style="' + (isHidden(val['CocktailID']) ? "display: none" : "") + '">'
            +'<span class="card-text">'
            //+ JSON.stringify(val) + ''
            +'<b>' + ((val["Zutaten"] !== undefined) ? val["Zutaten"] + '/' : "") + val["AnzahlZutaten"] + ' Zutaten</b> '
            + zutaten
            +'</span>'
            +'<div id="toggle_' + key + '" style="display:none">'
            +'<br><a href="https://www.google.de/search?q=' + encodeURIComponent(val["Name"] + ' Cocktail') + '&tbm=isch" title="Bild öffnen" class="pull-right btn btn-success" onclick="javascript:window.open(this.href,\'\', \'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600\');return false;">'
            +'<i class="fa fa-image text-white" aria-hidden="true"></i> Google Bilder anzeigen'
            +'</a>'
            +'<span class="card-text">' + val["Kommentar"] + '</span>'
            +'</div>'
            +'</div>'
            +'</div>';

        items.push( cocktail );
    });

    $('#cocktails').html(

        $( "<div/>", {
            "class": "my-new-list",
            html: items.join( "<br>" )
        })
    );
}

function isHidden(CocktailID) {
    var hiddens = localStorage.getItem('hiddens');
    if (hiddens == null) {
        return false;
    }
    var hideArray = hiddens.split(",").map(parseFloat);
    var index = hideArray.indexOf(parseFloat(CocktailID));
    //console.log(hideArray + " isHidden " + CocktailID + " " + index);
    if (index > -1) {
        return true;
    }
    return false;
}

function isFavorit(CocktailID) {
    var favorits = localStorage.getItem('favorits');
    if (favorits == null) {
        return false;
    }
    var favArray = favorits.split(",").map(parseFloat);
    var index = favArray.indexOf(parseFloat(CocktailID));
    //console.log(favArray + " isFavorit " + CocktailID + " " + index);
    if (index > -1) {
        return true;
    }
    return false;
}

/* store favorite Cocktails to local storage */
function favoriteCocktail(element, CocktailID) {
    var favorits = localStorage.getItem('favorits');
    if (favorits == null) {
        var favArray = new Array();
    } else {
        var favArray = favorits.split(",").map(parseFloat);

        if (isNaN(favArray[0])){
            favArray.splice(0, 1);
        }
    }

    var index = favArray.indexOf(parseFloat(CocktailID));
    if (index > -1) {
        favArray.splice(index, 1);
        $(element).removeClass("text-danger");
    } else {
        favArray.push(CocktailID);
        $(element).addClass("text-danger");
    }
    console.log("favArray:" + favArray);

    favorits = favArray.join();
    localStorage.setItem('favorits', favorits);
}

function hideCocktail(element, CocktailID) {
    var hiddens = localStorage.getItem('hiddens');
    if (hiddens == null) {
        var hideArray = new Array();
    } else {
        var hideArray = hiddens.split(",").map(parseFloat);

        if (isNaN(hideArray[0])){
            hideArray.splice(0, 1);
        }
    }

    var index = hideArray.indexOf(parseFloat(CocktailID));
    if (index > -1) {
        hideArray.splice(index, 1);
        $(element).parent().parent().find('.card-block').show();
    } else {
        hideArray.push(CocktailID);
        $(element).parent().parent().find('.card-block').hide();
    }
    console.log("hideArray:" + hideArray);

    hiddens = hideArray.join();
    localStorage.setItem('hiddens', hiddens);
}

/* Loading image während eines AJAX Aufruf der zB. etwas länger brauch */
$(document).on({
    ajaxStart: function () {
        $(".loader").show();
    },
    ajaxStop: function () {
        $(".loader").hide('slow');
    }
});