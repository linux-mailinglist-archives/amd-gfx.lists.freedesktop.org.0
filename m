Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 362A46F879
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 06:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF7789AB7;
	Mon, 22 Jul 2019 04:28:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700089.outbound.protection.outlook.com [40.107.70.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53A789AB7
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 04:28:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcEvtJXrq361IV5dHxw7ubKDIjlyX4gTY57b8MH2tzvgnWiZGho69MJzgAp9vnJv+9GB8r1qYTYckg8hah6Z8Z6O28SHABfTa40oYhLqRH1kT3XFnSWQI3WPiKgerDbvD4BpT4OBT8pS/LgEb5ezj8wXtubL/7BlPQP6QJeJXts63j38v/mrQ8M1mVhxAbyYXPJI8pN7SIAWpz4RgDCjsdW2FI0y933IdzAT+xXG4X4bHyjVheC5IPyH06SICg50jvmWY1EMYgi2q2oYA3ieLU38Z4MjBb+oSQT32G3cSrnF+sNKgoVqZMejPn7wKbr1j2R2JJuCIFZ6djabE0AbCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xg2J8ovBOua1XZgd1MUL7SNMLwtieD71/pmbHS2yKo=;
 b=Id0+Cq+VtYirexZftnfeQTRZ7SdGbETEnbRkaksXhhZTWR5Nl6wNGgUv9cD3DyA9WqzYn2Dfh1v+lVmpv0oC9ENuh2Th3ZurwOUlh3TKlFOHx7p8/ieRHXAg0rcR2NCuTjWgGkmzUYO/kJblU/stdyEt+mqb8bY30/xo1TyiUlh5m6KaL9UWt1kZSZHYqlqWmI4wJSGAcNrjpP7bdP3DOJJbvni0iGopz47tyn9wUhiRC0PoSjTqOPFOUtp9fOgs9Vqy/qQsz13n/tirsUdfDF42gwWYngv2P+hEbtc0ZNvx4pKtd4x0q9wACVEs/R6j+RNinPxpKKC1LSbL3AwA7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB4016.namprd12.prod.outlook.com (10.255.239.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 04:28:41 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5%7]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 04:28:41 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 4/5] drm/amd/powerplay: correct Navi10 VCN powergate
 control
Thread-Topic: [PATCH 4/5] drm/amd/powerplay: correct Navi10 VCN powergate
 control
Thread-Index: AQHVQDvy/ZCzREI8sUSFJwlnii48zabWC1Dg
Date: Mon, 22 Jul 2019 04:28:40 +0000
Message-ID: <MN2PR12MB359851CA088A334EC52E36DE8EC40@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <20190722031531.23437-1-evan.quan@amd.com>
 <20190722031531.23437-5-evan.quan@amd.com>
In-Reply-To: <20190722031531.23437-5-evan.quan@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26560252-3ee6-438e-f2ee-08d70e5d1308
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4016; 
x-ms-traffictypediagnostic: MN2PR12MB4016:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB4016083107BC6F507E6E69798EC40@MN2PR12MB4016.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:639;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39850400004)(136003)(396003)(346002)(376002)(13464003)(199004)(189003)(186003)(8936002)(5660300002)(7736002)(66066001)(6246003)(2906002)(81166006)(81156014)(8676002)(53546011)(476003)(26005)(102836004)(446003)(11346002)(33656002)(55016002)(66446008)(64756008)(256004)(6506007)(99286004)(9686003)(6306002)(53936002)(966005)(76116006)(66556008)(66476007)(229853002)(52536014)(66946007)(3846002)(6436002)(110136005)(6116002)(86362001)(478600001)(316002)(76176011)(486006)(305945005)(7696005)(14454004)(68736007)(74316002)(4326008)(25786009)(71200400001)(71190400001)(54906003)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4016;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 01IwEG8nMcfcoFYnDZ0wIhvOSKu8SeZSjb6ZUJH4hXXo0bbRmoQqcLXF+gYIIQf4JF3tcEIEMplWZkl+L18NF+Yw4t2/GRA1/kL4pygnapSQzSSxoLoPgw5lCZveowPBVk1FFkvgzo0g2hqHzkcQ5ycmOGKizSnFcY6lGxqRjbsTyZaGHhj+DOj8vgCcaJtiwAOPTUVIVjZxq+AjMdtPUICJdPVuHYhf4Cjua8hj2JUmjFLMAs9w7TrsVi/KAbWqAY/Bz6b7zIiKaW2Te9TptDqh6vmgaZ0Ss9alyhuNON7eHHjQ8E7bz/fLGrV7BnLURzaxZX0oJi+nO3+fozthYc0FL03cyQ3VN0MYYXmJyFFMuQnrkVE2Gvv6xTLzeaYOG4Kz1hdJxol4oXFv4LZqNg4ZJsrUZHXda3BGHAVgTEE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26560252-3ee6-438e-f2ee-08d70e5d1308
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 04:28:40.9316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyfeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4016
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xg2J8ovBOua1XZgd1MUL7SNMLwtieD71/pmbHS2yKo=;
 b=uchoGqQ3ETBMevenAEqXcMe79tDPRUUbyJ3YeqZPGGlGpt06dC+v4+ph0CTosmTL7j0cHpC3TW76DRMp4C6uhzoLVgEvIQ8mQgkHHkPyjPfGJ8jxrfFLOlDHMIe3JC9HZ2XuQFNjQPxSQ5v8XSpQgKH0tWZcUD47pXEqtGr39H4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kenneth.Feng@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+DQoNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggW21haWx0bzphbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbiBCZWhhbGYgT2YgRXZhbiBRdWFuDQpTZW50
OiBNb25kYXksIEp1bHkgMjIsIDIwMTkgMTE6MTYgQU0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1k
LmNvbT47IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIDQv
NV0gZHJtL2FtZC9wb3dlcnBsYXk6IGNvcnJlY3QgTmF2aTEwIFZDTiBwb3dlcmdhdGUgY29udHJv
bA0KDQpbQ0FVVElPTjogRXh0ZXJuYWwgRW1haWxdDQoNCk5vIFZDTiBEUE0gYml0IGNoZWNrIGFz
IHRoYXQncyBkaWZmZXJlbnQgZnJvbSBWQ04gUEcuIEFsc28gbm8gZXh0cmEgY2hlY2sgZm9yIHBv
c3NpYmxlIGRvdWJsZSBlbmFibGVtZW50L2Rpc2FibGVtZW50IGFzIHRoYXQncyBhbHJlYWR5IGRv
bmUgYnkgVkNOLg0KDQpDaGFuZ2UtSWQ6IEk1OWM2MzgyOWNmNGRjYjgwOTNmZGUxY2E4MjQ1YjYx
M2FiMmQ5MGRmDQpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPg0K
LS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIHwgMjYgKysr
KysrKystLS0tLS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDE3
IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvbmF2aTEwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3Bw
dC5jDQppbmRleCBjOGNlOWJiYWUyNzYuLjIxOThkMzczZDM4YyAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYw0KKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jDQpAQCAtNTkxLDI3ICs1OTEsMTkgQEAgc3Rh
dGljIGludCBuYXZpMTBfc2V0X2RlZmF1bHRfZHBtX3RhYmxlKHN0cnVjdCBzbXVfY29udGV4dCAq
c211KSAgc3RhdGljIGludCBuYXZpMTBfZHBtX3NldF91dmRfZW5hYmxlKHN0cnVjdCBzbXVfY29u
dGV4dCAqc211LCBib29sIGVuYWJsZSkgIHsNCiAgICAgICAgaW50IHJldCA9IDA7DQotICAgICAg
IHN0cnVjdCBzbXVfcG93ZXJfY29udGV4dCAqc211X3Bvd2VyID0gJnNtdS0+c211X3Bvd2VyOw0K
LSAgICAgICBzdHJ1Y3Qgc211X3Bvd2VyX2dhdGUgKnBvd2VyX2dhdGUgPSAmc211X3Bvd2VyLT5w
b3dlcl9nYXRlOw0KDQotICAgICAgIGlmIChlbmFibGUgJiYgcG93ZXJfZ2F0ZS0+dXZkX2dhdGVk
KSB7DQotICAgICAgICAgICAgICAgaWYgKHNtdV9mZWF0dXJlX2lzX2VuYWJsZWQoc211LCBTTVVf
RkVBVFVSRV9EUE1fVVZEX0JJVCkpIHsNCi0gICAgICAgICAgICAgICAgICAgICAgIHJldCA9IHNt
dV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUsIFNNVV9NU0dfUG93ZXJVcFZjbiwgMSk7DQot
ICAgICAgICAgICAgICAgICAgICAgICBpZiAocmV0KQ0KLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gcmV0Ow0KLSAgICAgICAgICAgICAgIH0NCi0gICAgICAgICAgICAgICBw
b3dlcl9nYXRlLT51dmRfZ2F0ZWQgPSBmYWxzZTsNCisgICAgICAgaWYgKGVuYWJsZSkgew0KKyAg
ICAgICAgICAgICAgIHJldCA9IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUsIFNNVV9N
U0dfUG93ZXJVcFZjbiwgMSk7DQorICAgICAgICAgICAgICAgaWYgKHJldCkNCisgICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiByZXQ7DQogICAgICAgIH0gZWxzZSB7DQotICAgICAgICAgICAg
ICAgaWYgKCFlbmFibGUgJiYgIXBvd2VyX2dhdGUtPnV2ZF9nYXRlZCkgew0KLSAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKHNtdV9mZWF0dXJlX2lzX2VuYWJsZWQoc211LCBTTVVfRkVBVFVSRV9E
UE1fVVZEX0JJVCkpIHsNCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gc211
X3NlbmRfc21jX21zZyhzbXUsIFNNVV9NU0dfUG93ZXJEb3duVmNuKTsNCi0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKHJldCkNCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gcmV0Ow0KLSAgICAgICAgICAgICAgICAgICAgICAgfQ0KLSAgICAg
ICAgICAgICAgICAgICAgICAgcG93ZXJfZ2F0ZS0+dXZkX2dhdGVkID0gdHJ1ZTsNCi0gICAgICAg
ICAgICAgICB9DQorICAgICAgICAgICAgICAgcmV0ID0gc211X3NlbmRfc21jX21zZyhzbXUsIFNN
VV9NU0dfUG93ZXJEb3duVmNuKTsNCisgICAgICAgICAgICAgICBpZiAocmV0KQ0KKyAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCiAgICAgICAgfQ0KDQorICAgICAgIHNtdV9mZWF0
dXJlX3NldF9lbmFibGVkKHNtdSwgU01VX0ZFQVRVUkVfVkNOX1BHX0JJVCwgZW5hYmxlKTsNCisN
CiAgICAgICAgcmV0dXJuIDA7DQogfQ0KDQotLQ0KMi4yMi4wDQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
