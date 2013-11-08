function getEndereco() {
    if ($.trim($("#paciente_cep").val()) != "") {
      $.getScript("http://cep.republicavirtual.com.br/web_cep.php?formato=javascript&cep="+$("#paciente_cep").val(), function(){
      <!-- Atribuindo os valores para os componentes da página-->
    if(resultadoCEP["resultado"]){
        $("#paciente_rua").val(unescape(resultadoCEP["tipo_logradouro"])+": "+unescape(resultadoCEP["logradouro"]));
        //$("#paciente_user_rua").val(unescape(resultadoCEP["logradouro"]));
        $("#paciente_bairro").val(unescape(resultadoCEP["bairro"]));
        $("#paciente_cidade").val(unescape(resultadoCEP["cidade"]));
        $("#paciente_uf").val(unescape(resultadoCEP["uf"]));
        } else {
          alert("Cep não encontrado.");
       }
       $("#lbcep").html(" CEP")});
    }
    else {
        alert("Informe um cep.");
    }
}