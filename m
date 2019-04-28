Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B582BB5A7
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Apr 2019 09:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AB589258;
	Sun, 28 Apr 2019 07:44:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810082.outbound.protection.outlook.com [40.107.81.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8F78915B
 for <amd-gfx@lists.freedesktop.org>; Sun, 28 Apr 2019 07:44:23 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2933.namprd12.prod.outlook.com (20.179.91.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Sun, 28 Apr 2019 07:44:22 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.010; Sun, 28 Apr 2019
 07:44:22 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 27/27] drm/amdgpu: Fix GTT size calculation
Thread-Topic: [PATCH 27/27] drm/amdgpu: Fix GTT size calculation
Thread-Index: AQHU/ZYxPIKog0WHeUWa+2vMcdfmZg==
Date: Sun, 28 Apr 2019 07:44:22 +0000
Message-ID: <20190428074331.30107-28-Felix.Kuehling@amd.com>
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
x-ms-office365-filtering-correlation-id: 76b6b0a1-e0df-4a8b-981b-08d6cbad5416
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2933; 
x-ms-traffictypediagnostic: BYAPR12MB2933:
x-microsoft-antispam-prvs: <BYAPR12MB2933A3AF3662B505A3DAB76692380@BYAPR12MB2933.namprd12.prod.outlook.com>
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(50226002)(81156014)(76176011)(54906003)(6512007)(4326008)(81166006)(8676002)(2616005)(3846002)(97736004)(186003)(8936002)(6116002)(6506007)(86362001)(36756003)(305945005)(6486002)(6436002)(7736002)(386003)(5640700003)(25786009)(11346002)(26005)(6916009)(1076003)(99286004)(256004)(5660300002)(2351001)(486006)(52116002)(2906002)(73956011)(71200400001)(2501003)(14454004)(53936002)(71190400001)(66476007)(66556008)(68736007)(66066001)(476003)(316002)(72206003)(102836004)(478600001)(64756008)(66946007)(66446008)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2933;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fJjLdShBPxxFiTcyy6Hz3wVfCBotxuPWzpkK0hGDAN4c+9VsQMbl/6sZbVfpwu2YnYDCbLYW4RiBFuTlh2oaewDv77usvz7PJvb/hEb2JpPu7sDXq7sjiTqPLnuQMbBnTYFVZSuN1bFjW13n1FG5kvvDzdWPQjZSShnG4QDdSfWwYOVYX6O2Cilvpuerh4dpl1T5vRXmYkX+Z+D742VwtdsNOe8AOZB+lQ2nh2AZrXuX7DCkvHD90sE4RLvxwGphf47S7iEsZ5eKADHnEK8JnGAIW0J1FmeWPC1efqITaRvPIIUX4B2PqdST+Oddp08bMm+3ENlfyJ8Y9cQVBkfdRBSl3nOuk1smKXEY5tmG5/bb6UXVFfUUSDe4/Gp8H9gz03hyl1Z0L0DMeYXW0D563Tn4G1slFdlnLeURKm0Sut8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b6b0a1-e0df-4a8b-981b-08d6cbad5416
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 07:44:22.2623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yie1pVgr5mcbxkXx21wn9qfIBMHjsQgyNrIZHJqHBsE=;
 b=055sZBWXa5RHRzQNuI08226BpxlOOZKg0dPh4xEKAzFmza+u6dh+dwL+um+yvDkZhI29EFENbP0y9GCfa9ppCs+VVYq1cQ9HaXOTQqCRaROpF2A0tUGsIVq+lmtiFlqiDDGzZFj54PWIji/RBTtGnDDe1QVIRWN6T4M+bLKW25s=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Russell,
 Kent" <Kent.Russell@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2VudCBSdXNzZWxsIDxrZW50LnJ1c3NlbGxAYW1kLmNvbT4NCg0KR1RUIHNpemUgaXMg
Y3VycmVudGx5IGxpbWl0ZWQgdG8gdGhlIG1pbmltdW0gb2YgVlJBTSBzaXplIG9yIDMvNCBvZg0K
c3lzdGVtIG1lbW9yeS4gVGhpcyBzZXZlcmVseSBsaW1pdHMgdGhlIHF1YW5pdGl0eSBvZiBzeXN0
ZW0gbWVtb3J5DQp0aGF0IGNhbiBiZSB1c2VkIGJ5IFJPQ20gYXBwbGljYXRpb24uDQoNCkluY3Jl
YXNlIEdUVCBzaXplIHRvIHRoZSBtYXhpbXVtIG9mIFZSQU0gc2l6ZSBvciBzeXN0ZW0gbWVtb3J5
IHNpemUuDQoNClNpZ25lZC1vZmYtYnk6IEtlbnQgUnVzc2VsbCA8a2VudC5ydXNzZWxsQGFtZC5j
b20+DQpSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+
DQpTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4N
Ci0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyB8IDkgKysrKy0t
LS0tDQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KaW5kZXggYzE0MTk4NzM3ZGNk
Li5lOWVjYzM5NTM2NzMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdHRtLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
Yw0KQEAgLTE3NDAsMTEgKzE3NDAsMTAgQEAgaW50IGFtZGdwdV90dG1faW5pdChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikNCiAJCXN0cnVjdCBzeXNpbmZvIHNpOw0KIA0KIAkJc2lfbWVtaW5m
bygmc2kpOw0KLQkJZ3R0X3NpemUgPSBtaW4obWF4KChBTURHUFVfREVGQVVMVF9HVFRfU0laRV9N
QiA8PCAyMCksDQotCQkJICAgICAgIGFkZXYtPmdtYy5tY192cmFtX3NpemUpLA0KLQkJCSAgICAg
ICAoKHVpbnQ2NF90KXNpLnRvdGFscmFtICogc2kubWVtX3VuaXQgKiAzLzQpKTsNCi0JfQ0KLQll
bHNlDQorCQlndHRfc2l6ZSA9IG1heDMoKEFNREdQVV9ERUZBVUxUX0dUVF9TSVpFX01CIDw8IDIw
KSwNCisJCQkJYWRldi0+Z21jLm1jX3ZyYW1fc2l6ZSwNCisJCQkJKCh1aW50NjRfdClzaS50b3Rh
bHJhbSAqIHNpLm1lbV91bml0KSk7DQorCX0gZWxzZQ0KIAkJZ3R0X3NpemUgPSAodWludDY0X3Qp
YW1kZ3B1X2d0dF9zaXplIDw8IDIwOw0KIA0KIAkvKiBJbml0aWFsaXplIEdUVCBtZW1vcnkgcG9v
bCAqLw0KLS0gDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
