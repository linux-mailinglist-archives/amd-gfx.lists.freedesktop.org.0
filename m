Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99154B58D
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Apr 2019 09:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8A7890D3;
	Sun, 28 Apr 2019 07:44:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810071.outbound.protection.outlook.com [40.107.81.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970E9890FE
 for <amd-gfx@lists.freedesktop.org>; Sun, 28 Apr 2019 07:44:04 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2933.namprd12.prod.outlook.com (20.179.91.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Sun, 28 Apr 2019 07:44:03 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.010; Sun, 28 Apr 2019
 07:44:03 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 01/27] drm/amdkfd: Use 64 bit sdma_bitmap
Thread-Topic: [PATCH 01/27] drm/amdkfd: Use 64 bit sdma_bitmap
Thread-Index: AQHU/ZYmo4/nJ/cYjkes1EXHH+c7tA==
Date: Sun, 28 Apr 2019 07:44:03 +0000
Message-ID: <20190428074331.30107-2-Felix.Kuehling@amd.com>
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190428074331.30107-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::28) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a29c384c-d99a-4671-8e12-08d6cbad488e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2933; 
x-ms-traffictypediagnostic: BYAPR12MB2933:
x-microsoft-antispam-prvs: <BYAPR12MB2933E42B855C495BD1BD59D792380@BYAPR12MB2933.namprd12.prod.outlook.com>
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(50226002)(81156014)(76176011)(54906003)(6512007)(4326008)(81166006)(8676002)(2616005)(3846002)(97736004)(186003)(8936002)(6116002)(6506007)(86362001)(36756003)(305945005)(6486002)(6436002)(7736002)(386003)(5640700003)(25786009)(11346002)(26005)(6916009)(1076003)(99286004)(256004)(5660300002)(2351001)(486006)(52116002)(2906002)(73956011)(71200400001)(2501003)(14454004)(53936002)(71190400001)(66476007)(66556008)(68736007)(66066001)(476003)(316002)(72206003)(102836004)(478600001)(64756008)(66946007)(66446008)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2933;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pdWfpfuRS0rvUjaplIoSrMnP5rmKtxozVDgXQNU4ikt2ZOstTE3hoKzj4+Ip+7gZNQ1gcJ06+bl5EmF+slxxEIqzCoP417Un75hWeoi7G2wohVb8TWzx2Mpvt5pKHMpsv1fxfYDCVEYMSAWpLXk+x3ppopKmktpzeI0XkDt+ZJ25fb42tfVo+kbYGeLjlNO1HlQdK5pJUNF8170mVFKi6V5nmzAJniTCQK6KHKsOZKNwy3WKA9Mi65FzdVq/mdpIabXSH+ddnZvEBnEr9Grv6rnejyPJlbNAsdHFl80I0/ocwuPpeWPoKJ+9Jvl6JXOHmrrK+FsGqlzMjKtisRX0tpHhdrgRxxXf6B8U+LnnOFemAngrksiiVRFnICI6vY3yqYtNAnSqgi77ljsxHmOLGuJSYY1GodNJeB7WXYFPd3o=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a29c384c-d99a-4671-8e12-08d6cbad488e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 07:44:03.4922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKKqPQWP9da1AQKgCBN70n26QRAF87yupqiEZHlT0Is=;
 b=Wy03/VvI7nBWfNTZmoayk+3/dP6g+IHGQRuc7p2TLwz9B0U9gb6+KTmAJbDXBq/snt883ba3LIczXnTtC1cf+sLaGQVyZMhhBr0HnVULceCEY2vtgD+WCLrZr1WjJv8tnb/R2asCJwc5a3mfg3zPXRMwWIOWd8eIsbzWsGANPrY=
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQoNCk1heGltdW1seSBzdXBwb3J0IDY0
IHNkbWEgcXVldWVzDQoNClNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29t
Pg0KUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0K
U2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQot
LS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIu
YyB8IDEwICsrKysrLS0tLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNl
X3F1ZXVlX21hbmFnZXIuaCB8ICAyICstDQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQppbmRleCAxZDZiMTU3ODhlYmYuLjBiMTA0
NGRlYTc2NSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZp
Y2VfcXVldWVfbWFuYWdlci5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
ZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KQEAgLTg5MSw3ICs4OTEsNyBAQCBzdGF0aWMgaW50IGlu
aXRpYWxpemVfbm9jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSkNCiAJfQ0K
IA0KIAlkcW0tPnZtaWRfYml0bWFwID0gKDEgPDwgZHFtLT5kZXYtPnZtX2luZm8udm1pZF9udW1f
a2ZkKSAtIDE7DQotCWRxbS0+c2RtYV9iaXRtYXAgPSAoMSA8PCBnZXRfbnVtX3NkbWFfcXVldWVz
KGRxbSkpIC0gMTsNCisJZHFtLT5zZG1hX2JpdG1hcCA9ICgxVUxMIDw8IGdldF9udW1fc2RtYV9x
dWV1ZXMoZHFtKSkgLSAxOw0KIA0KIAlyZXR1cm4gMDsNCiB9DQpAQCAtOTI5LDggKzkyOSw4IEBA
IHN0YXRpYyBpbnQgYWxsb2NhdGVfc2RtYV9xdWV1ZShzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFn
ZXIgKmRxbSwNCiAJaWYgKGRxbS0+c2RtYV9iaXRtYXAgPT0gMCkNCiAJCXJldHVybiAtRU5PTUVN
Ow0KIA0KLQliaXQgPSBmZnMoZHFtLT5zZG1hX2JpdG1hcCkgLSAxOw0KLQlkcW0tPnNkbWFfYml0
bWFwICY9IH4oMSA8PCBiaXQpOw0KKwliaXQgPSBfX2ZmczY0KGRxbS0+c2RtYV9iaXRtYXApOw0K
KwlkcW0tPnNkbWFfYml0bWFwICY9IH4oMVVMTCA8PCBiaXQpOw0KIAkqc2RtYV9xdWV1ZV9pZCA9
IGJpdDsNCiANCiAJcmV0dXJuIDA7DQpAQCAtOTQxLDcgKzk0MSw3IEBAIHN0YXRpYyB2b2lkIGRl
YWxsb2NhdGVfc2RtYV9xdWV1ZShzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCiB7
DQogCWlmIChzZG1hX3F1ZXVlX2lkID49IGdldF9udW1fc2RtYV9xdWV1ZXMoZHFtKSkNCiAJCXJl
dHVybjsNCi0JZHFtLT5zZG1hX2JpdG1hcCB8PSAoMSA8PCBzZG1hX3F1ZXVlX2lkKTsNCisJZHFt
LT5zZG1hX2JpdG1hcCB8PSAoMVVMTCA8PCBzZG1hX3F1ZXVlX2lkKTsNCiB9DQogDQogc3RhdGlj
IGludCBjcmVhdGVfc2RtYV9xdWV1ZV9ub2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdl
ciAqZHFtLA0KQEAgLTEwNDcsNyArMTA0Nyw3IEBAIHN0YXRpYyBpbnQgaW5pdGlhbGl6ZV9jcHNj
aChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSkNCiAJZHFtLT5xdWV1ZV9jb3VudCA9
IGRxbS0+cHJvY2Vzc2VzX2NvdW50ID0gMDsNCiAJZHFtLT5zZG1hX3F1ZXVlX2NvdW50ID0gMDsN
CiAJZHFtLT5hY3RpdmVfcnVubGlzdCA9IGZhbHNlOw0KLQlkcW0tPnNkbWFfYml0bWFwID0gKDEg
PDwgZ2V0X251bV9zZG1hX3F1ZXVlcyhkcW0pKSAtIDE7DQorCWRxbS0+c2RtYV9iaXRtYXAgPSAo
MVVMTCA8PCBnZXRfbnVtX3NkbWFfcXVldWVzKGRxbSkpIC0gMTsNCiANCiAJSU5JVF9XT1JLKCZk
cW0tPmh3X2V4Y2VwdGlvbl93b3JrLCBrZmRfcHJvY2Vzc19od19leGNlcHRpb24pOw0KIA0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFu
YWdlci5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5h
Z2VyLmgNCmluZGV4IDcwZTM4YTJlMjNiOS4uMjc3MGYzZWNlODlmIDEwMDY0NA0KLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmgNCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5oDQpA
QCAtMTg4LDcgKzE4OCw3IEBAIHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciB7DQogCXVuc2ln
bmVkIGludAkJdG90YWxfcXVldWVfY291bnQ7DQogCXVuc2lnbmVkIGludAkJbmV4dF9waXBlX3Rv
X2FsbG9jYXRlOw0KIAl1bnNpZ25lZCBpbnQJCSphbGxvY2F0ZWRfcXVldWVzOw0KLQl1bnNpZ25l
ZCBpbnQJCXNkbWFfYml0bWFwOw0KKwl1aW50NjRfdAkJc2RtYV9iaXRtYXA7DQogCXVuc2lnbmVk
IGludAkJdm1pZF9iaXRtYXA7DQogCXVpbnQ2NF90CQlwaXBlbGluZXNfYWRkcjsNCiAJc3RydWN0
IGtmZF9tZW1fb2JqCSpwaXBlbGluZV9tZW07DQotLSANCjIuMTcuMQ0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
