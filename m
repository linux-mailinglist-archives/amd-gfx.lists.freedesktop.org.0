Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5935F360C9
	for <lists+amd-gfx@lfdr.de>; Wed,  5 Jun 2019 18:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5F389C7F;
	Wed,  5 Jun 2019 16:06:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::612])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C371289C7F
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Jun 2019 16:06:45 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2820.namprd12.prod.outlook.com (20.177.240.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 16:06:41 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 16:06:41 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/6] drm/amdkfd: Only initialize sdma vm for sdma queues
Thread-Topic: [PATCH 1/6] drm/amdkfd: Only initialize sdma vm for sdma queues
Thread-Index: AQHVG7ipr8M+4A73IECYhNkp7rggpg==
Date: Wed, 5 Jun 2019 16:06:41 +0000
Message-ID: <1559750793-16608-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::19) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c1988ce-397c-40c8-e70c-08d6e9cfcc04
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2820; 
x-ms-traffictypediagnostic: BL0PR12MB2820:
x-microsoft-antispam-prvs: <BL0PR12MB2820FA9C619E855D3513F9E680160@BL0PR12MB2820.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(39860400002)(136003)(376002)(346002)(199004)(189003)(6512007)(305945005)(4326008)(478600001)(2906002)(5640700003)(36756003)(86362001)(256004)(7736002)(81156014)(81166006)(66946007)(5660300002)(66446008)(64756008)(68736007)(66556008)(66476007)(73956011)(2351001)(486006)(476003)(2616005)(2501003)(8936002)(8676002)(53936002)(14454004)(316002)(25786009)(71200400001)(71190400001)(102836004)(66066001)(6916009)(26005)(186003)(386003)(6506007)(99286004)(72206003)(6486002)(6116002)(3846002)(50226002)(6436002)(54906003)(52116002)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2820;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iYn0jzUGN4+O36ziwb+POeYCEfzcOqH7JqZpFgIdp4Nv0vaEp61YNLgckApqMwjq0+mqa5AWhWiqVIgkOQI867Zfv4v+BSwX/HOMmfUCGD1XNYIYOqYUOL0S3RRXvv+hwLC0DtqODJPZUtcdJ9HAg3ZzlJ36rvDmQNxHNIHASfoPmhaEkolG4BDb6KJyKW6zO32orDDASzl7IlSGe1kRVLkm7Bmp0u7dxjmtR8ybi9Rca/fQ+eLt3Z6vxTNNE8OobVULPJT3n1pQBSfYBYtVoFvzt0fBLgVe85qwHpb9e18qifDp0Kh/fq+hGYdq/1nO8LhVfbQAqO6TZM7hdI4zs8eqhgsb7vRPOpl/fB2MfAsokh6ozR+qkSwYYpkTGSmU8KWPgJAYrgPlujORpqssmIYZQE2EeN/xGQXwO06wwpA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1988ce-397c-40c8-e70c-08d6e9cfcc04
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 16:06:41.3307 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2820
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KT7iRI6c34m8Y9jj5j+/4WKJRV9h+3UZMM2jbk9O8T0=;
 b=YJNTsnv2iIapB5F+rsTWvfI9LYl8XTFRMm6QDj7015XPBm1ee1f/i1tewbWMaX8blGlr70NTR7D6HHDdmE7Gxu4qT+H6ljkzSBu9LIsPtkjTV6NI2qL/lrIuYfpJOEKsTILFaQTj9SEk163V/SDvTz8+fmBOwRsYN0jGIbNwu7c=
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Freehill, Chris" <Chris.Freehill@amd.com>,
 "Zeng, Oak" <Oak.Zeng@amd.com>, "Liu, Alex" <Alex.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RG9uJ3QgZG8gdGhlIHNhbWUgZm9yIGNvbXB1dGUgcXVldWVzDQoNCkNoYW5nZS1JZDogSWQ1Zjc0
M2NhMTBjMmI3NjE1OTBiZmUxOGNhYjJmODAyZDNjMDRkMmQNClNpZ25lZC1vZmYtYnk6IE9hayBa
ZW5nIDxPYWsuWmVuZ0BhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgfCA1ICsrKy0tDQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCmluZGV4IGMxODM1NWQu
LjAwY2EzZGQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2
aWNlX3F1ZXVlX21hbmFnZXIuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCkBAIC0xMjA5LDggKzEyMDksOSBAQCBzdGF0aWMgaW50
IGNyZWF0ZV9xdWV1ZV9jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwgc3Ry
dWN0IHF1ZXVlICpxLA0KIAkgKiB1cGRhdGVzIHRoZSBpc19ldmljdGVkIGZsYWcgYnV0IGlzIGEg
bm8tb3Agb3RoZXJ3aXNlLg0KIAkgKi8NCiAJcS0+cHJvcGVydGllcy5pc19ldmljdGVkID0gISFx
cGQtPmV2aWN0ZWQ7DQotDQotCWRxbS0+YXNpY19vcHMuaW5pdF9zZG1hX3ZtKGRxbSwgcSwgcXBk
KTsNCisJaWYgKHEtPnByb3BlcnRpZXMudHlwZSA9PSBLRkRfUVVFVUVfVFlQRV9TRE1BIHx8DQor
CQlxLT5wcm9wZXJ0aWVzLnR5cGUgPT0gS0ZEX1FVRVVFX1RZUEVfU0RNQV9YR01JKQ0KKwkJZHFt
LT5hc2ljX29wcy5pbml0X3NkbWFfdm0oZHFtLCBxLCBxcGQpOw0KIAlxLT5wcm9wZXJ0aWVzLnRi
YV9hZGRyID0gcXBkLT50YmFfYWRkcjsNCiAJcS0+cHJvcGVydGllcy50bWFfYWRkciA9IHFwZC0+
dG1hX2FkZHI7DQogCXJldHZhbCA9IG1xZF9tZ3ItPmluaXRfbXFkKG1xZF9tZ3IsICZxLT5tcWQs
ICZxLT5tcWRfbWVtX29iaiwNCi0tIA0KMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
