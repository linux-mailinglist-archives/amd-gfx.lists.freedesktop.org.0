Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D5799098
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 12:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD4C6EAF0;
	Thu, 22 Aug 2019 10:20:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720076.outbound.protection.outlook.com [40.107.72.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDD86EAF0
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 10:20:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHAeBP5V7F9InjrYQlQiqMuOKIe21x43VlSZA1SzwxeFFlGt1xkIbjKhaDP6y2OLL3lHCDoKdej0eC/RqBQW38g+B9P1scNPEj9Ro54q5ZxxeQkoiCXGdFa4SD8qQuoGvu4+ZJhHwUBCBV3nAuqURX23VMoG2oK8L5ydFoeswejthzvv6FkXzec3sv9jh7CkBZAxlZa9uYgFo8me7mg9a+RX9zw9h8ULxNaS+PuJVsCE2YU4hbXK7CGh8cGS+6mrLaW1n9+JPWrMFAdLIsgEQ6/rL7zK/MuGbKa3SnZtVOwF7o23T8Y3OuE1/N3VW0FVBqkcRiDT9GDre5nJhYYRzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWRZ13wib3n5XD49GUjEoPZL/6Kq67pA+ym4+GFITQQ=;
 b=SEb11DVb0184xRDiOflA0o5VlJ1sjmCPnXYK3S/kK+ku4+Tdvimx21Qchmo4aZq5nZPvZ9GLfHh7EGZmMFTA4L7AKwjsxGwObI9cesXlK3fxTfw5xp52O3SO0zVqdFtRJf5blxqCtIBmr4nIWMjHR/mEwTy27PFBkzkMOuZZCjG/Si+knC893EwqNFUTk9UY9/AhdNlpjulcCw/KIwRL2rqz05o4MzWp71cO076+EfCvfWFvRihhl5iBkV9a+VV3x+dVaS8/ePsLDws2HyXt1jTpXfqIJbn6kYd2N2MAOIaZ3RWiCr34/RjlgKxWrgic6i+9UG29rRVgOa4wPoUBUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2SPR01MB0018.namprd12.prod.outlook.com (52.132.175.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 22 Aug 2019 10:20:55 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077%6]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 10:20:55 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amd/powerplay: correct the pp_feature output on
 Arcturus
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: correct the pp_feature output on
 Arcturus
Thread-Index: AQHVV/xLXboFdMbBGEmULjU4uB6TYKcG9nyA
Date: Thu, 22 Aug 2019 10:20:55 +0000
Message-ID: <MN2PR12MB3344D88565FD9A38CF442F7EE4A50@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190821084143.25713-1-evan.quan@amd.com>
 <20190821084143.25713-2-evan.quan@amd.com>
In-Reply-To: <20190821084143.25713-2-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44551905-a23d-4230-b78e-08d726ea6b34
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2SPR01MB0018; 
x-ms-traffictypediagnostic: MN2SPR01MB0018:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2SPR01MB00186C888B87CD3C9149698EE4A50@MN2SPR01MB0018.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:305;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(13464003)(199004)(189003)(446003)(76176011)(52536014)(11346002)(110136005)(229853002)(316002)(478600001)(14454004)(66066001)(86362001)(6436002)(33656002)(9686003)(7696005)(53546011)(71200400001)(71190400001)(55016002)(99286004)(26005)(186003)(102836004)(6506007)(74316002)(256004)(305945005)(476003)(6246003)(8676002)(2906002)(25786009)(6116002)(53936002)(3846002)(81166006)(2501003)(76116006)(66476007)(66946007)(64756008)(486006)(66556008)(4326008)(66446008)(7736002)(5660300002)(81156014)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2SPR01MB0018;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: S29IBHbAKCl/E/QZFUsq3VeehnPh1WCAi8FiRQq/0ZBB/tJmpUoR1FxmUgH/YoHFMz2TO2BvDb+BfObEsYVnQsz1+LHZ0EN0vQ8jilrzTZjjBT++8CF3guMshSGDS1t73YEgYuux7wfQsHfSrEt1++eBwWdHOwZmZdVFgOoOwB6YLK6lc+w19vPqk2GcaCQO0ilVg00HMK29vJJwq6w0Q+7TLMRvbLtKIDkheWq4Ug+OANQIJvyYhG4Lw/yqim46IZBHDYyLN1y+LOr1Phw5vzi6UImQbxL68/bQ15hdbVE2rZn9KwEkgqPhTqqKJas7/Mkwg8dvIlPIric7VudQvYOB4AfLMwaakfgw+2/cz4sZeuOMw9ZjZBmhh9UVZ//jIZJYMVJA9Hcrlv8c4XH1NT+SnovrEeY+JjDeGHpV14M=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44551905-a23d-4230-b78e-08d726ea6b34
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 10:20:55.6565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e/scSJypT9cvDwZNZ0kn49DKsv5d0ScP/xPJxuJHmeKaNw9coCPMJ98eraWiMrdd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2SPR01MB0018
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWRZ13wib3n5XD49GUjEoPZL/6Kq67pA+ym4+GFITQQ=;
 b=u/Id+4uwPPHR453TDEktQkZrWKmmT6PB7mI09BNDg0Ah/U8SPLyEP3/tk0/AHmwbeB4vJlnFIhx4k2tqYZZwjKzwPlYE0MEztjJZcQMH23rubNDaV3jrj+4tug4ZzCz8DB943GiBUNwsXw9EZCNR2bPkLEo+GK2KHJc1wSGfNho=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGluZy4uCgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogRXZhbiBRdWFuIDxl
dmFuLnF1YW5AYW1kLmNvbT4KPiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAyMSwgMjAxOSA0OjQy
IFBNCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IFF1YW4sIEV2YW4g
PEV2YW4uUXVhbkBhbWQuY29tPgo+IFN1YmplY3Q6IFtQQVRDSCAyLzJdIGRybS9hbWQvcG93ZXJw
bGF5OiBjb3JyZWN0IHRoZSBwcF9mZWF0dXJlIG91dHB1dCBvbgo+IEFyY3R1cnVzCj4gCj4gRml4
IGZvciB0aGUgY29tbWl0IGJlbG93Ogo+IGRybS9hbWQvcG93ZXJwbGF5OiBpbXBsbWVudCBzeXNm
cyBmZWF0dXJlIHN0YXR1cyBmdW5jdGlvbiBpbiBzbXUKPiAKPiBDaGFuZ2UtSWQ6IElkOWEzNzNm
OGQ4ODY2Yjk3NDUwYmUwYWVmMGJhMTlkMDgzNWQ0MGQ4Cj4gU2lnbmVkLW9mZi1ieTogRXZhbiBR
dWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYXJjdHVydXNfcHB0LmMgIHwgMiArKwo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2luYy9zbXVfdHlwZXMuaCB8IDEgKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0
dXJ1c19wcHQuYwo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0
LmMKPiBpbmRleCBkZDY1NjMzNThlOGUuLmYxZjA3MjAxMmZhYyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jCj4gQEAgLTE0MSw2ICsxNDEsNyBA
QCBzdGF0aWMgc3RydWN0IHNtdV8xMV8wX2NtbjJhaXNjX21hcHBpbmcKPiBhcmN0dXJ1c19mZWF0
dXJlX21hc2tfbWFwW1NNVV9GRUFUVVJFX0NPCj4gIAlGRUFfTUFQKERQTV9TT0NDTEspLAo+ICAJ
RkVBX01BUChEUE1fRkNMSyksCj4gIAlGRUFfTUFQKERQTV9NUDBDTEspLAo+ICsJQVJDVFVSVVNf
RkVBX01BUChTTVVfRkVBVFVSRV9YR01JX0JJVCwKPiBGRUFUVVJFX0RQTV9YR01JX0JJVCksCj4g
IAlGRUFfTUFQKERTX0dGWENMSyksCj4gIAlGRUFfTUFQKERTX1NPQ0NMSyksCj4gIAlGRUFfTUFQ
KERTX0xDTEspLAo+IEBAIC0xNDksNiArMTUwLDcgQEAgc3RhdGljIHN0cnVjdCBzbXVfMTFfMF9j
bW4yYWlzY19tYXBwaW5nCj4gYXJjdHVydXNfZmVhdHVyZV9tYXNrX21hcFtTTVVfRkVBVFVSRV9D
Two+ICAJRkVBX01BUChHRlhfVUxWKSwKPiAgCUFSQ1RVUlVTX0ZFQV9NQVAoU01VX0ZFQVRVUkVf
VkNOX1BHX0JJVCwKPiBGRUFUVVJFX0RQTV9WQ05fQklUKSwKPiAgCUZFQV9NQVAoUlNNVV9TTU5f
Q0cpLAo+ICsJRkVBX01BUChXQUZMX0NHKSwKPiAgCUZFQV9NQVAoUFBUKSwKPiAgCUZFQV9NQVAo
VERDKSwKPiAgCUZFQV9NQVAoQVBDQ19QTFVTKSwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV90eXBlcy5oCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9pbmMvc211X3R5cGVzLmgKPiBpbmRleCA3Mjk2MmU4NDJkNjkuLmMzYzc0MDk4
ZjYxNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211
X3R5cGVzLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3R5
cGVzLmgKPiBAQCAtMjA3LDYgKzIwNyw3IEBAIGVudW0gc211X2Nsa190eXBlIHsKPiAgICAgICAg
IF9fU01VX0RVTU1ZX01BUChURU1QX0RFUEVOREVOVF9WTUlOKSwgICAgICAgICAgIAlcCj4gICAg
ICAgICBfX1NNVV9EVU1NWV9NQVAoTU1IVUJfUEcpLCAgICAgICAgICAgICAgICAgICAgICAJXAo+
ICAgICAgICAgX19TTVVfRFVNTVlfTUFQKEFUSFVCX1BHKSwgICAgICAgICAgICAgICAgICAgICAg
CVwKPiArICAgICAgIF9fU01VX0RVTU1ZX01BUChXQUZMX0NHKSwKPiAKPiAgI3VuZGVmIF9fU01V
X0RVTU1ZX01BUAo+ICAjZGVmaW5lIF9fU01VX0RVTU1ZX01BUChmZWF0dXJlKQo+IAlTTVVfRkVB
VFVSRV8jI2ZlYXR1cmUjI19CSVQKPiAtLQo+IDIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
