Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2258B464FF
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jun 2019 18:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E0689650;
	Fri, 14 Jun 2019 16:51:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720065.outbound.protection.outlook.com [40.107.72.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AFF89650
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 16:51:20 +0000 (UTC)
Received: from MWHPR12MB1311.namprd12.prod.outlook.com (10.169.206.148) by
 MWHPR12MB1248.namprd12.prod.outlook.com (10.169.206.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Fri, 14 Jun 2019 16:51:18 +0000
Received: from MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8]) by MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8%8]) with mapi id 15.20.1987.013; Fri, 14 Jun 2019
 16:51:18 +0000
From: "StDenis, Tom" <Tom.StDenis@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/amdgpu: cast mem->num_pages to 64-bits when shifting
Thread-Topic: [PATCH] drm/amd/amdgpu: cast mem->num_pages to 64-bits when
 shifting
Thread-Index: AQHVItFjqqx8iWFz9ketxi+qnnOTQg==
Date: Fri, 14 Jun 2019 16:51:18 +0000
Message-ID: <20190614165108.23011-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR06CA0049.namprd06.prod.outlook.com
 (2603:10b6:405:3a::38) To MWHPR12MB1311.namprd12.prod.outlook.com
 (2603:10b6:300:13::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae744a9e-23f2-4d65-aa34-08d6f0e88586
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1248; 
x-ms-traffictypediagnostic: MWHPR12MB1248:
x-microsoft-antispam-prvs: <MWHPR12MB1248305C33B9974E4C4DF341F7EE0@MWHPR12MB1248.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0068C7E410
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(366004)(136003)(396003)(189003)(199004)(8676002)(50226002)(2501003)(486006)(26005)(476003)(2351001)(2616005)(81156014)(73956011)(66066001)(316002)(81166006)(186003)(68736007)(8936002)(71200400001)(3846002)(36756003)(6916009)(6116002)(66446008)(2906002)(52116002)(99286004)(66476007)(66556008)(64756008)(1076003)(256004)(4326008)(25786009)(71190400001)(72206003)(305945005)(5640700003)(478600001)(14454004)(6506007)(386003)(86362001)(102836004)(6436002)(6486002)(5660300002)(66946007)(7736002)(6512007)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1248;
 H:MWHPR12MB1311.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CWKRMHqT22HnpOVkPWt3bXGq1PaA9Gcnf/L9ZHCcPBc62thj/tjJ5sFpglvSJizwWl/VZ2w1yRGh1YNfXkdCKtaCNJwnOcI+EptkxFmLFYAUtVjtzWGyIAuvX49s2M5HDOEUNda0XLcKu5NuGNOfU6jMEvLdbRunQmlR0Lrr0vVB5VkpIUlcwIJXbkv+rwTVWkpWFW1Bl3ualRnlRGayjImJAjoR67IqoYIOiSOXDyhbJiB0HG+DWhylg6Jnno97Qr2fUlahlFx0msBLvY7Sg7zx3aqfDpDtAp39/Dl7JI8Uk2xoIG8F7hCBDqldrMh9SNmbJb1BrZIgPWzj8laPUH2hWM5DkTRh+QXz3pOgAduQRpWBWAwCHFUOfriN6SBr+Y5XMwZyjIqp+y/AvVEMOTfhDKNHXw3gjHCXT5m5P2I=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae744a9e-23f2-4d65-aa34-08d6f0e88586
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2019 16:51:18.6911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tstdenis@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1248
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DG5lTErmH2ZerA0vM0T/LNtVJONPrFFog9IGL4g5UQ=;
 b=uPgikg9TrO95TFRZHLtYvbR5/ZB4vquDJfA6JXIzwAAYyI9/xyYsWqyuBnr2QEjHqubHXMMRyiMaQwJvHeARCB6h6ah8aVX56hA9yIdyw5+P/NGpZ/Cgbak5k0Y9rKoN6J/eQJx0/a/lrtbPCTmelsTIVBOi075wA2Sq8nXj9Qg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tom.StDenis@amd.com; 
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
Cc: "StDenis, Tom" <Tom.StDenis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMzItYml0IGhvc3RzIG1lbS0+bnVtX3BhZ2VzIGlzIDMyLWJpdHMgYW5kIGNhbiBvdmVyZmxv
dw0Kd2hlbiBzaGlmdGVkLiAgQWRkIGEgY2FzdCB0byBhdm9pZCB0aGlzLg0KDQpTaWduZWQtb2Zm
LWJ5OiBUb20gU3QgRGVuaXMgPHRvbS5zdGRlbmlzQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYyB8IDggKysrKystLS0NCiAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYw0KaW5kZXggYzk2M2FkODYwNzJlLi4z
MTg5NWQzYzMzZGUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdnJhbV9tZ3IuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zy
YW1fbWdyLmMNCkBAIC0yNzksMTQgKzI3OSwxNiBAQCBzdGF0aWMgaW50IGFtZGdwdV92cmFtX21n
cl9uZXcoc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4sDQogCXVpbnQ2NF90IHZpc191
c2FnZSA9IDA7DQogCXVuc2lnbmVkIGk7DQogCWludCByOw0KKwl1aW50NjRfdCBtZW1fYnl0ZXM7
DQogDQogCWxwZm4gPSBwbGFjZS0+bHBmbjsNCiAJaWYgKCFscGZuKQ0KIAkJbHBmbiA9IG1hbi0+
c2l6ZTsNCiANCiAJLyogYmFpbCBvdXQgcXVpY2tseSBpZiB0aGVyZSdzIGxpa2VseSBub3QgZW5v
dWdoIFZSQU0gZm9yIHRoaXMgQk8gKi8NCi0JaWYgKGF0b21pYzY0X2FkZF9yZXR1cm4obWVtLT5u
dW1fcGFnZXMgPDwgUEFHRV9TSElGVCwgJm1nci0+dXNhZ2UpID4gYWRldi0+Z21jLm1jX3ZyYW1f
c2l6ZSkgew0KLQkJYXRvbWljNjRfc3ViKG1lbS0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQsICZt
Z3ItPnVzYWdlKTsNCisJbWVtX2J5dGVzID0gKHU2NCltZW0tPm51bV9wYWdlcyA8PCBQQUdFX1NI
SUZUOw0KKwlpZiAoYXRvbWljNjRfYWRkX3JldHVybihtZW1fYnl0ZXMsICZtZ3ItPnVzYWdlKSA+
IGFkZXYtPmdtYy5tY192cmFtX3NpemUpIHsNCisJCWF0b21pYzY0X3N1YihtZW1fYnl0ZXMsICZt
Z3ItPnVzYWdlKTsNCiAJCW1lbS0+bW1fbm9kZSA9IE5VTEw7DQogCQlyZXR1cm4gMDsNCiAJfQ0K
QEAgLTMwOCw3ICszMTAsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV92cmFtX21ncl9uZXcoc3RydWN0
IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4sDQogCW5vZGVzID0ga3ZtYWxsb2NfYXJyYXkoKHVp
bnQzMl90KW51bV9ub2Rlcywgc2l6ZW9mKCpub2RlcyksDQogCQkJICAgICAgIEdGUF9LRVJORUwg
fCBfX0dGUF9aRVJPKTsNCiAJaWYgKCFub2Rlcykgew0KLQkJYXRvbWljNjRfc3ViKG1lbS0+bnVt
X3BhZ2VzIDw8IFBBR0VfU0hJRlQsICZtZ3ItPnVzYWdlKTsNCisJCWF0b21pYzY0X3N1YihtZW1f
Ynl0ZXMsICZtZ3ItPnVzYWdlKTsNCiAJCXJldHVybiAtRU5PTUVNOw0KIAl9DQogDQotLSANCjIu
MjEuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
