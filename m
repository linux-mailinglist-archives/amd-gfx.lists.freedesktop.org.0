Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 578948E88D
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 11:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888016E96B;
	Thu, 15 Aug 2019 09:48:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710046.outbound.protection.outlook.com [40.107.71.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAFF6E969
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 09:48:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAIpyiTpBXU6pQdXIJ60qjKhXAEPthtlbrKLlMyTDoK7uN77gg58lefhm4QyaBo8wL6kRm3Xr5d2da4giIedoFQ67j7sKlth88H8msZPRCfx21H5RGRwYc57A7HbCuXdMewbZAYIFP8sWvJYWP3gW8IE8P5IRVAWaxxmlN/BVEg1iH20rxLXgyPnGZ1ya58j5qnSzOe+XWESBYnKoKT4LNi6zc0VLMd1Coo6P7svXoJhS+DDAf9chHlw2fqzotaTpZmotnvonEcMtBORE5+/VaYUe5VsICpv93m172tY4r9Y2Q6VbsEqzHlXOuzBXxS8noh6OOU596RfRf3/gqm91A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79LFRGPDYuElpQ/nPJ4UGBfQi9JRDAh3h0/trIFbFDE=;
 b=GBrvUifyOPrtYjmR4nYo3z0yynbww4FPnEvomv1KV78hzmp6FR0CQCdASwFrYcg6+9ImyW4v5vuJ436DsKb0D4LL+t9b8+LKR802C/EeIhrJxwZhOeQfKc4P8rrdlMHXCKQTQ7NZCa0X+3sEsDhYyHrVBTdFx+LuIcme88yh4wJ9rN4ppKY8uRWGXn37oAUNS/2TBFHG/34H5CzFITIBFnWhtCbVu5R4w6YnAlMUp7+HGOfP7IQUCmpx55xTRgSCHFxjApx5O0ITAInVVYweAi1F6/+IuI0BEkLoe4e/HV7lRWAJx6gkC3c1N9KdlDwWER3glwg/N89pZMzIzHhRdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3555.namprd12.prod.outlook.com (20.178.212.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Thu, 15 Aug 2019 09:48:34 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 09:48:34 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: add firmware header printing for psp fw
 loading
Thread-Topic: [PATCH 2/2] drm/amdgpu: add firmware header printing for psp fw
 loading
Thread-Index: AQHVU06a00LXup6b70ST78XRZTk5nQ==
Date: Thu, 15 Aug 2019 09:48:34 +0000
Message-ID: <20190815094815.20819-2-xiaojie.yuan@amd.com>
References: <20190815094815.20819-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190815094815.20819-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0187.apcprd02.prod.outlook.com
 (2603:1096:201:21::23) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9fcfe0be-fb5b-4d56-0cd5-08d72165bcf8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3555; 
x-ms-traffictypediagnostic: BN8PR12MB3555:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB3555821E667864BE6F96492989AC0@BN8PR12MB3555.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(189003)(199004)(81156014)(3846002)(102836004)(6116002)(6436002)(81166006)(5660300002)(54906003)(52116002)(5640700003)(305945005)(76176011)(478600001)(7736002)(71190400001)(71200400001)(86362001)(99286004)(2351001)(8676002)(386003)(6506007)(64756008)(66446008)(14454004)(66476007)(66946007)(2501003)(66556008)(446003)(11346002)(476003)(2616005)(6512007)(2906002)(486006)(36756003)(256004)(4326008)(50226002)(1076003)(6486002)(26005)(53936002)(316002)(25786009)(8936002)(186003)(66066001)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3555;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YeUAsiw+7LGDzgirYNkHeLYlTI2meazPaKjLkuvW9w+grs0l8Ixuj66svV8fiJF18H8d03rAWE5MPW6BNXzZDjYVHa3paHVpPINJGH3ZNruKjoH2Hk/QL2phwCCb/aJxyxwDTO2jQvOhU/XykrU5qxOfN2Uz7vHhFkTHLxFZAi3/v2/my7aYhCqJTrdtn2DanVEHEPGeq8kHk8sZDsqXLuWDTaxpb8k2X4NBeqLF9pnaf7xBNwN2iWdiF38xAzKlo9FNc+ba5Qi7Mp3ZInWVqi97aMysRidn4ThKiyQ8l0bYd1CKXl8KYIKnejL00KPK1eb0ilSfnSRzY6UrVw8ybTWElVLZ6HaSutIqLbpDSW0rhQRtvcsR9fijakgNjoYXt/kOovu9dJ2j0nFV0JPiltLddWYQYnu/nUGOvMOXEMw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fcfe0be-fb5b-4d56-0cd5-08d72165bcf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 09:48:34.3449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gRvKBx7v8IL6g6Qe4tTo/iZMhTk7JLq+kVUvLcsJOU/5gmgkqePFQWOUmnnHEKnh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3555
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79LFRGPDYuElpQ/nPJ4UGBfQi9JRDAh3h0/trIFbFDE=;
 b=AWkyyx1PmZypgbl7Nixq8mnFek2yeEWNoGytUIgHOGgb3v3OgakTc+QKxAj9nw/4477XNvRDLgWf3XNRpnGTSs2AYCUsCXHWO77FJXxUBdcU++FPGsoppx96eKEHCBDzjEGiDgAvIHgLeTQVtm2ZtVcCBd5btVuCQ1qzwuhnOQc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ZmlybXdhcmUgaGVhZGVyIGluZm9ybWF0aW9uIGlzIHByaW50ZWQgZm9yIGRpcmVjdCBmdyBsb2Fk
aW5nIGJ1dCBub3QKYWRkZWQgZm9yIHBzcCBmdyBsb2FkaW5nIHlldAoKU2lnbmVkLW9mZi1ieTog
WGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgfCA1NCArKysrKysrKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9wc3AuYwppbmRleCA0YjJkMmZkNzJkYzYuLjc3MTVjMGRhNTIyOSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYwpAQCAtOTQ0LDYgKzk0NCw1OCBAQCBzdGF0
aWMgaW50IHBzcF9nZXRfZndfdHlwZShzdHJ1Y3QgYW1kZ3B1X2Zpcm13YXJlX2luZm8gKnVjb2Rl
LAogCXJldHVybiAwOwogfQogCitzdGF0aWMgdm9pZCBwc3BfcHJpbnRfZndfaGRyKHN0cnVjdCBw
c3BfY29udGV4dCAqcHNwLAorCQkJICAgICBzdHJ1Y3QgYW1kZ3B1X2Zpcm13YXJlX2luZm8gKnVj
b2RlKQoreworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gcHNwLT5hZGV2OworCWNvbnN0
IHN0cnVjdCBzZG1hX2Zpcm13YXJlX2hlYWRlcl92MV8wICpzZG1hX2hkciA9CisJCShjb25zdCBz
dHJ1Y3Qgc2RtYV9maXJtd2FyZV9oZWFkZXJfdjFfMCAqKQorCQlhZGV2LT5zZG1hLmluc3RhbmNl
W3Vjb2RlLT51Y29kZV9pZCAtIEFNREdQVV9VQ09ERV9JRF9TRE1BMF0uZnctPmRhdGE7CisJY29u
c3Qgc3RydWN0IGdmeF9maXJtd2FyZV9oZWFkZXJfdjFfMCAqY2VfaGRyID0KKwkJKGNvbnN0IHN0
cnVjdCBnZnhfZmlybXdhcmVfaGVhZGVyX3YxXzAgKilhZGV2LT5nZnguY2VfZnctPmRhdGE7CisJ
Y29uc3Qgc3RydWN0IGdmeF9maXJtd2FyZV9oZWFkZXJfdjFfMCAqcGZwX2hkciA9CisJCShjb25z
dCBzdHJ1Y3QgZ2Z4X2Zpcm13YXJlX2hlYWRlcl92MV8wICopYWRldi0+Z2Z4LnBmcF9mdy0+ZGF0
YTsKKwljb25zdCBzdHJ1Y3QgZ2Z4X2Zpcm13YXJlX2hlYWRlcl92MV8wICptZV9oZHIgPQorCQko
Y29uc3Qgc3RydWN0IGdmeF9maXJtd2FyZV9oZWFkZXJfdjFfMCAqKWFkZXYtPmdmeC5tZV9mdy0+
ZGF0YTsKKwljb25zdCBzdHJ1Y3QgZ2Z4X2Zpcm13YXJlX2hlYWRlcl92MV8wICptZWNfaGRyID0K
KwkJKGNvbnN0IHN0cnVjdCBnZnhfZmlybXdhcmVfaGVhZGVyX3YxXzAgKilhZGV2LT5nZngubWVj
X2Z3LT5kYXRhOworCWNvbnN0IHN0cnVjdCBybGNfZmlybXdhcmVfaGVhZGVyX3YyXzAgKnJsY19o
ZHIgPQorCQkoY29uc3Qgc3RydWN0IHJsY19maXJtd2FyZV9oZWFkZXJfdjJfMCAqKWFkZXYtPmdm
eC5ybGNfZnctPmRhdGE7CisJY29uc3Qgc3RydWN0IHNtY19maXJtd2FyZV9oZWFkZXJfdjFfMCAq
c21jX2hkciA9CisJCShjb25zdCBzdHJ1Y3Qgc21jX2Zpcm13YXJlX2hlYWRlcl92MV8wICopYWRl
di0+cG0uZnctPmRhdGE7CisKKwlzd2l0Y2ggKHVjb2RlLT51Y29kZV9pZCkgeworCWNhc2UgQU1E
R1BVX1VDT0RFX0lEX1NETUEwOgorCWNhc2UgQU1ER1BVX1VDT0RFX0lEX1NETUExOgorCWNhc2Ug
QU1ER1BVX1VDT0RFX0lEX1NETUEyOgorCWNhc2UgQU1ER1BVX1VDT0RFX0lEX1NETUEzOgorCWNh
c2UgQU1ER1BVX1VDT0RFX0lEX1NETUE0OgorCWNhc2UgQU1ER1BVX1VDT0RFX0lEX1NETUE1Ogor
CWNhc2UgQU1ER1BVX1VDT0RFX0lEX1NETUE2OgorCWNhc2UgQU1ER1BVX1VDT0RFX0lEX1NETUE3
OgorCQlhbWRncHVfdWNvZGVfcHJpbnRfc2RtYV9oZHIoJnNkbWFfaGRyLT5oZWFkZXIpOworCQli
cmVhazsKKwljYXNlIEFNREdQVV9VQ09ERV9JRF9DUF9DRToKKwkJYW1kZ3B1X3Vjb2RlX3ByaW50
X2dmeF9oZHIoJmNlX2hkci0+aGVhZGVyKTsKKwkJYnJlYWs7CisJY2FzZSBBTURHUFVfVUNPREVf
SURfQ1BfUEZQOgorCQlhbWRncHVfdWNvZGVfcHJpbnRfZ2Z4X2hkcigmcGZwX2hkci0+aGVhZGVy
KTsKKwkJYnJlYWs7CisJY2FzZSBBTURHUFVfVUNPREVfSURfQ1BfTUU6CisJCWFtZGdwdV91Y29k
ZV9wcmludF9nZnhfaGRyKCZtZV9oZHItPmhlYWRlcik7CisJCWJyZWFrOworCWNhc2UgQU1ER1BV
X1VDT0RFX0lEX0NQX01FQzE6CisJCWFtZGdwdV91Y29kZV9wcmludF9nZnhfaGRyKCZtZWNfaGRy
LT5oZWFkZXIpOworCQlicmVhazsKKwljYXNlIEFNREdQVV9VQ09ERV9JRF9STENfRzoKKwkJYW1k
Z3B1X3Vjb2RlX3ByaW50X3JsY19oZHIoJnJsY19oZHItPmhlYWRlcik7CisJCWJyZWFrOworCWNh
c2UgQU1ER1BVX1VDT0RFX0lEX1NNQzoKKwkJYW1kZ3B1X3Vjb2RlX3ByaW50X3NtY19oZHIoJnNt
Y19oZHItPmhlYWRlcik7CisJCWJyZWFrOworCX0KK30KKwogc3RhdGljIGludCBwc3BfcHJlcF9s
b2FkX2lwX2Z3X2NtZF9idWYoc3RydWN0IGFtZGdwdV9maXJtd2FyZV9pbmZvICp1Y29kZSwKIAkJ
CQkgICAgICAgc3RydWN0IHBzcF9nZnhfY21kX3Jlc3AgKmNtZCkKIHsKQEAgLTEwMjgsNiArMTA4
MCw4IEBAIHN0YXRpYyBpbnQgcHNwX25wX2Z3X2xvYWQoc3RydWN0IHBzcF9jb250ZXh0ICpwc3Ap
CiAJCSAgICB1Y29kZS0+dWNvZGVfaWQgPT0gQU1ER1BVX1VDT0RFX0lEX0NQX01FQzJfSlQpCiAJ
CQljb250aW51ZTsKIAorCQlwc3BfcHJpbnRfZndfaGRyKHBzcCwgdWNvZGUpOworCiAJCXJldCA9
IHBzcF9leGVjdXRlX25wX2Z3X2xvYWQocHNwLCB1Y29kZSk7CiAJCWlmIChyZXQpCiAJCQlyZXR1
cm4gcmV0OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
