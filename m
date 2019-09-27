Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D9BC0148
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Sep 2019 10:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3726EE54;
	Fri, 27 Sep 2019 08:37:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780082.outbound.protection.outlook.com [40.107.78.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3346EE54
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Sep 2019 08:37:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KhcX+DT7E3JGjQ6FKYkwf1A/MW9zmmQojhPrXAqdPovh0tZAit0BbQ3FuIWn/3/5WX7+XP2AyO3Ir+5QKiNKej8IkaCv/HWYykt8t89jeDZvU9aB2KP71FUEmYevfWqyjovItT11qfL4Yk2Q9LuaC/jblWc9gDUWysdiqyeTGm5ekvxn6bCmjLRc7YGMN4StLOBSWN3nOHPQGRpm710dqlYehmqjbKQeeI2A2zjuLjo2YS3Vv8vCheXCR9phQIghrWQhdkG7CCN1uj2CmxLWKwTaJDGvyb1f81fOOaDhEFwqdM8gZnSwE175BTRZd/Dun5o37jjppY7xLa/iEvPpNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXW9qeOkboS0oZ87Nr+w5agAPah9cbMQUmABgbJuJFg=;
 b=EznjhCd8XNQHl/BV6RQZwpsfalyd4xtGE9UcLxIiYCpcBp7i32/UIeFyHoh0n62kAERkHLEDQzVDYbNexnO6anO88GXj/xFIuXQhxCIovM5Cme07xY2SaCcob1sbbOXz5FiQe1cHTURI+xMQTYkyZGpg4AdTdeIu0fxpjb+2BXhJsPWu9LZgm8210q/58oE/1X7HJGQMHpEwUU0S5KrgomKyfdcZuPOWx0q+VLAbgZg+5WTcwNo/6934M/K74xj7BOO2GqlRhfX/0FwxbDfvSl7cX86HVma/0EugguVzUQ2HCLz1tH3c/GdWOOsrMFe2OUQsO/AcQ8/eKRrMtoP/yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3999.namprd12.prod.outlook.com (10.255.239.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Fri, 27 Sep 2019 08:37:03 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2305.017; Fri, 27 Sep 2019
 08:37:03 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: initlialize smu->is_apu is false by
 default
Thread-Topic: [PATCH] drm/amd/powerplay: initlialize smu->is_apu is false by
 default
Thread-Index: AQHVdQDkhkSWJCcgM0qXIIQnUawYFqc/MUhA
Date: Fri, 27 Sep 2019 08:37:02 +0000
Message-ID: <MN2PR12MB3536BA16A58AE0E5E6424063FB810@MN2PR12MB3536.namprd12.prod.outlook.com>
References: <20190927065727.22272-1-kevin1.wang@amd.com>
In-Reply-To: <20190927065727.22272-1-kevin1.wang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f373fa2-07af-48fb-cc64-08d74325df03
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3999:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB399917342BEFB4557C0A2B0BFB810@MN2PR12MB3999.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(366004)(376002)(52314003)(199004)(189003)(13464003)(66066001)(25786009)(229853002)(52536014)(446003)(186003)(7736002)(74316002)(71200400001)(486006)(476003)(2906002)(54906003)(53546011)(6506007)(14454004)(71190400001)(76176011)(305945005)(99286004)(7696005)(11346002)(86362001)(110136005)(3846002)(33656002)(26005)(478600001)(6116002)(66556008)(66946007)(102836004)(64756008)(66446008)(316002)(66476007)(8936002)(6246003)(8676002)(2501003)(55016002)(81156014)(81166006)(76116006)(4326008)(9686003)(6436002)(5660300002)(256004)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3999;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WsRYAS3sFkwUH1NKEExBL1JNeuU+n3D1K0tqCdjbgq434iCQJsRuCwsLTi33+x02JZFaJagtY1xQIlUJ+S6c92cNXHuZIEibQqa4mAtBZ28NRr4eHKKnEDwfZvFroBwBSPrG+qLCY9/M/LCkVqhjngZ4rmStZpo+/z3/5M3vk+yFl8z5uRvhgRUBVMe3R6nM0bIgCRE2/Qw9h2hD5To9KtW3dfKlDycAH0lgekvokrHProMv3Gd+Jz/ZGKr8ecqg3A+ioO49l29cm3O5GddiDhirNVwV+4zS9tzw05HUIHzPjhHFTnP0l2xeHselLg2h7DvFdKZPiFO90HU83gruI4Sj2YNR+0DgJ2/xegjZr0Rt1Wdqsh2tJlPqEXs3knhm98DcAqOiXoY1Qi32KFm+N4ePQ7zDSCwaKilUQOn2l6U=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f373fa2-07af-48fb-cc64-08d74325df03
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 08:37:02.9384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uxty1xV5oJSi9nB0EkCyF/DEsOQUGZQO/v8s7B2vlyrVHC0EJO4l4HagEbj/Rflf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXW9qeOkboS0oZ87Nr+w5agAPah9cbMQUmABgbJuJFg=;
 b=Qse2DdcOTpMz5wLhE2Vby7PZjSclfcnJQVL+AVDTob8F8XYQIKSWFPjknPxBQc5t4XCL9Gy4SzrppFVBE8d2+tD3u8FkvDJF3pzh2gF7/gESxvU9NxIBRmOiokEV0m05osl1Vjim9ZKbgfv/CexdXx1BkdEwLV3iESUZ1UeAWgg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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

RG9lcyB1c2UgdGhlIGRlZmF1bHQgdmFsdWUgKGZhbHNlKSBmb3IgdGhlIEJvb2xlYW4gdmFyaWFi
bGUgb2YgaXNfYXB1IG5vdCBlbm91Z2ggZm9yIGlkZW50aWZ5aW5nIERHUFU/ICAgCkFueXdheSwg
aW5pdGlhbGl6ZSB0aGUgaXNfYXB1IGR1cmluZyBzbXUgZWFybHkgaW5pdGlhbGl6ZSBhbHNvIGZp
bmUgYW5kIHRoZSBwYXRjaCBpcyAKClJldmlld2VkLWJ5OiBQcmlrZSBMaWFuZyA8UHJpa2UuTGlh
bmdAYW1kLmNvbT4KClRoYW5rcywKUHJpa2UKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+
IEZyb206IFdhbmcsIEtldmluKFlhbmcpIDxLZXZpbjEuV2FuZ0BhbWQuY29tPgo+IFNlbnQ6IEZy
aWRheSwgU2VwdGVtYmVyIDI3LCAyMDE5IDI6NTggUE0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBGZW5nLCBL
ZW5uZXRoCj4gPEtlbm5ldGguRmVuZ0BhbWQuY29tPjsgTGlhbmcsIFByaWtlIDxQcmlrZS5MaWFu
Z0BhbWQuY29tPjsgV2FuZywKPiBLZXZpbihZYW5nKSA8S2V2aW4xLldhbmdAYW1kLmNvbT4KPiBT
dWJqZWN0OiBbUEFUQ0hdIGRybS9hbWQvcG93ZXJwbGF5OiBpbml0bGlhbGl6ZSBzbXUtPmlzX2Fw
dSBpcyBmYWxzZSBieQo+IGRlZmF1bHQKPiAKPiB0aGUgbWVtYmVyIG9mIGlzX2FwdSBpbiBzbXVf
Y29udGV4dCBuZWVkIHRvIGluaXRsaWFsaXplIGJ5IGRlZmF1bHQuCj4gCj4gc2V0IGRlZmF1bHQg
dmFsdWUgaXMgZmFsc2UgKGRHUFUpCj4gCj4gZm9yIHBhdGNoOgo+IAlkcm0vYW1kL3Bvd2VycGxh
eTogYnlwYXNzIGRwbV9jb250ZXh0IG51bGwgcG9pbnRlciBjaGVjayBndWFyZAo+IAlmb3Igc29t
ZSBzbXUgc2VyaWVzCj4gCj4gU2lnbmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdA
YW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3Nt
dS5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKPiBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwo+IGluZGV4IDdiOTk1YjA4MzRl
Yi4uNmE2NGY3NjVmY2Q0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2FtZGdwdV9zbXUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2Ft
ZGdwdV9zbXUuYwo+IEBAIC03MTIsNiArNzEyLDcgQEAgc3RhdGljIGludCBzbXVfZWFybHlfaW5p
dCh2b2lkICpoYW5kbGUpCj4gCj4gIAlzbXUtPmFkZXYgPSBhZGV2Owo+ICAJc211LT5wbV9lbmFi
bGVkID0gISFhbWRncHVfZHBtOwo+ICsJc211LT5pc19hcHUgPSBmYWxzZTsKPiAgCW11dGV4X2lu
aXQoJnNtdS0+bXV0ZXgpOwo+IAo+ICAJcmV0dXJuIHNtdV9zZXRfZnVuY3MoYWRldik7Cj4gLS0K
PiAyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
