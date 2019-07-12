Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D25366A00
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 11:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41FF6E330;
	Fri, 12 Jul 2019 09:37:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810070.outbound.protection.outlook.com [40.107.81.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBB86E330
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 09:37:00 +0000 (UTC)
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3150.namprd12.prod.outlook.com (20.178.244.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Fri, 12 Jul 2019 09:36:58 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1%3]) with mapi id 15.20.2073.008; Fri, 12 Jul 2019
 09:36:58 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 3/3] drm/amd/powerplay: fix save dpm level error for smu
Thread-Topic: [PATCH 3/3] drm/amd/powerplay: fix save dpm level error for smu
Thread-Index: AQHVOJJRJbaEu0kj4UGx4t3Iy54XrKbGuFzw
Date: Fri, 12 Jul 2019 09:36:58 +0000
Message-ID: <MN2PR12MB334449E737221DE310C58FF4E4F20@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190712091454.13478-1-kevin1.wang@amd.com>
 <20190712091454.13478-3-kevin1.wang@amd.com>
In-Reply-To: <20190712091454.13478-3-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0735685-d7d7-4ca9-d5a6-08d706ac7c11
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3150; 
x-ms-traffictypediagnostic: MN2PR12MB3150:
x-microsoft-antispam-prvs: <MN2PR12MB31505B266DFC1BDE68B580E5E4F20@MN2PR12MB3150.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(13464003)(189003)(199004)(54906003)(256004)(14444005)(110136005)(446003)(9686003)(6246003)(316002)(478600001)(186003)(33656002)(86362001)(99286004)(55016002)(14454004)(53936002)(229853002)(25786009)(486006)(476003)(11346002)(6116002)(3846002)(6436002)(2906002)(81156014)(53546011)(7736002)(26005)(68736007)(71190400001)(64756008)(4326008)(66476007)(66446008)(66556008)(74316002)(8936002)(66946007)(8676002)(76116006)(5660300002)(305945005)(76176011)(52536014)(2501003)(7696005)(102836004)(66066001)(81166006)(6506007)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3150;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FxFg9fT9h/8XLJ/vHYSzA5ZoSwzvG+iitzFnjtKRJG5FpiaWlTADmabFLXPVcGNz7trsiLPn/bW2PS3VqOxEiq+z8O+REhiy16HQfL4xpZD7ZZZ+z+p4u7dDVdfxITGyjXTaKZ/Gwsg3Z4Efe1Y3lxUq6FGjasm3nTTh+EeFDZVclScQbtwOUMNyU1B1/B/aw3W1sdRTojjPtnI1/RhqTXiG+SYXcsci6Zm8j37qbEBAKRb9Jbu0Uk/G4pfEqfjOo/NZYe35Pzub/sNPiZGiGT7hn4NS34O+aNKuWtNOV6YIc1VrKP43j0iAbYQsJOonwQRADhArAm0peVdSEK4zu3ZHCpfiAhrQ2431/g7z2wKZPkP+WKinqmo9U7XrrXen9xGkdpO24SkJk/W/XjQFm5uc3qe/kbkzvF5pwrWh2EI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0735685-d7d7-4ca9-d5a6-08d706ac7c11
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 09:36:58.0560 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3150
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UREuKaoawmIwEEk8eu/Pz864pRCwIRoxZQW55tdkHQo=;
 b=nCBhN8+PVSV0hqFoO8svSROjtuasrLTFcUS/FZ6XAMNziAj6YOfCNUElsIydpP9wlUL1xdVlXTh3eHZ7gnRQGgc32Wka2YdQ4iG+mvP0EX2dBq9G+y6eyqG647tfiew8r5Nmv/qqno1O3YQ+ta0vDcYgBHmfBBhl9Qy9Bhjy22g=
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiB0aGUgc2F2ZSBkcG0gbGV2ZWwgc2hvdWxkIGJlIHNhdmUgcHJldmlvdXMgZHBtIHByb2ZpbGUg
bGV2ZWwsIHNob3VsZCBub3QKPiBtb2RpZmllZCBieSBnZXQgZHBtIGxldmVsIGZ1bmN0aW9uLgpQ
bGVhc2UgZ2l2ZSBhIGJldHRlciBkZXNjcmlwdGlvbiB0byBleHBsYWluIHdoeSB0aGlzIGNoYW5n
ZSBpcyBuZWVkZWQuCgoKZW51bSBhbWRfZHBtX2ZvcmNlZF9sZXZlbCBzbXVfZ2V0X3BlcmZvcm1h
bmNlX2xldmVsKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogewogCXN0cnVjdCBzbXVfZHBtX2Nv
bnRleHQgKnNtdV9kcG1fY3R4ID0gJihzbXUtPnNtdV9kcG0pOworCWVudW0gYW1kX2RwbV9mb3Jj
ZWRfbGV2ZWwgbGV2ZWw7CiAKIAlpZiAoIXNtdV9kcG1fY3R4LT5kcG1fY29udGV4dCkKIAkJcmV0
dXJuIC1FSU5WQUw7CiAKIAltdXRleF9sb2NrKCYoc211LT5tdXRleCkpOwotCWlmIChzbXVfZHBt
X2N0eC0+ZHBtX2xldmVsICE9IHNtdV9kcG1fY3R4LT5zYXZlZF9kcG1fbGV2ZWwpIHsKLQkJc211
X2RwbV9jdHgtPnNhdmVkX2RwbV9sZXZlbCA9IHNtdV9kcG1fY3R4LT5kcG1fbGV2ZWw7Ci0JfQor
CWxldmVsID0gc211X2RwbV9jdHgtPmRwbV9sZXZlbDsKIAltdXRleF91bmxvY2soJihzbXUtPm11
dGV4KSk7CiAKLQlyZXR1cm4gc211X2RwbV9jdHgtPmRwbV9sZXZlbDsKKwlyZXR1cm4gbGV2ZWw7
CiB9CgpDYW4geW91IHNpbXBsaWZ5IHRoZSBpbnRlcmZhY2UgZnVydGhlcj8gTWF5YmUganVzdCBy
ZXR1cm4gc211X2RwbV9jdHgtPmRwbV9sZXZlbCBhbmQgbm8gbG9jayBuZWVkZWQuCgpXaXRoIGFi
b3ZlIGFkZHJlc3NlZCwgdGhlIHBhdGNoIGlzIGV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5x
dWFuQGFtZC5jb20+Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogV2FuZywg
S2V2aW4oWWFuZykgPEtldmluMS5XYW5nQGFtZC5jb20+Cj4gU2VudDogRnJpZGF5LCBKdWx5IDEy
LCAyMDE5IDU6MTUgUE0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzog
RmVuZywgS2VubmV0aCA8S2VubmV0aC5GZW5nQGFtZC5jb20+OyBRdWFuLCBFdmFuCj4gPEV2YW4u
UXVhbkBhbWQuY29tPjsgWHUsIEZlaWZlaSA8RmVpZmVpLlh1QGFtZC5jb20+OyBXYW5nLAo+IEtl
dmluKFlhbmcpIDxLZXZpbjEuV2FuZ0BhbWQuY29tPgo+IFN1YmplY3Q6IFtQQVRDSCAzLzNdIGRy
bS9hbWQvcG93ZXJwbGF5OiBmaXggc2F2ZSBkcG0gbGV2ZWwgZXJyb3IgZm9yIHNtdQo+IAo+IHRo
ZSBzYXZlIGRwbSBsZXZlbCBzaG91bGQgYmUgc2F2ZSBwcmV2aW91cyBkcG0gcHJvZmlsZSBsZXZl
bCwgc2hvdWxkIG5vdAo+IG1vZGlmaWVkIGJ5IGdldCBkcG0gbGV2ZWwgZnVuY3Rpb24uCj4gZWc6
IGRlZmF1bHQgYXV0bwo+IDEuIGF1dG8gLT4gc3RhbmRhcmQgPT0+IGRwbV9sZXZlbCA9IHN0YW5k
YXJkLCBzYXZlX2RwbSA9IGF1dG8uCj4gMi4gc3RhbmRhcmQgLT4gYXV0byA9PT4gZHBtX2xldmVs
ID0gYXV0bywgc2F2ZV9kcG0gPSBzdGFuZGFyZC4KPiAKPiBDaGFuZ2UtSWQ6IEliNjc2NmU1N2Nj
MTg3ZGY0ZjBjODljYzY4ZGNlZTdlZmQ3NzUyOWZkCj4gU2lnbmVkLW9mZi1ieTogS2V2aW4gV2Fu
ZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYW1kZ3B1X3NtdS5jIHwgNyArKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYW1kZ3B1X3NtdS5jCj4gaW5kZXggYmU5MGFlNTlkZmE4Li40YWJlZGY3MmExNWUgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCj4gQEAgLTE0
MjgsMTcgKzE0MjgsMTYgQEAgaW50IHNtdV9oYW5kbGVfdGFzayhzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSwKPiBlbnVtIGFtZF9kcG1fZm9yY2VkX2xldmVsIHNtdV9nZXRfcGVyZm9ybWFuY2VfbGV2
ZWwoc3RydWN0Cj4gc211X2NvbnRleHQgKnNtdSkgIHsKPiAgCXN0cnVjdCBzbXVfZHBtX2NvbnRl
eHQgKnNtdV9kcG1fY3R4ID0gJihzbXUtPnNtdV9kcG0pOwo+ICsJZW51bSBhbWRfZHBtX2ZvcmNl
ZF9sZXZlbCBsZXZlbDsKPiAKPiAgCWlmICghc211X2RwbV9jdHgtPmRwbV9jb250ZXh0KQo+ICAJ
CXJldHVybiAtRUlOVkFMOwo+IAo+ICAJbXV0ZXhfbG9jaygmKHNtdS0+bXV0ZXgpKTsKPiAtCWlm
IChzbXVfZHBtX2N0eC0+ZHBtX2xldmVsICE9IHNtdV9kcG1fY3R4LT5zYXZlZF9kcG1fbGV2ZWwp
Cj4gewo+IC0JCXNtdV9kcG1fY3R4LT5zYXZlZF9kcG1fbGV2ZWwgPSBzbXVfZHBtX2N0eC0KPiA+
ZHBtX2xldmVsOwo+IC0JfQo+ICsJbGV2ZWwgPSBzbXVfZHBtX2N0eC0+ZHBtX2xldmVsOwo+ICAJ
bXV0ZXhfdW5sb2NrKCYoc211LT5tdXRleCkpOwo+IAo+IC0JcmV0dXJuIHNtdV9kcG1fY3R4LT5k
cG1fbGV2ZWw7Cj4gKwlyZXR1cm4gbGV2ZWw7Cj4gIH0KPiAKPiAgaW50IHNtdV9mb3JjZV9wZXJm
b3JtYW5jZV9sZXZlbChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bQo+IGFtZF9kcG1fZm9y
Y2VkX2xldmVsIGxldmVsKQo+IC0tCj4gMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
