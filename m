Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 650EBAE52C
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 10:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0636A6E864;
	Tue, 10 Sep 2019 08:12:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800055.outbound.protection.outlook.com [40.107.80.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692F16E864
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 08:12:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pn4f80A4sa2CzFQ57M3/7sB0GmBGifLADoQxknVhJnt0rXHiueVlUSSW7iGP35zynJnZbJvlr0i+8yFSQH33mR0Wa9tA0TbgIS+nhuy1btaiokADC32e0Zls6ipUxNmo/Ni+2lRHeSCfGR7E7zEccRWsEMB2d8aTWYeyWt2/uc1nrUHO4Scy29pq+2caCdwlyjFH55zVkzdJh6SITnDbvbRp203T+fyGayowUY5SUWXV16ep5LauQBkfvGOTvQSTJFQpSzBPMqoBKvnSLVwVA9XrIxPC+mpYMsHBmUjIxi+x3iqo6qS4xsiql2ocGXNGfIHmrnxEVfOe0N2+D7YjOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lm+JWaYPJOaH24ypA1R3iBJtOI/6fCfpWbv42GNgOGM=;
 b=hLxCPmO7HNVT/kL07z1WzRYq2G6zGxSavykL7SD3qAVJo9M25ITQ7WGZiF99LRnfEOarzwcKbYvt+3b3V83F45crQH91Rp+AwRHaHJPV8HGjVUEUHDHWknHVLFLGaWm9h2JchYmfRJ7k68YarSi241rNroKvQmuQ+BTczzgz2ZioCHHthth0irpbuzZbgvx9+Izi9o7O7M0+1QAEnCIPP2n6CAM0WoxEJrvX3SlU4BF6u5P+yZYNgUz4/XhaFFBKFyPGkgZ325GiSMqTKFQzMWGnEvdAaz/rn7LnZu3WmE6pnNxODjxxiHc/YDiMO9qD6I1RGSVN3SOK7egz0csKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB2894.namprd12.prod.outlook.com (20.179.84.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.13; Tue, 10 Sep 2019 08:12:34 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 08:12:34 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "S, Shirish" <Shirish.S@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: RE: [PATCH] drm/amdgpu: fix build error without CONFIG_HSA_AMD
Thread-Topic: [PATCH] drm/amdgpu: fix build error without CONFIG_HSA_AMD
Thread-Index: AQHVZ6zZSGP4wbr8DUmv4JsslOgvO6ckj2Hw
Date: Tue, 10 Sep 2019 08:12:34 +0000
Message-ID: <MN2PR12MB33099B938972C6AF2437C92BECB60@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190910075312.17108-1-shirish.s@amd.com>
In-Reply-To: <20190910075312.17108-1-shirish.s@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7a28e43-f2e5-4c33-56ff-08d735c6a2b1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB2894; 
x-ms-traffictypediagnostic: MN2PR12MB2894:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2894FB9A9C0137C0DAD6CA82ECB60@MN2PR12MB2894.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(13464003)(189003)(199004)(9686003)(11346002)(8676002)(102836004)(52536014)(99286004)(4326008)(53546011)(33656002)(6506007)(71190400001)(71200400001)(55016002)(81156014)(6246003)(53936002)(25786009)(2906002)(478600001)(66066001)(7736002)(74316002)(14454004)(305945005)(256004)(14444005)(86362001)(110136005)(6116002)(6636002)(476003)(3846002)(7696005)(6436002)(81166006)(76176011)(5660300002)(316002)(229853002)(66446008)(486006)(64756008)(66476007)(66556008)(66946007)(76116006)(446003)(26005)(186003)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2894;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: u5Ak2OEHViLl2rJAD453ip0FUcSlmzK63rAF2tNbNMElf4b/I4NRp41gNpnqbCeotz7JPaW5WApnEIze73vUh3DdeQ5c6PXcR+M826JDdig44ViQ5HFTw6gI18CYiMYKW/nco0owaGVmDGEq+culrTwJd/Y/gx5R162p3GrjfanMikAgobNUpv0LSSWDelTHoY8SAM9ogjlpMbQZGxq5Nb3L4ERi0ykWX7JelnYUPmWcPWCpUzPk9jQZXuN0yTV15I7mcuAtSdCHVHrPnq+1aoWoAgBxup4dnEl5+8YPTp92l6UJIPCmcDzxXAAcIxUuE+LIH4ZOB4yE1Igf7zTIicU5Q+cYzJFS2nWRKN2sT6ki/siEtE0CmiHJjXX+r9OTMdA5cPJYd8geXUEQiQ0QlZfXPQISLOg4fDxA3nrzBmc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a28e43-f2e5-4c33-56ff-08d735c6a2b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 08:12:34.3863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d/XqpAUW3dWnDlFbHXNE6psIa0hCf83UR+7YVgNpWk8+FC2kbdnncXLSxQKZBCARl/w9i93d25fVzAhNjhtyaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2894
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lm+JWaYPJOaH24ypA1R3iBJtOI/6fCfpWbv42GNgOGM=;
 b=JgrF6tl3qix+qHPHCzDzLhM25+L9hl/0WELCNB/vQhkLx5VCK5q6g+vKxoyLyIJ5MNMPVv3vbyy9RFgyKUYwMoj58E/PlLGr1aZZi7BfFKKqb++4LVDeuPCL3ZwHOni/aIKV+nDMe2Ib5QDSVEYkj6VBb6s19vxTwpySnkVnewc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFMsIFNoaXJpc2ggPFNoaXJpc2gu
U0BhbWQuY29tPgo+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAxMCwgMjAxOSAzOjU0IFBNCj4g
VG86IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IEtvZW5p
ZywgQ2hyaXN0aWFuCj4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IEh1YW5nLCBSYXkgPFJh
eS5IdWFuZ0BhbWQuY29tPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgUywg
U2hpcmlzaCA8U2hpcmlzaC5TQGFtZC5jb20+Cj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1
OiBmaXggYnVpbGQgZXJyb3Igd2l0aG91dCBDT05GSUdfSFNBX0FNRAo+IAo+IElmIENPTkZJR19I
U0FfQU1EIGlzIG5vdCBzZXQsIGJ1aWxkIGZhaWxzOgo+IAo+IGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZXZpY2UubzogSW4gZnVuY3Rpb24KPiBgYW1kZ3B1X2RldmljZV9pcF9l
YXJseV9pbml0JzoKPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmM6
MTYyNjogdW5kZWZpbmVkCj4gcmVmZXJlbmNlIHRvIGBzY2hlZF9wb2xpY3knCj4gCj4gVXNlIENP
TkZJR19IU0FfQU1EIHRvIGd1YXJkIHRoaXMuCj4gCj4gRml4ZXM6IDFhYmI2ODBhZDM3MSAoImRy
bS9hbWRncHU6IGRpc2FibGUgZ2Z4b2ZmIHdoaWxlIHVzZSBubyBIL1cKPiBzY2hlZHVsaW5nIHBv
bGljeSIpCj4gCj4gU2lnbmVkLW9mZi1ieTogU2hpcmlzaCBTIDxzaGlyaXNoLnNAYW1kLmNvbT4K
CisgRmVsaXggZm9yIGhpcyBhd2FyZW5lc3MuCgpSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXku
aHVhbmdAYW1kLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dS5oICAgICAgICB8IDIgKysKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jIHwgNiArKysrKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1LmgKPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCj4gaW5kZXgg
MTAzMGNiMzA3MjBjLi5hMTUxNmEzYWU5YTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHUuaAo+IEBAIC0xNjksNyArMTY5LDkgQEAgZXh0ZXJuIGludCBhbWRncHVfZGlzY292ZXJ5
OyAgZXh0ZXJuIGludAo+IGFtZGdwdV9tZXM7ICBleHRlcm4gaW50IGFtZGdwdV9ub3JldHJ5OyAg
ZXh0ZXJuIGludAo+IGFtZGdwdV9mb3JjZV9hc2ljX3R5cGU7Cj4gKyNpZmRlZiBDT05GSUdfSFNB
X0FNRAo+ICBleHRlcm4gaW50IHNjaGVkX3BvbGljeTsKPiArI2VuZGlmCj4gCj4gICNpZmRlZiBD
T05GSUdfRFJNX0FNREdQVV9TSQo+ICBleHRlcm4gaW50IGFtZGdwdV9zaV9zdXBwb3J0Owo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPiBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+IGluZGV4IGJkNDIz
ZGQ2NGUxOC4uMjUzNWRiMjdmODIxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kZXZpY2UuYwo+IEBAIC0xNjIzLDcgKzE2MjMsMTEgQEAgc3RhdGljIGludCBhbWRn
cHVfZGV2aWNlX2lwX2Vhcmx5X2luaXQoc3RydWN0Cj4gYW1kZ3B1X2RldmljZSAqYWRldikKPiAg
CX0KPiAKPiAgCWFkZXYtPnBtLnBwX2ZlYXR1cmUgPSBhbWRncHVfcHBfZmVhdHVyZV9tYXNrOwo+
IC0JaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSB8fCBzY2hlZF9wb2xpY3kgPT0KPiBLRkRfU0NI
RURfUE9MSUNZX05PX0hXUykKPiArCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikKPiArCSAgICAj
aWZkZWYgQ09ORklHX0hTQV9BTUQKPiArCSAgICB8fCBzY2hlZF9wb2xpY3kgPT0gS0ZEX1NDSEVE
X1BPTElDWV9OT19IV1MKPiArCSAgICAjZW5kaWYKPiArCSAgICApCj4gIAkJYWRldi0+cG0ucHBf
ZmVhdHVyZSAmPSB+UFBfR0ZYT0ZGX01BU0s7Cj4gCj4gIAlmb3IgKGkgPSAwOyBpIDwgYWRldi0+
bnVtX2lwX2Jsb2NrczsgaSsrKSB7Cj4gLS0KPiAyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
