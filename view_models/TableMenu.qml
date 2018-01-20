import QtQuick 2.0
import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "../utils/Icons.js" as MdiFont
import "../utils/Help.js" as H
import "../utils"

Menu
{
    id: rootMenu
    x: parent.width / 2 - width / 2
    y: parent.height / 2 - height / 2
    modal: bae.isMobile()
    focus: true


    property int rate : 0
    property string starColor : "#FFC107"
    property string starReg : bae.foregroundColor()
    property string starIcon: MdiFont.Icon.star
    property int assetsize : menuItemHeight/2
    property int menuItemHeight : bae.isMobile() ? 48 : 32;

    signal rated(int value)



    enter: Transition {
        NumberAnimation { property: "opacity"; from: 0.0; to: 1.0 }
    }

    function rateIt(rank)
    {
        rate = rank
        bae.rateTrack(list.model.get(currentRow).url, rate)
    }


    background: Rectangle
    {
        implicitWidth: 200
        implicitHeight: 40
        color: bae.backgroundColor()
        border.color: bae.midColor()
        border.width: 1
        radius: 4

    }


    //    Label
    //    {
    //        id: titleLabel
    //        visible: bae.isMobile()
    //        padding: bae.isMobile() ? 10 : 0
    //        font.bold: true
    //        width: parent.width
    //        height: bae.isMobile() ? menuItemHeight : 0
    //        horizontalAlignment: Qt.AlignHCenter
    //        elide: Text.ElideRight
    //        text: currentRow >= 0 ? list.model.get(currentRow).title : ""
    //        color: bae.foregroundColor()
    //    }

    TableMenuItem
    {
        height: menuItemHeight
        txt: "Babe it"
        onTriggered: {}
    }

    TableMenuItem
    {
        height: menuItemHeight
        txt: "Queue"
        onTriggered: list.queueTrack(currentRow)
    }

    TableMenuItem
    {
        height: menuItemHeight
        txt: "Edit..."
        onTriggered: {}
    }

    TableMenuItem
    {
        height: menuItemHeight
        txt: "Remove"
        onTriggered: {}
    }

    TableMenuItem
    {
        height: menuItemHeight
        txt: "Save..."
        onTriggered: {}
    }

    TableMenuItem
    {
        height: menuItemHeight
        txt: "Send to..."
        onTriggered: {}
    }


    MenuItem
    {
        height: menuItemHeight
        hoverEnabled: true
        padding: 10

        RowLayout
        {
            anchors.fill: parent
            ToolButton
            {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignCenter
                BabeIcon
                {
                    text: starIcon
                    color: rate >= 1 ? starColor :starReg
                    iconSize: assetsize
                }

                onClicked: rateIt(1)
            }
            ToolButton
            {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignCenter
                BabeIcon
                {
                    text: starIcon
                    color: rate >= 2 ? starColor :starReg
                    iconSize: assetsize
                }

                onClicked: rateIt(2)
            }
            ToolButton
            {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignCenter
                BabeIcon
                {
                    text: starIcon
                    color: rate >= 3 ? starColor :starReg
                    iconSize: assetsize
                }

                onClicked: rateIt(3)
            }

            ToolButton
            {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignCenter
                BabeIcon
                {
                    text: starIcon
                    color: rate >= 4 ? starColor :starReg
                    iconSize: assetsize
                }

                onClicked: rateIt(4)
            }

            ToolButton
            {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignCenter
                BabeIcon
                {
                    text: starIcon
                    color: rate >= 5 ? starColor :starReg
                    iconSize: assetsize
                }

                onClicked: rateIt(5)
            }



        }

    }

    MenuItem
    {
        height: menuItemHeight
        hoverEnabled: true
        padding: 10
        RowLayout
        {
            anchors.fill: parent
            ToolButton
            {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignCenter

                Rectangle
                {
                    anchors.centerIn: parent
                    width: assetsize
                    height: assetsize
                    color: bae.moodColor(0)
                    radius: 2
                    border.color: bae.altColor()
                    border.width: 1
                }

                onClicked: {}
            }
            ToolButton
            {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignCenter

                Rectangle
                {
                    anchors.centerIn: parent
                    width: assetsize
                    height: assetsize
                    color: bae.moodColor(1)
                    radius: 2
                    border.color: bae.altColor()
                    border.width: 1
                }

                onClicked: {}
            }
            ToolButton
            {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignCenter

                Rectangle
                {
                    anchors.centerIn: parent
                    width: assetsize
                    height: assetsize
                    color: bae.moodColor(2)
                    radius: 2
                    border.color: bae.altColor()
                    border.width: 1
                }

                onClicked: {}
            }
            ToolButton
            {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignCenter

                Rectangle
                {
                    anchors.centerIn: parent
                    width: assetsize
                    height: assetsize
                    color: bae.moodColor(3)
                    radius: 2
                    border.color: bae.altColor()
                    border.width: 1
                }

                onClicked: {}
            }

            ToolButton
            {
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignCenter

                Rectangle
                {
                    anchors.centerIn: parent
                    width: assetsize
                    height: assetsize
                    color: bae.moodColor(4)
                    radius: 2
                    border.color: bae.altColor()
                    border.width: 1
                }

                onClicked: {}
            }



        }

    }
}