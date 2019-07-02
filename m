Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA095C751
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 04:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F20989AEB;
	Tue,  2 Jul 2019 02:29:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700054.outbound.protection.outlook.com [40.107.70.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1261C89AEB
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 02:29:47 +0000 (UTC)
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3011.namprd12.prod.outlook.com (20.178.208.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 02:29:44 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::8d31:f3d2:a080:9a9c]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::8d31:f3d2:a080:9a9c%5]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 02:29:44 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amdgpu/gfx9: use reset default for PA_SC_FIFO_SIZE
Thread-Topic: [PATCH 1/2] drm/amdgpu/gfx9: use reset default for
 PA_SC_FIFO_SIZE
Thread-Index: AQHVMBVY9X8REBrHkkiwSBykHY1s26a2m8Nx
Date: Tue, 2 Jul 2019 02:29:44 +0000
Message-ID: <BN8PR12MB3602BD3D78D364D0B06F43BD89F80@BN8PR12MB3602.namprd12.prod.outlook.com>
References: <20190701140019.9881-1-alexander.deucher@amd.com>
In-Reply-To: <20190701140019.9881-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76602db4-754c-4d1a-86f3-08d6fe95254b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3011; 
x-ms-traffictypediagnostic: BN8PR12MB3011:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB3011340DD4703C05EA1D4AF389F80@BN8PR12MB3011.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(199004)(189003)(102836004)(86362001)(76176011)(186003)(26005)(6506007)(53546011)(81166006)(71190400001)(476003)(7696005)(6436002)(229853002)(71200400001)(8936002)(305945005)(256004)(11346002)(99286004)(2501003)(64756008)(33656002)(66556008)(66946007)(76116006)(66446008)(66066001)(73956011)(91956017)(81156014)(446003)(52536014)(14444005)(8676002)(110136005)(74316002)(5660300002)(316002)(486006)(7736002)(68736007)(25786009)(14454004)(4326008)(66476007)(53936002)(6246003)(6116002)(966005)(55016002)(2906002)(6306002)(478600001)(72206003)(3846002)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3011;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hA/pfruIRrrPkqsR9X6NnbEo8eu8qzNXyCZZbWak1HHDSFuYCKcfd5Ut/GJWuFW+SdnAXIJfx8Afn8AapGKbdNyYFP6YvrRV3Yal1UzCjtXn82n5ekIp3dtux8eyzIK1BZ7Ro7hGmWDsAo1Il8woH1ZPLl/q4+LKWHpz0IGDmr2YsUFI3J1ovh+8+oyFU9w4K5AWG0kCTGSx/V5Z9xsoLMNyJzNiGepF0iQeisnZ2vBxAdf/kvLqufbHzhv6BbSvyGILPJfk7AZUsYwwfw+TQ4bTPuX7cGPBkufD5WVdgtzxGFI0RGwSKbHZywxtl10Ggz2OpaTMnz5hlwl9aZYsFxnK+WdjlqufnxY0s9eSUI9DG3SAgBwfxGlJI1yf+M7l1eN9wd3PlfGJws7TOH5ObcoZAD2p4wXd12QqeDDS30U=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76602db4-754c-4d1a-86f3-08d6fe95254b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 02:29:44.7193 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3011
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRtAR8BQZiiUCySIP0iAbaTwN/DE/WYwIBKM5Q4Zcwk=;
 b=FlPMtec3ZeyL+i73CapNvrv8geYADtCx8C9wbf4LG7nxCrX7k57i7R4+rQkBwXoZNq1AMQaLWQzLIhrx6pVWXMqR5FT/rCSxk5y+mf7mKhn7U3+m8kWaiIffwhzVM2w0+Yfh3qxYjcxZJjwTXMB18POzgly7fdf1fQoVgtAZ7y0=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+CgpCUiwKWGlh
b2ppZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcm9tOiBhbWQt
Z2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBvbiBiZWhhbGYgb2Yg
QWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+ClNlbnQ6IE1vbmRheSwgSnVseSAx
LCAyMDE5IDEwOjAwIFBNClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogRGV1
Y2hlciwgQWxleGFuZGVyClN1YmplY3Q6IFtQQVRDSCAxLzJdIGRybS9hbWRncHUvZ2Z4OTogdXNl
IHJlc2V0IGRlZmF1bHQgZm9yIFBBX1NDX0ZJRk9fU0laRQoKUmVjb21tZW5kZWQgYnkgdGhlIGh3
IHRlYW0uCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyB8IDE5IC0t
LS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwppbmRleCA5YjQxM2Y2ZmE1ODguLjViZGQ3YzQy
YjAwZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCkBAIC0xOTYwLDI1ICsx
OTYwLDYgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfY29uc3RhbnRzX2luaXQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCiAgICAgICAgbXV0ZXhfdW5sb2NrKCZhZGV2LT5zcmJtX211dGV4KTsK
CiAgICAgICAgZ2Z4X3Y5XzBfaW5pdF9jb21wdXRlX3ZtaWQoYWRldik7Ci0KLSAgICAgICBtdXRl
eF9sb2NrKCZhZGV2LT5ncmJtX2lkeF9tdXRleCk7Ci0gICAgICAgLyoKLSAgICAgICAgKiBtYWtp
bmcgc3VyZSB0aGF0IHRoZSBmb2xsb3dpbmcgcmVnaXN0ZXIgd3JpdGVzIHdpbGwgYmUgYnJvYWRj
YXN0ZWQKLSAgICAgICAgKiB0byBhbGwgdGhlIHNoYWRlcnMKLSAgICAgICAgKi8KLSAgICAgICBn
ZnhfdjlfMF9zZWxlY3Rfc2Vfc2goYWRldiwgMHhmZmZmZmZmZiwgMHhmZmZmZmZmZiwgMHhmZmZm
ZmZmZik7Ci0KLSAgICAgICBXUkVHMzJfU09DMTVfUkxDKEdDLCAwLCBtbVBBX1NDX0ZJRk9fU0la
RSwKLSAgICAgICAgICAgICAgICAgIChhZGV2LT5nZnguY29uZmlnLnNjX3ByaW1fZmlmb19zaXpl
X2Zyb250ZW5kIDw8Ci0gICAgICAgICAgICAgICAgICAgICAgIFBBX1NDX0ZJRk9fU0laRV9fU0Nf
RlJPTlRFTkRfUFJJTV9GSUZPX1NJWkVfX1NISUZUKSB8Ci0gICAgICAgICAgICAgICAgICAoYWRl
di0+Z2Z4LmNvbmZpZy5zY19wcmltX2ZpZm9fc2l6ZV9iYWNrZW5kIDw8Ci0gICAgICAgICAgICAg
ICAgICAgICAgIFBBX1NDX0ZJRk9fU0laRV9fU0NfQkFDS0VORF9QUklNX0ZJRk9fU0laRV9fU0hJ
RlQpIHwKLSAgICAgICAgICAgICAgICAgIChhZGV2LT5nZnguY29uZmlnLnNjX2hpel90aWxlX2Zp
Zm9fc2l6ZSA8PAotICAgICAgICAgICAgICAgICAgICAgICBQQV9TQ19GSUZPX1NJWkVfX1NDX0hJ
Wl9USUxFX0ZJRk9fU0laRV9fU0hJRlQpIHwKLSAgICAgICAgICAgICAgICAgIChhZGV2LT5nZngu
Y29uZmlnLnNjX2Vhcmx5el90aWxlX2ZpZm9fc2l6ZSA8PAotICAgICAgICAgICAgICAgICAgICAg
ICBQQV9TQ19GSUZPX1NJWkVfX1NDX0VBUkxZWl9USUxFX0ZJRk9fU0laRV9fU0hJRlQpKTsKLSAg
ICAgICBtdXRleF91bmxvY2soJmFkZXYtPmdyYm1faWR4X211dGV4KTsKLQogfQoKIHN0YXRpYyB2
b2lkIGdmeF92OV8wX3dhaXRfZm9yX3JsY19zZXJkZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCi0tCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
