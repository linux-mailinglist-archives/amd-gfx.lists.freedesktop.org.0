Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DF628D55
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 00:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381AF6E090;
	Thu, 23 May 2019 22:41:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780072.outbound.protection.outlook.com [40.107.78.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289046E090
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2019 22:41:22 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2451.namprd12.prod.outlook.com (52.132.11.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Thu, 23 May 2019 22:41:20 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1900.020; Thu, 23 May 2019
 22:41:20 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 7/8] drm/amdkfd: PM4 packets change to support GWS
Thread-Topic: [PATCH 7/8] drm/amdkfd: PM4 packets change to support GWS
Thread-Index: AQHVEbij8FyUazTY30CdUVoObMn6Sw==
Date: Thu, 23 May 2019 22:41:19 +0000
Message-ID: <1558651263-3478-7-git-send-email-Oak.Zeng@amd.com>
References: <1558651263-3478-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1558651263-3478-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::24) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80fa060b-55e1-4227-d2fc-08d6dfcfc628
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2451; 
x-ms-traffictypediagnostic: BL0PR12MB2451:
x-microsoft-antispam-prvs: <BL0PR12MB2451C256848A503FF38746A180010@BL0PR12MB2451.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(39860400002)(366004)(376002)(396003)(51234002)(199004)(189003)(66556008)(64756008)(71190400001)(66446008)(66476007)(71200400001)(446003)(73956011)(4326008)(478600001)(8676002)(25786009)(99286004)(2501003)(66946007)(66066001)(6436002)(6512007)(5640700003)(476003)(316002)(54906003)(6486002)(26005)(5660300002)(256004)(186003)(76176011)(486006)(102836004)(2616005)(11346002)(52116002)(386003)(6506007)(86362001)(68736007)(2906002)(6916009)(6116002)(3846002)(2351001)(305945005)(7736002)(14454004)(50226002)(53936002)(8936002)(81166006)(81156014)(36756003)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2451;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ddZ1bljGgLGO6pM2KVhQJ7C5uzblY0JIMrVB+AoM5DCS//jBw2aOB9ewUQNFO6VIhvTnlqSXR9wagH86qhEVA86hZWHsF7KYjJWtZydyWYsVV32bxlwAcWuG6J3HttVnUuzkMP7R2yah9pHDqtXzXloljmLccyevCMZp5KM4lo7K5eaim1MtzskhTPf4T0D98ajBqZPzvuYYA59Mq2g4m7Ct9rBXxZ/VAg2nKtxn9nhb5M3MMV+yFWLKmsPLgm2X6PR0Sl465h8za6OwCKO5L9FVpBl23RZWW7xBLXh7ZlYwXtkmTKnN+RKkgbNOX9PaHiHLHi4oqSkGEepz3Q/ZCPDfLK/HcOYnblBrTz/SVtT2arIsnl6KYlAfHCgHCs53ekqIJ5TG6419QrqmxTFGQl6OyoRey21gzhQAqChXDpk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80fa060b-55e1-4227-d2fc-08d6dfcfc628
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 22:41:19.8750 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2451
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plmr9YxiRZqfDZTJqpWKd8Sx7vBrKnzFftYVkGGMKD4=;
 b=Go5ebnjdUQcNwpMQ5b6n2OTh2lQqmbuZa8qC0GQzRLcFtaqd8kiDcQGj+7uRjAhSdBwULp00SF18qLVpc11aMpN+RVZQfTo1IaYPKsg5UmjMT7asvsvtsUYgDv6yrZGBylvLuaga5L+6TaSOI9bZ8bh+2XveRo0MzYKw9syzZp8=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng,
 Oak" <Oak.Zeng@amd.com>, "Keely, Sean" <Sean.Keely@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
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
