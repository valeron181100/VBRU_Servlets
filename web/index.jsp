<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>VBond inc.</title>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="js/script.js"></script>
    <script src="js/canvas-script.js"></script>
    <link rel="stylesheet" href="styles/animation.css">
    <link rel="stylesheet" href="styles/style.css"/>
    <link rel="stylesheet" href="styles/mainContent.css">
    <link rel="stylesheet" href="styles/button.css">
    <link rel="stylesheet" href="styles/history.css">
    <link rel="stylesheet" href="styles/loading.css">
</head>
<body>
<div id="mainHeader">
    <img id="mainHeaderImageLeft" src="images/coder.png">
    <span id="mainHeaderCodeImg">public static void main(String[] args){<br>System.out.println(Math.random());<br>for(int i=0; i < arr.length; i++){ <br>System.out.println("Hello World");<br>
        int width = 10;<br>
        System.err.println(width);
        <br>}}</span>
    <div id="authorNameBackground"></div>
    <pre id="authorName">Бондарь Валерий<br>P3211</pre>
</div>
<div id="header">
    <div class="menuButton" onmousedown="playButtonClickAnimation(); playButtonAnimation(this)">
        <img src="images/menu-button.png" alt="Menu">
    </div>
    <div id="horScreenSize" style="margin-left: 20%"></div>
</div>
<div style="position: relative;">
    <div id="sidePanel">
        <div id="upperSidePanel">
            <div class="menuButton" onmousedown="playButtonClickAnimation(); playButtonAnimation(this)">
                <img src="images/back-arrow.png" alt="Back">
            </div>
        </div>
        <div id="headerSidePanel">
            <!--Header side panel content-->
            <img id="headerSideImage" src="images/logo.png"/>
        </div>
        <div id="footerSidePanel">
            <ol style="list-style: none">
                <li id="popularSideItem" class="sideItem" onmousedown="playButtonAnimation(this); mainPageBtnClick()">
                    <img class="sideItemImg" src="images/home-button.png"/>
                    <span class="sideItemText">Главная страница</span>
                </li>
                <li id="newSideItem" class="sideItem" onmousedown="playButtonAnimation(this); historyBtnClick()">
                    <img class="sideItemImg" src="images/history.png"/>
                    <span class="sideItemText">История</span>
                </li>
            </ol>
        </div>
    </div>
</div>

<!--Main Content-->
<div id="mainContent" onmousedown="mainContentClick()">
    <table id="mainTable">
        <tr style="display: none" id="historyView">
            <td>
                <div id="history">
                    <!-- <h1>History</h1>
                    <ol class="historyList">
                        <li><span>x=3, y=4, R=1 (Входит)</span></li>
                        <li><span>x=3, y=4, R=1 (Входит)</span></li>
                        <li><span>x=3, y=4, R=1 (Входит)</span></li>
                        <li><span>x=3, y=4, R=1 (Входит)</span></li>
                        <li><span>x=3, y=4, R=1 (Входит)</span></li>
                        <li><span>x=3, y=4, R=1 (Входит)</span></li>
                        <li><span>x=3, y=4, R=1 (Входит)</span></li>
                        <li><span>x=3, y=4, R=1 (Входит)</span></li>
                        <li><span>x=3, y=4, R=1 (Входит)</span></li>
                        <li><span>x=3, y=4, R=1 (Входит)</span></li>
                        <li><span>x=3, y=4, R=1 (Входит)</span></li>
                        <li><span>x=3, y=4, R=1 (Входит)</span></li>
                        <li><span>x=3, y=4, R=1 (Входит)</span></li>
                        <li><span>x=3, y=4, R=1 (Входит)</span></li>
                        <li><span>x=3, y=4, R=1 (Входит)</span></li>
                        <li><span>x=3, y=4, R=1 (Входит)</span></li>
                        <li><span>x=3, y=4, R=1 (Входит)</span></li>
                        <li><span>x=3, y=4, R=1 (Входит)</span></li>
                        <li><span>x=3, y=4, R=1 (Входит)</span></li>
                        <li><span>x=3, y=4, R=1 (Входит)</span></li>
                    </ol> -->
                </div>
            </td>
        </tr>
        <tr id="mainView">
            <td>
                <div id="leftSide">
                    <form id="coordform" onsubmit="return false">
                        <div id="x-form" style="white-space: nowrap">
                            Значение X:
                            <input type="button" name="x-button" value="-5" onmousedown="onXSelected(this)">
                            <input type="button" name="x-button" value="-4" onmousedown="onXSelected(this)">
                            <input type="button" name="x-button" value="-3" onmousedown="onXSelected(this)">
                            <input type="button" name="x-button" value="-2" onmousedown="onXSelected(this)">
                            <input type="button" name="x-button" value="-1" onmousedown="onXSelected(this)">
                            <input type="button" name="x-button" value="0" onmousedown="onXSelected(this)">
                            <input type="button" name="x-button" value="1" onmousedown="onXSelected(this)">
                            <input type="button" name="x-button" value="2" onmousedown="onXSelected(this)">
                            <input type="button" name="x-button" value="3" onmousedown="onXSelected(this)">
                        </div>
                        <div id="ry-container">
                            <div id="y-form">
                                <label for="y-input" style="white-space: nowrap">Значение Y:</label>
                                <input type="text" placeholder="(-3 ... 5)" name="y-input" id="y-input">
                            </div>
                            <div id="r-form">
                                Значение R:
                                <label class="radioBlock"><input type="radio" name="r-radio" value="1" checked="checked" onmousedown="radioClick(this)">1</label>
                                <label class="radioBlock"><input type="radio" name="r-radio" value="2" onmousedown="radioClick(this)">2</label>
                                <label class="radioBlock"><input type="radio" name="r-radio" value="3" onmousedown="radioClick(this)">3</label>
                                <label class="radioBlock"><input type="radio" name="r-radio" value="4" onmousedown="radioClick(this)">4</label>
                                <label class="radioBlock"><input type="radio" name="r-radio" value="5" onmousedown="radioClick(this)">5</label>
                            </div>
                            <div id="submit-form">
                                <button id="submitButton" class="button" onmousedown="submitForm()">
                                    Готово
                                </button>
                            </div>
                        </div>

                    </form>
                </div>
            </td>
            <td>
                <div id="rightSide">
                    <div id="graph">
                        <canvas id="task-chart"></canvas>
                        <img src="images/graph.png">
                    </div>
                    <div id="response">

                    </div>
                    <!-- <div id="response">Точка не входит в данную область!
                        <div id="rating">
                            <img src="images/rating-star.png" alt="Star"> 12/20
                        </div>
                    </div> -->
                </div>
            </td>
        </tr>
        <tr>
            <td id="mainFooter" colspan="2">
                <div style="align-self: flex-end; margin-bottom: 1%">Icons made by <a href="https://www.flaticon.com/authors/google" title="Google">Google</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
