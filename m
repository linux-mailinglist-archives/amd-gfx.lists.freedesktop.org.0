Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EF133742
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2019 19:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5570F892D3;
	Mon,  3 Jun 2019 17:51:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740044.outbound.protection.outlook.com [40.107.74.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3566C892D3
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 17:51:03 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0SPR01MB0021.namprd12.prod.outlook.com (20.177.146.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.16; Mon, 3 Jun 2019 17:51:01 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 17:51:01 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/5] drm/amdkfd: Only load sdma mqd when queue is active
Thread-Topic: [PATCH 2/5] drm/amdkfd: Only load sdma mqd when queue is active
Thread-Index: AQHVGjToYlMXrW/zHEKYLE+VplQ68w==
Date: Mon, 3 Jun 2019 17:51:01 +0000
Message-ID: <1559584248-12115-2-git-send-email-Oak.Zeng@amd.com>
References: <1559584248-12115-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1559584248-12115-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::31) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46ad84a8-654e-47bd-dfb5-08d6e84c0aa2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0SPR01MB0021; 
x-ms-traffictypediagnostic: BL0SPR01MB0021:
x-microsoft-antispam-prvs: <BL0SPR01MB00217B640CA8B7EF1CE70F4A80140@BL0SPR01MB0021.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(366004)(346002)(376002)(396003)(136003)(39860400002)(189003)(199004)(66066001)(6916009)(68736007)(2906002)(54906003)(99286004)(316002)(8936002)(26005)(6116002)(3846002)(486006)(52116002)(76176011)(186003)(14444005)(81156014)(81166006)(476003)(2616005)(11346002)(446003)(8676002)(102836004)(386003)(2501003)(53936002)(6506007)(4326008)(66556008)(7736002)(64756008)(305945005)(256004)(66946007)(5660300002)(71200400001)(71190400001)(4744005)(73956011)(36756003)(66476007)(478600001)(66446008)(6486002)(86362001)(14454004)(5640700003)(50226002)(6436002)(25786009)(2351001)(72206003)(6512007)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0SPR01MB0021;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: A+wCo683n5yYzuHQ+WVaGynxF2pNp4hOiR7I8YP6Md8BpPz8i8i12jw5VTPcCxTQ4uPXTfftR+y1R6oW1Ao7XcrSKG/VM6szzO0cXVtBVyQN8sSLdWoHeQGYrZSc8mwZrVe4ORnaWeukBH9B8FV5aW84CZHnUo254uCWoryx3RJ6Q8VoYfmHA/dfJYAOo6adDuvY7YZSgTbzTyizTGxOYjLOLYv55NZ2jJ25AeDN2eQi2aW13Ti/5fFhqB09jgAe5AjhxHHWFm4kRFWj4/OA3ZP9t1CJDzf9Oh9oyxCWILVUml2qqQNW9cMsqa/LnSy3Wgy9H9IBqfOk5z2IsOyiLd8X74IZ4ASpXxPRot+eoDjYHCmPgbNjxVkByVQxoPcRHeV/W51GHN4j/GlooR2ubG74Kbgv5kIduPLRCpds9aI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ad84a8-654e-47bd-dfb5-08d6e84c0aa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 17:51:01.6566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0SPR01MB0021
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9rm4c3TVNF69fTUQ6oV/J/rkSmPR3rVrf/uF3E5LZc=;
 b=CrHv+TRTvNLEO/ow+9Trz7OW0dYMXpO78+6zbnKcQ7dSc7QPqCloTSWP3+BfqsiAgA+S5iXlzULx4XvNe8Khhvj41uluLK2vWiKIJuHCXcmtvoyWRCNqVeyIzm47AKJX37Drpjuk27iSUiEdTbj/R2LdDkLXPEAu5qHvDmgrKkc=
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

QWxzbyBjYWxscyBsb2FkX21xZCB3aXRoIGN1cnJlbnQtPm1tIHN0cnVjdC4gVGhlIG1tDQpzdHJ1
Y3QgaXMgdXNlZCB0byByZWFkIGJhY2sgdXNlciB3cHRyIG9mIHRoZSBxdWV1ZS4NCg0KQ2hhbmdl
LUlkOiBJMGY2ZDA4NTg3ODM1OGRjZDNhNDEzMDU0ZGJlNjFkMWNhMGZkZjY2ZA0KU2lnbmVkLW9m
Zi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyB8IDUgKysrKy0NCiAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQppbmRl
eCBlNWNiZjIxLi5kYzFhNzBiIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQpAQCAtOTkwLDggKzk5MCwxMSBAQCBz
dGF0aWMgaW50IGNyZWF0ZV9zZG1hX3F1ZXVlX25vY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9t
YW5hZ2VyICpkcW0sDQogCWlmIChyZXR2YWwpDQogCQlnb3RvIG91dF9kZWFsbG9jYXRlX2Rvb3Ji
ZWxsOw0KIA0KKwlpZiAoIXEtPnByb3BlcnRpZXMuaXNfYWN0aXZlKQ0KKwkJcmV0dXJuIDA7DQor
DQogCXJldHZhbCA9IG1xZF9tZ3ItPmxvYWRfbXFkKG1xZF9tZ3IsIHEtPm1xZCwgMCwgMCwgJnEt
PnByb3BlcnRpZXMsDQotCQkJCU5VTEwpOw0KKwkJCQljdXJyZW50LT5tbSk7DQogCWlmIChyZXR2
YWwpDQogCQlnb3RvIG91dF91bmluaXRfbXFkOw0KIA0KLS0gDQoyLjcuNA0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
