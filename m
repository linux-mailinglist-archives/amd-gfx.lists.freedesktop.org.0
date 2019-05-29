Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 061832D589
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 08:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A8B6E106;
	Wed, 29 May 2019 06:32:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750081.outbound.protection.outlook.com [40.107.75.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4F46E106
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 May 2019 06:32:20 +0000 (UTC)
Received: from MN2PR12MB3437.namprd12.prod.outlook.com (20.178.240.212) by
 MN2PR12MB3711.namprd12.prod.outlook.com (10.255.236.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.16; Wed, 29 May 2019 06:32:19 +0000
Received: from MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5]) by MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5%6]) with mapi id 15.20.1922.021; Wed, 29 May 2019
 06:32:19 +0000
From: "Xiao, Jack" <Jack.Xiao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: [PATCH 3/3] drm/amdkfd: remove duplicated PCIE atomics request
Thread-Topic: [PATCH 3/3] drm/amdkfd: remove duplicated PCIE atomics request
Thread-Index: AQHVFehDQp9N704MMU2/G9vBlAm5+g==
Date: Wed, 29 May 2019 06:32:19 +0000
Message-ID: <1559111516-21940-4-git-send-email-Jack.Xiao@amd.com>
References: <1559111516-21940-1-git-send-email-Jack.Xiao@amd.com>
In-Reply-To: <1559111516-21940-1-git-send-email-Jack.Xiao@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK0PR03CA0009.apcprd03.prod.outlook.com
 (2603:1096:203:2e::21) To MN2PR12MB3437.namprd12.prod.outlook.com
 (2603:10b6:208:c3::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e37b6601-991e-4720-eae5-08d6e3ff6621
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3711; 
x-ms-traffictypediagnostic: MN2PR12MB3711:
x-microsoft-antispam-prvs: <MN2PR12MB371183F0ADD8D468CD403952EF1F0@MN2PR12MB3711.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:439;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(346002)(376002)(366004)(39860400002)(199004)(189003)(66446008)(72206003)(64756008)(2906002)(68736007)(3846002)(6116002)(14454004)(2501003)(478600001)(66556008)(66476007)(66946007)(73956011)(6636002)(7736002)(4326008)(8676002)(476003)(2616005)(25786009)(305945005)(11346002)(446003)(486006)(71200400001)(71190400001)(386003)(66066001)(6506007)(186003)(8936002)(50226002)(5660300002)(110136005)(6512007)(102836004)(26005)(81166006)(81156014)(6486002)(6436002)(76176011)(99286004)(86362001)(52116002)(256004)(53936002)(14444005)(36756003)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3711;
 H:MN2PR12MB3437.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: V7tiyW7vhAri2HHur1wUqMkbwM0yfPP+psqO8ZXrUaB5UYD+5Rlh+oa9jHeQbczcgs9+UtJXJmZKhCknI55eR6xhDg8u8x4dtX//eekCErvChsE3jyeNpoLw1CR+b/eZkyvFD3J9gyZe9zxyjT/pMqbWkr7h1tZ7R0amHfYrv6HOAKD503ln7v20FMBH6GRTQsR+ywVWo0NohPVVA5+/VcrOtvvdFlhf3S+Kse1dIQ9Zby83SLxzsH3O7oXsY/RzA3AO0CQxh//n7HQTs/R8JaSuKAIT3gp8cRQLbClpdF1uS6C+3jFaATKYjqSY1YNB/w0Gd7zeQfofpIfKCZpWWiclTv18PJ9eXaR1HUXIVAqSwAf6p2/n+A5C7Hbl/6tPtf44tSlcNrfSShUKVQ2l5GWjMy3Uo0rsNrX7Uun6KTI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e37b6601-991e-4720-eae5-08d6e3ff6621
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 06:32:19.3725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jacxiao@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3711
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UBsBQHcrC9yidsB+Iyo3iRUEYM9sPGt1aJovEe18oc=;
 b=A/jsLsDtOFNnDT5UXUO+Ird/S40hI0yd8NA0a7tDUsRAZnOZc8GCx7URVl6lWFpEb8x6It8OyanDryFveKCLEs+hU9hsts0MsjNscFr9PPItvxw7tCRzg85fUIRicjqRcqhoINQmofCEd4Astgfiw3EsTKqtjTPszQGdAdN5I8o=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jack.Xiao@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2luY2UgYW1kZ3B1IGhhcyBhbHdheXMgcmVxdWVzdGVkIFBDSUUgYXRvbWljcywga2ZkIGRvbid0
DQpuZWVkIGR1cGxpY2F0ZWQgUENJRSBhdG9taWNzIGVuYWJsZW1lbnQuIFJlZmVycmluZyB0byBh
bWRncHUNCnJlcXVlc3QgcmVzdWx0IGlzIGVub3VnaC4NCg0KU2lnbmVkLW9mZi1ieTogSmFjayBY
aWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9hbWRrZmQuYyB8ICA3ICsrKysrKysNCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfYW1ka2ZkLmggfCAgMSArDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2RldmljZS5jICAgIHwgMTAgKysrKy0tLS0tLQ0KIDMgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9hbWRrZmQuYw0KaW5kZXggOTgzMjZlM2IuLmRkZDZjNTIgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMNCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYw0KQEAgLTYyMCw2ICs2MjAsMTMgQEAgYm9v
bCBhbWRncHVfYW1ka2ZkX2lzX2tmZF92bWlkKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1
MzIgdm1pZCkNCiAJcmV0dXJuIGZhbHNlOw0KIH0NCiANCitib29sIGFtZGdwdV9hbWRrZmRfaGF2
ZV9hdG9taWNzX3N1cHBvcnQoc3RydWN0IGtnZF9kZXYgKmtnZCkNCit7DQorCXN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopa2dkOw0KKw0KKwlyZXR1
cm4gYWRldi0+aGF2ZV9hdG9taWNzX3N1cHBvcnQ7DQorfQ0KKw0KICNpZm5kZWYgQ09ORklHX0hT
QV9BTUQNCiBib29sIGFtZGtmZF9mZW5jZV9jaGVja19tbShzdHJ1Y3QgZG1hX2ZlbmNlICpmLCBz
dHJ1Y3QgbW1fc3RydWN0ICptbSkNCiB7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2FtZGtmZC5oDQppbmRleCBmNTdmMjk3Li44ZDEzNWM4MiAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaA0KKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oDQpAQCAtMTM1LDYgKzEzNSw3IEBAIGludCBh
bWRncHVfYW1ka2ZkX3N1Ym1pdF9pYihzdHJ1Y3Qga2dkX2RldiAqa2dkLCBlbnVtIGtnZF9lbmdp
bmVfdHlwZSBlbmdpbmUsDQogCQkJCXVpbnQzMl90IHZtaWQsIHVpbnQ2NF90IGdwdV9hZGRyLA0K
IAkJCQl1aW50MzJfdCAqaWJfY21kLCB1aW50MzJfdCBpYl9sZW4pOw0KIHZvaWQgYW1kZ3B1X2Ft
ZGtmZF9zZXRfY29tcHV0ZV9pZGxlKHN0cnVjdCBrZ2RfZGV2ICprZ2QsIGJvb2wgaWRsZSk7DQor
Ym9vbCBhbWRncHVfYW1ka2ZkX2hhdmVfYXRvbWljc19zdXBwb3J0KHN0cnVjdCBrZ2RfZGV2ICpr
Z2QpOw0KIA0KIHN0cnVjdCBrZmQya2dkX2NhbGxzICphbWRncHVfYW1ka2ZkX2dmeF83X2dldF9m
dW5jdGlvbnModm9pZCk7DQogc3RydWN0IGtmZDJrZ2RfY2FsbHMgKmFtZGdwdV9hbWRrZmRfZ2Z4
XzhfMF9nZXRfZnVuY3Rpb25zKHZvaWQpOw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9k
ZXZpY2UuYw0KaW5kZXggN2I0ZWEyNC4uNzZhMTU5OSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2RldmljZS5jDQpAQCAtNDgxLDE3ICs0ODEsMTUgQEAgc3RydWN0IGtmZF9kZXYg
KmtnZDJrZmRfcHJvYmUoc3RydWN0IGtnZF9kZXYgKmtnZCwNCiAJICogMzIgYW5kIDY0LWJpdCBy
ZXF1ZXN0cyBhcmUgcG9zc2libGUgYW5kIG11c3QgYmUNCiAJICogc3VwcG9ydGVkLg0KIAkgKi8N
Ci0JcmV0ID0gcGNpX2VuYWJsZV9hdG9taWNfb3BzX3RvX3Jvb3QocGRldiwNCi0JCQlQQ0lfRVhQ
X0RFVkNBUDJfQVRPTUlDX0NPTVAzMiB8DQotCQkJUENJX0VYUF9ERVZDQVAyX0FUT01JQ19DT01Q
NjQpOw0KLQlpZiAoZGV2aWNlX2luZm8tPm5lZWRzX3BjaV9hdG9taWNzICYmIHJldCA8IDApIHsN
CisJa2ZkLT5wY2lfYXRvbWljX3JlcXVlc3RlZCA9IGFtZGdwdV9hbWRrZmRfaGF2ZV9hdG9taWNz
X3N1cHBvcnQoa2dkKTsNCisJaWYgKGRldmljZV9pbmZvLT5uZWVkc19wY2lfYXRvbWljcyAmJg0K
KwkgICAgIWtmZC0+cGNpX2F0b21pY19yZXF1ZXN0ZWQpIHsNCiAJCWRldl9pbmZvKGtmZF9kZXZp
Y2UsDQogCQkJICJza2lwcGVkIGRldmljZSAleDoleCwgUENJIHJlamVjdHMgYXRvbWljc1xuIiwN
CiAJCQkgcGRldi0+dmVuZG9yLCBwZGV2LT5kZXZpY2UpOw0KIAkJa2ZyZWUoa2ZkKTsNCiAJCXJl
dHVybiBOVUxMOw0KLQl9IGVsc2UgaWYgKCFyZXQpDQotCQlrZmQtPnBjaV9hdG9taWNfcmVxdWVz
dGVkID0gdHJ1ZTsNCisJfQ0KIA0KIAlrZmQtPmtnZCA9IGtnZDsNCiAJa2ZkLT5kZXZpY2VfaW5m
byA9IGRldmljZV9pbmZvOw0KLS0gDQoxLjkuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
