var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/:idAquario", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/tempo-real/:idAquario", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

 router.get("/relatorio/:idAquario/:dia_inicio/:dia_fim/:mes_atual", function (req, res) {
    medidaController.relatorio(req, res);
})

router.get("/totUsers/:idAquario", function (req, res) {
    medidaController.totUsers(req, res);
})

module.exports = router;