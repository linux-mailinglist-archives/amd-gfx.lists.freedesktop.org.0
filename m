Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A38B46385
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jun 2019 17:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92C589A62;
	Fri, 14 Jun 2019 15:59:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA7589A62
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 15:59:44 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2403.namprd12.prod.outlook.com (52.132.11.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Fri, 14 Jun 2019 15:59:42 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61%4]) with mapi id 15.20.1987.013; Fri, 14 Jun 2019
 15:59:42 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: Set gws_mask to 64 bit 1s
Thread-Topic: [PATCH] drm/amdkfd: Set gws_mask to 64 bit 1s
Thread-Index: AQHVIsotz50EMl3zyE2mDAYgdJl9qg==
Date: Fri, 14 Jun 2019 15:59:42 +0000
Message-ID: <1560527975-18868-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::28) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3cb27ce8-4d2d-4928-59ac-08d6f0e1502e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2403; 
x-ms-traffictypediagnostic: BL0PR12MB2403:
x-microsoft-antispam-prvs: <BL0PR12MB24031795CD4522212FDBEF6E80EE0@BL0PR12MB2403.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:644;
x-forefront-prvs: 0068C7E410
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(376002)(346002)(39860400002)(136003)(199004)(189003)(86362001)(50226002)(2616005)(5660300002)(6916009)(7736002)(476003)(68736007)(486006)(66066001)(4326008)(36756003)(8676002)(4744005)(2501003)(81166006)(81156014)(8936002)(71190400001)(73956011)(71200400001)(66946007)(66556008)(25786009)(64756008)(66446008)(66476007)(6486002)(386003)(14454004)(102836004)(26005)(99286004)(478600001)(53936002)(6436002)(6506007)(6512007)(2906002)(305945005)(6116002)(5640700003)(186003)(52116002)(54906003)(72206003)(3846002)(316002)(2351001)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2403;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hSr05K281j4U/Wh/UKNtc8gS76IdkyzKppMRefilF3USWiywg2ozFNu9X0kjrCW8vMBGa4ad6KgV/J+pLgb0VexxxS7bhNf5teEqqRrshTJ7LodbyM+3/S+TIIf1wT35RZCsLDBJK80zWKhSdfbIvbHEIYBo1EyDXzlhBGIt4Vp7T3dBfj37QBEgJMIG2UJywss8of8HMPidf8hkKFitffKjFp+eSZd+Oh1NdEPhED2alrlelujy+anL/9O6ZJAsinmYRr1v5t3PisTg4u/n6ETK34Dfs2ua8wj6vPUskBS95n0h4Y44ca+UGWDJ2DUhnTbN3anxeXKFdl6Bf51ysGs18eAeIC1LJMTEUdExHvd9hAXt0MMQ+M02+rjQKdcTlXuZ+hhIJV2HdbjTS4dunL7kA7stf0+wWschCGo4sgU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb27ce8-4d2d-4928-59ac-08d6f0e1502e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2019 15:59:42.7254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2403
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvjZBawOge3UWLXi9WPojdsvFA1BXSy71y/UHu5R8U8=;
 b=C3tWR/WTrbbfMH/hySkJglC2SqYaK6B3IbtaeYS0dlOrZbulkjHu3V37ci8uJGBod2PmBv9quvS76cQ+iYCWFDJk2xFjL7evf5upDee7xlIR9OTKuaOfFARnzTbEdlsYHi474bT3l4h1WUDq57EWuYJnbb6/VQeMri6LH+d1ftc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UHJldmlvdXMga2ZkIGRvZXNuJ3QgdXNlIGd3cyBzbyB0aGlzIG1hc2sgd2FzIHNldCB0byAwLg0K
U2V0IGl0IHRvIDY0IGJpdCAxcyBiZWNhdXNlIG5vdyBrZmQgY2FuIHVzZSBhbGwgNjQgZ3dzDQpy
ZXNvdXJjZXMuDQoNCkNoYW5nZS1JZDogSWM4MjE3ZDZkMTM1MDk5ZjMzOTUwMTdiYmM5YzBmZTk0
YTczOWFhOTMNClNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPg0KLS0t
DQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMg
fCA0ICsrLS0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9x
dWV1ZV9tYW5hZ2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1
ZXVlX21hbmFnZXIuYw0KaW5kZXggZTVjNmRiMS4uMjUwNzk4YiAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQorKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KQEAg
LTk5Myw4ICs5OTMsOCBAQCBzdGF0aWMgaW50IHNldF9zY2hlZF9yZXNvdXJjZXMoc3RydWN0IGRl
dmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0pDQogDQogCQlyZXMucXVldWVfbWFzayB8PSAoMXVsbCA8
PCBpKTsNCiAJfQ0KLQlyZXMuZ3dzX21hc2sgPSByZXMub2FjX21hc2sgPSByZXMuZ2RzX2hlYXBf
YmFzZSA9DQotCQkJCQkJcmVzLmdkc19oZWFwX3NpemUgPSAwOw0KKwlyZXMuZ3dzX21hc2sgPSAw
eEZGRkZGRkZGRkZGRkZGRkY7DQorCXJlcy5vYWNfbWFzayA9IHJlcy5nZHNfaGVhcF9iYXNlID0g
cmVzLmdkc19oZWFwX3NpemUgPSAwOw0KIA0KIAlwcl9kZWJ1ZygiU2NoZWR1bGluZyByZXNvdXJj
ZXM6XG4iDQogCQkJInZtaWQgbWFzazogMHglOFhcbiINCi0tIA0KMi43LjQNCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
