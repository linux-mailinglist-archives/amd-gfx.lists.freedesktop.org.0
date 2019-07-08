Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE1F62587
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jul 2019 18:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355B989F0A;
	Mon,  8 Jul 2019 16:01:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710065.outbound.protection.outlook.com [40.107.71.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F3B89F77
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jul 2019 16:01:26 +0000 (UTC)
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3430.namprd12.prod.outlook.com (20.178.196.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Mon, 8 Jul 2019 16:01:24 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::b134:9f:3a1e:2b5a]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::b134:9f:3a1e:2b5a%5]) with mapi id 15.20.2052.020; Mon, 8 Jul 2019
 16:01:24 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: properly guard DC support in navi code
Thread-Topic: [PATCH] drm/amdgpu: properly guard DC support in navi code
Thread-Index: AQHVM3IY9qvsNXm2Z0qc3t1+eMqFeqbAdGkA///63gCAAHLCAIAAA9gA
Date: Mon, 8 Jul 2019 16:01:24 +0000
Message-ID: <6180dc12-cfa6-3f03-1d4e-49c92dfc8ad8@amd.com>
References: <20190705204142.10231-1-alexander.deucher@amd.com>
 <c62c35e2-a920-081b-6dfc-7fdab8a8b1ba@daenzer.net>
 <25d7a737-534d-8200-2b24-60080218db64@amd.com>
 <CADnq5_Nv-8-jY4FPGWUrDPAUP4TBg_amaR4DGPqyUtkmrNcJzA@mail.gmail.com>
In-Reply-To: <CADnq5_Nv-8-jY4FPGWUrDPAUP4TBg_amaR4DGPqyUtkmrNcJzA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::49) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8b504df-a192-4a87-880e-08d703bd86f1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3430; 
x-ms-traffictypediagnostic: BYAPR12MB3430:
x-microsoft-antispam-prvs: <BYAPR12MB34308E46540EA735B5DB0D4DECF60@BYAPR12MB3430.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(199004)(189003)(6486002)(229853002)(6436002)(54906003)(6916009)(6512007)(102836004)(52116002)(3846002)(6506007)(386003)(8936002)(72206003)(76176011)(478600001)(26005)(53546011)(6116002)(4326008)(99286004)(316002)(25786009)(31686004)(53936002)(8676002)(14444005)(36756003)(186003)(2906002)(86362001)(5660300002)(256004)(2616005)(476003)(446003)(11346002)(31696002)(14454004)(305945005)(66446008)(64756008)(66556008)(6246003)(66066001)(66476007)(486006)(7736002)(1411001)(73956011)(66946007)(81166006)(81156014)(71200400001)(71190400001)(68736007)(66574012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3430;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Yjy5CPj/Q2XfrB8l349ASYg0f2Me4SU5T0C9d9tWspokF6N5X/EKbPPsnh9FBx2/c5xxsRVP9xfN5wAA5XPyOwioZbCrsrZIZBAXTcsNBswRajle2A8viG0iFTgWYWN11nNwc0z5jg2A4GZvgJDhWfl9Hyv9AoA5UUkgGk1RskDDnzxkUjR7AoZb1EctyJLkxp9Qo60CAXoM+miN18lSs2YuQ86U2cDkIlZ3cnCACyWH4PsU23FrVVHSbY1doKAw9zmMsa4XXa2UxoyyPyzTU9s4UIe4xHfBFredyW9ufyJKjk/CYxP/cXmtGBbvBV3feBk+7Veyom+aYUGt+QRQk8iQGjlvaE+TBATyr1pFaUTyRYvMqrwrt/Qg96Me1Hy8X75HubcfbuGfArpZ+fk5tsl2+Vaz/ryxeLEHb3NopBY=
Content-ID: <6FB5E73ACA084945B5DAB65560EA1632@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b504df-a192-4a87-880e-08d703bd86f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 16:01:24.5951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nkazlaus@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3430
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rtp1yDG1wxkeLYkZKeWmmh+64rpKNi2jegx4TguNbMM=;
 b=0bvkE8Ff4gwv6dHgRWg4owsSnzs/isqiLtxFaSjGw1bYaBxTcan/sisPeeXDpQj4YFLtjqp83NZ54RXocg8dz8088ld8cHncopJS9rR/Y6BkEIZKSDdJgO3xbkUxnB9lAxuYDXAiWMMUoaK5a5bb2zKzc4lIuoqgg2907FCOnW4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gNy84LzE5IDExOjQ3IEFNLCBBbGV4IERldWNoZXIgd3JvdGU6DQo+IE9uIE1vbiwgSnVsIDgs
IDIwMTkgYXQgODo1NiBBTSBLYXpsYXVza2FzLCBOaWNob2xhcw0KPiA8TmljaG9sYXMuS2F6bGF1
c2thc0BhbWQuY29tPiB3cm90ZToNCj4+DQo+PiBPbiA3LzgvMTkgNToxNSBBTSwgTWljaGVsIETD
pG56ZXIgd3JvdGU6DQo+Pj4gT24gMjAxOS0wNy0wNSAxMDo0MSBwLm0uLCBBbGV4IERldWNoZXIg
d3JvdGU6DQo+Pj4+IE5lZWQgdG8gYWRkIGFwcHJvcHJpYXRlIGlmZGVmLg0KPj4+Pg0KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+
Pj4+IC0tLQ0KPj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIHwgNCArKysr
DQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4+Pj4NCj4+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9udi5jDQo+Pj4+IGluZGV4IGEwOTBlM2ZkYzc2Mi4uZWUzOWNiNzQwZDQx
IDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jDQo+Pj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMNCj4+Pj4gQEAgLTM1Miw4ICsz
NTIsMTIgQEAgaW50IG52X3NldF9pcF9ibG9ja3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
DQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICBhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChh
ZGV2LCAmc211X3YxMV8wX2lwX2Jsb2NrKTsNCj4+Pj4gICAgICAgICAgICAgICBpZiAoYWRldi0+
ZW5hYmxlX3ZpcnR1YWxfZGlzcGxheSB8fCBhbWRncHVfc3Jpb3ZfdmYoYWRldikpDQo+Pj4+ICAg
ICAgICAgICAgICAgICAgICAgICBhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZGNl
X3ZpcnR1YWxfaXBfYmxvY2spOw0KPj4+PiArI2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURfREMp
DQo+Pj4+ICAgICAgICAgICAgICAgZWxzZSBpZiAoYW1kZ3B1X2RldmljZV9oYXNfZGNfc3VwcG9y
dChhZGV2KSkNCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgIGFtZGdwdV9kZXZpY2VfaXBfYmxv
Y2tfYWRkKGFkZXYsICZkbV9pcF9ibG9jayk7DQo+Pj4+ICsjZWxzZQ0KPj4+PiArIyAgIHdhcm5p
bmcgIkVuYWJsZSBDT05GSUdfRFJNX0FNRF9EQyBmb3IgZGlzcGxheSBzdXBwb3J0IG9uIG5hdmku
Ig0KPj4+PiArI2VuZGlmDQo+Pj4+ICAgICAgICAgICAgICAgYW1kZ3B1X2RldmljZV9pcF9ibG9j
a19hZGQoYWRldiwgJmdmeF92MTBfMF9pcF9ibG9jayk7DQo+Pj4+ICAgICAgICAgICAgICAgYW1k
Z3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnNkbWFfdjVfMF9pcF9ibG9jayk7DQo+Pj4+
ICAgICAgICAgICAgICAgaWYgKGFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSA9PSBBTURHUFVfRldf
TE9BRF9ESVJFQ1QgJiYNCj4+Pj4NCj4+Pg0KPj4+IElzIENPTkZJR19EUk1fQU1EX0RDIHN0aWxs
IG5lZWRlZD8gV2hhdCBmb3I/IChPdGhlciB0aGFuIGFjY2lkZW50YWxseQ0KPj4+IGRpc2FibGlu
ZyBkaXNwbGF5IHdpdGggY3VycmVudCBoYXJkd2FyZSA7KQ0KPj4+DQo+Pj4NCj4+DQo+PiBJdCB3
b3VsZCBzbGltIGRvd24gbW9kdWxlIHNpemUgYW5kIGNvbXBpbGUgdGltZXMgaWYgeW91IGp1c3Qg
bmVlZGVkDQo+PiBSYWRlb24gYW5kIG5vdGhpbmcgZWxzZSwgYnV0IGl0J3Mga2luZCBvZiBhIG5p
Y2hlIHVzZSBjYXNlLg0KPj4NCj4+IEkgdGhpbmsgdGhlIG9ubHkgdGhpbmcgaXQgZG9lcyByaWdo
dCBub3cgaXMgYXV0b3NlbGVjdCBEQ04gYmFzZWQgb24NCj4+IHdoZXRoZXIgd2UgdGhpbmsgd2Ug
aGF2ZSBGUCBzdXBwb3J0IG9yIG5vdCwgYnV0IHRoYXQgY291bGQgcHJvYmFibHkgYmUNCj4+IG1v
dmVkIGVsc2V3aGVyZS4NCj4gDQo+IENhbiBJIGdldCBhbiBhY2sgb3IgUkIgb24gdGhpcz8gIFdl
IGNhbiBkZWNpZGUgd2hhdCB0byBkbyBhYm91dCB0aGUNCj4gb3B0aW9uIGxhdGVyLg0KPiANCj4g
QWxleA0KDQpSZXZpZXdlZC1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1
c2thc0BhbWQuY29tPg0KDQpUaGlzIGlzIGZpbmUgZm9yIG5vdy4NCg0KPiANCj4+DQo+PiBOaWNo
b2xhcyBLYXpsYXVza2FzDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
