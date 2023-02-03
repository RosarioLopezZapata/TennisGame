import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: ventana
    width: 640
    height: 480
    visible: true
    title: "Juego de Tenis"


    Rectangle{
        id: cancha
        color: "#9DB577"

        anchors.fill: parent

        property color nuevoColor: "#9DB577"


        Grid{
            id: contadores
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.leftMargin: 10
            anchors.bottomMargin: 10

            rows: 1
            columns: 2
            spacing: 2

            Contador{
                id:winplayer1
                bcolor: "#7796B5"

            }
            Contador{
                id:winplayer2
                bcolor: "#85A177"
            }
}


        Raqueta{
            id: player1
            color: "#7796B5"

            anchors.left: parent.left
            anchors.leftMargin: 5

            width: cancha.width/100
            height: cancha.height/3

            up: Qt.Key_Q
            down: Qt.Key_A

        }

        Raqueta{
            id: player2
            color: "#85A177"

            anchors.right: parent.right
            anchors.rightMargin: 5

            width: cancha.width/100
            height: cancha.height/3

            up: Qt.Key_P
            down: Qt.Key_L


        }

        focus:true

        Keys.onPressed: (event)=>{
                            switch(event.key){
                                case player1.up:
                                    player1.y -=10;
                                //console.log('hombrecito',hombrecito.mapToItem(player1, hombrecito.x).y);

                                /*
                                    console.log('player1',player1.y-player1.height/2,player1.y+player1.height/2);

                                console.log('hombrecito',hombrecito.y);

                                console.log('q ondis',hombrecito.mapToItem(player1, hombrecito.x, hombrecito.y).y);

                                */

                                /*

                                if(hombrecito.x === player1.x){

                                    if(hombrecito.y < player1.y-player1.height/2  || hombrecito.y > player1.y+player1.height/2  ){
                                        console.log("siamo fuori de la copa")
                                    }
                                }
                                */
                                break;

                                case player1.down:
                                    player1.y +=10;
                                /*
                                    if(hombrecito.x === player1.x){
                                        if(hombrecito.y < player1.y-player1.height/2  || hombrecito.y > player1.y+player1.height/2  ){
                                            console.log("siamo fuori de la copa")
                                        }
                                    }
                                 */

                                break;

                                case player2.up:
                                    player2.y -=10;
                                    break;
                                case player2.down:
                                    player2.y +=10;
                                    break;
     /*
                                case Qt.Key_H:
                                    hombrecito.nuevoX = hombrecito.x + 300;
                                    animacionEnX.start();
                                    break;
*/
                            }
                        }
        Image{
            id: hombrecito
            source:"/img/hombrecito.png"

            x:0
            y:0

            width: parent.width / 10
            height: parent.width / 10

            property int nuevoX: 0
            property int nuevoY: 0

            property int nuevoAngulo: 0


            NumberAnimation on x{
                id: animacionEnX

                to: hombrecito.nuevoX

                duration: 1950
            }

            NumberAnimation on y{
                id: animacionEnY

                to: hombrecito.nuevoY

                duration: 1950
            }

            RotationAnimation on rotation{
                id: animacionRotacion
                to: hombrecito.nuevoAngulo

                duration: 500
            }


        }

        ColorAnimation on color{
            id: animacionColor
            to: cancha.nuevoColor
            duration: 500
        }
    }
    Timer{
        interval:2000
        running: true
        repeat: true

        onTriggered:{
            if(hombrecito.x === 0){
                hombrecito.nuevoX = cancha.width - hombrecito.width;
                hombrecito.nuevoY = Math.random() * cancha.height - hombrecito.height;

                hombrecito.nuevoAngulo= 90 + (Math.atan( (hombrecito.nuevoY- hombrecito.y)/( hombrecito.nuevoX- hombrecito.x) ))*(180 /Math.PI);

                cancha.nuevoColor = "#85A177";
                console.log("hombrecito en x =0 ")
                if((hombrecito.y + hombrecito.width/4) < player1.y-player1.height/2  ||( hombrecito.y+ hombrecito.width/4) > player1.y+player1.height/2  ){
                    console.log("siamo fuori de la copa")
                    winplayer2.cont++;
                }

            }
            else{
                if(hombrecito.nuevoX === (cancha.width - hombrecito.width)){
                    if((hombrecito.y + hombrecito.width/4) < player2.y-player2.height/2  ||( hombrecito.y+ hombrecito.width/4) > player2.y+player2.height/2  ){
                        console.log("sali de ahi maravilla")
                        winplayer1.cont++;
                    }

                }

                hombrecito.nuevoX = 0;
                hombrecito.nuevoY = Math.random() * cancha.height  - hombrecito.height;
                hombrecito.nuevoAngulo= -90 + (Math.atan( (hombrecito.nuevoY- hombrecito.y)/( hombrecito.nuevoX- hombrecito.x) ))*(180 /Math.PI);

                cancha.nuevoColor = "#7796B5";
            }
            animacionEnX.start();
            animacionEnY.start();
            animacionRotacion.start();
            animacionColor.start();
        }
    }
}
