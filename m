Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7023BB58F
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Apr 2019 09:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9358189101;
	Sun, 28 Apr 2019 07:44:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810071.outbound.protection.outlook.com [40.107.81.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82919890D3
 for <amd-gfx@lists.freedesktop.org>; Sun, 28 Apr 2019 07:44:04 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2933.namprd12.prod.outlook.com (20.179.91.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Sun, 28 Apr 2019 07:44:02 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.010; Sun, 28 Apr 2019
 07:44:02 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 00/27] KFD upstreaming
Thread-Topic: [PATCH 00/27] KFD upstreaming
Thread-Index: AQHU/ZYltw7MLQgAS0iiLSdfkkf+qA==
Date: Sun, 28 Apr 2019 07:44:02 +0000
Message-ID: <20190428074331.30107-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::28) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c6c6872-303c-4065-982f-08d6cbad4794
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2933; 
x-ms-traffictypediagnostic: BYAPR12MB2933:
x-microsoft-antispam-prvs: <BYAPR12MB2933C17F5C3D3AA32289D4FE92380@BYAPR12MB2933.namprd12.prod.outlook.com>
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(50226002)(81156014)(6512007)(4326008)(81166006)(8676002)(2616005)(3846002)(97736004)(186003)(8936002)(6116002)(6506007)(86362001)(36756003)(305945005)(6486002)(6436002)(7736002)(386003)(5640700003)(14444005)(25786009)(26005)(6916009)(1076003)(99286004)(256004)(5660300002)(2351001)(486006)(52116002)(2906002)(73956011)(71200400001)(2501003)(14454004)(53936002)(71190400001)(66476007)(66556008)(68736007)(66066001)(476003)(316002)(72206003)(102836004)(478600001)(64756008)(66946007)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2933;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: st/CjE9b30/jTzXmrjkWXh7wmXU1rQFN+eaD3ir+Lf0TuyCReSnx90puJtxU45IGnMzOR94e5A4sI76f6KS6Je62A7NxIvUki3Dx6dJ9m43G86vivF1K83QeW+DOHx/aWSnHF0yh8/whGKO/vABR5jeQWSFfcQLhxgXmuiFqMPlS1G4Cmu8CEwYGYGD8YGGUKIW0cNqO17kUvKSdzlUCN10EysJhNCDtj9dV46SPVZCCa6qFIkKFHF/qcD334Ny554kr+OLgwfpH6CuxQnkSdbXm1EdBH7I63zUVKzmbqeY8LVo+CmywIcfGh+fY5rxeNKjuWIzaQW37+ysdU38SutKk8BCmYmCMRxz+cz31soBhSwDLIII8UN8o7VXr183jv3RHD0Cs7J7joeve+07KezNjpy5Njese8KG7mDDqo+s=
Content-ID: <02DAA9788BB3B242A0F477085A109778@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6c6872-303c-4065-982f-08d6cbad4794
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 07:44:02.2143 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bditjBce2lI3dHeVvS3Mm0wAaXXSM2CqtYDQBOoUoKs=;
 b=FvK42xgSBmgUY7p8ipTlwjSy8TnIgSZbl5kSBpkkDqIFO/cNrKmWffsBzNvd7SObMNpyXVCVlE2c7hFu8od8f1r4ZyzKZKqs7+WEKdKGZcfHlpVqOzcwCDw2Jtyqsd6ZUVe9Gq8vfPC04RyHVu07r8FBSBL8tIFnMPr5xBYexUM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QXNzb3J0ZWQgS0ZEIGNoYW5nZXMgdGhhdCBoYXZlIGJlZW4gYWNjdW11bGF0aW5nIG9uIGFtZC1r
ZmQtc3RhZ2luZy4gTmV3DQpmZWF0dXJlcyBhbmQgZml4ZXMgaW5jbHVkZWQ6DQoqIFN1cHBvcnQg
Zm9yIFZlZ2FNDQoqIFN1cHBvcnQgZm9yIHN5c3RlbXMgd2l0aCBtdWx0aXBsZSBQQ0kgZG9tYWlu
cw0KKiBOZXcgU0RNQSBxdWV1ZSB0eXBlIHRoYXQncyBvcHRpbWl6ZWQgZm9yIFhHTUkgbGlua3MN
CiogU0RNQSBNUUQgYWxsb2NhdGlvbiBjaGFuZ2VzIHRvIHN1cHBvcnQgZnV0dXJlIEFTSUNzIHdp
dGggbW9yZSBTRE1BIHF1ZXVlcw0KKiBGaXggZm9yIGNvbXB1dGUgcHJvZmlsZSBzd2l0Y2hpbmcg
YXQgcHJvY2VzcyB0ZXJtaW5hdGlvbg0KKiBGaXggZm9yIGEgY2lyY3VsYXIgbG9jayBkZXBlbmRl
bmN5IGluIE1NVSBub3RpZmllcnMNCiogRml4IGZvciBUTEIgZmx1c2hpbmcgYnVnIHdpdGggWEdN
SSBlbmFibGVkDQoqIEZpeCBmb3IgYXJ0aWZpY2lhbCBHVFQgc3lzdGVtIG1lbW9yeSBsaW1pdGF0
aW9uDQoqIFRyYXAgaGFuZGxlciB1cGRhdGVzDQoNCkFtYmVyIExpbiAoMSk6DQogIGRybS9hbWRr
ZmQ6IEFkZCBkb21haW4gbnVtYmVyIGludG8gZ3B1X2lkDQoNCkZlbGl4IEt1ZWhsaW5nICgxKToN
CiAgZHJtL2FtZGtmZDogRml4IGEgY2lyY3VsYXIgbG9jayBkZXBlbmRlbmN5DQoNCkhhcmlzaCBL
YXNpdmlzd2FuYXRoYW4gKDEpOg0KICBkcm0vYW1ka2ZkOiBGaXggY29tcHV0ZSBwcm9maWxlIHN3
aXRjaGluZw0KDQpKYXkgQ29ybndhbGwgKDQpOg0KICBkcm0vYW1ka2ZkOiBGaXggZ2Z4OCBNRU1f
VklPTCBleGNlcHRpb24gaGFuZGxlcg0KICBkcm0vYW1ka2ZkOiBQcmVzZXJ2ZSB3YXZlIHN0YXRl
IGFmdGVyIGluc3RydWN0aW9uIGZldGNoIE1FTV9WSU9MDQogIGRybS9hbWRrZmQ6IEZpeCBnZng5
IFhOQUNLIHN0YXRlIHNhdmUvcmVzdG9yZQ0KICBkcm0vYW1ka2ZkOiBQcmVzZXJ2ZSB0dG1wWzQ6
NV0gaW5zdGVhZCBvZiB0dG1wWzE0OjE1XQ0KDQpLZW50IFJ1c3NlbGwgKDIpOg0KICBkcm0vYW1k
a2ZkOiBBZGQgVmVnYU0gc3VwcG9ydA0KICBkcm0vYW1kZ3B1OiBGaXggR1RUIHNpemUgY2FsY3Vs
YXRpb24NCg0KT2FrIFplbmcgKDE2KToNCiAgZHJtL2FtZGtmZDogVXNlIDY0IGJpdCBzZG1hX2Jp
dG1hcA0KICBkcm0vYW1ka2ZkOiBBZGQgc2RtYSBhbGxvY2F0aW9uIGRlYnVnIG1lc3NhZ2UNCiAg
ZHJtL2FtZGtmZDogRGlmZmVyZW50aWF0ZSBiL3Qgc2RtYV9pZCBhbmQgc2RtYV9xdWV1ZV9pZA0K
ICBkcm0vYW1ka2ZkOiBTaGlmdCBzZG1hX2VuZ2luZV9pZCBhbmQgc2RtYV9xdWV1ZV9pZCBpbiBt
cWQNCiAgZHJtL2FtZGtmZDogRml4IGEgcG90ZW50aWFsIG1lbW9yeSBsZWFrDQogIGRybS9hbWRr
ZmQ6IEludHJvZHVjZSBhc2ljLXNwZWNpZmljIG1xZF9tYW5hZ2VyX2luaXQgZnVuY3Rpb24NCiAg
ZHJtL2FtZGtmZDogSW50cm9kdWNlIERJUSB0eXBlIG1xZCBtYW5hZ2VyDQogIGRybS9hbWRrZmQ6
IEluaXQgbXFkIG1hbmFnZXJzIGluIGRldmljZSBxdWV1ZSBtYW5hZ2VyIGluaXQNCiAgZHJtL2Ft
ZGtmZDogQWRkIG1xZCBzaXplIGluIG1xZCBtYW5hZ2VyIHN0cnVjdA0KICBkcm0vYW1ka2ZkOiBB
bGxvY2F0ZSBNUUQgdHJ1bmsgZm9yIEhJUSBhbmQgU0RNQQ0KICBkcm0vYW1ka2ZkOiBNb3ZlIG5v
bi1zZG1hIG1xZCBhbGxvY2F0aW9uIG91dCBvZiBpbml0X21xZA0KICBkcm0vYW1ka2ZkOiBBbGxv
Y2F0ZSBoaXEgYW5kIHNkbWEgbXFkIGZyb20gbXFkIHRydW5rDQogIGRybS9hbWRrZmQ6IEZpeCBz
ZG1hIHF1ZXVlIG1hcCBpc3N1ZQ0KICBkcm0vYW1ka2ZkOiBJbnRyb2R1Y2UgWEdNSSBTRE1BIHF1
ZXVlIHR5cGUNCiAgZHJtL2FtZGtmZDogRXhwb3NlIHNkbWEgZW5naW5lIG51bWJlcnMgdG8gdG9w
b2xvZ3kNCiAgZHJtL2FtZGtmZDogRGVsZXRlIGFsbG9jX2Zvcm1hdCBmaWVsZCBmcm9tIG1hcF9x
dWV1ZSBzdHJ1Y3QNCg0KWW9uZyBaaGFvICgxKToNCiAgZHJtL2FtZGtmZDogTW92ZSBzZG1hX3F1
ZXVlX2lkIGNhbGN1bGF0aW9uIGludG8gYWxsb2NhdGVfc2RtYV9xdWV1ZSgpDQoNCnNoYW95dW5s
ICgxKToNCiAgZHJtL2FtZGdwdTogVXNlIGhlYXZ5IHdlaWdodCBmb3IgdGxiIGludmFsaWRhdGlv
biBvbiB4Z21pDQogICAgY29uZmlndXJhdGlvbg0KDQogLi4uL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfYW1ka2ZkX2dmeF92OS5jIHwgIDUzICstDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3R0bS5jICAgICAgIHwgICA5ICstDQogLi4uL2dwdS9kcm0vYW1kL2FtZGtmZC9j
d3NyX3RyYXBfaGFuZGxlci5oICAgIHwgNDgzICsrKysrKysrKy0tLS0tLS0tLQ0KIC4uLi9kcm0v
YW1kL2FtZGtmZC9jd3NyX3RyYXBfaGFuZGxlcl9nZng4LmFzbSB8ICAxMyAtDQogLi4uL2RybS9h
bWQvYW1ka2ZkL2N3c3JfdHJhcF9oYW5kbGVyX2dmeDkuYXNtIHwgIDYzICstLQ0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jaGFyZGV2LmMgICAgICB8ICAgMiArDQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NyYXQuYyAgICAgICAgIHwgICA1ICsNCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgICAgICAgfCAgNTEgKysNCiAuLi4vZHJtL2Ft
ZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgfCAzNTQgKysrKysrKystLS0tLQ0K
IC4uLi9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuaCB8ICAxNCArLQ0K
IC4uLi9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlcl9jaWsuYyB8ICAgMiArDQog
Li4uL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyX3Y5LmMgIHwgICAxICsNCiAu
Li4vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXJfdmkuYyAgfCAgIDIgKw0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9mbGF0X21lbW9yeS5jICB8ICAgMSArDQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2tlcm5lbF9xdWV1ZS5jIHwgICA2ICstDQogLi4u
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfa2VybmVsX3F1ZXVlX3Y5LmMgIHwgICA0ICstDQogLi4u
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfa2VybmVsX3F1ZXVlX3ZpLmMgIHwgICA0ICstDQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyLmMgIHwgIDcwICsrLQ0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRfbWFuYWdlci5oICB8ICAgOCArDQogLi4u
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfY2lrLmMgIHwgIDUzICstDQogLi4u
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjkuYyAgIHwgIDg1ICstLQ0KIC4u
Li9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3ZpLmMgICB8ICA1MyArLQ0KIC4u
Li9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BhY2tldF9tYW5hZ2VyLmMgICB8ICAgNCArLQ0KIC4u
Li9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BtNF9oZWFkZXJzX2FpLmggICB8ICAgNyArLQ0KIC4u
Li9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BtNF9oZWFkZXJzX3ZpLmggICB8ICAgNyArLQ0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggICAgICAgICB8ICAxNCArLQ0KIC4u
Li9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzX3F1ZXVlX21hbmFnZXIuYyAgICB8ICAxNCArLQ0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF90b3BvbG9neS5jICAgICB8ICAxMyArLQ0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF90b3BvbG9neS5oICAgICB8ICAgMiArDQogZHJp
dmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2Npa19zdHJ1Y3RzLmggICAgIHwgICAzICstDQogZHJp
dmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL3Y5X3N0cnVjdHMuaCAgICAgIHwgICAzICstDQogZHJp
dmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL3ZpX3N0cnVjdHMuaCAgICAgIHwgICAzICstDQogaW5j
bHVkZS91YXBpL2xpbnV4L2tmZF9pb2N0bC5oICAgICAgICAgICAgICAgIHwgICA3ICstDQogMzMg
ZmlsZXMgY2hhbmdlZCwgODI2IGluc2VydGlvbnMoKyksIDU4NyBkZWxldGlvbnMoLSkNCg0KLS0g
DQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
