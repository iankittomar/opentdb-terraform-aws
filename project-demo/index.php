<html>
  <head>
    <title>HomeWork</title>
    <style>
    </style>
    <!-- For basic styling-->
     <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">  
     <!-- Vue.JS Progressive Javascript Framework for data control over the SPA-->
     <script src="https://cdn.jsdelivr.net/npm/vue"></script> 
     
     <!-- for GraphQL API Transactions with the backend-->
     <script src="https://unpkg.com/axios/dist/axios.min.js"></script> 
     
  </head>
  <body>
  <div class="w3-card-4" id="app">

<header class="w3-container w3-blue">
  <h1>{{question}}</h1>
</header>

<div class="w3-container">
  <ul>
    <li v-for="o in options">
      <input type="radio" v-bind:value="o"v-model="response">{{o}}
    </li>
  </ul>
</div>

<footer class="w3-container w3-blue">
  <button class="w3-button" onclick="SubmitResponse()">Submit</button>
  <button class="w3-button" onclick="FetchQuestion()">Skip</button>
  <button class="w3-button" onclick="ShowNetResult()">View Total Stats</button>
</footer>
<div v-if="report">
  <div v-for="d in reportData">

  </div>
</div>
</div> 
  </body>
  <script>
    var correctResponses=0,totalResponses=0,incorrectResponses=0;
    var dataControl=new Vue({
    el:'#app',
    data:{
          question:"",
          options:{},
          response:"",
          report:false,
          reportData:{}
        },
    methods:{

    },
    mounted:function(){
      FetchQuestion();
    }
});
function FetchQuestion() //Question is requested followed by options. Correct options are recieved thanks to sessions
{
    var params = new URLSearchParams();
    params.append('action','FetchQuestion');
    axios.post('backend.php', params).then(function (response) 
    {
        dataControl.question=response.data;
        var params = new URLSearchParams();
        params.append('action','FetchOptions');
        axios.post('backend.php', params).then(function (response) 
        {
            dataControl.options=response.data;
        });
      });
}
function SubmitResponse()
{
      var params = new URLSearchParams();
      params.append('action','SubmitResponse');
      params.append('response',dataControl.response);
      axios.post('backend.php', params).then(function (response) 
      {
          alert(response.data);
          totalResponses++;
          console.log(response);
          if(response.data.indexOf("Correct")!=-1)
          {
            correctResponses++;
          }
          else if(response.data.indexOf("Incorrect!")!=-1)
          {
            incorrectResponses++;
          }
          FetchQuestion();
      });
}
function ShowNetResult()
{
    var percent=(correctResponses/totalResponses)*100;
    if(percent<0){percent=0;}
    alert("You have responded correctly " + percent.toString() + "% times!");
}
  </script>
</html>