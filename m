Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAB76A0B1
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 05:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786856E082;
	Tue, 16 Jul 2019 03:01:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680047.outbound.protection.outlook.com [40.107.68.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357756E082
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 03:01:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBbGND1MGNTGlfvddZC4nu4TBjyFTx+rlTzy0I2BFio0QFTZvrhXRMxwSs4OQATATlpDiBVKnVB6V1bbdEJYZoykZ1vtbsthiGuaBW6Nc8t2U7B6/dG875iVZFzxFKRZnJwlEn/3lQrbFFwc+lKc7K5Zf+KvRWntocTZxjrUub4O7p8Jo6r8kAMopuo9VAeu42Y/5UXMd0AMRY9ZH99SEoC/Id0djM0pSVn42VBn/RnzdqkgqivkTP/hN+zMs1qV5t7djSllgkq+D3WuHi/AeTRcIVnaiFQec7AajbkO1LfZkA79tN5zUZOmzQyp1fWhrCvgQubI2HULLEjA82NbTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dswVIYUodvyViutW2K0uD9EX9ZhuwgfjFg+yUvOz5d0=;
 b=n5qRbrpHCoaB6hE7bcbmXpVFfeJHh/tIqSeqxrxhNmwqIsJQbRRKuW778woUW/rdQMEa3fYlNqe2dAZqL2nuOfmYHl20e20nPohJ4zs+bMCt7XqIifMfzEuuJv1trG+YLbTjuY/ay56GxknA38XuX2zU89SHgKZKWGXvyu8PikTxIx1sOBJKxhgk5iy5MjEZUCnTIEX2qT1eN4r/swzwj99qw7CnZYjRE1aIuiBrSPL9atCpzeCDN+jvZyKwhPMGu1vXwoeeuTmWnOxpyFfXkY12ZoQTeqQT1UYZo7nJVZan4GVVoaWV9rfoI4Ug6WZyF1+kJGRr4IcHOBB+C8FJOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB2893.namprd12.prod.outlook.com (20.179.83.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 16 Jul 2019 03:01:43 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1%3]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 03:01:43 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: fix deadlock around smu_handle_task V2
Thread-Topic: [PATCH] drm/amd/powerplay: fix deadlock around smu_handle_task V2
Thread-Index: AQHVOHXS7ERRrYT8g0KbsSPPs08gpabMlKNw
Date: Tue, 16 Jul 2019 03:01:43 +0000
Message-ID: <MN2PR12MB3344074D151A9DF09836BFEDE4CE0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190712055054.22119-1-evan.quan@amd.com>
In-Reply-To: <20190712055054.22119-1-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6764dcf6-b38a-4d37-c1cf-08d70999eede
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2893; 
x-ms-traffictypediagnostic: MN2PR12MB2893:
x-microsoft-antispam-prvs: <MN2PR12MB28931ED3BB8B3819EE659B92E4CE0@MN2PR12MB2893.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(13464003)(199004)(189003)(186003)(8936002)(86362001)(53546011)(102836004)(478600001)(6506007)(53936002)(76176011)(316002)(486006)(7696005)(25786009)(256004)(14444005)(99286004)(9686003)(476003)(6116002)(3846002)(55016002)(26005)(5660300002)(446003)(11346002)(52536014)(6436002)(229853002)(6246003)(14454004)(71200400001)(4326008)(71190400001)(68736007)(76116006)(110136005)(33656002)(2501003)(66066001)(66476007)(8676002)(81166006)(7736002)(66556008)(64756008)(66446008)(2906002)(74316002)(66946007)(81156014)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2893;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HwHkcmPqk3Mih71cdluUovBkyq7kGgybymLCY4Sq9J9dXmswWQ6nENPiLIUQmoxU7aYODdh2TFhOB3nxacggjJaRMPvtrpZFDQ9ProyIY/a+INPWfoJWNIp3BJNvFEDuGNeGr3W+HQOKUmJEKMCkzme/x7QIwaTxnjn8LJW6bCTAqplHrhMKUoON13TKu6jEBLyJ43a4QH9vNXsykFUO+AXG39jcaFau/JWNPHrXsalp2oxmbwNHxJh15u5+7d2kYPWRqHjgK0di5sTi1nUfp/CtcNOCJvUzBAyoLYRD4dcXphIFAaivlB+bHwqyH1O/lMnfllFlaxZrZ7r8j/4Sw0fWpRom/yQ+gl03ftKklpUFpuXsqp9HlvYLt72SeqebWSjCwhcKXPIdV3nVmCIPYKz1s7FMQ4yTOcYFoUNR/7w=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6764dcf6-b38a-4d37-c1cf-08d70999eede
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 03:01:43.7427 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2893
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dswVIYUodvyViutW2K0uD9EX9ZhuwgfjFg+yUvOz5d0=;
 b=GlxZRHT2RUqKQcrCHM6QwAtuuBIIOIqgLxVhN4JdMxmm19GsuZidHNZzq+5GnDECYjjblYTyzp58e3GIIrsWlTEuIqtDUhtmhvdwimk5rZHauBOfXtmsW7xxPr4tszpQAFkcPP6D/JtEnbbH0rOdL9cbmoc52Je3NrrgfWnyS0E=
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
Cc: "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGluZy4uCgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogRXZhbiBRdWFuIDxl
dmFuLnF1YW5AYW1kLmNvbT4KPiBTZW50OiBGcmlkYXksIEp1bHkgMTIsIDIwMTkgMTo1MSBQTQo+
IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBXYW5nLCBLZXZpbihZYW5n
KSA8S2V2aW4xLldhbmdAYW1kLmNvbT47IFF1YW4sIEV2YW4KPiA8RXZhbi5RdWFuQGFtZC5jb20+
Cj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kL3Bvd2VycGxheTogZml4IGRlYWRsb2NrIGFyb3Vu
ZAo+IHNtdV9oYW5kbGVfdGFzayBWMgo+IAo+IEFzIHRoZSBsb2NrIHdhcyBhbHJlYWR5IGhlbGQg
b24gdGhlIGVudHJhbmNlIHRvIHNtdV9oYW5kbGVfdGFzay4KPiAKPiAtIFYyOiBsb2NrIGluIHNt
YWxsIGdyYW51bGFyaXR5Cj4gCj4gQ2hhbmdlLUlkOiBJNTM4OGFhOTE3ZWYwZTMzMDk3NGUyNmM1
OWRiNDJkMTM1NGI2YTg2NQo+IFNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFt
ZC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jIHwg
MiAtLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMKPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jCj4gaW5kZXggOTYxZjRlNTRlZDE4Li5lYjI1NWE2YmQz
YTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYwo+IEBAIC0zMDQ5
LDExICszMDQ5LDkgQEAgdm9pZCBhbWRncHVfcG1fY29tcHV0ZV9jbG9ja3Moc3RydWN0Cj4gYW1k
Z3B1X2RldmljZSAqYWRldikKPiAgCWlmIChpc19zdXBwb3J0X3N3X3NtdShhZGV2KSkgewo+ICAJ
CXN0cnVjdCBzbXVfY29udGV4dCAqc211ID0gJmFkZXYtPnNtdTsKPiAgCQlzdHJ1Y3Qgc211X2Rw
bV9jb250ZXh0ICpzbXVfZHBtID0gJmFkZXYtCj4gPnNtdS5zbXVfZHBtOwo+IC0JCW11dGV4X2xv
Y2soJihzbXUtPm11dGV4KSk7Cj4gIAkJc211X2hhbmRsZV90YXNrKCZhZGV2LT5zbXUsCj4gIAkJ
CQlzbXVfZHBtLT5kcG1fbGV2ZWwsCj4gIAkJCQlBTURfUFBfVEFTS19ESVNQTEFZX0NPTkZJR19D
SEFOR0UpOwo+IC0JCW11dGV4X3VubG9jaygmKHNtdS0+bXV0ZXgpKTsKPiAgCX0gZWxzZSB7Cj4g
IAkJaWYgKGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+ZGlzcGF0Y2hfdGFza3MpIHsKPiAgCQkJ
aWYgKCFhbWRncHVfZGV2aWNlX2hhc19kY19zdXBwb3J0KGFkZXYpKSB7Cj4gLS0KPiAyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
