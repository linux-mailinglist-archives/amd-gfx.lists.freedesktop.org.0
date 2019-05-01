Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67646107BA
	for <lists+amd-gfx@lfdr.de>; Wed,  1 May 2019 14:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B498938C;
	Wed,  1 May 2019 12:01:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780072.outbound.protection.outlook.com [40.107.78.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CEE8938C
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 May 2019 12:01:13 +0000 (UTC)
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1155.namprd12.prod.outlook.com (10.168.226.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Wed, 1 May 2019 12:01:07 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::cc4d:3c41:57ba:522]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::cc4d:3c41:57ba:522%2]) with mapi id 15.20.1856.008; Wed, 1 May 2019
 12:01:07 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: Add replay counter defines to NBIO headers
Thread-Topic: [PATCH 1/2] drm/amdgpu: Add replay counter defines to NBIO
 headers
Thread-Index: AQHVABWPpXceeMCJj0CGXi7WAJ5aKA==
Date: Wed, 1 May 2019 12:01:07 +0000
Message-ID: <20190501120057.3012-1-kent.russell@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTBPR01CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::39) To BN6PR12MB1618.namprd12.prod.outlook.com
 (2603:10b6:405:b::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 836c16eb-b1bd-4ae3-9519-08d6ce2cb1b1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1155; 
x-ms-traffictypediagnostic: BN6PR12MB1155:
x-microsoft-antispam-prvs: <BN6PR12MB11558D2BAEBA32806F4336DF853B0@BN6PR12MB1155.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(396003)(346002)(366004)(136003)(199004)(189003)(73956011)(72206003)(25786009)(14454004)(71190400001)(1076003)(66066001)(86362001)(478600001)(2351001)(64756008)(66556008)(66476007)(66946007)(305945005)(66446008)(2501003)(316002)(7736002)(71200400001)(5660300002)(6506007)(386003)(5640700003)(4326008)(52116002)(256004)(6486002)(186003)(6436002)(3846002)(26005)(53936002)(102836004)(6116002)(2906002)(6512007)(36756003)(8936002)(99286004)(68736007)(6916009)(486006)(81156014)(476003)(81166006)(8676002)(2616005)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1155;
 H:BN6PR12MB1618.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:3; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: J/ndrjA7d4ObV7eAY1Xzwy4/24qdex/enQyYikJNaWkGk5kb7bCikjRvC4K4fSbszZOYcFcMjqClQWgpVlpjImvfb41/5jDrNqtOMIel7ei3XmTbBQlvZ2SGGly8A+EYRpajVtmnNcN5FrXVS/haEoxEihOIBwz0mwQ1pt8b1c+ymV48jAuNepL4YNuvsE7ovLGyipgE+4tt3eR9+OOgdbHCJGTUZ1GFvI5iVzQXRWUH0kAOfZTxFjlmBbMhYyLPbzZmJtuDvjoOtd6CCgEvcmVMg/Vw9y7kAXhs/kdoBVwUKmbrqV+WMG9OxryThumtxU+AHQtgs96O2MqsM9sw00i4U1QdyVaJ1yF19LbeccBTwo43s8gGCcvEPSZoFAU+LadT1Cm1kscxbJ+IFr77sJJSnjZqo/OfMcOEShuytuc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 836c16eb-b1bd-4ae3-9519-08d6ce2cb1b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 12:01:07.8385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1155
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CPCuj0FN/Qehx50aD2VR29pUWUuBwcNhQ9HR6fUBEY=;
 b=xe3x/fV1VMcgi2EuzN/Hoa3z1A+Gg5pnfY6wM4UQeOgNV/ndj2J+rBZP4iZ6pT7LMi2i0FZbLs7ZERm5ya6A4V5CWMzmr4+i2Ed2r2EKyV08De3q5WHAxdYDr1TlUHjG80eSw/KFQfcVlU7LWTitTtVnDI1cl+09w1MctGIvBEY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kent.Russell@amd.com; 
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
Cc: "Russell, Kent" <Kent.Russell@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIHRoZSBQQ0lFX1JYX05VTV9OQUNLIGFuZCBQQ0lFX1JYX05VTV9OQUNLX0dFTkVSQVRFRCB2
YWx1ZXMgdG8gdGhlDQpOQklPIFNNTiBoZWFkZXJzIGluIHByZXBhcmF0aW9uIGZvciBleHBvc2lu
ZyB0aGUgbnVtYmVyIG9mIFBDSWUgcmVwbGF5cw0KdmlhIHN5c2ZzDQoNCkNoYW5nZS1JZDogSTM2
Yzk4YjkxNWYxOTFlZTJlMzdkMzJkYzA3MTY3YzI4NjkzOWQ2NjMNClNpZ25lZC1vZmYtYnk6IEtl
bnQgUnVzc2VsbCA8a2VudC5ydXNzZWxsQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2luY2x1ZGUvYXNpY19yZWcvbmJpby9uYmlvXzZfMV9zbW4uaCAgIHwgMyArKysNCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvbmJpby9uYmlvXzdfMF9zbW4uaCAgIHwg
MyArKysNCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvbmJpby9uYmlvXzdf
NF8wX3Ntbi5oIHwgMyArKysNCiAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQ0KDQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL25iaW8vbmJp
b182XzFfc21uLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvbmJpby9u
YmlvXzZfMV9zbW4uaA0KaW5kZXggOGM3NTY2OWViNTAwLi45NDcwZWM1ZTBmNDIgMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvbmJpby9uYmlvXzZfMV9z
bW4uaA0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL25iaW8vbmJp
b182XzFfc21uLmgNCkBAIC01NCw1ICs1NCw4IEBADQogI2RlZmluZSBzbW5QQ0lFX1BFUkZfQ09V
TlQwX1RYQ0xLMgkJCTB4MTExODAyNTgNCiAjZGVmaW5lIHNtblBDSUVfUEVSRl9DT1VOVDFfVFhD
TEsyCQkJMHgxMTE4MDI1Yw0KIA0KKyNkZWZpbmUgc21uUENJRV9SWF9OVU1fTkFLCQkJCTB4MTEx
ODAwMzgNCisjZGVmaW5lIHNtblBDSUVfUlhfTlVNX05BS19HRU5FUkFURUQJCQkweDExMTgwMDNj
DQorDQogI2VuZGlmCS8vIF9uYmlvXzZfMV9TTU5fSEVBREVSDQogDQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL25iaW8vbmJpb183XzBfc21uLmggYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvbmJpby9uYmlvXzdfMF9zbW4uaA0K
aW5kZXggNTU2M2YwNzE1ODk2Li5jYWY1ZmZkYzEzMGEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2luY2x1ZGUvYXNpY19yZWcvbmJpby9uYmlvXzdfMF9zbW4uaA0KKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FzaWNfcmVnL25iaW8vbmJpb183XzBfc21uLmgNCkBA
IC01MSw0ICs1MSw3IEBADQogI2RlZmluZSBzbW5QQ0lFX1BFUkZfQ09VTlQwX1RYQ0xLMgkJCTB4
MTExODAyNTgNCiAjZGVmaW5lIHNtblBDSUVfUEVSRl9DT1VOVDFfVFhDTEsyCQkJMHgxMTE4MDI1
Yw0KIA0KKyNkZWZpbmUgc21uUENJRV9SWF9OVU1fTkFLCQkJCTB4MTExODAwMzgNCisjZGVmaW5l
IHNtblBDSUVfUlhfTlVNX05BS19HRU5FUkFURUQJCQkweDExMTgwMDNjDQorDQogI2VuZGlmCS8v
IF9uYmlvXzdfMF9TTU5fSEVBREVSDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9p
bmNsdWRlL2FzaWNfcmVnL25iaW8vbmJpb183XzRfMF9zbW4uaCBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvaW5jbHVkZS9hc2ljX3JlZy9uYmlvL25iaW9fN180XzBfc21uLmgNCmluZGV4IGMxNDU3ZDg4
MGM0ZC4uNGJjYWNmNTI5ODUyIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNs
dWRlL2FzaWNfcmVnL25iaW8vbmJpb183XzRfMF9zbW4uaA0KKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9pbmNsdWRlL2FzaWNfcmVnL25iaW8vbmJpb183XzRfMF9zbW4uaA0KQEAgLTUwLDQgKzUw
LDcgQEANCiAjZGVmaW5lIHNtblBDSUVfUEVSRl9DTlRMX0VWRU5UX0xDX1BPUlRfU0VMCQkweDEx
MTgwMjRjDQogI2RlZmluZSBzbW5QQ0lFX1BFUkZfQ05UTF9FVkVOVF9DSV9QT1JUX1NFTAkJMHgx
MTE4MDI1MA0KIA0KKyNkZWZpbmUgc21uUENJRV9SWF9OVU1fTkFLCQkJCTB4MTExODAwMzgNCisj
ZGVmaW5lIHNtblBDSUVfUlhfTlVNX05BS19HRU5FUkFURUQJCQkweDExMTgwMDNjDQorDQogI2Vu
ZGlmCS8vIF9uYmlvXzdfNF8wX1NNTl9IRUFERVINCi0tIA0KMi4xNy4xDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
