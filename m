Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A9F33741
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2019 19:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72122892DE;
	Mon,  3 Jun 2019 17:51:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740070.outbound.protection.outlook.com [40.107.74.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EB0892DE
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 17:50:59 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0SPR01MB0021.namprd12.prod.outlook.com (20.177.146.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.16; Mon, 3 Jun 2019 17:50:57 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 17:50:57 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/5] drm/amdkfd: Only initialize sdma vm for sdma queues
Thread-Topic: [PATCH 1/5] drm/amdkfd: Only initialize sdma vm for sdma queues
Thread-Index: AQHVGjTl5S1sJZzp3U+hkJBgLNR40w==
Date: Mon, 3 Jun 2019 17:50:56 +0000
Message-ID: <1559584248-12115-1-git-send-email-Oak.Zeng@amd.com>
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
x-ms-office365-filtering-correlation-id: 4efd474c-7e54-4ee3-849c-08d6e84c07cc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0SPR01MB0021; 
x-ms-traffictypediagnostic: BL0SPR01MB0021:
x-microsoft-antispam-prvs: <BL0SPR01MB002180DFD1CE57FA8E5E1F3780140@BL0SPR01MB0021.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(376002)(396003)(136003)(39860400002)(189003)(199004)(66066001)(6916009)(68736007)(2906002)(54906003)(99286004)(316002)(8936002)(26005)(6116002)(3846002)(486006)(52116002)(186003)(14444005)(81156014)(81166006)(476003)(2616005)(8676002)(102836004)(386003)(2501003)(53936002)(6506007)(4326008)(66556008)(7736002)(64756008)(305945005)(256004)(66946007)(5660300002)(71200400001)(71190400001)(73956011)(36756003)(66476007)(478600001)(66446008)(6486002)(86362001)(14454004)(5640700003)(50226002)(6436002)(25786009)(2351001)(72206003)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0SPR01MB0021;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Uz73ukDrAM/YeG/LRkMjdy+d9JzX3WRa9V3py8u4UHwgS+TC44XdaBX8O4Wn4poqyff1adbGbGL8z8H3ttD0EtIGkcMTGCj4mRMGa1GteavILfN+6nN4CH1+3mRgornbs7bLu+wzKgT/tu2VStyAfUWq/3rlxZVgDg/m7bf6TUe5p1FBID7Wvqa7JQk/kHWEK4YZVIVMuL3ImwbyTvsHyaATrUyEv1sH7cRCSFS5KZP8AOa/RDUVSMxO9gBfQ6XUWe48q0Y368s/MB8Z0MzoFFIR5M05iTB+/WRqmErd90PzqPJjzW9hnBZq5BM9dMQ/1esnyeeIuxNn6r7XRTT96ryLpWR8Ii/ccEaYQmie2pDPJhrOSbIF8C9rlE2MO8iPwwPRqoosQUq8t3Mo0kFv8MBMJSVc0YdYGt4jFhR9OP8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4efd474c-7e54-4ee3-849c-08d6e84c07cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 17:50:57.1212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0SPR01MB0021
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/d+s/Q+gNVsYSglodmkm7QIfUNLVAstFfinkdGlUME=;
 b=AZyxmZiyvzLuJ1sjJRJUaB8U8chxAjD3tAXOfyR41bmoOG4K1aBmv+iueOYuIo9+Q7055z3FgsLOR4AJAI5FCPTr6wj1HI+vwHKpdMNLYMRL6VAxSrkFYUZSChpxbNiWiI/4XmRysbF/YNOVzKSU3X/4r7bsmyvlEZZolWBzYRk=
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

RG9uJ3QgZG8gdGhlIHNhbWUgZm9yIGNvbXB1dGUgcXVldWVzDQoNCkNoYW5nZS1JZDogSWQ1Zjc0
M2NhMTBjMmI3NjE1OTBiZmUxOGNhYjJmODAyZDNjMDRkMmQNClNpZ25lZC1vZmYtYnk6IE9hayBa
ZW5nIDxPYWsuWmVuZ0BhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgfCA0ICsrKy0NCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQppbmRleCBlY2UzNWM3Li5l
NWNiZjIxIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rldmlj
ZV9xdWV1ZV9tYW5hZ2VyLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9k
ZXZpY2VfcXVldWVfbWFuYWdlci5jDQpAQCAtMTIwNiw3ICsxMjA2LDkgQEAgc3RhdGljIGludCBj
cmVhdGVfcXVldWVfY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sIHN0cnVj
dCBxdWV1ZSAqcSwNCiAJCXEtPnByb3BlcnRpZXMuaXNfZXZpY3RlZCA9IChxLT5wcm9wZXJ0aWVz
LnF1ZXVlX3NpemUgPiAwICYmDQogCQkJCQkgICAgcS0+cHJvcGVydGllcy5xdWV1ZV9wZXJjZW50
ID4gMCAmJg0KIAkJCQkJICAgIHEtPnByb3BlcnRpZXMucXVldWVfYWRkcmVzcyAhPSAwKTsNCi0J
ZHFtLT5hc2ljX29wcy5pbml0X3NkbWFfdm0oZHFtLCBxLCBxcGQpOw0KKwlpZiAocS0+cHJvcGVy
dGllcy50eXBlID09IEtGRF9RVUVVRV9UWVBFX1NETUEgfHwNCisJCXEtPnByb3BlcnRpZXMudHlw
ZSA9PSBLRkRfUVVFVUVfVFlQRV9TRE1BX1hHTUkpDQorCQlkcW0tPmFzaWNfb3BzLmluaXRfc2Rt
YV92bShkcW0sIHEsIHFwZCk7DQogCXEtPnByb3BlcnRpZXMudGJhX2FkZHIgPSBxcGQtPnRiYV9h
ZGRyOw0KIAlxLT5wcm9wZXJ0aWVzLnRtYV9hZGRyID0gcXBkLT50bWFfYWRkcjsNCiAJcmV0dmFs
ID0gbXFkX21nci0+aW5pdF9tcWQobXFkX21nciwgJnEtPm1xZCwgJnEtPm1xZF9tZW1fb2JqLA0K
LS0gDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
