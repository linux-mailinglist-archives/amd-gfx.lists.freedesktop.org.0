Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3721228617
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 20:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B403E6E063;
	Thu, 23 May 2019 18:41:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on0600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB7E6E063
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2019 18:41:09 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2339.namprd12.prod.outlook.com (52.132.10.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Thu, 23 May 2019 18:41:07 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1900.020; Thu, 23 May 2019
 18:41:07 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 7/7] drm/amdkfd: PM4 packets change to support GWS
Thread-Topic: [PATCH 7/7] drm/amdkfd: PM4 packets change to support GWS
Thread-Index: AQHVEZcV5l/5hAdxFEy9+LXgAiu92w==
Date: Thu, 23 May 2019 18:41:06 +0000
Message-ID: <1558636843-9867-7-git-send-email-Oak.Zeng@amd.com>
References: <1558636843-9867-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1558636843-9867-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::24)
 To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33cbc3f2-ee9a-4523-7a4c-08d6dfae376f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2339; 
x-ms-traffictypediagnostic: BL0PR12MB2339:
x-microsoft-antispam-prvs: <BL0PR12MB233940B5D877C968A893E12C80010@BL0PR12MB2339.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(136003)(39860400002)(396003)(366004)(189003)(199004)(51234002)(81156014)(8676002)(8936002)(305945005)(81166006)(7736002)(68736007)(36756003)(50226002)(71200400001)(2351001)(4326008)(53936002)(71190400001)(486006)(476003)(99286004)(52116002)(6506007)(102836004)(5640700003)(25786009)(6512007)(66066001)(54906003)(386003)(76176011)(256004)(2906002)(66476007)(64756008)(186003)(26005)(86362001)(66946007)(66446008)(66556008)(73956011)(6116002)(6486002)(11346002)(2616005)(5660300002)(478600001)(2501003)(6916009)(3846002)(14454004)(446003)(72206003)(316002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2339;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 538z3oeJDWHifTH5cZ4H8foAgNZEouTUv9rxpnms4eXh9xLpsni9cURjj79V28EdXYDOaRRV+PKGKOQZmeNCPhjOgVAcKA5/RIAEiq8CPrSwNcoUi3rQ5mChqfRA7TVpJLAYkZIcLgHheKSSzkoZ9pE8ydcXijroVY+u9r7I1Mx5SyjZCOVBwbJxWV4DouXAvGtKBUlUTUr9W1AYwrsOld/+mltKz9b0hyfi7SuStX+HCfMZrUJ57CQXmUwApncAkxClg6vBJ+tBjZNHoGNI7+ATlVqN1F26uc34WjAP0UB5hzevjFxV/9Dh1utkeexcBDzSStw0uyeLORZZEpNPshdMQ2T37URh1KxSNhpbeHbfU5yfdiRPqg6fjXvQnVKL+Vj78uJXIGkP0Vlh2f4dxlYvJ4twkVCQ26Sk/7kK2kM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33cbc3f2-ee9a-4523-7a4c-08d6dfae376f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 18:41:06.9818 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2339
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plmr9YxiRZqfDZTJqpWKd8Sx7vBrKnzFftYVkGGMKD4=;
 b=l+gbFfxTZk7ekZtjyWYCmMZir4TdIZUeVBTQUZlbYQfRn7OQBrHByEHUtje2pDJ4KdJAJsR8h+KnDHqt85eqks+2f0bpcbwFQN+b6/OoCu1UNcFjg9RATt27EJDv+3HGeAYAUr+oyl+185k1CqNHa3REW/ItyVk7rFHi+phMIZI=
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
LmNvbT4NClJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNv
bT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9rZXJuZWxfcXVldWVfdjku
YyB8IDEgKw0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wbTRfaGVhZGVyc19haS5o
ICB8IDcgKysrKy0tLQ0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2tl
cm5lbF9xdWV1ZV92OS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2tlcm5lbF9x
dWV1ZV92OS5jDQppbmRleCAzZGQ3MzFjLi4wN2YwMmY4ZSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9rZXJuZWxfcXVldWVfdjkuYw0KKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX2tlcm5lbF9xdWV1ZV92OS5jDQpAQCAtMTU5LDYgKzE1OSw3
IEBAIHN0YXRpYyBpbnQgcG1fbWFwX3F1ZXVlc192OShzdHJ1Y3QgcGFja2V0X21hbmFnZXIgKnBt
LCB1aW50MzJfdCAqYnVmZmVyLA0KIA0KIAlwYWNrZXQtPmJpdGZpZWxkczIuZW5naW5lX3NlbCA9
DQogCQllbmdpbmVfc2VsX19tZXNfbWFwX3F1ZXVlc19fY29tcHV0ZV92aTsNCisJcGFja2V0LT5i
aXRmaWVsZHMyLmd3c19jb250cm9sX3F1ZXVlID0gcS0+Z3dzID8gMSA6IDA7DQogCXBhY2tldC0+
Yml0ZmllbGRzMi5xdWV1ZV90eXBlID0NCiAJCXF1ZXVlX3R5cGVfX21lc19tYXBfcXVldWVzX19u
b3JtYWxfY29tcHV0ZV92aTsNCiANCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfcG00X2hlYWRlcnNfYWkuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9wbTRfaGVhZGVyc19haS5oDQppbmRleCAwNjYxMzM5Li40OWFiNjZiIDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BtNF9oZWFkZXJzX2FpLmgNCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wbTRfaGVhZGVyc19haS5oDQpAQCAtMTc2LDgg
KzE3Niw3IEBAIHN0cnVjdCBwbTRfbWVzX21hcF9wcm9jZXNzIHsNCiANCiAJdW5pb24gew0KIAkJ
c3RydWN0IHsNCi0JCQl1aW50MzJfdCBudW1fZ3dzOjY7DQotCQkJdWludDMyX3QgcmVzZXJ2ZWQ3
OjE7DQorCQkJdWludDMyX3QgbnVtX2d3czo3Ow0KIAkJCXVpbnQzMl90IHNkbWFfZW5hYmxlOjE7
DQogCQkJdWludDMyX3QgbnVtX29hYzo0Ow0KIAkJCXVpbnQzMl90IHJlc2VydmVkODo0Ow0KQEAg
LTI3Miw3ICsyNzEsOSBAQCBzdHJ1Y3QgcG00X21lc19tYXBfcXVldWVzIHsNCiAJCXN0cnVjdCB7
DQogCQkJdWludDMyX3QgcmVzZXJ2ZWQxOjQ7DQogCQkJZW51bSBtZXNfbWFwX3F1ZXVlc19xdWV1
ZV9zZWxfZW51bSBxdWV1ZV9zZWw6MjsNCi0JCQl1aW50MzJfdCByZXNlcnZlZDI6MTU7DQorCQkJ
dWludDMyX3QgcmVzZXJ2ZWQ1OjY7DQorCQkJdWludDMyX3QgZ3dzX2NvbnRyb2xfcXVldWU6MTsN
CisJCQl1aW50MzJfdCByZXNlcnZlZDI6ODsNCiAJCQllbnVtIG1lc19tYXBfcXVldWVzX3F1ZXVl
X3R5cGVfZW51bSBxdWV1ZV90eXBlOjM7DQogCQkJdWludDMyX3QgcmVzZXJ2ZWQzOjI7DQogCQkJ
ZW51bSBtZXNfbWFwX3F1ZXVlc19lbmdpbmVfc2VsX2VudW0gZW5naW5lX3NlbDozOw0KLS0gDQoy
LjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
