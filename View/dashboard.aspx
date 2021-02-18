<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="ionpolis.View.dashboard" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge;IE=10;IE=9;IE=8;IE=7;" />
    <link rel="SHORTCUT ICON" href="../images/logoicon.ico" type="image/x-icon" />
    <title>KPC 자격 TF</title>
    <script src="../js/jquery-1.4.2.js" type="text/javascript"></script>
    <link href="../Scripts/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <link href="../Scripts/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet" />
    <link href="../Scripts/css/sb-admin.css" rel="stylesheet" />
    <script src="../Scripts/vendor/jquery/jquery.min.js"></script>
    <link href="../Scripts/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/js/jquery-1.12.4.js"></script>
    <script src="../Scripts/js/jquery-ui.js"></script>
    <link href="../Scripts/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="../Scripts/css/all.min.css" rel="stylesheet" type="text/css" />
    <link href="../Scripts/css/googlefonts.css" rel="stylesheet" />
    <link href="../Scripts/css/sb-admin-2.min.css" rel="stylesheet" />
    <script src="../Scripts/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../Scripts/vendor/chart.js/Chart.min.js"></script>
    <script src="../js/core.js"></script>
    <script src="../js/charts.js"></script>
    <script src="../js/wordCloud.js"></script>
    <script src="../js/animated.js"></script>

    <style>
        #chartdiv {
            width: 100%;
            height: 100%;
        }

        .area {
            position: absolute;
            background: #fff;
            border: 1px solid #888;
            border-radius: 3px;
            font-size: 12px;
            top: -5px;
            left: 15px;
            padding: 2px;
        }

        .info {
            font-size: 12px;
            padding: 5px;
        }

            .info .title {
                font-weight: bold;
            }

        .map_wrap {
            position: relative;
            overflow: hidden;
            width: 100%;
            height: 100%;
        }

        .radius_border {
            border: 1px solid #919191;
            border-radius: 5px;
        }

        .custom_typecontrol {
            position: absolute;
            top: 10px;
            right: 10px;
            overflow: hidden;
            width: 65px;
            height: 30px;
            margin: 0;
            padding: 0;
            z-index: 1;
            font-size: 12px;
            font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
        }

            .custom_typecontrol span {
                display: block;
                width: 65px;
                height: 30px;
                float: left;
                text-align: center;
                line-height: 30px;
                cursor: pointer;
            }

            .custom_typecontrol .btn {
                background: #fff;
                background: linear-gradient(#fff, #e6e6e6);
            }

                .custom_typecontrol .btn:hover {
                    background: #f5f5f5;
                    background: linear-gradient(#f5f5f5,#e3e3e3);
                }

                .custom_typecontrol .btn:active {
                    background: #e6e6e6;
                    background: linear-gradient(#e6e6e6, #fff);
                }

            .custom_typecontrol .selected_btn {
                color: #fff;
                background: #425470;
                background: linear-gradient(#425470, #5b6d8a);
            }

                .custom_typecontrol .selected_btn:hover {
                    color: #fff;
                }

        .circleDetail {
            background-color: white;
            width: 10px;
            height: 10px;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            margin-left: 8px;
        }
    </style>
    		<style type="text/css">
.highcharts-figure, .highcharts-data-table table {
    min-width: 320px; 
    max-width: 800px;
    margin: 1em auto;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}
.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}
.highcharts-data-table th {
	font-weight: 600;
    padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
    padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}
.highcharts-data-table tr:hover {
    background: #f1f7ff;
}

		</style>
    <script src="../code/highcharts.js"></script>
    <script src="../code/modules/networkgraph.js"></script>
    <script src="../code/modules/exporting.js"></script>
    <script>
        am4core.ready(function () {

            // Themes begin
            am4core.useTheme(am4themes_animated);
            // Themes end

            var chart = am4core.create("chartdiv", am4plugins_wordCloud.WordCloud);
            chart.fontFamily = "Courier New";
            var series = chart.series.push(new am4plugins_wordCloud.WordCloudSeries());
            series.randomness = 0.1;
            series.rotationThreshold = 0.5;

            series.data = [{
                "tag": "GTQ",
                "count": "100"
            }, {
                "tag": "그래픽디자인",
                "count": "99"
            }, {
                "tag": "인쇄",
                "count": "99"
            }, {
                "tag": "그래픽",
                "count": "99"
            }, {
                "tag": "컴퓨터그래픽",
                "count": "99"
            }, {
                "tag": "디자인",
                "count": "99"
            }, {
                "tag": "만화·애니메이션",
                "count": "99"
            }, {
                "tag": "만화·애니메이션",
                "count": "99"
            }, {
                "tag": "예체능",
                "count": "99"
            }, {
                "tag": "공학",
                "count": "99"
            }, { "tag": "가천대학교", "count": "98" },
            { "tag": "가톨릭관동대학교", "count": "98" },
            { "tag": "가톨릭대학교", "count": "98" },
            { "tag": "강남대학교", "count": "98" },
            { "tag": "강릉원주대학교", "count": "98" },
            { "tag": "강원대학교", "count": "98" },
            { "tag": "건국대학교", "count": "98" },
            { "tag": "건양대학교", "count": "98" },
            { "tag": "경기대학교", "count": "98" },
            { "tag": "경성대학교", "count": "98" },
            { "tag": "경운대학교", "count": "98" },
            { "tag": "경일대학교", "count": "98" },
            { "tag": "경주대학교", "count": "98" },
            { "tag": "경희대학교", "count": "98" },
            { "tag": "경희사이버대학교", "count": "98" },
            { "tag": "계명대학교", "count": "98" },
            { "tag": "고려대학교", "count": "98" },
            { "tag": "고려대학교 세종캠퍼스", "count": "98" },
            { "tag": "단국대학교", "count": "98" },
            { "tag": "대구가톨릭대학교", "count": "98" },
            { "tag": "대구대학교", "count": "98" },
            { "tag": "대구예술대학교", "count": "98" },
            { "tag": "대구한의대학교", "count": "98" },
            { "tag": "대전대학교", "count": "98" },
            { "tag": "대진대학교", "count": "98" },
            { "tag": "덕성여자대학교", "count": "98" },
            { "tag": "동국대학교", "count": "98" },
            { "tag": "동덕여자대학교", "count": "98" },
            { "tag": "동명대학교", "count": "98" },
            { "tag": "동서대학교", "count": "98" },
            { "tag": "동신대학교", "count": "98" },
            { "tag": "동아대학교", "count": "98" },
            { "tag": "동양대학교", "count": "98" },
            { "tag": "동의대학교", "count": "98" },
            { "tag": "디지털서울문화예술대학교", "count": "98" },
            { "tag": "명지대학교 인문캠퍼스", "count": "98" },
            { "tag": "명지대학교 자연캠퍼스", "count": "98" },
            { "tag": "목원대학교", "count": "98" },
            { "tag": "목포대학교", "count": "98" },
            { "tag": "배재대학교", "count": "98" },
            { "tag": "선문대학교", "count": "98" },
            { "tag": "성결대학교", "count": "98" },
            { "tag": "성공회대학교", "count": "98" },
            { "tag": "성균관대학교", "count": "98" },
            { "tag": "성신여자대학교", "count": "98" },
            { "tag": "세명대학교", "count": "98" },
            { "tag": "영남대학교", "count": "98" },
            { "tag": "영산대학교", "count": "98" },
            { "tag": "예원예술대학교", "count": "98" },
            { "tag": "용인대학교", "count": "98" },
            { "tag": "우석대학교", "count": "98" },
            { "tag": "우송대학교(본교)", "count": "98" },
            { "tag": "울산과학기술원", "count": "98" },
            { "tag": "홍익대학교 세종캠퍼스", "count": "98" },
            { "tag": "화신사이버대학교", "count": "98" },
            { "tag": "공간디자인학과", "count": "97" },
            { "tag": "공간환경·산업디자인학과", "count": "97" },
            { "tag": "공간환경디자인전공", "count": "97" },
            { "tag": "공간환경시스템공학과", "count": "97" },
            { "tag": "공항홍보전공", "count": "97" },
            { "tag": "광고.PR.브랜딩전공", "count": "97" },
            { "tag": "광고미디어학과", "count": "97" },
            { "tag": "광고사진영상학과", "count": "97" },
            { "tag": "광고영상디자인전공", "count": "97" },
            { "tag": "광고이벤트학과", "count": "97" },
            { "tag": "광고전공", "count": "97" },
            { "tag": "광고컨텐츠디자인학과", "count": "97" },
            { "tag": "광고학전공", "count": "97" },
            { "tag": "광고홍보문화콘텐츠전공", "count": "97" },
            { "tag": "광고홍보언론학과", "count": "97" },
            { "tag": "광고홍보이벤트학과", "count": "97" },
            { "tag": "광고홍보전공", "count": "97" },
            { "tag": "광고홍보전공 트랙", "count": "97" },
            { "tag": "광고홍보학과", "count": "97" },
            { "tag": "광고홍보학부", "count": "97" },
            { "tag": "광고홍보학전공", "count": "97" },
            { "tag": "광고PR전공", "count": "97" },
            { "tag": "디자인·영상학부 영상·영화전공", "count": "97" },
            { "tag": "디자인·영상학부 커뮤니케이션디자인전공", "count": "97" },
            { "tag": "디자인·영상학부 프로덕트디자인전공", "count": "97" },
            { "tag": "디자인·조형학부", "count": "97" },
            { "tag": "디자인경영융합학부", "count": "97" },
            { "tag": "디자인경영학과", "count": "97" },
            { "tag": "디자인계열", "count": "97" },
            { "tag": "디자인공학과", "count": "97" },
            { "tag": "디자인과", "count": "97" },
            { "tag": "디자인기획학과", "count": "97" },
            { "tag": "디자인비즈학부", "count": "97" },
            { "tag": "디자인엔지니어링학과", "count": "97" },
            { "tag": "디자인영상학부", "count": "97" },
            { "tag": "디자인예술문화전공", "count": "97" },
            { "tag": "디자인융합학과", "count": "97" },
            { "tag": "디자인전공", "count": "97" },
            { "tag": "디자인창의학과", "count": "97" },
            { "tag": "디자인학과", "count": "97" },
            { "tag": "디자인학부", "count": "97" },
            { "tag": "디자인학부 산업디자인전공", "count": "97" },
            { "tag": "디자인학부 시각디자인전공", "count": "97" },
            { "tag": "디자인학부 영상디자인전공", "count": "97" }
            ];

            series.dataFields.word = "tag";
            series.dataFields.value = "count";

            series.heatRules.push({
                "target": series.labels.template,
                "property": "fill",
                "min": am4core.color("#0000CC"),
                "max": am4core.color("#CC00CC"),
                "dataField": "value"
            });

            series.labels.template.tooltipText = "{word}";

            var hoverState = series.labels.template.states.create("hover");
            hoverState.properties.fill = am4core.color("#FF0000");
            ;

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <cc1:ToolkitScriptManager runat="server" ScriptMode="Release" />
        <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
            <a class="navbar-brand mr-1" href="dashboard">
                <img src="../images/wlogo.png" alt="로고" style="width: 230px; height: 46px;" /></a>
            <!-- Navbar Search -->
            <div class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <a href="login" id="userDropdown" role="button" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-fw fa-user" style="color: white"></i>
                </a>
                <span style="color: white; font-size: 14px" runat="server" id="sp_userName">환영합니다</span>
            </div>
        </nav>

        <div id="wrapper">
            <div id="content-wrapper" style="background-color: rgb(43,43,43); min-width: 1660px">
                <div class="container-fluid" style="font-size: 12px">
                    <ol class="breadcrumb" style="background-color: rgb(62,62,62);">
                        <li class="breadcrumb-item active" style="font-weight: bold; color: white; font-size: 18px; width: 100%; height: 30px">
                            <div style="float: left;">
                                <label style="margin: 0px;font-size: 20px">KPC 자격 TF</label>
                            </div>
                        </li>
                    </ol>
                    <div class="row">
                        <table style="font-size: 20px;margin-left:15px">
                            <tr>
                                <td>
                                    <label style="padding-top: 7px;color:white;width:100px">자격종류 : </label>
                                </td>
                                <td style="padding-left: 10px">
                                    <asp:DropDownList runat="server" CssClass="dropdown" Height="25px" Width="150px" ID="drSido" AutoPostBack="true" OnSelectedIndexChanged="drSido_SelectedIndexChanged">
                                        <asp:ListItem Text="전체" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="GTQ" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="row" style="padding-top: 0px">
                        <div style="float: left; width: 48%; padding-left: 12px;">
                            <style>
                                .header-line {
                                    height: 5px;
                                    width: 100%;
                                    content: '';
                                    display: block;
                                }

                                .gradient-color-1 {
                                    background: linear-gradient(to top, #1e3c72 0%, #1e3c72 1%, #2a5298 100%);
                                }

                                .gradient-color-2 {
                                    background: linear-gradient(to top, #1e3c72 0%, #1e3c72 1%, #2a5298 100%);
                                }

                                .gradient-color-3 {
                                    background: linear-gradient(to top, #09203f 0%, #537895 100%);
                                }

                                .gradient-color-4 {
                                    background: linear-gradient(to top, #09203f 0%, #537895 100%);
                                }
                            </style>
                            <div class="card border-0 mb-3" style="background-color: rgb(245,247,251); color: black;">
                                <div class="card-header flex-row align-items-center justify-content-between gradient-color-1" style="color: white; background-color: gray;">
                                    <div style="float: left;">
                                        <h6 class="m-0 font-weight-bold text" style="font-size: 20px;padding-top:10px;"><i class="fab fa-mixcloud"></i> 키워드</h6>
                                    </div>
                                </div>
                                <div class="card-body" style="height: 340px">
                                    <div id="chartdiv"></div>
                                </div>
                            </div>
                        </div>
                        <div style="float: right; width: 48%; margin-left: 60px;">
                            <div class="card border-0 mb-3" style="background-color: rgb(245,247,251); color: black;">
                                <div class="card-header flex-row align-items-center justify-content-between gradient-color-1" style="color: white; background-color: gray;">
                                    <h6 class="m-0 font-weight-bold text" style="font-size: 20px;padding-top:10px;height:40px"><i class="fas fa-project-diagram"></i> 연관관계</h6>
                                </div>
                                <div class="card-body" style="height: 340px">
                                    <div id="container" style="width:100%;height:300px;"></div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="padding-left: 12px; padding-top: 0px">
                        <div style="width: 99%;">
                            <div class="card border-0 mb-3" style="background-color: rgb(245,247,251); color: white;">
                                <div class="card-header flex-row align-items-center justify-content-between gradient-color-2" style="color: white; background-color: #4E73DF;">
                                    <h6 class="m-0 font-weight-bold text" style="font-size: 20px;padding-top:10px;height:40px; float: left"><i class="fas fa-table"></i> 자격증별 연관 학과 및 학교 정보
                                       
                                    </h6>
                                     <asp:Button runat="server" ID="btnExcel" Text="Excel 다운로드" CssClass="btn btn-warning" OnClick="btnExcel_Click" OnClientClick="loading('block');" Height="35px"
                                            Style="font-size: 15px; color: black; float: right; font-weight: bold" />
                                </div>
                                <div class="card-body" >
                                    <asp:GridView ID="grdDetail" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-centered mb-0" Width="100%" 
                                        AllowPaging="True" onpageindexchanging="grdDetail_PageIndexChanging" PagerStyle-HorizontalAlign="Center" AllowSorting="true" OnSorting="grdDetail_Sorting">
                                        <EmptyDataTemplate>검색된 데이터가 없습니다.</EmptyDataTemplate>
                                        <HeaderStyle Font-Bold="true" Font-Size="13px" ForeColor="Black" BackColor="#ECECED" HorizontalAlign="Center"/>
                                        <Columns>
                                            <asp:BoundField HeaderText="자격종목" DataField="data1" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="Black" SortExpression="data1"/>
                                            <asp:BoundField HeaderText="대분류" DataField="data2" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="Black" SortExpression="data2"/>
                                            <asp:BoundField HeaderText="소분류" DataField="data3" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="Black" SortExpression="data3"/>
                                            <asp:BoundField HeaderText="학교명" DataField="data4" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="Black" SortExpression="data4"/>
                                            <asp:BoundField HeaderText="학과명" DataField="data5" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="Black" SortExpression="data5"/>
                                        </Columns>
                                    </asp:GridView> 
                                    <div style="visibility: collapse">
                                        <asp:GridView ID="grdExcel" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-centered mb-0" Width="100%">
                                            <EmptyDataTemplate>검색된 데이터가 없습니다.</EmptyDataTemplate>
                                            <HeaderStyle Font-Bold="true" Font-Size="13px" ForeColor="Black" BackColor="#ECECED" HorizontalAlign="Center"/>
                                            <Columns>
                                                <asp:BoundField HeaderText="자격종목" DataField="data1" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="Black" SortExpression="data1"/>
                                                <asp:BoundField HeaderText="대분류" DataField="data2" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="Black" SortExpression="data2"/>
                                                <asp:BoundField HeaderText="소분류" DataField="data3" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="Black" SortExpression="data3"/>
                                                <asp:BoundField HeaderText="학교명" DataField="data4" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="Black" SortExpression="data4"/>
                                                <asp:BoundField HeaderText="학과명" DataField="data5" ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="Black" SortExpression="data5"/>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="sticky-footer" style="background-color: black">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span style="color: white">Copyright © 2020 KPC Co.,Ltd All right reserved.</span>
                    </div>
                </div>
            </footer>
        </div>
        <script type="text/javascript">
            Highcharts.addEvent(
                Highcharts.Series,
                'afterSetOptions',
                function (e) {
                    var colors = Highcharts.getOptions().colors,
                        i = 0,
                        nodes = {};

                    if (
                        this instanceof Highcharts.seriesTypes.networkgraph &&
                        e.options.id === 'lang-tree'
                    ) {
                        e.options.data.forEach(function (link) {

                            if (link[0] === 'GTQ') {
                                nodes['GTQ'] = {
                                    id: 'GTQ',
                                    marker: {
                                        radius: 20
                                    }
                                };
                                nodes[link[1]] = {
                                    id: link[1],
                                    marker: {
                                        radius: 10
                                    },
                                    color: colors[i++]
                                };
                            } else if (nodes[link[0]] && nodes[link[0]].color) {
                                nodes[link[1]] = {
                                    id: link[1],
                                    color: nodes[link[0]].color
                                };
                            }
                        });

                        e.options.nodes = Object.keys(nodes).map(function (id) {
                            return nodes[id];
                        });
                    }
                }
            );

            Highcharts.chart('container', {
                chart: {
                    type: 'networkgraph',
                    height: '300px'
                },
                title: {
                    text: 'GTQ'
                },
                plotOptions: {
                    networkgraph: {
                        keys: ['from', 'to'],
                        layoutAlgorithm: {
                            enableSimulation: true,
                            friction: -0.9
                        }
                    }
                },
                series: [{
                    dataLabels: {
                        enabled: true,
                        linkFormat: ''
                    },
                    id: 'lang-tree',
                    data: [
                        ['GTQ', '예체능계열'],
                        ['GTQ', '공학계열'],
                        ['GTQ', '사회계열'],
                        ['공학계열', '게임공학과'],
                        ['공학계열', '컴퓨터공학과'],
                        ['사회계열', '광고·홍보학과'],
                        ['예체능계열', '만화·애니메이션학과'],
                        ['예체능계열', '사진·영상예술학과'],
                        ['예체능계열', '산업디자인학과'],
                        ['예체능계열', '시각디자인학과'],
                        ['예체능계열', '패션디자인학과'],
                        ['게임공학과', '계명대학교'],
                        ['게임공학과', '공주대학교'],
                        ['게임공학과', '대구예술대학교'],
                        ['게임공학과', '동명대학교'],
                        ['게임공학과', '동서대학교'],
                        ['광고·홍보학과', '가톨릭관동대학교'],
                        ['광고·홍보학과', '건국대학교'],
                        ['광고·홍보학과', '경기대학교'],
                        ['광고·홍보학과', '계명대학교'],
                        ['광고·홍보학과', '고신대학교'],
                        ['광고·홍보학과', '국민대학교'],
                        ['만화·애니메이션학과', '경기대학교'],
                        ['만화·애니메이션학과', '경성대학교'],
                        ['만화·애니메이션학과', '경일대학교'],
                        ['만화·애니메이션학과', '동서대학교'],
                        ['사진·영상예술학과', '가톨릭관동대학교'],
                        ['사진·영상예술학과', '강원대학교'],
                        ['사진·영상예술학과', '용인대학교'],
                        ['사진·영상예술학과', '화신사이버대학교'],
                        ['산업디자인학과', '가천대학교'],
                        ['산업디자인학과', '가톨릭관동대학교'],
                        ['실내디자인학과', '공주대학교'],
                        ['실내디자인학과', '협성대학교'],
                        ['실내디자인학과', '호서대학교'],
                        ['컴퓨터공학과', '가천대학교'],
                        ['컴퓨터공학과', '가톨릭관동대학교'],
                        ['컴퓨터공학과', '가톨릭대학교'],
                        ['컴퓨터공학과', '강남대학교'],
                        ['컴퓨터공학과', '경북대학교'],
                        ['컴퓨터공학과', '호원대학교'],
                        ['컴퓨터공학과', '홍익대학교'],
                        ['패션디자인학과', '가천대학교'],
                        ['패션디자인학과', '강릉원주대학교'],
                        ['패션디자인학과', '호원대학교'],
                        ['패션디자인학과', '홍익대학교']
                    ]
                }]
            });

		</script>
    </form>
</body>
</html>