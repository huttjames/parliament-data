# About Page 

about_me_header <- renderUI(
  {HTML("<b> About the Developer </b> <br/><br/>")})

bioinfo <- renderUI(
  {HTML("<br>
    <b> Name:</b> James Hutt 
    <br>
    <b>Email:</b> james.w.hutt@gmail.com
    <br><br>
    <b>Bio:</b> To Do<br><br>
    <a href='https://github.com/huttjames/'> GitHub <a/>
    <br>
    <a href='https://www.linkedin.com/in/james-w-hutt/'> LinkedIn <a/><br/><br/>
    <a href='https://github.com/huttjames/parliament-data'> Repo for this project <a/>
    <br><br>
    <b> Thanks: </b> James would like to express particular thanks to Harvard Preceptor David Kane and TF Mitchell Kilborn, 
    without who's teaching, support and help little of this project would have been possible. 
    "
)})

proj_info <- renderUI({
  HTML("<h2><b> About This Project</b></h2>
              <h3><b> To Do</b></h3>            
         <br> <br>")
})