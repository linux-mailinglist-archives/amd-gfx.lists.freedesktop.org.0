Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AB626749
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2019 17:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C6089C33;
	Wed, 22 May 2019 15:51:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::605])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DB889C2A
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2019 15:51:37 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2578.namprd12.prod.outlook.com (52.132.27.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Wed, 22 May 2019 15:51:35 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1900.020; Wed, 22 May 2019
 15:51:35 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 7/7] drm/amdkfd: PM4 packets change to support GWS
Thread-Topic: [PATCH 7/7] drm/amdkfd: PM4 packets change to support GWS
Thread-Index: AQHVELY8b5uVrJmkG0itwE/QHTdDxA==
Date: Wed, 22 May 2019 15:51:35 +0000
Message-ID: <1558540278-23734-7-git-send-email-Oak.Zeng@amd.com>
References: <1558540278-23734-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1558540278-23734-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::14) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef74457e-b8fd-4dde-7a80-08d6decd5e67
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2578; 
x-ms-traffictypediagnostic: BL0PR12MB2578:
x-microsoft-antispam-prvs: <BL0PR12MB25787937F544933DECD1AB5480000@BL0PR12MB2578.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(39860400002)(346002)(376002)(136003)(199004)(189003)(51234002)(64756008)(66446008)(6916009)(8676002)(66476007)(66556008)(73956011)(316002)(102836004)(53936002)(68736007)(2906002)(2501003)(66946007)(76176011)(7736002)(52116002)(186003)(2351001)(305945005)(5640700003)(81166006)(81156014)(386003)(6506007)(8936002)(6436002)(6512007)(26005)(54906003)(256004)(478600001)(50226002)(11346002)(476003)(2616005)(446003)(486006)(71200400001)(3846002)(6116002)(66066001)(36756003)(71190400001)(99286004)(14454004)(25786009)(4326008)(86362001)(5660300002)(72206003)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2578;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jUbZAsbSJb8dO9QakbCBB5X3m4kLy2XkmvJLpc5xuMERTvLDK8gditA74MANhp/HXu72K/Qo6gvzTP+2GTX1vIbx0fjX8CU8Y639h++FJ2qONKuvDqeH1SeLs3UU4s2+M8831Xov4j3qkngrwP0o5g18TnkwCPAGplQA/4be1mwkYyQR0lyrlCff2XVQuoZU7zT9cAL7ju/DFbev6eCxJJ6WCikIBBl461AxFywEbiRlkaycYAN/EOuHrLqmWL3z8VZqVItSXKAmqnScymAaPnOAPT2d8u2adX89WCGruACaPoX/wVahKOCOB+jk7tpjW9zK4WFd4hI76vi5L3QrPrZj8JTp5pqHhzo81BZ0pD1Cz9XcRtFrmmqV2+DtWNDtd9RkWgxWqvw6Drvzz5KB1KKKtAZzqtoHQYS7XrDWL1M=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef74457e-b8fd-4dde-7a80-08d6decd5e67
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 15:51:35.6163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2578
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plmr9YxiRZqfDZTJqpWKd8Sx7vBrKnzFftYVkGGMKD4=;
 b=iMtUs4XyBGewy/1wtKCj53+qocB+8MolpROy3SOcoabnPipgXNK1d6oACkyVCey7H9pYuotz9R3RxCWTkweLpxjBzZV0IZWFPki2ecAz6Oe0GSyFMirEi1IqwyiLVzaBoyVQsQlAm0geAPM+cx1ev+j+HJSIgMUmVQllWZ5GJ58=
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
