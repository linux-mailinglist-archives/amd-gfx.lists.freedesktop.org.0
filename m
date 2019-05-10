Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6091A0ED
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 18:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5106E799;
	Fri, 10 May 2019 16:01:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750049.outbound.protection.outlook.com [40.107.75.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251DF6E79B
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 May 2019 16:01:34 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2577.namprd12.prod.outlook.com (52.132.27.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.14; Fri, 10 May 2019 16:01:32 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1856.012; Fri, 10 May 2019
 16:01:32 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 8/8] drm/amdkfd: PM4 packets change to support GWS
Thread-Topic: [PATCH 8/8] drm/amdkfd: PM4 packets change to support GWS
Thread-Index: AQHVB0miM9lfPbVHK0q3Ejwb+PLg4w==
Date: Fri, 10 May 2019 16:01:32 +0000
Message-ID: <1557504063-1559-8-git-send-email-Oak.Zeng@amd.com>
References: <1557504063-1559-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1557504063-1559-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::40) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6653378-cc2f-46dc-3127-08d6d560c52f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2577; 
x-ms-traffictypediagnostic: BL0PR12MB2577:
x-microsoft-antispam-prvs: <BL0PR12MB2577C1C5549FE52A8AC473A7800C0@BL0PR12MB2577.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(396003)(366004)(136003)(51234002)(189003)(199004)(99286004)(76176011)(6916009)(6436002)(5660300002)(68736007)(102836004)(386003)(486006)(86362001)(4326008)(2501003)(6486002)(54906003)(256004)(316002)(7736002)(305945005)(53936002)(8936002)(81156014)(52116002)(2351001)(476003)(6506007)(6512007)(2616005)(478600001)(2906002)(14454004)(5640700003)(81166006)(66446008)(64756008)(25786009)(71190400001)(66556008)(71200400001)(66476007)(11346002)(66066001)(3846002)(6116002)(66946007)(446003)(36756003)(72206003)(73956011)(8676002)(186003)(26005)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2577;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nKQnmWfqoPLHUtgJkiG1GrwkKvkRdRBi7YTWi1IoDn3bI3wncCdqedtatdRHKjEoOYogyu1volGg2RrJ/J0t6CAUFrfNetvsgP8a3PJQLzcWUnDSyMnCBYSe+g6TQvQtIvJAWv7Z/CsV+I6mbTu+bsHy2kFu7tfBp1NSS3TPmNmMzjpkXKJt7VLcNCfeAfQHukCbfoRiqSU8HhwA5DGgq+ARU6lDKzAWarMcIdxnRlhXWrCZE92jh3D/IM0RodS2zHyrwGhBYdsvL46j3WLYgb1Ya0Rg6ir6Mg7RWMq5TXgJwKpiW7hW0mM9cZy5jVsK982nlxOceoO9byRW1ya5SMAzz78vDo25R+r+0Q+lx2TE6fpmEAnmXmQKmoef5UCZUU68NtFwQZBLFpWOq4/6n20ayfASLSv4ccpMUJmGy/w=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6653378-cc2f-46dc-3127-08d6d560c52f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 16:01:32.4033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2577
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agj4Ee8jwosa+l7Hovpepvsdb2Zs+J+qbBKMrbAXadA=;
 b=1LDNiiINi/WQvXgGoIIxH0X+UzN2iOVi09+uyMzoAdpkQq4ukl9+HylZ6Htj094I/tihmhciP0Lx/FOAF5LtGbLDh7d+x7W/2TZM9bV6Lajh6J9aLgoZmcHOmD58XTllbH+wQrbk6qwcmVdLOY2hrx5bAdgPyjPye+UCPbJUQ5s=
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
