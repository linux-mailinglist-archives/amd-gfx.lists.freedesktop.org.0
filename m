Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 471375C76F
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 04:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB0189AD2;
	Tue,  2 Jul 2019 02:45:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730040.outbound.protection.outlook.com [40.107.73.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FB789AD2
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 02:45:50 +0000 (UTC)
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3393.namprd12.prod.outlook.com (20.178.211.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 02:45:46 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::8d31:f3d2:a080:9a9c]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::8d31:f3d2:a080:9a9c%5]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 02:45:46 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdgpu/gfx10: use reset default for
 PA_SC_FIFO_SIZE
Thread-Topic: [PATCH 2/2] drm/amdgpu/gfx10: use reset default for
 PA_SC_FIFO_SIZE
Thread-Index: AQHVMBVaV8PFw5/ay02+NWzz1rYiAqa2m+0u
Date: Tue, 2 Jul 2019 02:45:46 +0000
Message-ID: <BN8PR12MB36027047E1A7983646020E8789F80@BN8PR12MB3602.namprd12.prod.outlook.com>
References: <20190701140019.9881-1-alexander.deucher@amd.com>,
 <20190701140019.9881-2-alexander.deucher@amd.com>
In-Reply-To: <20190701140019.9881-2-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a15581e1-5866-419e-e0b9-08d6fe976264
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3393; 
x-ms-traffictypediagnostic: BN8PR12MB3393:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB3393125926F7DC5602B00DB689F80@BN8PR12MB3393.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(199004)(189003)(478600001)(9686003)(55016002)(86362001)(966005)(53936002)(71190400001)(81166006)(6306002)(68736007)(8676002)(7696005)(81156014)(71200400001)(256004)(52536014)(25786009)(99286004)(4326008)(14454004)(14444005)(2906002)(2501003)(5660300002)(8936002)(6506007)(316002)(91956017)(76116006)(53546011)(76176011)(66446008)(72206003)(66556008)(66946007)(73956011)(66476007)(64756008)(229853002)(446003)(66066001)(26005)(6436002)(11346002)(476003)(110136005)(186003)(33656002)(6116002)(486006)(3846002)(102836004)(7736002)(74316002)(305945005)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3393;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YaEZCkJtgQeY4dQ3lxpNPFRHGJU6U93YMLAgHwX38/NzMYls/qePiYH2W9fHQIGqz2Ct8CQHqmHZnTUADBYCNeABByU3inzC9ZNjklE7I4SXhdhVoN4PmCrJa/W8Z/JfdkrUsnB8P4QWoEKYIGm7msW3Irv4h7R0CnKHud3ZMMTXiKQjKL33TRMd+uiQno8tCUevwsLm2eKeKXRRurTqu/OJ+DcGHHRoft1PgauYut7R9XRhdgoA4n/ZCBn+Xa5+Tj/9axrmnEP5KLuDFe1g/1+n/r/QdBe480r4lUvm/T9ysBVSQweb7jXlMjUvQ1KT0/YAAwDSMLuEkdQ34xAuz93Fij6RKZf9VLMudpdXiHvB5fqEWsAMcQiZakkQ1G1I+aJM14qron16JTtC0CF5upUGa0LbM0jntyf3etGpw1Y=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a15581e1-5866-419e-e0b9-08d6fe976264
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 02:45:46.2319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3393
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fd/qd4+kcPhPogebBtlyF6hjRjZG/ytPAKUtDWlh0/Y=;
 b=NoPdsJ2zzBh7i/rpM5S5PoMFcDtj10mTAx8/fSWYgsILVPC8kR3u/PTuiuqEJ9YwiySkILeiauykV+npo7qA5fB3Rf+FcBZ9JMJ5LugRCiGOyPpbqoAXUEeO5vcJxOCDvVQaPtl51E5cV5+Cg5dDBIJg3NuR6b2fmBUpHDY6McY=
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
Y2hlciwgQWxleGFuZGVyClN1YmplY3Q6IFtQQVRDSCAyLzJdIGRybS9hbWRncHUvZ2Z4MTA6IHVz
ZSByZXNldCBkZWZhdWx0IGZvciBQQV9TQ19GSUZPX1NJWkUKClJlY29tbWVuZGVkIGJ5IHRoZSBo
dyB0ZWFtLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIHwgMTgg
LS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTggZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwppbmRleCAyOTMyYWRlN2RiZDAuLmNjZDVh
NDk2OGE2MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8w
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTE1NDQs
MjQgKzE1NDQsNiBAQCBzdGF0aWMgdm9pZCBnZnhfdjEwXzBfY29uc3RhbnRzX2luaXQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCgogICAgICAgIGdmeF92MTBfMF9pbml0X2NvbXB1dGVfdm1p
ZChhZGV2KTsKCi0gICAgICAgbXV0ZXhfbG9jaygmYWRldi0+Z3JibV9pZHhfbXV0ZXgpOwotICAg
ICAgIC8qCi0gICAgICAgICogbWFraW5nIHN1cmUgdGhhdCB0aGUgZm9sbG93aW5nIHJlZ2lzdGVy
IHdyaXRlcyB3aWxsIGJlIGJyb2FkY2FzdGVkCi0gICAgICAgICogdG8gYWxsIHRoZSBzaGFkZXJz
Ci0gICAgICAgICovCi0gICAgICAgZ2Z4X3YxMF8wX3NlbGVjdF9zZV9zaChhZGV2LCAweGZmZmZm
ZmZmLCAweGZmZmZmZmZmLCAweGZmZmZmZmZmKTsKLQotICAgICAgIHRtcCA9IFJFR19TRVRfRklF
TEQoMCwgUEFfU0NfRklGT19TSVpFLCBTQ19GUk9OVEVORF9QUklNX0ZJRk9fU0laRSwKLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGFkZXYtPmdmeC5jb25maWcuc2NfcHJpbV9maWZvX3NpemVf
ZnJvbnRlbmQpOwotICAgICAgIHRtcCA9IFJFR19TRVRfRklFTEQodG1wLCBQQV9TQ19GSUZPX1NJ
WkUsIFNDX0JBQ0tFTkRfUFJJTV9GSUZPX1NJWkUsCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICBhZGV2LT5nZnguY29uZmlnLnNjX3ByaW1fZmlmb19zaXplX2JhY2tlbmQpOwotICAgICAgIHRt
cCA9IFJFR19TRVRfRklFTEQodG1wLCBQQV9TQ19GSUZPX1NJWkUsIFNDX0hJWl9USUxFX0ZJRk9f
U0laRSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgIGFkZXYtPmdmeC5jb25maWcuc2NfaGl6
X3RpbGVfZmlmb19zaXplKTsKLSAgICAgICB0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgUEFfU0Nf
RklGT19TSVpFLCBTQ19FQVJMWVpfVElMRV9GSUZPX1NJWkUsCi0gICAgICAgICAgICAgICAgICAg
ICAgICAgICBhZGV2LT5nZnguY29uZmlnLnNjX2Vhcmx5el90aWxlX2ZpZm9fc2l6ZSk7Ci0gICAg
ICAgV1JFRzMyX1NPQzE1KEdDLCAwLCBtbVBBX1NDX0ZJRk9fU0laRSwgdG1wKTsKLQotICAgICAg
IG11dGV4X3VubG9jaygmYWRldi0+Z3JibV9pZHhfbXV0ZXgpOwogfQoKIHN0YXRpYyB2b2lkIGdm
eF92MTBfMF9lbmFibGVfZ3VpX2lkbGVfaW50ZXJydXB0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LAotLQoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
