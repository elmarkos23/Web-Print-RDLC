<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web_Print_RDLC._Default" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <rsweb:ReportViewer ID="ReportViewer1" runat="server"></rsweb:ReportViewer>
        <br />
    <input type="button" id="btnPrint" value="Print" onclick="Print()" />
    <script type="text/javascript">
        function Print() {
            var report = document.getElementById("<%=ReportViewer1.ClientID %>");
            var div = report.getElementsByTagName("DIV");
            var reportContents;
            for (var i = 0; i < div.length; i++) {
                if (div[i].id.indexOf("VisibleReportContent") != -1) {
                    reportContents = div[i].innerHTML;
                    break;
                }
            }
            var frame1 = document.createElement('iframe');
            frame1.name = "frame1";
            frame1.style.position = "absolute";
            frame1.style.top = "-1000000px";
            document.body.appendChild(frame1);
            var frameDoc = frame1.contentWindow ? frame1.contentWindow : frame1.contentDocument.document ? frame1.contentDocument.document : frame1.contentDocument;
            frameDoc.document.open();
            frameDoc.document.write('<html><head><title>RDLC Report</title>');
            frameDoc.document.write('</head><body style = "font-family:arial;font-size:10pt;">');
            frameDoc.document.write(reportContents);
            frameDoc.document.write('</body></html>');
            frameDoc.document.close();
            setTimeout(function () {
                window.frames["frame1"].focus();
                window.frames["frame1"].print();
                document.body.removeChild(frame1);
            }, 500);
        }
    </script>
</asp:Content>
