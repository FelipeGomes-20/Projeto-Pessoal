var medidaModel = require("../models/medidaModel");

function buscarUltimasMedidas(req, res) {

    const limite_linhas = 7;

    var idAquario = req.params.idAquario;

    console.log(`Recuperando as ultimas ${limite_linhas} medidas`);

    medidaModel.buscarUltimasMedidas(idAquario, limite_linhas).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}




function buscarMedidasEmTempoReal(req, res) {

    var idAquario = req.params.idAquario;

    console.log(`Recuperando medidas em tempo real`);

    medidaModel.buscarMedidasEmTempoReal(idAquario).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

 function relatorio(req, res) {

    var idAquario = req.params.idAquario;
    var dia_inicio= req.params.dia_inicio;
    var dia_fim = req.params.dia_fim;
    var mes_atual = req.params.mes_atual;

    console.log(`Relatorio em tempo real`);

    medidaModel.relatorio(idAquario,dia_inicio,dia_fim,mes_atual).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);

        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as medidas de relatorio.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });

    
} 

function totUsers(req, res) {

    var idAquario = req.params.idAquario;

    console.log(`Recuperando total de usuarios`);

    medidaModel.totUsers(idAquario).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);

        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar quantidade de usuários.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });

    
} 

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    totUsers,
    relatorio 

}