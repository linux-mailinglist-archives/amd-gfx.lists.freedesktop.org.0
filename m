Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C721816BB
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 12:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AA06E2C1;
	Mon,  5 Aug 2019 10:16:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820054.outbound.protection.outlook.com [40.107.82.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9FE6E2C1
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 10:16:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4cdiP0XhrcJEk4OS61UoqmUvh7s1O8L1F2Ar4huJ3w1i+ZPAaAqa0SQJ5jv2lp7lOuPsuMwmLZakK65Piv2wzPeXQqgFssY9HnS1Omvy9i/XltHWpKWj+35deQL8Y8l8VM82L8jO4nXye2UlfgrfVvb9/qx8oP5uF23Ql8W7t0avBBbA87cjMA9Z2rhDyVf55jym0pGPgk1s2wPcIihIBp/UH7dkLPv37sldp86H8M07kC3nQSicdtvxb65jQa3BqOFL2atsAJFiChXrYrs6tFxN3GyhQKfDE/kGamx5VcaxMdOFGT+K6YL8zdOoHlk91XL9hmCtQY8UsulUeYAkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kzTf5FohuH7yE3hL9Wfaz/lFbtbfciNnZrBwsbhg2Q=;
 b=cb5oj/jLTYcQH7Z93pwh4Z0zJ7u1X23mtaEvBF7VwlG5TdEW0oPmoDQNgeUCX3x3Q6Cl5oA5TkE8XvmIlrEyHb0X5ZgNwXb1+qEwPdUaAfaJM7EkNkKJ/lb55BtjwbLv4MnN1bnoK6ZP0Mur91bLagacs+ddXubvS91ljjtotqJ/0MFA45sdFi9bXiZUhXQtSyuXmwK9tcw1W0oq2Gvja41Bov1EjgW3RPjxJc+hMYMrjXMD7UiD7P26qke2h/X+4QVv1Uzvq5LYUhwBEihB8LHAjaUePLTXR8nUowNAkqELmqF952cjwuZmA//Iy7DdWnH9FoA4mTuJT8LFo3rdcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB2974.namprd12.prod.outlook.com (20.178.240.140) by
 MN2PR12MB3629.namprd12.prod.outlook.com (20.178.242.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Mon, 5 Aug 2019 10:16:44 +0000
Received: from MN2PR12MB2974.namprd12.prod.outlook.com
 ([fe80::d97d:73f6:5f7b:b10]) by MN2PR12MB2974.namprd12.prod.outlook.com
 ([fe80::d97d:73f6:5f7b:b10%5]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 10:16:44 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/soc15: fix external_rev_id for navi14
Thread-Topic: [PATCH] drm/amdgpu/soc15: fix external_rev_id for navi14
Thread-Index: AQHVS3Eka+Rjt5l6IUGO1CTR58Z1JqbsTgMAgAAA+4CAAAdXEA==
Date: Mon, 5 Aug 2019 10:16:44 +0000
Message-ID: <MN2PR12MB2974C716EB4864E4727A1E8795DA0@MN2PR12MB2974.namprd12.prod.outlook.com>
References: <1564997723-3737-1-git-send-email-tianci.yin@amd.com>
 <DM5PR12MB1418EE05F666713D1B599859FCDA0@DM5PR12MB1418.namprd12.prod.outlook.com>
 <DM5PR12MB14182C295C686901E22911A1FCDA0@DM5PR12MB1418.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB14182C295C686901E22911A1FCDA0@DM5PR12MB1418.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b035cde1-b763-44bd-fb70-08d7198e047e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3629; 
x-ms-traffictypediagnostic: MN2PR12MB3629:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB362986106976967A6C62ABB295DA0@MN2PR12MB3629.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(13464003)(189003)(199004)(43544003)(186003)(5660300002)(446003)(229853002)(6436002)(68736007)(7736002)(53936002)(8676002)(66946007)(64756008)(71200400001)(66476007)(66446008)(66556008)(476003)(71190400001)(76116006)(8936002)(11346002)(52536014)(86362001)(2906002)(81166006)(26005)(81156014)(486006)(110136005)(6506007)(55016002)(54906003)(3846002)(7696005)(76176011)(74316002)(6306002)(6246003)(33656002)(66066001)(9686003)(102836004)(14444005)(316002)(2501003)(6116002)(256004)(99286004)(53546011)(478600001)(305945005)(14454004)(25786009)(4326008)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3629;
 H:MN2PR12MB2974.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: H6oSb89E+bcG7KT2qHIjFs0t7AgcGMUqbkD5Tm/zOOJKEYuzJb7VIZdff6RqWlDxrmgWk39OelQH7vjHFYSIsvx3zNnRwIhfXGlzxeQUkuFAXbcNASRHJwFTNqfw01BBIWUFiYS5HvBMx4W+bGGV5M5kkHVfZ3eGJcWY0khGdVQhn4OoGrtDag4AdcqzdKup8OCuGDxORqbgW978N8+zH1iK0Ll7gs4N0YRUE46fYmRIjX3BWsPjcFsD8O4Rn+m53UDKPM48AGx1NVC6QG6x4xUR/tRN/fbZFdimFwGZJGZ2d/PaxlX2JnY+EksP9VfcLKewApH9wZpSv8DKOd/kIgx1TXEApGjLI9ZxMEgn+aWjsHyfZK4/dkuiNEThSgyfi35GdMP7PzT/47aSU8AwdivmuF1eol2MdCzQj2DzRS8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b035cde1-b763-44bd-fb70-08d7198e047e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 10:16:44.6016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tiancyin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3629
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kzTf5FohuH7yE3hL9Wfaz/lFbtbfciNnZrBwsbhg2Q=;
 b=TaAmrZp3x3GEw6LzVePwCzGSs5wA1skvNU9VAxnblszZS0il1ArVJP9oFIjnTrpowEp8UrGISL//IN3l0keN6FVbG6EIuQM6NHzk/0GFNXkzonwkFkGqydF4YyImEbGMom8SBTz/GEI26bB69i2pvua/FEHeMmBBAH1FnX6KFY4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tianci.Yin@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhbmtzIEhhd2tpbmcsIEknbGwgdGFrZSBjYXJlIG9mIHRoZSBkaWZmZXJlbmNlIG9uIHRvcGlj
IGJyYW5jaCBhbmQgZHJtLW5leHQuDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+IA0KU2VudDogTW9uZGF5
LCBBdWd1c3QgNSwgMjAxOSA1OjQ5IFBNDQpUbzogWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhh
bmdAYW1kLmNvbT47IFlpbiwgVGlhbmNpIChSaWNvKSA8VGlhbmNpLllpbkBhbWQuY29tPjsgYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBYaWFvLCBKYWNrIDxKYWNrLlhpYW9AYW1k
LmNvbT47IFlpbiwgVGlhbmNpIChSaWNvKSA8VGlhbmNpLllpbkBhbWQuY29tPjsgWXVhbiwgWGlh
b2ppZSA8WGlhb2ppZS5ZdWFuQGFtZC5jb20+DQpTdWJqZWN0OiBSRTogW1BBVENIXSBkcm0vYW1k
Z3B1L3NvYzE1OiBmaXggZXh0ZXJuYWxfcmV2X2lkIGZvciBuYXZpMTQNCg0KQlRXLCBwbGVhc2Ug
bWFrZSBzdXJlIHlvdSBoYXZlIHRoZSBsYXRlc3QgZHJtLW5leHQgY29kZSBiYXNlLiBUaGUgZGVs
ZXRlZCBjb2RlIHNlZW1zIGxpa2UgaW4gc29tZSB0b3BpYyBicmFuY2guDQoNClJlZ2FyZHMsDQpI
YXdraW5nDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQt
Z2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgWmhhbmcsIEhh
d2tpbmcNClNlbnQ6IDIwMTnlubQ45pyINeaXpSAxNzo0NQ0KVG86IFlpbiwgVGlhbmNpIChSaWNv
KSA8VGlhbmNpLllpbkBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNj
OiBYaWFvLCBKYWNrIDxKYWNrLlhpYW9AYW1kLmNvbT47IFlpbiwgVGlhbmNpIChSaWNvKSA8VGlh
bmNpLllpbkBhbWQuY29tPjsgWXVhbiwgWGlhb2ppZSA8WGlhb2ppZS5ZdWFuQGFtZC5jb20+DQpT
dWJqZWN0OiBSRTogW1BBVENIXSBkcm0vYW1kZ3B1L3NvYzE1OiBmaXggZXh0ZXJuYWxfcmV2X2lk
IGZvciBuYXZpMTQNCg0KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdA
YW1kLmNvbT4NCg0KUmVnYXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQpGcm9tOiBUaWFuY2kgWWluIDx0aWFuY2kueWluQGFtZC5jb20+IA0KU2VudDogMjAxOeW5tDjm
nIg15pelIDE3OjM1DQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBaaGFu
ZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgWGlhbywgSmFjayA8SmFjay5YaWFv
QGFtZC5jb20+OyBZdWFuLCBYaWFvamllIDxYaWFvamllLll1YW5AYW1kLmNvbT47IFlpbiwgVGlh
bmNpIChSaWNvKSA8VGlhbmNpLllpbkBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIXSBkcm0vYW1k
Z3B1L3NvYzE1OiBmaXggZXh0ZXJuYWxfcmV2X2lkIGZvciBuYXZpMTQNCg0KRnJvbTogdGlhbmN5
aW4gPHRpYW5jaS55aW5AYW1kLmNvbT4NCg0KZml4IHRoZSBoYXJkIGNvZGUgZXh0ZXJuYWxfcmV2
X2lkLg0KDQpDaGFuZ2UtSWQ6IEk3YjQ2ZjdiNDliNmQwNTg2ZDFmYTI4MmQ0OTYxODE1ZmIxMjQz
NzliDQpTaWduZWQtb2ZmLWJ5OiB0aWFuY3lpbiA8dGlhbmNpLnlpbkBhbWQuY29tPg0KLS0tDQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L252LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIGlu
ZGV4IDliY2U2YTEuLjJmNDViZjIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9udi5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jDQpAQCAtNTQ2
LDcgKzU0Niw3IEBAIHN0YXRpYyBpbnQgbnZfY29tbW9uX2Vhcmx5X2luaXQodm9pZCAqaGFuZGxl
KQ0KIAkJCUFNRF9DR19TVVBQT1JUX0JJRl9MUzsNCiAJCWFkZXYtPnBnX2ZsYWdzID0gQU1EX1BH
X1NVUFBPUlRfVkNOIHwNCiAJCQlBTURfUEdfU1VQUE9SVF9WQ05fRFBHOw0KLQkJYWRldi0+ZXh0
ZXJuYWxfcmV2X2lkID0gMjA7DQorCQlhZGV2LT5leHRlcm5hbF9yZXZfaWQgPSBhZGV2LT5yZXZf
aWQgKyAyMDsNCiAJCWJyZWFrOw0KIAlkZWZhdWx0Og0KIAkJLyogRklYTUU6IG5vdCBzdXBwb3J0
ZWQgeWV0ICovDQotLQ0KMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
