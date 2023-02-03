import QtQuick 2.0

Item {
    id: contador

    width:50
    height: 30
    property alias bcolor: rectanguloContador.border.color
    property int cont: 0;
/*
    property int up: Qt.Key_Up
    property int down: Qt.Key_Down
*/
    Rectangle{

        id: rectanguloContador

        anchors.fill: contador
        color:"transparent"
        border.color: bcolor
        border.width: width / 10

        Text{
            id: contanding
            text: contador.cont
            //font.family: "/DS-DIGIB.TTF"
        }
    }
}
