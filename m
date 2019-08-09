Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4FC86F8D
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 04:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531736ECEB;
	Fri,  9 Aug 2019 02:15:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680051.outbound.protection.outlook.com [40.107.68.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F051A6ECEA
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 02:15:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=azdsqifQGb/F22Dk9OA+Vw1kjROsVsY1gfajaTYQT+fngv7AlzAghka6mjDo74dea9ioiEa45hyABNCckVgiWK63LLcqte8zgUS84wsK7P4/Y7/i5RIGpuMEiLUo2GHxu04i8GneDVUK55Bqs6FaVVKIVbY94SH2V0224oycj/kyYs5IKFcHhAzZu/9ed5pssHiT5p8BlHi3bTSuip355xJwRMQvwuGPDtAkF98gDFt7RcFZwMSYnGiwvTko4yx5vKPAn46lbO9vQV6IF86hMd6EcMEbUAGoDMXApAv0Jl5/L9M7IA8feMwOXa/8V7Q4G5OjRRcwpw0a/pjngy+DhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ptx9TbAKy6KlyD2bZGz1gGOn7LmmONlJdbNvlfDCT4o=;
 b=e24FN9fQsYqYXRDj0KTj1LklDqhpgAoPeMI7WVMNbI014r7Z+ic3FZz/BPrYivGTg0pz+RMKNHAqOTXA9WOqI/UiqcmwYzzDANl6JqUbbLZUS+IllUF4ID/6rrAcMj6g4Vg7MkfAxgMftD9ujoiSKE5SqheOSMQD1kq8y/wohqqJ1KeIgp4bjainxJtxkAyu8euI3KK6HFGJtd4oB19mM5IgxOqBRy3+vGVGfLojauyg6Xq5bceW+UVBjn853JWw2mg7Koo2/EXJy3CFgFOUtyhLPXW+wF1V6hIeHpA6N3rGFYvAdhx4muRJGf6NfNO/tMq1HI3aZPyoNt0iY8LeHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2436.namprd12.prod.outlook.com (52.132.29.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Fri, 9 Aug 2019 02:15:38 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543%7]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 02:15:38 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/5] drm/amdgpu: Support new arcturus mtype
Thread-Topic: [PATCH 2/5] drm/amdgpu: Support new arcturus mtype
Thread-Index: AQHVTlhWoel5/12juU6NzfDG76aCwg==
Date: Fri, 9 Aug 2019 02:15:38 +0000
Message-ID: <1565316926-19516-2-git-send-email-Oak.Zeng@amd.com>
References: <1565316926-19516-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1565316926-19516-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::46) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc7ce82a-26bc-4949-002a-08d71c6f7878
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2436; 
x-ms-traffictypediagnostic: BL0PR12MB2436:
x-microsoft-antispam-prvs: <BL0PR12MB2436A6EDB6566FD991B9297380D60@BL0PR12MB2436.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(189003)(199004)(2616005)(14454004)(5660300002)(99286004)(305945005)(316002)(7736002)(478600001)(76176011)(6116002)(36756003)(386003)(6506007)(8936002)(2351001)(6486002)(53936002)(26005)(52116002)(186003)(3846002)(6916009)(54906003)(476003)(71200400001)(71190400001)(2906002)(102836004)(81156014)(6436002)(8676002)(256004)(86362001)(25786009)(11346002)(5640700003)(486006)(66066001)(66476007)(81166006)(66446008)(6512007)(66946007)(66556008)(64756008)(446003)(50226002)(2501003)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2436;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5LuU868KYUcXQGr558xDfkVBUd3WqrNk0PQtgGlWpA1O4flw6p8Bpn4+prnYkvwJRxCzZPwm90bEqT7w4X4WbeQYKnLWwMDHi/5I6z1BE5Z4S8HvrN5GyseH5DybT+zJuWbr4g3Vqs9CXOgNUlaHrQu0BH48guLCyvA8afe4oiWSn2yapIg1iohiiAKBHQwXUQ6SjWDaAwabKpOcIzvEWGMvTQ/UYtIozoqcZd3H/WLVxaZ4oOCV2dLy9Kj0n5TIgURjQVDFz1YZEgVBUXAfzgETjQTX3CAIOBO8gSEoElAtS7222DwZrCYvV3DqZQ9A9y7x70N9Zt2nKo4yBDdK3BqmN45xn7pcrYcZO0mcdeT9fwlFBJzEBUzUKetFxmwX3riHnqJBX5FstPYl+gfYkbFWW3t4yxgUz+2NUCeWimU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7ce82a-26bc-4949-002a-08d71c6f7878
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 02:15:38.6501 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3175XEM+z7GT9pp/o91JogHCYR7scgJNurhTb4u8tWXHmrx7gZxZ8zMgfLPZveIq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2436
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ptx9TbAKy6KlyD2bZGz1gGOn7LmmONlJdbNvlfDCT4o=;
 b=IUxuKL4aO8vSRWzA4ka+Tg3agpZ9dSmcJ/EoYf8UKQesodw4peh+vzxmTm7tCD0KR47DUh13l3aXezbM2t3itPddaXvq6/EE8nPd/BZkT8n8btigOGmoumVe2w1nGZBD8E3pwfmkM2n8d5Uw9L6zQ9XI52t8+9LergIMFYQM6ZI=
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
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Keely,
 Sean" <Sean.Keely@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QXJjdHVydXMgcmVwdXJwb3NlZCBtdHlwZSBXQyB0byBSVy4gTW9kaWZ5IGdtYyBmdW5jdGlvbnMK
dG8gc3VwcG9ydCB0aGUgbmV3IG10eXBlCgpDaGFuZ2UtSWQ6IElkYzMzOGU1Mzg2YTU3MDIwZjQ1
MjYyMDI1ZTI2NjRhYjRiYTlmMjkxClNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0Bh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgICAgIHwg
MyArKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS92ZWdhMTBfZW51bS5oIHwgMSArCiAy
IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
bWNfdjlfMC5jCmluZGV4IGEyYWEzNWUuLmU2YWRjODYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ21jX3Y5XzAuYwpAQCAtNTgyLDYgKzU4Miw5IEBAIHN0YXRpYyB1aW50NjRfdCBnbWNfdjlf
MF9nZXRfdm1fcHRlX2ZsYWdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCWNhc2UgQU1E
R1BVX1ZNX01UWVBFX1dDOgogCQlwdGVfZmxhZyB8PSBBTURHUFVfUFRFX01UWVBFX1ZHMTAoTVRZ
UEVfV0MpOwogCQlicmVhazsKKwljYXNlIEFNREdQVV9WTV9NVFlQRV9SVzoKKwkJcHRlX2ZsYWcg
fD0gQU1ER1BVX1BURV9NVFlQRV9WRzEwKE1UWVBFX1JXKTsKKwkJYnJlYWs7CiAJY2FzZSBBTURH
UFVfVk1fTVRZUEVfQ0M6CiAJCXB0ZV9mbGFnIHw9IEFNREdQVV9QVEVfTVRZUEVfVkcxMChNVFlQ
RV9DQyk7CiAJCWJyZWFrOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRl
L3ZlZ2ExMF9lbnVtLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvdmVnYTEwX2VudW0u
aAppbmRleCBjMTRiYTY1Li5hZGYxYjc1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2luY2x1ZGUvdmVnYTEwX2VudW0uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUv
dmVnYTEwX2VudW0uaApAQCAtMTAzNyw2ICsxMDM3LDcgQEAgVENDX0NBQ0hFX1BPTElDWV9TVFJF
QU0gICAgICAgICAgICAgICAgICA9IDB4MDAwMDAwMDEsCiB0eXBlZGVmIGVudW0gTVRZUEUgewog
TVRZUEVfTkMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9IDB4MDAwMDAwMDAsCiBN
VFlQRV9XQyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID0gMHgwMDAwMDAwMSwKK01U
WVBFX1JXICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPSAweDAwMDAwMDAxLAogTVRZ
UEVfQ0MgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9IDB4MDAwMDAwMDIsCiBNVFlQ
RV9VQyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID0gMHgwMDAwMDAwMywKIH0gTVRZ
UEU7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
