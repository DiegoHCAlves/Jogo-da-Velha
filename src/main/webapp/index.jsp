<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Jogo da Velha</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            background-color: antiquewhite;
            width: 100%;
            height: 900px;
        }

        main {
            background-color: white;
            width: 40%;
            height: 70%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .campo {
            width: 33.33%;
            height: 33.33%;
            float: left;
            background-color: black;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 36px;
            color: white;
            cursor: pointer;
        }
    </style>
</head>
<body>
<main>
    <div class="campo" onclick="jogada(0)"></div>
    <div class="campo" onclick="jogada(1)"></div>
    <div class="campo" onclick="jogada(2)"></div>

    <div class="campo" onclick="jogada(3)"></div>
    <div class="campo" onclick="jogada(4)"></div>
    <div class="campo" onclick="jogada(5)"></div>

    <div class="campo" onclick="jogada(6)"></div>
    <div class="campo" onclick="jogada(7)"></div>
    <div class="campo" onclick="jogada(8)"></div>
</main>

<script>
    var jogadorAtual = 'X';
    var tabuleiro = ['', '', '', '', '', '', '', '', ''];
    var vitoria = false;

    function jogada(index) {
        if (!vitoria && tabuleiro[index] === '') {
            tabuleiro[index] = jogadorAtual;
            document.getElementsByClassName('campo')[index].innerText = jogadorAtual;
            jogadorAtual = jogadorAtual === 'X' ? 'O' : 'X';
        }
        verificarVitoria();
    }

    function verificarVitoria() {
        var linhas = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8],
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8],
            [0, 4, 8],
            [2, 4, 6]
        ];

        for (var i = 0; i < linhas.length; i++) {
            var [a, b, c] = linhas[i];
            if (tabuleiro[a] && tabuleiro[a] === tabuleiro[b] && tabuleiro[a] === tabuleiro[c]) {
                alert('Jogador ' + tabuleiro[a] + ' venceu!');
                vitoria = true;
                break;
            }
        }
        if (vitoria) {
            setTimeout(reiniciar, 1000);
        }
    }

    function reiniciar() {
        for (var i = 0; i < tabuleiro.length; i++) {
            tabuleiro[i] = '';
            document.getElementsByClassName('campo')[i].innerText = '';
        }
        vitoria = false;
    }
</script>
</body>
</html>
