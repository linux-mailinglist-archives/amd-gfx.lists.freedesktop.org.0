Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C995F1D01B
	for <lists+amd-gfx@lfdr.de>; Tue, 14 May 2019 21:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DEC89317;
	Tue, 14 May 2019 19:43:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700046.outbound.protection.outlook.com [40.107.70.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C1E89317
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 May 2019 19:43:41 +0000 (UTC)
Received: from BYAPR12MB3384.namprd12.prod.outlook.com (20.178.55.225) by
 BYAPR12MB3096.namprd12.prod.outlook.com (20.178.54.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Tue, 14 May 2019 19:43:37 +0000
Received: from BYAPR12MB3384.namprd12.prod.outlook.com
 ([fe80::94db:e1b3:e492:1513]) by BYAPR12MB3384.namprd12.prod.outlook.com
 ([fe80::94db:e1b3:e492:1513%6]) with mapi id 15.20.1878.024; Tue, 14 May 2019
 19:43:37 +0000
From: "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>
To: Roman Gushchin <guro@fb.com>
Subject: Re: [PATCH 4/4] drm/amdkfd: Check against device cgroup
Thread-Topic: [PATCH 4/4] drm/amdkfd: Check against device cgroup
Thread-Index: AQHVAC55koEwRnit7kyr2zcr6OGdM6Zp8LgAgAEGcACAACKqrQ==
Date: Tue, 14 May 2019 19:43:37 +0000
Message-ID: <BYAPR12MB3384F5C0D850C9D6DE720B6C8C080@BYAPR12MB3384.namprd12.prod.outlook.com>
References: <20190501145904.27505-1-Harish.Kasiviswanathan@amd.com>
 <20190501145904.27505-5-Harish.Kasiviswanathan@amd.com>
 <20190514015832.GA14741@tower.DHCP.thefacebook.com>,
 <20190514173749.GA12629@tower.DHCP.thefacebook.com>
In-Reply-To: <20190514173749.GA12629@tower.DHCP.thefacebook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aadeffd1-4e2a-4f24-b47b-08d6d8a4753c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3096; 
x-ms-traffictypediagnostic: BYAPR12MB3096:
x-microsoft-antispam-prvs: <BYAPR12MB30968A8A1EAB66576A45C3EE8C080@BYAPR12MB3096.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(136003)(396003)(366004)(189003)(199004)(66066001)(6916009)(73956011)(71190400001)(71200400001)(478600001)(2906002)(4326008)(102836004)(5660300002)(66556008)(25786009)(76116006)(6246003)(55016002)(186003)(64756008)(66446008)(256004)(14444005)(53936002)(26005)(54906003)(99286004)(7696005)(52536014)(66476007)(6116002)(3846002)(74316002)(9686003)(76176011)(229853002)(53546011)(6506007)(68736007)(91956017)(6436002)(476003)(7736002)(8936002)(86362001)(446003)(11346002)(305945005)(14454004)(66946007)(486006)(8676002)(72206003)(81166006)(81156014)(316002)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3096;
 H:BYAPR12MB3384.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TqyiUpc05gsS9TXM238QvHNLhn7lzd47VZWsOxjukkaUfo8Rg7EPoM0Dp2F4G4ALX1MqWLaOlVC0Mh23zV/RrMXRWG+HRFSPq4kSycbdyZZZFx5nOA69z7bcWDbLfMO8KxsATidJFn1fSPxGHZNprMQ534OwE1SI44H6VmmPyAN0tloIgrHqa/r/MTLwjLzkAVlIJax/p5Kd3vWUCkUJKHUf0uBGaSWEexXixYirifZA6fUOhn05FxHWffc3Dielv1AkVHBWkiHRK7iHWb3B6fYtxfmpFQz/Jxn2j31saT8qVOssxATAdlFV/Gg0hh831uZ54Am3dbBAvEbJ5b4yQsZN7tMMHnDxuEt67f29JQf2kN3huk5Xhy8j8H8pk6XunGvNycuUUORCHa4wxWSbVgRuI+4IsAfmGHHDm0fjRQM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aadeffd1-4e2a-4f24-b47b-08d6d8a4753c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2019 19:43:37.2013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3096
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zOR9zsbKDBKlfCcrjv9bsLGQZvb5cCshKyL/sCFwLE=;
 b=KHx8EZvaPotWBKvJKP/DJ4JkgAeyt7hBtM62izf5XwyFWdJJk9/dO/VPvABTqji6VpUfPJ+GE2YpFsmoSkeLWSg+dtiYkEXZ7XsyPtYSzcCvdGUkWehainwSWYzotViEm1VF6WktpiVxGNvKVxbqkQfJuOxVVTC32YuUreV5Krg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harish.Kasiviswanathan@amd.com; 
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
Cc: "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgUm9tYW4sCgpUaGFua3MgZm9yIHlvdXIgZmVlZGJhY2suIEkgd2lsbCByZXdvcmsgYW5kIHNl
bmQgbmV3IHBhdGNoIHNvb24uCgpCZXN0IFJlZ2FyZHMsCkhhcmlzaAogCgoKCgpGcm9tOiBSb21h
biBHdXNoY2hpbiA8Z3Vyb0BmYi5jb20+ClNlbnQ6IFR1ZXNkYXksIE1heSAxNCwgMjAxOSAxOjM3
IFBNClRvOiBLYXNpdmlzd2FuYXRoYW4sIEhhcmlzaApDYzogY2dyb3Vwc0B2Z2VyLmtlcm5lbC5v
cmc7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClN1YmplY3Q6IFJlOiBbUEFUQ0ggNC80
XSBkcm0vYW1ka2ZkOiBDaGVjayBhZ2FpbnN0IGRldmljZSBjZ3JvdXAKwqAgCgpbQ0FVVElPTjog
RXh0ZXJuYWwgRW1haWxdCgpPbiBUdWUsIE1heSAxNCwgMjAxOSBhdCAwMTo1ODo0MEFNICswMDAw
LCBSb21hbiBHdXNoY2hpbiB3cm90ZToKPiBPbiBXZWQsIE1heSAwMSwgMjAxOSBhdCAwMjo1OToy
OVBNICswMDAwLCBLYXNpdmlzd2FuYXRoYW4sIEhhcmlzaCB3cm90ZToKPiA+IFBhcnRpY2lwYXRl
IGluIGRldmljZSBjZ3JvdXAuIEFsbCBrZmQgZGV2aWNlcyBhcmUgZXhwb3NlZCB2aWEgL2Rldi9r
ZmQuCj4gPiBTbyB1c2UgL2Rldi9kcmkvcmVuZGVyTiBub2RlLgo+ID4KPiA+IEJlZm9yZSBleHBv
c2luZyB0aGUgZGV2aWNlIHRvIGEgdGFzayBjaGVjayBpZiBpdCBoYXMgcGVybWlzc2lvbiB0bwo+
ID4gYWNjZXNzIGl0LiBJZiB0aGUgdGFzayAoYmFzZWQgb24gaXRzIGNncm91cCkgY2FuIGFjY2Vz
cyAvZGV2L2RyaS9yZW5kZXJOCj4gPiB0aGVuIGV4cG9zZSB0aGUgZGV2aWNlIHZpYSBrZmQgbm9k
ZS4KPiA+Cj4gPiBJZiB0aGUgdGFzayBjYW5ub3QgYWNjZXNzIC9kZXYvZHJpL3JlbmRlck4gdGhl
biBwcm9jZXNzIGRldmljZSBkYXRhCj4gPiAocGRkKSBpcyBub3QgY3JlYXRlZC4gVGhpcyB3aWxs
IGVuc3VyZSB0aGF0IHRhc2sgY2Fubm90IHVzZSB0aGUgZGV2aWNlLgo+ID4KPiA+IEluIHN5c2Zz
IHRvcG9sb2d5LCBhbGwgZGV2aWNlIG5vZGVzIGFyZSB2aXNpYmxlIGlycmVzcGVjdGl2ZSBvZiB0
aGUgdGFzawo+ID4gY2dyb3VwLiBUaGUgc3lzZnMgbm9kZSBkaXJlY3RvcmllcyBhcmUgY3JlYXRl
ZCBhdCBkcml2ZXIgbG9hZCB0aW1lIGFuZAo+ID4gY2Fubm90IGJlIGNoYW5nZWQgZHluYW1pY2Fs
bHkuIEhvd2V2ZXIsIGFjY2VzcyB0byBpbmZvcm1hdGlvbiBpbnNpZGUKPiA+IG5vZGVzIGlzIGNv
bnRyb2xsZWQgYmFzZWQgb24gdGhlIHRhc2sncyBjZ3JvdXAgcGVybWlzc2lvbnMuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogSGFyaXNoIEthc2l2aXN3YW5hdGhhbiA8SGFyaXNoLkthc2l2aXN3YW5h
dGhhbkBhbWQuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVo
bGluZ0BhbWQuY29tPgo+Cj4gSGVsbG8sIEhhcmlzaCEKPgo+IENncm91cC9kZXZpY2UgY29udHJv
bGxlciBwYXJ0IGxvb2tzIGdvb2QgdG8gbWUuCj4gUGxlYXNlLCBmZWVsIGZyZWUgdG8gdXNlIG15
IGFja3MgZm9yIHBhdGNoZXMgMyBhbmQgNDoKPiBBY2tlZC1ieTogUm9tYW4gR3VzaGNoaW4gPGd1
cm9AZmIuY29tPgoKSGVsbG8hCgpBZnRlciB0aGUgc2Vjb25kIGxvb2sgYXQgdGhlIHBhdGNoc2V0
IEkgY2FtZSB0byBhbiB1bmRlcnN0YW5kaW5nIHRoYXQKZXhwb3J0aW5nIGNncm91cF92MS1vbmx5
IF9fZGV2Y2dyb3VwX2NoZWNrX3Blcm1pc3Npb24oKSBpc24ndCB0aGUgYmVzdCBpZGVhLgoKSW5z
dGVhZCBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gZXhwb3J0IGRldmNncm91cF9jaGVja19wZXJtaXNz
aW9uKCksIHdoaWNoCnByb3ZpZGVzIGFuIHVuaXZlcnNhbCBpbnRlcmZhY2UgZm9yIGJvdGggY2dy
b3VwIHYxIGFuZCB2MiBkZXZpY2UgY29udHJvbGxlcnMuCkl0wqAgcmVxdWlyZSBzb21lIHJlZmFj
dG9yaW5ncywgYnV0IHNob3VsZCBiZSBub3QgaGFyZC4KCkRvZXMgaXQgbWFrZXMgc2Vuc2UgdG8g
eW91PyBDYW4geW91LCBwbGVhc2UsIHJld29yayB0aGlzIHBhcnQ/CgpUaGFua3MhCiAgICAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
