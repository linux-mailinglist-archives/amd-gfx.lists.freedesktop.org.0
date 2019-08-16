Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9546F8FCA5
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 09:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD176EB05;
	Fri, 16 Aug 2019 07:44:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680059.outbound.protection.outlook.com [40.107.68.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB486EB05
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 07:44:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3yrjIi5PwKfy1JkLvKgmr1UIKEGbvLSvR5BgkmRV3VVvZZLkATfOjrdaSDpV0wAx74B/msvva1BXiYCijdwxh5X6yRpFV1ajP9Fnbq66s6htCu+z6ivIj4jrZGxr2dIBdDSEH9QLvPThcndhcuRwCgYcSYLgrSPAmSfQVvUgZoM359EwYODeEMIim7tFhHtPxdeJSsg38NtALwa0dGeeJiT9IyHX8zNuBw9Y95vszjnXGMB6pTEHvn9JMTeXVlVbvVzd4Q2iVdLfaswgjCWEEBMBTrMvZO98V+se4wOU54ohFuJ2AQLEgdDnaOQBLp+ATezphWfAz19F6lVJHAEJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrjEMQ0OVKFxfhzioflGWoJ800OlUv+BQOFVqhpBXAU=;
 b=JM6H/VlVWz/bcqHriL6tn1aGpiBIabxVlvFO2MXAOGOdQovSUb49+m3S6z9HUIGhctPpxSpXZim26FJ0TBX0tMnDiUwdkNWAhMEp1RieiRYkcw0n7HjGwK7XBKdibwToA7Z3ytnW7bENFZ+FL/1S1ixUPwOGYrTe5mCwb76QNyJKlKGPE5sXP0K+jl/4nmZWuWoAZqTfyob0ZI543Y+W1R1lBAWn4vHTEsALexNlK8HyX47w+QRplEzm/ZzTaEbW1utWuhYIE8wKZ51Lpi3ZbH4UI7EI50oY6mtWJvgeaJS66ctIGsEunnCnAS2tHLZXaFK1AlLhWlNz3NJl4B3BvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3600.namprd12.prod.outlook.com (20.178.241.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Fri, 16 Aug 2019 07:44:14 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077%6]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 07:44:14 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: add smu_smc_read_sensor support for
 arcturus
Thread-Topic: [PATCH] drm/amd/powerplay: add smu_smc_read_sensor support for
 arcturus
Thread-Index: AQHVVANX9qrnAkbKrEyyuQuMRJcat6b9Y9wQ
Date: Fri, 16 Aug 2019 07:44:14 +0000
Message-ID: <MN2PR12MB3344E68E5D3285594A36845EE4AF0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190816072200.21833-1-kevin1.wang@amd.com>
In-Reply-To: <20190816072200.21833-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bdc958f1-8f23-46e3-fbe9-08d7221d8935
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3600; 
x-ms-traffictypediagnostic: MN2PR12MB3600:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3600C35BBE2015EA2774F1EAE4AF0@MN2PR12MB3600.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(366004)(136003)(376002)(13464003)(189003)(199004)(26005)(66946007)(74316002)(7696005)(102836004)(81166006)(6506007)(99286004)(53546011)(5660300002)(316002)(110136005)(54906003)(86362001)(76176011)(14454004)(52536014)(8936002)(53936002)(6246003)(229853002)(8676002)(81156014)(9686003)(55016002)(7736002)(3846002)(71190400001)(305945005)(66066001)(6116002)(2906002)(6436002)(71200400001)(4326008)(486006)(66446008)(476003)(64756008)(66476007)(11346002)(446003)(478600001)(66556008)(25786009)(76116006)(2501003)(33656002)(14444005)(186003)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3600;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 97mU2vQivub7LmZoPP1oWrcGXjuLx3S4RuiWmZGtBJT1EKYIn0tFtsYcOc1WlKJJnymhPIXIlMkgycLwTl/3WM44eUB+wdJDESt27fpaxC5fyXtsl/yTCHMZOVhJlxdwSd5tuIeAPr9sqXJUnZkq8J2RhELeyxzkL87dIaso7hvAi1BDGomQ34WQej3R9OBLb4inpUNwN6gyzmDkeic21nNM3b+7FH8dV1FtR39ISkY3cgvGoxAwURf6LdiAqluuL+KzXPGZUyDuLVYUzNXd9JHMP9nUWVPS6QDU0nVjunih1AntjnD7oyM8sRG2ZE7ImJ64VvnV4S6ZNhNPDbCkYdg43AUFX6XWakqzgsayvo79qG3vWx/0Y99Q0z1xYDyEaHcmsFJA1xJhiO4Pyq+hrRLmz+N0Bc7759M7ACPSfwo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc958f1-8f23-46e3-fbe9-08d7221d8935
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 07:44:14.4618 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 55e1I23qT4f14v6uSoWh3pF8ktyv+u8EKGs6BDgBFxSc/u/Jpptj3lH9RA0KwdfU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3600
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrjEMQ0OVKFxfhzioflGWoJ800OlUv+BQOFVqhpBXAU=;
 b=iwity0o/J2smFxk/cFrmwYr2PZaQaa9abPH8jfELj3t0uhVWiEz2pIQF9z5EQtR0vzR81SS1cvZsoS+M281nIiHyLQjRRwPGHRKXz4dFPKhFLzSstdxGE364EfqLSZrb67gh1zTPmmatXwPpHV7Ktp69xzw9N4pttAqC260LfHk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2l0aG91dCB0aGlzIHBhdGNoLCB0aGVyZSB3aWxsIGJlIG1pc3NpbmcgbWFueSBzZW5zb3Igc3Vw
cG9ydCBvbiBhcmN0dXJ1cy4KQmV0dGVyIHRvIGRlY2xhcmUgdGhpcyBpbiBkZXNjcmlwdGlvbnMg
b3IgcGF0Y2ggaGVhZGVyLgpXaXRoIHRoYXQgZml4ZWQsIHRoZSBwYXRjaCBpcyByZXZpZXdlZC1i
eTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KClJlZ2FyZHMsCkV2YW4KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdhbmcsIEtldmluKFlhbmcpIDxLZXZpbjEuV2Fu
Z0BhbWQuY29tPgo+IFNlbnQ6IEZyaWRheSwgQXVndXN0IDE2LCAyMDE5IDM6MjIgUE0KPiBUbzog
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogUXVhbiwgRXZhbiA8RXZhbi5RdWFu
QGFtZC5jb20+OyBIdWFuZywgUmF5Cj4gPFJheS5IdWFuZ0BhbWQuY29tPjsgRmVuZywgS2VubmV0
aCA8S2VubmV0aC5GZW5nQGFtZC5jb20+OyBXYW5nLAo+IEtldmluKFlhbmcpIDxLZXZpbjEuV2Fu
Z0BhbWQuY29tPgo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBzbXVf
c21jX3JlYWRfc2Vuc29yIHN1cHBvcnQKPiBmb3IgYXJjdHVydXMKPiAKPiB0aGUgYmVsbG93IHBh
dGNoIHJlZmluZSB0aGUgc2Vuc29yIHJlYWQgc2VxdWVuY2UsCj4gYnV0IG1pc3NlZCB0byBhZGQg
YXJjdXR1cnMgc3VwcG9ydC4gKGFyY3V0dXJzX3BwdC5jKQo+IAo+IGRybS9hbWQvcG93ZXJwbGF5
OiBjaGFuZ2Ugc211X3JlYWRfc2Vuc29yIHNlcXVlbmNlIGluIHNtdQo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jIHwgNSArKysrLQo+ICAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jCj4gYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYwo+IGluZGV4IGZjZjYyM2NmNWQyYy4u
ODUwYjJhMWVmMzI5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2FyY3R1cnVzX3BwdC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJj
dHVydXNfcHB0LmMKPiBAQCAtMTAxMiw2ICsxMDEyLDkgQEAgc3RhdGljIGludCBhcmN0dXJ1c19y
ZWFkX3NlbnNvcihzdHJ1Y3Qgc211X2NvbnRleHQKPiAqc211LAo+ICAJUFBUYWJsZV90ICpwcHRh
YmxlID0gdGFibGVfY29udGV4dC0+ZHJpdmVyX3BwdGFibGU7Cj4gIAlpbnQgcmV0ID0gMDsKPiAK
PiArCWlmKCFkYXRhIHx8ICFzaXplKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiAgCXN3aXRj
aCAoc2Vuc29yKSB7Cj4gIAljYXNlIEFNREdQVV9QUF9TRU5TT1JfTUFYX0ZBTl9SUE06Cj4gIAkJ
Kih1aW50MzJfdCAqKWRhdGEgPSBwcHRhYmxlLT5GYW5NYXhpbXVtUnBtOwo+IEBAIC0xMDM2LDcg
KzEwMzksNyBAQCBzdGF0aWMgaW50IGFyY3R1cnVzX3JlYWRfc2Vuc29yKHN0cnVjdCBzbXVfY29u
dGV4dAo+ICpzbXUsCj4gIAkJKnNpemUgPSA0Owo+ICAJCWJyZWFrOwo+ICAJZGVmYXVsdDoKPiAt
CQlyZXR1cm4gLUVJTlZBTDsKPiArCQlyZXQgPSBzbXVfc21jX3JlYWRfc2Vuc29yKHNtdSwgc2Vu
c29yLCBkYXRhLCBzaXplKTsKPiAgCX0KPiAKPiAgCXJldHVybiByZXQ7Cj4gLS0KPiAyLjIyLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
