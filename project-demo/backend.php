<?php 
    pg_connect("host=localhost dbname=homework user=mysql password=root");
    session_start();   //Using PHP Sessions to keep track of data
    switch($_POST['action'])
    {
        //GraphQL type single endpoint API for frontend to connect via POST Transactions
        case 'FetchQuestion':
            $get=file_get_contents("https://opentdb.com/api.php?amount=15"); //Fetch Data from API
            /*
                API Provides:
                category
                type : bool/multiple
                difficulty
                question
                correct_answer
                incorrect_answers (array)
            */
            $data=json_decode($get); //convert data to PHP Object
            $_SESSION['question_data']=$get; //Store data as a session variable
            echo html_entity_decode($data->results[0]->question); //send after removing html encoding
        break;
        case 'FetchOptions': 
            $data=json_decode($_SESSION['question_data']);
            $options=$data->results[0]->incorrect_answers;
            array_push($options,$data->results[0]->correct_answer);
            shuffle($options); //Options are shuffled before being sent
            echo json_encode($options); //Sent as a JSON Object
        break;
        case 'SubmitResponse':
            $data=json_decode($_SESSION['question_data']);
            $query=pg_query_params( //Storage for later use such as report generation
                'INSERT INTO data(sessionid,response,qdata) VALUES
                ($1,$2,$3);',
                array(
                    session_id(),
                    $_POST['response'],
                    $_SESSION['question_data']
                )
            );
            if($_POST['response']==$data->results[0]->correct_answer)
            {echo 'Correct!';}
            else
            {echo 'Incorrect!';}
        break;
    }?> 
