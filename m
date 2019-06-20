Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EDD4DA7C
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 21:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CF36E578;
	Thu, 20 Jun 2019 19:43:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780084.outbound.protection.outlook.com [40.107.78.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6A76E575
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 19:43:29 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3578.namprd12.prod.outlook.com (20.178.199.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 20 Jun 2019 19:43:27 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 19:43:27 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/1] drm/amdkfd: Print a warning when the runlist becomes
 oversubscribed
Thread-Topic: [PATCH 1/1] drm/amdkfd: Print a warning when the runlist becomes
 oversubscribed
Thread-Index: AQHVJ6Bu8AHyw8lXiEi/31pwu70W9g==
Date: Thu, 20 Jun 2019 19:43:27 +0000
Message-ID: <20190620194309.11148-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTBPR01CA0019.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::32) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b97f3ef-801d-46c3-3871-08d6f5b79062
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3578; 
x-ms-traffictypediagnostic: DM6PR12MB3578:
x-microsoft-antispam-prvs: <DM6PR12MB35785151966A9AD6A1F46ED492E40@DM6PR12MB3578.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(39860400002)(366004)(396003)(136003)(189003)(199004)(52116002)(66946007)(50226002)(8936002)(186003)(99286004)(7736002)(2501003)(1076003)(476003)(66446008)(5660300002)(478600001)(2906002)(66556008)(66476007)(53936002)(2616005)(6512007)(6436002)(72206003)(26005)(5640700003)(64756008)(2351001)(36756003)(25786009)(73956011)(305945005)(6916009)(68736007)(14454004)(4326008)(386003)(6486002)(71190400001)(316002)(6116002)(102836004)(14444005)(3846002)(6506007)(8676002)(486006)(66066001)(81156014)(256004)(86362001)(81166006)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3578;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tKzzw2ynubl0ws3OaZloFWc+2qGFzQ4bPdGZVUk6i8kCZXYz0z1xnS1oKCAgMLNPviNmLp4c6nK8++2KcI60w2ctX8xUoRlnL4PuZwzxkmb7z5hzgC6j3fyiiNHUxa54MJk6+TR1Xs9c4DmkPE7zmOD6aeraFSycCrHNzv1JkH33p7IS+wc3n8EVMxuufPhbk1Yo7Xsl0YH8OtybSDoOreaR0nQrl8xMZU4wRCMBxnLD274X0oI6JR+Yk0aqikarD09NyhRGvUimsmTCYq6iZvgE3m2Z+cwBswLb/LyaTEYTzHCdD39P/KjvlbTGhnOlIbQGfqWIvW+t8+OlSjN/VCpUqCUOuFRp6g65UFnpQ0DkZXwvCLcvlQXw3uH9990E+r8x+JW6v0LBGcpRJ2/JjZa991v5wJ4UAc/g94huEgM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b97f3ef-801d-46c3-3871-08d6f5b79062
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 19:43:27.3757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3578
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZPdqWcSaZvwJLWaJA9C6ekHG9SHtpLdRqq1Gf9rCL0=;
 b=oybAcKrDuacMa6BYkPdqI/FTfNCnx+DHlUys5/fG4GewhRCvjfCDO7sYQe0tnmBaj/t0v67OtZUbkTU3Ht+ovpJO+VZZvEh7JSynxGwaIlKY+XQerM8Dy9x9svVoryGsvXGNWO3v6Iw5YAk6GU5Vd6JYUTQX5rQ7mZsB57Xpz54=
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

T3ZlcnN1YnNjcmlwdGlvbiBvZiBxdWV1ZXMgb3IgcHJvY2Vzc2VzIHJlc3VsdHMgaW4gcG9vciBw
ZXJmb3JtYW5jZQ0KbW9zdGx5IGJlY2F1c2UgSFdTIGJsaW5ibHkgc2NoZWR1bGVzIGJ1c3kgYW5k
IGlkbGUgcXVldWVzLCByZXN1bHRpbmcNCmluIHBvb3Igb2NjdXBhbmN5IGlmIG1hbnkgcXVldWVz
IGFyZSBpZGxlLg0KDQpMZXQgdXNlcnMga25vdyB3aXRoIGEgd2FybmluZyBtZXNzYWdlIHdoZW4g
dHJhbnNpdGlvbmluZyBmcm9tIGENCm5vbi1vdmVyc3Vic2NyaWJlZCB0byBhbiBvdmVyc3Vic2Ny
aWJlZCBydW5saXN0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3Vl
aGxpbmdAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wYWNr
ZXRfbWFuYWdlci5jIHwgNiArKysrKy0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
cHJpdi5oICAgICAgICAgICB8IDEgKw0KIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfcGFja2V0X21hbmFnZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9w
YWNrZXRfbWFuYWdlci5jDQppbmRleCBjNzJjOGY1ZmQ1NGMuLmNjZjZiMjMxMDMxNiAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wYWNrZXRfbWFuYWdlci5jDQor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcGFja2V0X21hbmFnZXIuYw0KQEAg
LTIwMywxMSArMjAzLDE1IEBAIHN0YXRpYyBpbnQgcG1fY3JlYXRlX3J1bmxpc3RfaWIoc3RydWN0
IHBhY2tldF9tYW5hZ2VyICpwbSwNCiANCiAJcHJfZGVidWcoIkZpbmlzaGVkIG1hcCBwcm9jZXNz
IGFuZCBxdWV1ZXMgdG8gcnVubGlzdFxuIik7DQogDQotCWlmIChpc19vdmVyX3N1YnNjcmlwdGlv
bikNCisJaWYgKGlzX292ZXJfc3Vic2NyaXB0aW9uKSB7DQorCQlpZiAoIXBtLT5pc19vdmVyX3N1
YnNjcmlwdGlvbikNCisJCQlwcl93YXJuKCJSdW5saXN0IGlzIGdldHRpbmcgb3ZlcnN1YnNjcmli
ZWQuIEV4cGVjdCByZWR1Y2VkIFJPQ20gcGVyZm9ybWFuY2UuXG4iKTsNCiAJCXJldHZhbCA9IHBt
LT5wbWYtPnJ1bmxpc3QocG0sICZybF9idWZmZXJbcmxfd3B0cl0sDQogCQkJCQkqcmxfZ3B1X2Fk
ZHIsDQogCQkJCQlhbGxvY19zaXplX2J5dGVzIC8gc2l6ZW9mKHVpbnQzMl90KSwNCiAJCQkJCXRy
dWUpOw0KKwl9DQorCXBtLT5pc19vdmVyX3N1YnNjcmlwdGlvbiA9IGlzX292ZXJfc3Vic2NyaXB0
aW9uOw0KIA0KIAlmb3IgKGkgPSAwOyBpIDwgYWxsb2Nfc2l6ZV9ieXRlcyAvIHNpemVvZih1aW50
MzJfdCk7IGkrKykNCiAJCXByX2RlYnVnKCIweCUyWCAiLCBybF9idWZmZXJbaV0pOw0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oDQppbmRleCA0MDcwZTZkMjRlZjcuLmQ0YmJhMDEy
NGQyOSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgN
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgNCkBAIC05MzcsNiAr
OTM3LDcgQEAgc3RydWN0IHBhY2tldF9tYW5hZ2VyIHsNCiAJYm9vbCBhbGxvY2F0ZWQ7DQogCXN0
cnVjdCBrZmRfbWVtX29iaiAqaWJfYnVmZmVyX29iajsNCiAJdW5zaWduZWQgaW50IGliX3NpemVf
Ynl0ZXM7DQorCWJvb2wgaXNfb3Zlcl9zdWJzY3JpcHRpb247DQogDQogCWNvbnN0IHN0cnVjdCBw
YWNrZXRfbWFuYWdlcl9mdW5jcyAqcG1mOw0KIH07DQotLSANCjIuMTcuMQ0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
