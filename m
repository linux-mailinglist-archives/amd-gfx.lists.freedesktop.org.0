Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3CA65967
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jul 2019 16:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C9C6E262;
	Thu, 11 Jul 2019 14:53:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760042.outbound.protection.outlook.com [40.107.76.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E23D6E262
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jul 2019 14:53:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=VWIH6AAEaa70KIA4bWpWV034JraZCCHF8BNyYuYlB5KDMVgDaXhthUbFEfl0xnrvegu9r52t/9pQnD8pxnD+YU1C3/GAxOX5BiIOTXLTj29ccCF/CbRWLmrcB7OXVbiYD/G12cq2RgxeGDfbRUT6IrFmfFGEyCOuCuK3gMbPsbU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yfl8kgwbTLE8r8+AWsYC7QZCsm+n7I2Gq0RmZ2m+krI=;
 b=Otq2rdjjgRpHqCdN9snTtx8fAsZLecr9XSpIVvbK36UPZRN6qs1fdxi1PB6ASm+xBDE6vSlXZjEoygZpGGrjycYdUoJXnVAxNAj4Lk5Nlu2tqmcrOhP02mKQunCbmR9M7qsl1ozzjNBdU+GH0n7RQ9nFPNy6z1GFRNuaKekg+ng=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from CH2PR12MB3767.namprd12.prod.outlook.com (52.132.244.213) by
 CH2PR12MB3799.namprd12.prod.outlook.com (52.132.245.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.15; Thu, 11 Jul 2019 14:53:26 +0000
Received: from CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::6cc4:28bf:361f:d486]) by CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::6cc4:28bf:361f:d486%3]) with mapi id 15.20.2052.020; Thu, 11 Jul 2019
 14:53:26 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
Subject: Re: [PATCH] drm/amd/powerplay: fix smu clock type change miss error
Thread-Topic: [PATCH] drm/amd/powerplay: fix smu clock type change miss error
Thread-Index: AQHVN+41XmBWZoXLgEWWJZTYyaQPfabFgO23
Date: Thu, 11 Jul 2019 14:53:26 +0000
Message-ID: <49F36836-71B8-4B7D-BF7A-D03D0A24FA31@amd.com>
References: <20190711133937.10417-1-kevin1.wang@amd.com>
In-Reply-To: <20190711133937.10417-1-kevin1.wang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [218.1.208.84]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb091887-fae2-46dc-1af0-08d7060f87ae
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CH2PR12MB3799; 
x-ms-traffictypediagnostic: CH2PR12MB3799:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CH2PR12MB3799105BEE80D94D8D1DD026FEF30@CH2PR12MB3799.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(189003)(199004)(54906003)(2906002)(53936002)(966005)(5660300002)(6436002)(8676002)(316002)(81166006)(81156014)(66066001)(66556008)(66446008)(6486002)(71190400001)(71200400001)(6116002)(64756008)(37006003)(478600001)(7736002)(86362001)(6512007)(102836004)(53546011)(8936002)(186003)(6306002)(14454004)(66476007)(256004)(4326008)(11346002)(68736007)(2616005)(76176011)(446003)(476003)(6862004)(99286004)(6636002)(3846002)(6246003)(36756003)(33656002)(76116006)(25786009)(229853002)(26005)(6506007)(66946007)(486006)(91956017)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3799;
 H:CH2PR12MB3767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7aRm+FM9LYip//n0Lsax+Zh7DDIGU1vsgv7D04yLDlrSeJlfmBmwEmEEZFdRHxuGk42xUV+kN4+YMOFh06G/UkADn6hlUHJWkYJ8voMq9f/ecY7jzuzhdksrBzVBBObSeUhPKLxhhlIYoACcT8aau5XvcYrQbDpoIQ02lx/OICEQOhJh+7XvH4z4F9YYyl5pCA/JP1YpN9MvwY46a13DqAlnZ6Dm6L7OFwuM0zWaucZOW2Uf1gbLkHM2ktX5rTppiS5VSPjlp1EUDRGaxidcS42D5uZWXii4rNjZWNDGr3sm+vkfH/tt1dz4Z+4lnEKu0weBsziRA0hO4ygnb25zOwZY3IlV5QEfAfwiro0s5iB8ROrDfp6RLTpOzmS1T1d5UPKDimwSNTKs1OgxLvu7Tgeg3yCUhwvQ/u3fAr4Mja0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb091887-fae2-46dc-1af0-08d7060f87ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 14:53:26.5385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: feifxu@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3799
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yfl8kgwbTLE8r8+AWsYC7QZCsm+n7I2Gq0RmZ2m+krI=;
 b=JoV/zjgsro5BA0r4PeOIfbyzAWNaOSI+Umn+PYtKppuDMq9nvysqdF0yXK9wIGmg8chgZVj0VaqyEG7v2zgCJu6100ZARZL5F7fP94OEOMhM7wWbHH1dGWAfk1UfdARRVXkJAnKICmhjCyT/aKsT/F9/5XVqMv1qInVSFyaBKYY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Feifei.Xu@amd.com; 
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
Cc: "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEZlaWZlaSBYdSA8RmVpZmVpLlh1QGFtZC5jb20+Cgo+IE9uIEp1bCAxMSwg
MjAxOSwgYXQgMjE6NDAsIFdhbmcsIEtldmluKFlhbmcpIDxLZXZpbjEuV2FuZ0BhbWQuY29tPiB3
cm90ZToKPiAKPiBpbiB0aGUgc211IG1vZHVsZSwgdXNlIHRoZSBzbXVfeHh4Y2xrIHR5cGUgdG8g
aWRlbnRpZnkgdGhlIENMSyB0eXBlCj4gdXNlIFNNVV9TQ0xLLCBTTVVfTUNMSyB0byByZXBsYWNl
IFBQX1NDTEssIFBQX01DTEsuCj4gCj4gQ2hhbmdlLUlkOiBJZmE4NzBhZWEzOGYwNDNlMTk4M2Y2
ZjA1NjBlZWQyYWMwNzBiNjhiNwo+IFNpZ25lZC1vZmYtYnk6IEtldmluIFdhbmcgPGtldmluMS53
YW5nQGFtZC5jb20+Cj4gLS0tCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1
X3NtdS5jIHwgNCArKy0tCj4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
YW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5j
Cj4gaW5kZXggMWMxNWYwMjEwMWZlLi5kZTZjYzVkNDg5Y2QgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCj4gQEAgLTEzODYsOCArMTM4Niw4IEBAIGlu
dCBzbXVfYWRqdXN0X3Bvd2VyX3N0YXRlX2R5bmFtaWMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUs
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICZzb2NfbWFzayk7Cj4gICAgICAgICAgICBp
ZiAocmV0KQo+ICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gLSAgICAgICAgICAgIHNtdV9m
b3JjZV9jbGtfbGV2ZWxzKHNtdSwgUFBfU0NMSywgMSA8PCBzY2xrX21hc2spOwo+IC0gICAgICAg
ICAgICBzbXVfZm9yY2VfY2xrX2xldmVscyhzbXUsIFBQX01DTEssIDEgPDwgbWNsa19tYXNrKTsK
PiArICAgICAgICAgICAgc211X2ZvcmNlX2Nsa19sZXZlbHMoc211LCBTTVVfU0NMSywgMSA8PCBz
Y2xrX21hc2spOwo+ICsgICAgICAgICAgICBzbXVfZm9yY2VfY2xrX2xldmVscyhzbXUsIFNNVV9N
Q0xLLCAxIDw8IG1jbGtfbWFzayk7Cj4gICAgICAgICAgICBicmVhazsKPiAKPiAgICAgICAgY2Fz
ZSBBTURfRFBNX0ZPUkNFRF9MRVZFTF9NQU5VQUw6Cj4gLS0gCj4gMi4yMi4wCj4gCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxp
bmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
