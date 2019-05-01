Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 286A9107E6
	for <lists+amd-gfx@lfdr.de>; Wed,  1 May 2019 14:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B874D8934F;
	Wed,  1 May 2019 12:31:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810058.outbound.protection.outlook.com [40.107.81.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D900D8934F
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 May 2019 12:31:30 +0000 (UTC)
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1649.namprd12.prod.outlook.com (10.172.18.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.14; Wed, 1 May 2019 12:31:29 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::cc4d:3c41:57ba:522]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::cc4d:3c41:57ba:522%2]) with mapi id 15.20.1856.008; Wed, 1 May 2019
 12:31:29 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: Fix CIK references in gmc_v8
Thread-Topic: [PATCH 1/2] drm/amdgpu: Fix CIK references in gmc_v8
Thread-Index: AQHVABnN/JbQS5QTo0WQagIfSq7IpQ==
Date: Wed, 1 May 2019 12:31:29 +0000
Message-ID: <20190501123118.10937-1-kent.russell@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTOPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::15) To BN6PR12MB1618.namprd12.prod.outlook.com
 (2603:10b6:405:b::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3921035-d449-4267-e83a-08d6ce30ef53
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1649; 
x-ms-traffictypediagnostic: BN6PR12MB1649:
x-microsoft-antispam-prvs: <BN6PR12MB1649411C3C477A956A732C12853B0@BN6PR12MB1649.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(39860400002)(376002)(346002)(396003)(199004)(189003)(53936002)(66946007)(186003)(8936002)(5660300002)(26005)(8676002)(3846002)(66446008)(73956011)(102836004)(2906002)(64756008)(386003)(6506007)(66556008)(66476007)(72206003)(50226002)(4326008)(14454004)(6512007)(86362001)(25786009)(81166006)(81156014)(2501003)(68736007)(316002)(71200400001)(6486002)(2351001)(305945005)(476003)(6916009)(478600001)(6116002)(6436002)(36756003)(7736002)(486006)(66066001)(5640700003)(52116002)(256004)(14444005)(99286004)(2616005)(71190400001)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1649;
 H:BN6PR12MB1618.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4I7Sm9AXZM5khI0s2tq7bJXabFmaFESohy4zEYIKHViAxxIlmXb2OcEEiy9T56wTWSgMpKdC7FeEysP6zWkp6KIwkAZtfMzY9sW9Wt1aUzB4ZpqMxAp6sbZHjhtHidpbm1cAejTE3KPzPCftqVrvCcmYePCzSFp0dcX/6EMa81Vr/Ttod+4cxjwnLrQH1vlhV8+u0fTbC/wyO9JayvCYpuIk0DhIaic6if27M7+Qnb9oVqlUxqxLu21SFJBDIdj+UCf8+MExy6Nr8mLibWegrXOLZuAYSB2XVs0O350U6LF/ZqDGVXP+vgE0rF8RaWG6eoiGrdaJjlgQIJZOd1K8UD0DSSZCCyu64VPZ6NYNqtg4AIMPHS18CvFe2bStdD37MrSdiu32AZsXrymyJ+xdfY41yJF1f2vF+rb7cwq5DMw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3921035-d449-4267-e83a-08d6ce30ef53
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 12:31:29.2402 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1649
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylHFUM16TUJ+QtW8e/gFMmWolgfbp29z7jAeB7CtG3c=;
 b=eo3wUvCBP+KLViOM3U7xmAqXVMHGGQNtPul8o6dlOh1BkYCY2QQKINyO2OO0bLdaTTTduwnE1Zd1skXpervtNHpCsXMUqPzotARuHSRXphfiHb+QpNfX0A2ut/u/I8iJrvigNEloon5HMxfvKMNpqKbPJz/3W7iDg+7L2qb5RH0=
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

Z21jX3Y4IGlzIGZvciBWSSwgbm90IENJSywgc28gZml4IHRob3NlIHJlZmVyZW5jZXMNCg0KQ2hh
bmdlLUlkOiBJZmE0NjIxMmZiZWFkYmVjN2U3M2JhMjhkMDJlOTczMzlmZmNmYjVkMQ0KU2lnbmVk
LW9mZi1ieTogS2VudCBSdXNzZWxsIDxrZW50LnJ1c3NlbGxAYW1kLmNvbT4NCi0tLQ0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OF8wLmMgfCAxNCArKysrKysrLS0tLS0tLQ0KIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjhfMC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3Y4XzAuYw0KaW5kZXggMjg4MGExNDU0NTBhLi42NzY5OTg5OTA2
YmYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjhfMC5jDQor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjhfMC5jDQpAQCAtMjg5LDcgKzI4
OSw3IEBAIHN0YXRpYyBpbnQgZ21jX3Y4XzBfaW5pdF9taWNyb2NvZGUoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpDQogICoNCiAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyDQogICoN
Ci0gKiBMb2FkIHRoZSBHRERSIE1DIHVjb2RlIGludG8gdGhlIGh3IChDSUspLg0KKyAqIExvYWQg
dGhlIEdERFIgTUMgdWNvZGUgaW50byB0aGUgaHcgKFZJKS4NCiAgKiBSZXR1cm5zIDAgb24gc3Vj
Y2VzcywgZXJyb3Igb24gZmFpbHVyZS4NCiAgKi8NCiBzdGF0aWMgaW50IGdtY192OF8wX3Rvbmdh
X21jX2xvYWRfbWljcm9jb2RlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KQEAgLTQ0Myw3
ICs0NDMsNyBAQCBzdGF0aWMgdm9pZCBnbWNfdjhfMF92cmFtX2d0dF9sb2NhdGlvbihzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwNCiAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyDQog
ICoNCiAgKiBTZXQgdGhlIGxvY2F0aW9uIG9mIHZyYW0sIGdhcnQsIGFuZCBBR1AgaW4gdGhlIEdQ
VSdzDQotICogcGh5c2ljYWwgYWRkcmVzcyBzcGFjZSAoQ0lLKS4NCisgKiBwaHlzaWNhbCBhZGRy
ZXNzIHNwYWNlIChWSSkuDQogICovDQogc3RhdGljIHZvaWQgZ21jX3Y4XzBfbWNfcHJvZ3JhbShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiB7DQpAQCAtNTE1LDcgKzUxNSw3IEBAIHN0YXRp
YyB2b2lkIGdtY192OF8wX21jX3Byb2dyYW0oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQog
ICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcg0KICAqDQogICogTG9vayB1cCB0aGUgYW1v
dW50IG9mIHZyYW0sIHZyYW0gd2lkdGgsIGFuZCBkZWNpZGUgaG93IHRvIHBsYWNlDQotICogdnJh
bSBhbmQgZ2FydCB3aXRoaW4gdGhlIEdQVSdzIHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2UgKENJSyku
DQorICogdnJhbSBhbmQgZ2FydCB3aXRoaW4gdGhlIEdQVSdzIHBoeXNpY2FsIGFkZHJlc3Mgc3Bh
Y2UgKFZJKS4NCiAgKiBSZXR1cm5zIDAgZm9yIHN1Y2Nlc3MuDQogICovDQogc3RhdGljIGludCBn
bWNfdjhfMF9tY19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KQEAgLTYzMCw3ICs2
MzAsNyBAQCBzdGF0aWMgaW50IGdtY192OF8wX21jX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpDQogICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcg0KICAqIEB2bWlkOiB2bSBp
bnN0YW5jZSB0byBmbHVzaA0KICAqDQotICogRmx1c2ggdGhlIFRMQiBmb3IgdGhlIHJlcXVlc3Rl
ZCBwYWdlIHRhYmxlIChDSUspLg0KKyAqIEZsdXNoIHRoZSBUTEIgZm9yIHRoZSByZXF1ZXN0ZWQg
cGFnZSB0YWJsZSAoVkkpLg0KICAqLw0KIHN0YXRpYyB2b2lkIGdtY192OF8wX2ZsdXNoX2dwdV90
bGIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQogCQkJCXVpbnQzMl90IHZtaWQsIHVpbnQz
Ml90IGZsdXNoX3R5cGUpDQpAQCAtODAwLDcgKzgwMCw3IEBAIHN0YXRpYyB2b2lkIGdtY192OF8w
X3NldF9wcnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGJvb2wgZW5hYmxlKQ0KICAqIFRo
aXMgc2V0cyB1cCB0aGUgVExCcywgcHJvZ3JhbXMgdGhlIHBhZ2UgdGFibGVzIGZvciBWTUlEMCwN
CiAgKiBzZXRzIHVwIHRoZSBodyBmb3IgVk1JRHMgMS0xNSB3aGljaCBhcmUgYWxsb2NhdGVkIG9u
DQogICogZGVtYW5kLCBhbmQgc2V0cyB1cCB0aGUgZ2xvYmFsIGxvY2F0aW9ucyBmb3IgdGhlIExE
UywgR0RTLA0KLSAqIGFuZCBHUFVWTSBmb3IgRlNBNjQgY2xpZW50cyAoQ0lLKS4NCisgKiBhbmQg
R1BVVk0gZm9yIEZTQTY0IGNsaWVudHMgKFZJKS4NCiAgKiBSZXR1cm5zIDAgZm9yIHN1Y2Nlc3Ms
IGVycm9ycyBmb3IgZmFpbHVyZS4NCiAgKi8NCiBzdGF0aWMgaW50IGdtY192OF8wX2dhcnRfZW5h
YmxlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KQEAgLTk0OCw3ICs5NDgsNyBAQCBzdGF0
aWMgaW50IGdtY192OF8wX2dhcnRfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiAg
Kg0KICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXINCiAgKg0KLSAqIFRoaXMgZGlzYWJs
ZXMgYWxsIFZNIHBhZ2UgdGFibGUgKENJSykuDQorICogVGhpcyBkaXNhYmxlcyBhbGwgVk0gcGFn
ZSB0YWJsZSAoVkkpLg0KICAqLw0KIHN0YXRpYyB2b2lkIGdtY192OF8wX2dhcnRfZGlzYWJsZShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiB7DQpAQCAtOTc4LDcgKzk3OCw3IEBAIHN0YXRp
YyB2b2lkIGdtY192OF8wX2dhcnRfZGlzYWJsZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikN
CiAgKiBAc3RhdHVzOiBWTV9DT05URVhUMV9QUk9URUNUSU9OX0ZBVUxUX1NUQVRVUyByZWdpc3Rl
ciB2YWx1ZQ0KICAqIEBhZGRyOiBWTV9DT05URVhUMV9QUk9URUNUSU9OX0ZBVUxUX0FERFIgcmVn
aXN0ZXIgdmFsdWUNCiAgKg0KLSAqIFByaW50IGh1bWFuIHJlYWRhYmxlIGZhdWx0IGluZm9ybWF0
aW9uIChDSUspLg0KKyAqIFByaW50IGh1bWFuIHJlYWRhYmxlIGZhdWx0IGluZm9ybWF0aW9uIChW
SSkuDQogICovDQogc3RhdGljIHZvaWQgZ21jX3Y4XzBfdm1fZGVjb2RlX2ZhdWx0KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LCB1MzIgc3RhdHVzLA0KIAkJCQkgICAgIHUzMiBhZGRyLCB1MzIg
bWNfY2xpZW50LCB1bnNpZ25lZCBwYXNpZCkNCi0tIA0KMi4xNy4xDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
