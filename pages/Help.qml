// Copyright (c) 2014-2018, The Monero Project
// 
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without modification, are
// permitted provided that the following conditions are met:
// 
// 1. Redistributions of source code must retain the above copyright notice, this list of
//    conditions and the following disclaimer.
// 
// 2. Redistributions in binary form must reproduce the above copyright notice, this list
//    of conditions and the following disclaimer in the documentation and/or other
//    materials provided with the distribution.
// 
// 3. Neither the name of the copyright holder nor the names of its contributors may be
//    used to endorse or promote products derived from this software without specific
//    prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
// THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
// THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
//import moneroComponents.PendingTransaction 1.0
import moneroComponents.AddressBook 1.0
import moneroComponents.AddressBookModel 1.0

import "../components" as MoneroComponents
import moneroComponents.Clipboard 1.0
import moneroComponents.Wallet 1.0
import moneroComponents.WalletManager 1.0
import moneroComponents.TransactionHistory 1.0
import moneroComponents.TransactionHistoryModel 1.0
import moneroComponents.Subaddress 1.0
import moneroComponents.SubaddressModel 1.0
import "../js/TxUtils.js" as TxUtils

//import "." 1.0
//import "../js/TxUtils.js" as TxUtils
import "../../version.js" as Version

Rectangle {
    color: "transparent"
    height: 1800 * scaleRatio
    Layout.fillWidth: true

Clipboard { id: clipboard }

    /* main layout */
    ColumnLayout {
        id: mainLayout
        anchors.margins: (isMobile)? 17 : 40
        anchors.topMargin: 40 * scaleRatio

        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right

        spacing: 20 * scaleRatio
        property int labelWidth: 120 * scaleRatio
        property int editWidth: 400 * scaleRatio
        property int lineEditFontSize: 12 * scaleRatio
        property int qrCodeSize: 220 * scaleRatio

        ColumnLayout {
            id: addressRow
            spacing: 0

/*            MoneroComponents.TextBlock {
                font.pixelSize: 20 * scaleRatio
                text: qsTr("FAQ") + translationManager.emptyString
            }
			            MoneroComponents.TextBlock {
                font.pixelSize: 20 * scaleRatio
                text: qsTr(" ") + translationManager.emptyString
            }
*/			
            MoneroComponents.TextBlock {
                font.pixelSize: 18 * scaleRatio
                text: qsTr("Stellite daemon issues: ") + translationManager.emptyString
            }

        Text {
            textFormat: Text.RichText
//            font.family: Style.fontRegular.name
            font.pixelSize: 14 * scaleRatio
			color: "#ffffff"
            text: qsTr("Please check your Stellite GUI wallet folder that contains stellited (.exe) file. If the file is not there, exclude your Stellite GUI wallet folder from your Antivirus software and extract files from downloaded archive again.<br>") +
                    qsTr("If you still have a problem and your stellited file exists, please run stellited manually and check log. You can either contact us on our Discord channel or delete c:/\programdata/\stellite (Linux and Mac have this folder in home directory) folder and run stellited again to sync from scratch.<br> ") + translationManager.emptyString
            wrapMode: Text.Wrap
            Layout.fillWidth: true;
//            color: Style.defaultFontColor
        }

            MoneroComponents.TextBlock {
                font.pixelSize: 18 * scaleRatio
                text: qsTr("Balance issues: ") + translationManager.emptyString
            }

        Text {
            textFormat: Text.RichText
//            font.family: Style.fontRegular.name
            font.pixelSize: 14 * scaleRatio
			color: "#ffffff"
			property var style: "<style type='text/css'>a {cursor:pointer;text-decoration: underline; color: #FF6C3C}</style>"
            text: style + qsTr("Check your synchronization status first. Your synchronization status block height should be comparable to block you can find as the last one on <a href='https://explorer.stellite.cash'>Blockchain Explorer</a><br>") +
                  qsTr("If you still dont think your balance is right: Set your Wallet creation height to 0 (If you created your wallet after V5 fork, you can enter 500000 to speed up process)in Settings - Info and confirm rescan of your wallet cache.<br> ") + translationManager.emptyString
                onLinkActivated: Qt.openUrlExternally(link)
			wrapMode: Text.Wrap
            Layout.fillWidth: true;
//            color: Style.defaultFontColor
            MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.NoButton // we don't want to eat clicks on the Text
        cursorShape: parent.hoveredLink ? Qt.PointingHandCursor : Qt.ArrowCursor
    }
		}
            MoneroComponents.TextBlock {
                font.pixelSize: 18 * scaleRatio
                text: qsTr("Remote node: ") + translationManager.emptyString
            }

        Text {
            textFormat: Text.RichText
//            font.family: Style.fontRegular.name
            font.pixelSize: 14 * scaleRatio
			color: "#ffffff"
            text: qsTr("Everyone can enable Remote node usage in Settings - Node - Remote node by entering remote node address (port number 20189) - it means you will no longer need to download your blockchain localy. It is better for whole network to sync with as many users as possible, but we want to offer some alternative.<br>") +
                    qsTr("Remote nodes to use: nodes.stellite.cash, daemons.cryptopool.space or node.stellite.space<br> ") + translationManager.emptyString
            wrapMode: Text.Wrap
            Layout.fillWidth: true;
//            color: Style.defaultFontColor
        }
		            MoneroComponents.TextBlock {
                font.pixelSize: 18 * scaleRatio
                text: qsTr("Auto lock feature: ") + translationManager.emptyString
            }

        Text {
            textFormat: Text.RichText
//            font.family: Style.fontRegular.name
            font.pixelSize: 14 * scaleRatio
			color: "#ffffff"
            text: qsTr("There is a new Auto-lock feature which locks the wallet after 10 minutes of being inactive. You can disable this behaviour in Settings - Layour - Lock wallet on inactivity<br><br>") + translationManager.emptyString
            wrapMode: Text.Wrap
            Layout.fillWidth: true;
//            color: Style.defaultFontColor
        }
		Text {
//    anchors.centerIn: parent
            textFormat: Text.RichText
//            font.family: Style.fontRegular.name
            font.pixelSize: 14 * scaleRatio
			color: "#ffffff"
                property var style: "<style type='text/css'>a {cursor:pointer;text-decoration: underline; color: #FF6C3C}</style>"
    text: style + "To learn more about Stellite, visit <a href='https://stellite.cash'>our website.</a>"
    onLinkActivated: Qt.openUrlExternally(link)

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.NoButton // we don't want to eat clicks on the Text
        cursorShape: parent.hoveredLink ? Qt.PointingHandCursor : Qt.ArrowCursor
    }
}
		Text {
//    anchors.centerIn: parent
            textFormat: Text.RichText
//            font.family: Style.fontRegular.name
            font.pixelSize: 14 * scaleRatio
			color: "#ffffff"
                property var style: "<style type='text/css'>a {cursor:pointer;text-decoration: underline; color: #FF6C3C}</style>"
    text: style + "To get support, ask questions or just chat,please visit our <a href='https://discord.gg/AnWFhJs'>Discord channel</a>"
    onLinkActivated: Qt.openUrlExternally(link)

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.NoButton // we don't want to eat clicks on the Text
        cursorShape: parent.hoveredLink ? Qt.PointingHandCursor : Qt.ArrowCursor
    }
}
		Text {
//    anchors.centerIn: parent
            textFormat: Text.RichText
//            font.family: Style.fontRegular.name
            font.pixelSize: 14 * scaleRatio
			color: "#ffffff"
                property var style: "<style type='text/css'>a {cursor:pointer;text-decoration: underline; color: #FF6C3C}</style>"
    text: style + "To support us directly, you can donate to support future development:<br><a href='#'>XTL address (click to copy)</a>"
    onLinkActivated: {
				var data = "SEiTBcLGpfm3uj5b5RaZDGSUoAGnLCyG5aJjAwko67jqRwWEH26NFPd26EUpdL1zh4RTmTdRWLz8WCmk5F4umYaFByMtJT6RLjD6vzApQJWfi";
                clipboard.setText(data);
                appWindow.showStatusMessage(qsTr("XTL address copied to clipboard"), 3);

	}
	
    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.NoButton // we don't want to eat clicks on the Text
        cursorShape: parent.hoveredLink ? Qt.PointingHandCursor : Qt.ArrowCursor
    }
}
		Text {
//    anchors.centerIn: parent
            textFormat: Text.RichText
//            font.family: Style.fontRegular.name
            font.pixelSize: 14 * scaleRatio
			color: "#ffffff"
                property var style: "<style type='text/css'>a {cursor:pointer;text-decoration: underline; color: #FF6C3C}</style>"
    text: style + "<a href='#'>XTL address (click to open in Send tab)</a>"
    onLinkActivated: {
var address = "SEiTBcLGpfm3uj5b5RaZDGSUoAGnLCyG5aJjAwko67jqRwWEH26NFPd26EUpdL1zh4RTmTdRWLz8WCmk5F4umYaFByMtJT6RLjD6vzApQJWfi";
var description = "Donation";
var paymentId = "";
                   console.log("Sending to: ", address +" "+ paymentId);
                   middlePanel.sendTo(address, paymentId, description);
                   leftPanel.selectItem(middlePanel.state)					
	}
	
    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.NoButton // we don't want to eat clicks on the Text
        cursorShape: parent.hoveredLink ? Qt.PointingHandCursor : Qt.ArrowCursor
    }
}

			Text {
//    anchors.centerIn: parent
            textFormat: Text.RichText
//            font.family: Style.fontRegular.name
            font.pixelSize: 14 * scaleRatio
			color: "#ffffff"
                property var style: "<style type='text/css'>a {cursor:pointer;text-decoration: underline; color: #FF6C3C}</style>"
    text: style + "<a href='#'>BTC address (click to copy)</a>"
    onLinkActivated: {
				var data = "1XTLY5LqdBXRW6hcHtnuMU7c68mAyW6qm";
                clipboard.setText(data);
                appWindow.showStatusMessage(qsTr("BTC address copied to clipboard"), 3);
					
	}
	
    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.NoButton // we don't want to eat clicks on the Text
        cursorShape: parent.hoveredLink ? Qt.PointingHandCursor : Qt.ArrowCursor
    }
}



}
}
}

