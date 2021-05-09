function getAjax(url) {
    var da;
    $.ajax({
        url: url,
        type: "post",
        dataType: "json",
        async: false,
        contentType: 'application/json;charset=UTF-8',
        success: function (da1) {
            da = da1;
        }
    })
    return da;
}

function getAjax1(data, url) {
    var da;
    $.ajax({
        url: url,
        type: "post",
        dataType: "json",
        async: false,
        data: data,
        contentType: 'application/json;charset=UTF-8',
        success: function (da1) {
            da = da1;
        }
    })
    return da;
}

function getJSON(obj) {
    var d = {};
    var data = $(obj).serializeArray();
    $.each(data, function () {
        d[this.name] = this.value;
    })
    return d;
}
