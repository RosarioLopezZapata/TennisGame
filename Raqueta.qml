import QtQuick 2.0

Item {
    id: raqueta

    width:20
    height: 100

    property alias color: rectanguloRaqueta.color

    property int up: Qt.Key_Up
    property int down: Qt.Key_Down

    Rectangle{

        id: rectanguloRaqueta

        anchors.fill: raqueta
        color:"blue"
        border.color: Qt.darker(color)
        border.width: width / 10


    }
}
