$(document).ready(function () {
    $.ajax({
        url: "/UserProject/GetUsers",
        type: "GET",
        dataType: "json",
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                $("#Users").append("<option id='" + data[i].UserId + "'>" + data[i].FirstName + " " + data[i].LastName + "</option>");
            }
        }
    });

    $("#Users").change(function () {
        $.ajax({
            url: "/UserProject/GetProjects",
            type: "GET",
            data: { UserId: $("#Users option:selected").attr('id') },
            dataType: "json",
            success: function (data) {
                console.log(data);
                $("#Projects").removeAttr("hidden");
                $("#Projects tbody").find("tr").remove();
                for (var i = 0; i < data.length; i++) {
                    var timeToStart = parseInt(data[i].TimeToStart);
                    if (timeToStart < 0) {
                        timeToStart = "Started";
                    }
                    var status = data[i].IsActive ? "Active" : "Inactive";
                    var row = "<tr><td>" + data[i].ProjectId + "</td><td>" + new Date(data[i].StartDate.match(/\d+/)[0] * 1) + "</td><td>"
                        + timeToStart + "</td><td>" + new Date(data[i].EndDate.match(/\d+/)[0] * 1) + "</td><td>" + data[i].Credits + "</td><td>"
                        + status + "</td></tr>";
                    $("#Projects").append(row);
                }
            }
        });
    });
});