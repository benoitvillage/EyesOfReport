<?php include('../../../include/config.php');

	$table_name = $_GET['table_name'];

	if ($table_name == 'contract_context'){
		$name = $_GET['name'];
		if (empty($name)) {
			echo "false";
			exit;
		}
		$alias = $_GET['alias'];
		$id_contract = $_GET['id_contract'];
		if (empty($id_contract)) {
			echo "false";
			exit;
		}
		$id_time_period = $_GET['id_time_period'];
		if (empty($id_time_period)) {
			echo "false";
			exit;
		}
		$id_kpi = $_GET['id_kpi'];
		if (empty($id_kpi)) {
			echo "false";
			exit;
		}

		$id_step_group = $_GET['id_step_group'];
                if (empty($id_step_group)) {
                        echo "false";
                        exit;
                }

		$sql = "insert into contract_context (NAME,ALIAS,ID_CONTRACT,ID_TIME_PERIOD,ID_KPI,ID_STEP_GROUP) values('".$name."','".$alias."',".$id_contract.",".$id_time_period.",".$id_kpi.",".$id_step_group.")";
	}

	else if ($table_name == 'kpi'){
		$name = $_GET['name'];
		if (empty($name)) {
			echo "false";
			exit;
		}
		$alias = $_GET['alias'];
		$id_unit_comput = $_GET['id_unit_comput'];
		if (empty($id_unit_comput)) {
			echo "false";
			exit;
		}
		$id_unit_presentation = $_GET['id_unit_presentation'];
		if (empty($id_unit_presentation)) {
			echo "false";
			exit;
		}

		$sql = "insert into kpi (NAME,ALIAS,ID_UNIT_COMPUT,ID_UNIT_PRESENTATION) values('".$name."','".$alias."',".$id_unit_comput.",".$id_unit_presentation.")";
	}

	else if ($table_name == 'unit'){
		$name = $_GET['name'];
		if (empty($name)) {
			echo "false";
			exit;
		}
		$short_name = $_GET['short_name'];
		if (empty($short_name)) {
			echo "false";
			exit;
		}

		$sql = "insert into unit (NAME,SHORT_NAME) values('".$name."','".$short_name."')";
	}

	else if ($table_name == 'company'){
		$name = $_GET['name'];
		if (empty($name)) {
			echo "false";
			exit;
		}
		$alias = $_GET['alias'];

		$sql = "insert into company (NAME,ALIAS) values('".$name."','".$alias."')";
	}

	else if ($table_name == 'time_period'){
		$name = $_GET['name'];
		if (empty($name)) {
			echo "false";
			exit;
		}
		$alias = $_GET['alias'];
		$values = $_GET['values'];
		if (empty($values)) {
			echo "false";
			exit;
		}

		$sql = "insert into time_period (NAME,ALIAS) values('".$name."','".$alias."')";
	}

	else if ($table_name == 'contract_context_application'){
		$id_contract_context = $_GET['id_contract_context'];
		if (empty($id_contract_context)) {
			echo "false";
			exit;
		}

		$applications = $_GET['applications'];
		$application_source = "global_nagiosbp";

		if (empty($applications)) {
			echo "false";
			exit;
		}

		$sql = "delete from contract_context_application where ID_CONTRACT_CONTEXT = " . $id_contract_context . ";";
   
		for ($i = 1; $i <= count($applications); $i++){
			$application_name = $applications["$i"];
      if(empty($application_name)){
        continue;
      }

			if ($i == count($applications)){
				$sql .= "insert into contract_context_application (ID_CONTRACT_CONTEXT,APPLICATION_NAME,APPLICATION_SOURCE) values(".$id_contract_context.",'".$application_name."','".$application_source."')";
			}
			else{
				$sql .= "insert into contract_context_application (ID_CONTRACT_CONTEXT,APPLICATION_NAME,APPLICATION_SOURCE) values(".$id_contract_context.",'".$application_name."','".$application_source."');";
			}
		}
	}

	else if ($table_name == 'step_group'){
		$name = $_GET['name'];
		if (empty($name)) {
			echo "false";
			exit;
		}

		$id_kpi = $_GET['id_kpi'];
		if (empty($id_kpi)) {
			echo "false";
			exit;
		}

		$type = $_GET['type'];
		if (empty($type)) {
			echo "false";
			exit;
		}

		$values_step = $_GET['values_step'];
		$step_number = count($values_step);
		$sql = "insert into step_group (ID_KPI, NAME, STEP_NUMBER, TYPE";

		for ($i=1; $i <= $step_number; $i++){
			$sql = $sql . ", STEP_" .$i. "_MIN, STEP_" .$i. "_MAX";
		}

		$sql = $sql . ") values(" .$id_kpi.",'".$name."',".$step_number.",'".$type."'";

		for ($i=1; $i <= $step_number; $i++){
			$sql = $sql . "," .$values_step["$i"][0] . "," .$values_step["$i"][1];
		}

		$sql = $sql . ")";
	}

	else if ($table_name == 'contract'){
		$name = $_GET['name'];
		if (empty($name)) {
			echo "false";
			exit;
		}
		$alias = $_GET['alias'];

		$contract_sdm_intern = $_GET['contract_sdm_intern'];
		if (empty($contract_sdm_intern)) {
			$contract_sdm_intern = NULL;
		}
		$contract_sdm_extern = $_GET['contract_sdm_extern'];
		if (empty($contract_sdm_extern)) {
			$contract_sdm_extern = NULL;
		}
		$id_company = $_GET['id_company'];
		if (empty($id_company)) {
			echo "false";
			exit;
		}
		if (! ctype_digit($id_company)){
			$id_company = explode(" ", $id_company);
		}
		$extern_contract_id = $_GET['extern_contract_id'];
		if (empty($extern_contract_id)) {
			$extern_contract_id = NULL;
		}
		$validity_date = $_GET['validity_date'];
		if (empty($validity_date)) {
			echo "false";
			exit;
		}

		$sql = "insert into contract (NAME,ALIAS,CONTRACT_SDM_INTERN,CONTRACT_SDM_EXTERN,ID_COMPANY,EXTERN_CONTRACT_ID,VALIDITY_DATE) values('".$name."','".$alias."','".$contract_sdm_intern."','".$contract_sdm_extern."',".$id_company.",'".$extern_contract_id."','".$validity_date."')";

	}

    try {
        #$bdd = new PDO("mysql:host=$database_host;dbname=$database_vanillabp", 'eyesofreport', 'SaintThomas,2014');
        $bdd = new PDO("mysql:host=$database_host;dbname=$database_vanillabp", $database_username, $database_password);
    } catch(Exception $e) {
		 echo "Connection failed: " . $e->getMessage();
        exit('Impossible de se connecter à la base de données.');
    }

	if ($table_name == 'contract_context'){
		$sql_verify = $bdd->query("select count(*) from contract_context where ID_CONTRACT='$id_contract' and ID_TIME_PERIOD='$id_time_period' and ID_KPI = $id_kpi and ID_STEP_GROUP = $id_step_group");
		$verify = $sql_verify->fetch();

		if ($verify["count(*)"] >= 1){
			echo "no_right";
			exit;
		}
	}
	
	if ($table_name == 'contract_context'){
		$sql_verify = $bdd->query("select count(*) from contract_context where ID_CONTRACT='$id_contract' and ID_TIME_PERIOD <> '$id_time_period'");
		$verify = $sql_verify->fetch();

		if ($verify["count(*)"] >= 1){
			echo "no_right_2";
			exit;
		}
	}

	$bdd->exec($sql);

	$status = 'New';
	include('../php/save_last_entry.php');

	if ($table_name == 'time_period'){
		$sql = "select ID_TIME_PERIOD from time_period where NAME = '". $name ."'";
		$req = $bdd->query($sql);
		$id = $req->fetch();
		$id = $id['ID_TIME_PERIOD'];
		$values = $_GET['values'];

		for ($i = 1; $i <= count($values); $i++){
			$day = $values["$i"][0];
			$h_open = $values["$i"][1].":".$values["$i"][2];
			$h_close = $values["$i"][3].":".$values["$i"][4];

			$sql = "insert into timeperiod_entry (ID_TIME_PERIOD,ENTRY,H_OPEN,H_CLOSE) values(".$id.",'".$day."','".$h_open."','".$h_close."')";
			$bdd->exec($sql);
		}
	}
	echo "true";
	exit;
?>


