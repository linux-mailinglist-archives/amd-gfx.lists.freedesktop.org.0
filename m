Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259CEB59C
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Apr 2019 09:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB37891AC;
	Sun, 28 Apr 2019 07:44:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810055.outbound.protection.outlook.com [40.107.81.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCFE89166
 for <amd-gfx@lists.freedesktop.org>; Sun, 28 Apr 2019 07:44:15 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2933.namprd12.prod.outlook.com (20.179.91.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Sun, 28 Apr 2019 07:44:14 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.010; Sun, 28 Apr 2019
 07:44:14 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 15/27] drm/amdkfd: Fix sdma queue map issue
Thread-Topic: [PATCH 15/27] drm/amdkfd: Fix sdma queue map issue
Thread-Index: AQHU/ZYs6Jn/7zbTNkmk0Hc6QRfXnQ==
Date: Sun, 28 Apr 2019 07:44:13 +0000
Message-ID: <20190428074331.30107-16-Felix.Kuehling@amd.com>
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190428074331.30107-1-Felix.Kuehling@amd.com>
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
x-ms-office365-filtering-correlation-id: 27b50dab-a5f3-4ee3-0e03-08d6cbad4f1c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2933; 
x-ms-traffictypediagnostic: BYAPR12MB2933:
x-microsoft-antispam-prvs: <BYAPR12MB29334EB7C8BAC8D8F0738F4A92380@BYAPR12MB2933.namprd12.prod.outlook.com>
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(50226002)(81156014)(76176011)(54906003)(6512007)(4326008)(81166006)(8676002)(2616005)(3846002)(97736004)(186003)(8936002)(6116002)(6506007)(86362001)(36756003)(305945005)(6486002)(6436002)(7736002)(386003)(5640700003)(14444005)(25786009)(11346002)(26005)(6916009)(1076003)(99286004)(256004)(5660300002)(2351001)(486006)(52116002)(2906002)(73956011)(71200400001)(2501003)(14454004)(53936002)(71190400001)(66476007)(66556008)(68736007)(66066001)(476003)(316002)(72206003)(102836004)(478600001)(64756008)(66946007)(66446008)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2933;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: b98zCCUy8icswPfmVE93VJoGl02CAJjchBBmFi0ozA5ZUU8XwHv/ky2s1skI9HECUbvPBy4ZsThhkgONmm5OjXksozzXkngTiz0TGnDaSiGrxrf4Ra1GZHId3uoTkVt1GNc2nAxeGGYRTxKRmEPahrKhGrqiMv+6zCuZNo/wAredUjDcVXe36+oLfCKBranQ26aXh26HUArcnGTuQZZSoV4g0xRE0tjIjQ+fP7CT0u7iLeOA8H+uwv0r2nCtcWAkfKy69w9MKeYRUUaRaYpQUYlpo0rMCio2f0nniX7CCC9+BNDwl2CzIC0oCb0wDRcW9VJ+gDFeecJPxeVSTHDgGheaayG66Bjq4wgJ2LWo7fAaxyClfsYVduTzJ15U9X0FJcJNlcAyokun7dg4alk3klUkxJvJdvghVsaSykSPkXY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b50dab-a5f3-4ee3-0e03-08d6cbad4f1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 07:44:13.8964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFmwvyX/afxxlqJia3eWMV0XozMasCndvSDv00iSHqc=;
 b=ljUPaKZpEwVxikxqcQKOvrJnME6hdiqDdnF441DbblxCIK23Wm2QmlOkuUUXxCaLcWYTizbnfkCPVEB9pyQNoj3nHtPdlNuVqL8FfhodUhlwQ3+419Zk/4soI0cmJw7J1FC3YNvXSBa5cz/KIqvXmluwHUX2tyabQknevtT1s+s=
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQoNClByZXZpb3VzIGNvZGVzIGFzc3Vt
ZXMgdGhlcmUgYXJlIHR3byBzZG1hIGVuZ2luZXMuDQpUaGlzIGlzIG5vdCB0cnVlIGUuZy4sIFJh
dmVuIG9ubHkgaGFzIDEgU0RNQSBlbmdpbmUuDQpGaXggdGhlIGlzc3VlIGJ5IHVzaW5nIHNkbWEg
ZW5naW5lIG51bWJlciBpbmZvIGluDQpkZXZpY2VfaW5mby4NCg0KU2lnbmVkLW9mZi1ieTogT2Fr
IFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQpSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZl
bGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQpTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVs
aXguS3VlaGxpbmdAYW1kLmNvbT4NCi0tLQ0KIC4uLi9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNl
X3F1ZXVlX21hbmFnZXIuYyB8IDIxICsrKysrKysrKysrLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCmluZGV4IGJh
YzFmMzZkMzhhMi4uZDQxMDQ1ZDNmYzNhIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQpAQCAtMTIxMiwxMiArMTIx
MiwxNyBAQCBpbnQgYW1ka2ZkX2ZlbmNlX3dhaXRfdGltZW91dCh1bnNpZ25lZCBpbnQgKmZlbmNl
X2FkZHIsDQogCXJldHVybiAwOw0KIH0NCiANCi1zdGF0aWMgaW50IHVubWFwX3NkbWFfcXVldWVz
KHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KLQkJCQl1bnNpZ25lZCBpbnQgc2Rt
YV9lbmdpbmUpDQorc3RhdGljIGludCB1bm1hcF9zZG1hX3F1ZXVlcyhzdHJ1Y3QgZGV2aWNlX3F1
ZXVlX21hbmFnZXIgKmRxbSkNCiB7DQotCXJldHVybiBwbV9zZW5kX3VubWFwX3F1ZXVlKCZkcW0t
PnBhY2tldHMsIEtGRF9RVUVVRV9UWVBFX1NETUEsDQotCQkJS0ZEX1VOTUFQX1FVRVVFU19GSUxU
RVJfRFlOQU1JQ19RVUVVRVMsIDAsIGZhbHNlLA0KLQkJCXNkbWFfZW5naW5lKTsNCisJaW50IGks
IHJldHZhbCA9IDA7DQorDQorCWZvciAoaSA9IDA7IGkgPCBkcW0tPmRldi0+ZGV2aWNlX2luZm8t
Pm51bV9zZG1hX2VuZ2luZXM7IGkrKykgew0KKwkJcmV0dmFsID0gcG1fc2VuZF91bm1hcF9xdWV1
ZSgmZHFtLT5wYWNrZXRzLCBLRkRfUVVFVUVfVFlQRV9TRE1BLA0KKwkJCUtGRF9VTk1BUF9RVUVV
RVNfRklMVEVSX0RZTkFNSUNfUVVFVUVTLCAwLCBmYWxzZSwgaSk7DQorCQlpZiAocmV0dmFsKQ0K
KwkJCXJldHVybiByZXR2YWw7DQorCX0NCisJcmV0dXJuIHJldHZhbDsNCiB9DQogDQogLyogZHFt
LT5sb2NrIG11dGV4IGhhcyB0byBiZSBsb2NrZWQgYmVmb3JlIGNhbGxpbmcgdGhpcyBmdW5jdGlv
biAqLw0KQEAgLTEyNTYsMTAgKzEyNjEsOCBAQCBzdGF0aWMgaW50IHVubWFwX3F1ZXVlc19jcHNj
aChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCiAJcHJfZGVidWcoIkJlZm9yZSBk
ZXN0cm95aW5nIHF1ZXVlcywgc2RtYSBxdWV1ZSBjb3VudCBpcyA6ICV1XG4iLA0KIAkJZHFtLT5z
ZG1hX3F1ZXVlX2NvdW50KTsNCiANCi0JaWYgKGRxbS0+c2RtYV9xdWV1ZV9jb3VudCA+IDApIHsN
Ci0JCXVubWFwX3NkbWFfcXVldWVzKGRxbSwgMCk7DQotCQl1bm1hcF9zZG1hX3F1ZXVlcyhkcW0s
IDEpOw0KLQl9DQorCWlmIChkcW0tPnNkbWFfcXVldWVfY291bnQgPiAwKQ0KKwkJdW5tYXBfc2Rt
YV9xdWV1ZXMoZHFtKTsNCiANCiAJcmV0dmFsID0gcG1fc2VuZF91bm1hcF9xdWV1ZSgmZHFtLT5w
YWNrZXRzLCBLRkRfUVVFVUVfVFlQRV9DT01QVVRFLA0KIAkJCWZpbHRlciwgZmlsdGVyX3BhcmFt
LCBmYWxzZSwgMCk7DQotLSANCjIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
