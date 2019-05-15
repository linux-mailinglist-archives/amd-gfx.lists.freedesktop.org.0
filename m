Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 740461FB92
	for <lists+amd-gfx@lfdr.de>; Wed, 15 May 2019 22:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35738926D;
	Wed, 15 May 2019 20:38:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770080.outbound.protection.outlook.com [40.107.77.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F5989258
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 May 2019 20:38:00 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2354.namprd12.prod.outlook.com (52.132.10.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.25; Wed, 15 May 2019 20:37:59 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 20:37:59 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 7/7] drm/amdkfd: PM4 packets change to support GWS
Thread-Topic: [PATCH 7/7] drm/amdkfd: PM4 packets change to support GWS
Thread-Index: AQHVC14VvCjXACPsQEmPA/OKzsyUkQ==
Date: Wed, 15 May 2019 20:37:59 +0000
Message-ID: <1557952664-12218-7-git-send-email-Oak.Zeng@amd.com>
References: <1557952664-12218-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1557952664-12218-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::17) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11a9dfcf-7e36-4fcb-0fb9-08d6d97537c4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2354; 
x-ms-traffictypediagnostic: BL0PR12MB2354:
x-microsoft-antispam-prvs: <BL0PR12MB2354FA1745E31DCACF3D282380090@BL0PR12MB2354.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(376002)(136003)(39860400002)(396003)(189003)(199004)(51234002)(53936002)(52116002)(66556008)(64756008)(26005)(81156014)(2351001)(66476007)(81166006)(99286004)(71200400001)(50226002)(2501003)(7736002)(2906002)(36756003)(66066001)(8676002)(54906003)(6116002)(3846002)(76176011)(71190400001)(8936002)(186003)(5660300002)(305945005)(102836004)(66446008)(316002)(386003)(6506007)(6916009)(256004)(486006)(4326008)(6436002)(86362001)(478600001)(25786009)(446003)(68736007)(73956011)(11346002)(66946007)(72206003)(2616005)(476003)(5640700003)(6512007)(14454004)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2354;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LwRRzsQidRJ1+D7WWSQyVgx2h34dtQ0b94tnxbrhTY4tTe95OcaurdnprrDIMKFkmCJ5RkLiZ5NIJWrhzaDKvnFEMsq5QBx7xzHwh4h+Hj4aFD8wx/cCL7cuTXuW7u4Sk/KF4W1dj9FyM8s7nqaciq9ALGVlENXklxxyWG0T9NQQPBQQ/wiPos2FjDThrNPUI8MBjOVx4Z76DM9RGI42qTV0hsLa4GE0H5HYNxUrssYvge2qg8Ij+AU8JoMPCTZM9GxtBWnQmSjat/Ts8OIg7VjQ02Xa8vgUWz7JBbT1S4smGIgsQV74kRrJpxQuYpIRgQvo/xfYebKdInDZ5FOzffemR8dOPCLVfWP5PzkgSI4gX7wOKiNGyAr+G9g1mSXmFe0Dundx4z/POzNQFEAkeKGacK7ALDijoutFyBp12Ck=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a9dfcf-7e36-4fcb-0fb9-08d6d97537c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 20:37:59.2049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agj4Ee8jwosa+l7Hovpepvsdb2Zs+J+qbBKMrbAXadA=;
 b=tc9a6Xy3u/uVCYOgrHn6KMvZP9HCTe8O9p744pp8WAURSgqSXZ90uKKTecJTtY6qFwV+zGacQtB0zUhFsrK0lkGa8JaVdE16H4IPmPL8qqlUgjtCMljoyk2NwELZXwTAqnrl2vyjTrLtlsStxCOdBecewz3ojpa/a8QB2FNSH78=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>,
 "Keely, Sean" <Sean.Keely@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIGEgZmllbGQgaW4gbWFwX3F1ZXVlcyBwYWNrZXQgdG8gaW5kaWNhdGUgd2hldGhlcg0KdGhp
cyBpcyBhIGd3cyBjb250cm9sIHF1ZXVlLiBPbmx5IG9uZSBxdWV1ZSBwZXIgcHJvY2Vzcw0KY2Fu
IGJlIGd3cyBjb250cm9sIHF1ZXVlLiBDaGFuZ2UgbnVtX2d3cyBmaWVsZCBpbg0KbWFwX3Byb2Nl
c3MgcGFja2V0IHRvIDcgYml0cw0KDQpDaGFuZ2UtSWQ6IEkwZGI5MWQ5OWM2OTYyZDE0ZjkyMDJi
MmViOTUwZjhlN2U0OTdiNzllDQpTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1k
LmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9rZXJuZWxfcXVldWVf
djkuYyB8IDEgKw0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wbTRfaGVhZGVyc19h
aS5oICB8IDcgKysrKy0tLQ0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2tlcm5lbF9xdWV1ZV92OS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2tlcm5l
bF9xdWV1ZV92OS5jDQppbmRleCAzZGQ3MzFjLi4wN2YwMmY4ZSAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9rZXJuZWxfcXVldWVfdjkuYw0KKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2tlcm5lbF9xdWV1ZV92OS5jDQpAQCAtMTU5LDYgKzE1
OSw3IEBAIHN0YXRpYyBpbnQgcG1fbWFwX3F1ZXVlc192OShzdHJ1Y3QgcGFja2V0X21hbmFnZXIg
KnBtLCB1aW50MzJfdCAqYnVmZmVyLA0KIA0KIAlwYWNrZXQtPmJpdGZpZWxkczIuZW5naW5lX3Nl
bCA9DQogCQllbmdpbmVfc2VsX19tZXNfbWFwX3F1ZXVlc19fY29tcHV0ZV92aTsNCisJcGFja2V0
LT5iaXRmaWVsZHMyLmd3c19jb250cm9sX3F1ZXVlID0gcS0+Z3dzID8gMSA6IDA7DQogCXBhY2tl
dC0+Yml0ZmllbGRzMi5xdWV1ZV90eXBlID0NCiAJCXF1ZXVlX3R5cGVfX21lc19tYXBfcXVldWVz
X19ub3JtYWxfY29tcHV0ZV92aTsNCiANCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfcG00X2hlYWRlcnNfYWkuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9wbTRfaGVhZGVyc19haS5oDQppbmRleCAwNjYxMzM5Li40OWFiNjZiIDEwMDY0NA0KLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BtNF9oZWFkZXJzX2FpLmgNCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wbTRfaGVhZGVyc19haS5oDQpAQCAtMTc2
LDggKzE3Niw3IEBAIHN0cnVjdCBwbTRfbWVzX21hcF9wcm9jZXNzIHsNCiANCiAJdW5pb24gew0K
IAkJc3RydWN0IHsNCi0JCQl1aW50MzJfdCBudW1fZ3dzOjY7DQotCQkJdWludDMyX3QgcmVzZXJ2
ZWQ3OjE7DQorCQkJdWludDMyX3QgbnVtX2d3czo3Ow0KIAkJCXVpbnQzMl90IHNkbWFfZW5hYmxl
OjE7DQogCQkJdWludDMyX3QgbnVtX29hYzo0Ow0KIAkJCXVpbnQzMl90IHJlc2VydmVkODo0Ow0K
QEAgLTI3Miw3ICsyNzEsOSBAQCBzdHJ1Y3QgcG00X21lc19tYXBfcXVldWVzIHsNCiAJCXN0cnVj
dCB7DQogCQkJdWludDMyX3QgcmVzZXJ2ZWQxOjQ7DQogCQkJZW51bSBtZXNfbWFwX3F1ZXVlc19x
dWV1ZV9zZWxfZW51bSBxdWV1ZV9zZWw6MjsNCi0JCQl1aW50MzJfdCByZXNlcnZlZDI6MTU7DQor
CQkJdWludDMyX3QgcmVzZXJ2ZWQ1OjY7DQorCQkJdWludDMyX3QgZ3dzX2NvbnRyb2xfcXVldWU6
MTsNCisJCQl1aW50MzJfdCByZXNlcnZlZDI6ODsNCiAJCQllbnVtIG1lc19tYXBfcXVldWVzX3F1
ZXVlX3R5cGVfZW51bSBxdWV1ZV90eXBlOjM7DQogCQkJdWludDMyX3QgcmVzZXJ2ZWQzOjI7DQog
CQkJZW51bSBtZXNfbWFwX3F1ZXVlc19lbmdpbmVfc2VsX2VudW0gZW5naW5lX3NlbDozOw0KLS0g
DQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
