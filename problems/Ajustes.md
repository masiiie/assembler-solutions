<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>Ajustes</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="Ajustes_files/css.css" rel="stylesheet">
    <script src="Ajustes_files/jquery-1.js"></script>
    <script src="Ajustes_files/jquery-migrate-1.js"></script>
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="/scripts/html5shiv.js"></script>
    <![endif]-->
    <!-- MathJax -->
    <script type="text/x-mathjax-config;executed=true">
      MathJax.Hub.Config({    
        tex2jax: {inlineMath: [["$","$"],["\\(","\\)"]]}
      });
    </script>
    <script type="text/javascript" src="Ajustes_files/MathJax.js"></script>
    <style>
        <!-- problems with chrome  -->
        .MathJax .math * {
            border-color: transparent !important;
        }
    </style>
    <style type="text/css">
        .MathJax_Hover_Frame {border-radius: .25em; box-shadow: 0px 0px 15px #83A; border: 1px solid #A6D !important; display: inline-block; position: absolute}
        .MathJax_Hover_Arrow {position: absolute; width: 15px; height: 11px; cursor: pointer}
    </style>
    <style type="text/css">
        #MathJax_About {position: fixed; left: 50%; width: auto; text-align: center; border: 3px outset; padding: 1em 2em; background-color: #DDDDDD; color: black; cursor: default; font-family: message-box; font-size: 120%; border-radius: 15px; box-shadow: 0px 10px 20px #808080;}
        .MathJax_Menu {position: absolute; background-color: white; color: black; width: auto; padding: 2px; border: 1px solid #CCCCCC; margin: 0; cursor: default; font: menu; text-align: left; z-index: 201; box-shadow: 0px 10px 20px #808080;}
        .MathJax_MenuItem {padding: 2px 2em; background: transparent}
        .MathJax_MenuArrow {position: absolute; right: .5em; color: #666666}
        .MathJax_MenuActive {background-color: Highlight; color: HighlightText}
    </style>
    <style type="text/css">
        #MathJax_Zoom {position: absolute; background-color: #F0F0F0; overflow: auto; display: block; z-index: 301; padding: .5em; border: 1px solid black; margin: 0; box-shadow: 5px 5px 15px #AAAAAA;}
        #MathJax_ZoomOverlay {position: absolute; left: 0; top: 0; z-index: 300; display: inline-block; width: 100%; height: 100%; background-color: white; opacity: 0;}
        #MathJax_ZoomFrame {position: relative; display: inline-block; height: 0; width: 0}
    </style>
    <style type="text/css">
        .MathJax_Preview {color: #888}
        #MathJax_Message {position: fixed; left: 1px; bottom: 2px; background-color: #E6E6E6; border: 1px solid #959595; margin: 0px; padding: 2px 8px; z-index: 102; color: black; font-size: 80%;}
        .MathJax_Error {color: #CC0000; font-style: italic}
    </style>
</head>
<body>
    <div style="display: none;" id="MathJax_Message"></div>
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container-fluid">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="page-header">
                <div class="row-fluid">
                    <div class="span3">
                        <a href="http://judge.matcom.uh.cu/asm/home">
                            <img src="Ajustes_files/logo.gif">
                        </a>
                    </div>
                    <div class="span9">
                        <div class="pull-right">
                            <a href="http://judge.matcom.uh.cu/asm/localization/changeculture/es?returnUrl=%2Fasm%2Fcontest%2FARR%2FB">
                                <img src="Ajustes_files/Spain-flag.png" alt="Spanish" class="flagSizeSmall"></a> |
                            <a href="http://judge.matcom.uh.cu/asm/localization/changeculture?returnUrl=%2Fasm%2Fcontest%2FARR%2FB">
                                <img src="Ajustes_files/USA-flag.png" alt="English" class="flagSizeSmall"></a>
                        </div>
                        <h1>Matcom Online Grader
                            <br>
                            <small>Faculty of Mathematics and Computer Science of University of Havana</small>
                        </h1>
                        <h3>Programación de Máquinas I</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="row-fluid">
        </div>
        <div class="row-fluid">
            <div class="span3">
                <div class="sidebar-nav">
                    <ul class="nav nav-list">
                        <div class="sidebar-nav">
                            <div class="nav-header">
                                Contest
                            </div>
                            <div>
                                <table class="table table-bordered">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <h3 class="center"><a href="http://judge.matcom.uh.cu/asm/contest/ARR">Arrays</a></h3>
                                                <h3 class="muted center time" data-d="10" data-h="0" data-m="8" data-s="24" data-total="874800">10 days</h3>
                                                <div style="" class="progress progress-striped active" id="timebanner">
                                                    <div class="bar" id="bartime" style="width: 2.99063px;"></div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <ul class="nav nav-list">
                                                    <li class="active"><a href="http://judge.matcom.uh.cu/asm/contest/ARR"><i class="icon-list-alt"></i>Problems</a></li>
                                                    <li class=""><a href="http://judge.matcom.uh.cu/asm/contest/ARR/standings"><i class="icon-signal"></i>Standings</a></li>
                                                    <li class=""><a href="http://judge.matcom.uh.cu/asm/contest/ARR/submissions/"><i class="icon-road"></i>Submissions</a></li>
                                                    <li class=""><a href="http://judge.matcom.uh.cu/asm/contest/ARR/submit/B"><i class="icon-envelope"></i>Submit</a></li>
                                                </ul>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </ul>
                </div>
            </div>
            <div class="span9">
                <section>
                    <div class="row-fluid">
                    </div>
                    <div class="statement">
                        <h3>B - Ajustes</h3>
                        <h5>Time Limit: 2 second(s)</h5>
                        <h5>Memory Limit: 127 megabytes</h5>
                        <ul class="nav nav-pills">
                            <li class="active"><a href="">Statement</a></li>
                            <li><a href="http://judge.matcom.uh.cu/asm/contest/ARR/submissions/problem/B">All Submissions</a></li>
                            <li><a href="http://judge.matcom.uh.cu/asm/contest/ARR/submissions/problem/B/result/accepted">Accepted Submissions</a></li>
                            <li><a href="http://judge.matcom.uh.cu/asm/problem/ARRB/pdf">Download PDF</a></li>
                            <li><a href="http://judge.matcom.uh.cu/asm/contest/ARR/submit/B">Submit</a></li>
                        </ul>
                        Fito y Martina están trabajando en una compañia llamada “Adjustment 
                        Office” y tienen ahora un problema interesante que resolver. Les han 
                        otorgado un tablero cuadrado gigante de n x n, donde inicialmente cada 
                        celda(x,y) del tablero contiene escrito el valor x + y (1 ≤ x,y ≤ n). 
                        Ellos saben que en el futuro habrán dos tipos de operaciones sobre el tablero:
                        - “R r” — Sumar todos los valores de la fila *r*, imprimir el resultado y escribir cero en todas las celdas de la fila *r*; 
                        - “C c” — Sumar todos los valores de la columna *c*, imprimir el resultado y escribir cero en todas las celdas de la columna *c*; 
                        Ellos han previsto cuáles serán las preguntas y necesitan saber si han 
                        predicho los resultados correctamente. Ayúdalos computando los 
                        resultados de las preguntas.
                        <br>
                        ### Input
                        La primera linea de la entrada contiene dos enteros *n* y *q (1 ≤ n ≤ 10^6, 1 ≤ q ≤ 10^5)* el tamaño del tablero y la cantidad de preguntas.
                        Cada una de las *q* líneas contiene la descripción de una pregunta. Cada pregunta es “R r” (1 ≤ r ≤ n) o “C c” (1 ≤ c ≤ n).
                        <br>
                        ### Output
                        La salida debe contener *q* líneas. La i-ésima debe contener el resultado de la i-ésima pregunta.
                        <br>
                        ### Sample test(s)
                        <aside>
                            <div class="sample-tests">
                                <div class="sample-test">
                                    <div class="input">
                                        <div class="title">Input</div>
                                        <div class="pre">
                                            <span class="text">4 3
C 1
R 3
C 4
</span>
                                        </div>
                                    </div>
                                    <div class="output">
                                        <div class="title">Output</div>
                                        <div class="pre">
                                            <span class="text">14
18
19
</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </aside>
                    </div>
                    <div id="deleteModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h3 id="deleteModalLabel">Delete</h3>
                        </div>
                        <div class="modal-body">
                            <p>Are you sure you want to delete this item</p>
                        </div>
                        <div class="modal-footer">
                            <form novalidate="novalidate" id="deleteFormModal" method="POST">
                                <button class="btn btn-danger" type="submit">Delete</button>
                                <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                            </form>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <hr>
        <footer>
            <div class="center">
                <p>© 2016 - MOG Version: 2.0.0.14</p>
                <p>Grader Version: 2.0.0.22</p>
                <p>Server Time: 10/11/2016 12:57:35 PM</p>
            </div>
        </footer>
    </div>
    <script src="Ajustes_files/jquery_002.js"></script>
    <script src="Ajustes_files/jquery.js"></script>
    <script src="Ajustes_files/jquery_004.js"></script>
    <script src="Ajustes_files/bootstrap.js"></script>
    <script src="Ajustes_files/jquery_003.js"></script>
    <script src="Ajustes_files/site.js"></script>
</body>
</html>