Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC15BA4CCC
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Sep 2019 02:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6407989AC3;
	Mon,  2 Sep 2019 00:21:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820053.outbound.protection.outlook.com [40.107.82.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D874789AC3
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Sep 2019 00:21:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewgTl0ljjg4OIhPCx5wIQpET2DLdIVZqf9qe5AeoMJI/PA8XzHya0m1GcoGeIr/OUoTxsj8U9A6RkpmGQwfzc03ztj7NwM1IE0FUI8gGqhELFPCs+1BwO8Tmk3dZBhQmeShDDEJKBqqlTsh9cke8jiSzVgThnHN6ZQkwW/KpoPynla7UmV9GlAXm9ZqJZd59tm9+ooZtl1C+OZjH9KzGYYNZ98PLSGttFRP4JvOdUonM7/zuf01uhhQUeKlMTI2iOAiyqQn8moAcFxr16xbmzelAIElO0YryL8I+0TU1cfHXkGEsmy4CBX4aIbdGNJCt0tO/MoFzS9tf5XdwDuryRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EswUYpYbMUeJmF4FpwgcXPFjs8cBvpHN9rnGpaby5c=;
 b=bdEZiz5stC2XUGE/KCzaMtLGivPXESkQJqaHLTfZDVD1IicS7NKb54+0KfE6FfTTBWOo0k03/RlQ5cgfvG2d10qjGNjVZB/EHgkZArW7qbeEZm8xEct3h/4dl/2q4+OnZIBoZI8L7K1uK7gL3t62jtEGIT9KE2gNfpliXf816noBTuxWc4pzP0pmOzZBeDvrI1Vy0JlAwgyAI3HSOX1p00bluOB2STi858SxLI2msmlvSF9iZ0o6VlEM99VMgNB0k52Taa6vUMlx8BCtDSmObT2n0FPlpySTlatMwIFsTt1S5uSTc2dIVgn5u94Inmk3xZUjJWViSUzfFT0dg18EAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1945.namprd12.prod.outlook.com (10.175.89.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 2 Sep 2019 00:21:33 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2220.021; Mon, 2 Sep 2019
 00:21:33 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu/irq: check if nbio funcs exist
Thread-Topic: [PATCH] drm/amdgpu/irq: check if nbio funcs exist
Thread-Index: AQHVYOwuLqfxJAvUwE6kLecBvF7GYqcXhuek
Date: Mon, 2 Sep 2019 00:21:33 +0000
Message-ID: <E07A2B4A-0C24-4101-BEF3-FD732BA8E8EA@amd.com>
References: <20190901173854.8824-1-alexander.deucher@amd.com>
In-Reply-To: <20190901173854.8824-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [221.177.253.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc280a2c-fcfa-4017-f2fd-08d72f3b82a4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1945; 
x-ms-traffictypediagnostic: DM5PR12MB1945:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1945B90524128E48726683C1FCBE0@DM5PR12MB1945.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(189003)(199004)(102836004)(1411001)(256004)(99286004)(2906002)(7736002)(9886003)(6486002)(86362001)(305945005)(33656002)(53936002)(3846002)(25786009)(6246003)(4326008)(54906003)(229853002)(14454004)(8676002)(6436002)(5660300002)(478600001)(486006)(316002)(8936002)(6116002)(81156014)(6916009)(81166006)(2616005)(476003)(446003)(11346002)(6506007)(91956017)(76116006)(53546011)(66946007)(6306002)(66446008)(64756008)(66556008)(66476007)(76176011)(36756003)(71200400001)(71190400001)(66066001)(26005)(186003)(966005)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1945;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sIbtKWBkEiFAoiGM2kaEHQSZ1s6W69hADCnzwumgiuxfcSEr5Y81dlM8UuyN72jPaIVCSSevaZH0ZppO0hSw+JrtuUF2cv43Jzp5NELUc4YHzhuJG+eMF27Ey4b+79ZhEDYzNSjy09PXXGlmQOiTxlvA/3gVBXYjbKBWLXrhV8fwC+jxcqhc+jgMkAIIdODMsyXiC6LrCMKVZep+sjWzjIq7HSjt1L/DfESzB2jbiPe3PZ9oF8ZfziE7uh11iQi9sLKR6DEyFwPrAxx++o6pjTjIx+E6uqDcuZReTU502VtAGnh7KEDgSdzOz301DhyyrmD6M8IkUvpbEx6iPAlnLhRUwbZI9d3FpuG9z4IL8kNJRFuOpCOw84fe2T7r6OOHug2Gm4JDrvzCYrPc8cqXJ00BwJ5Xwj8cvE6dC5W5gSg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc280a2c-fcfa-4017-f2fd-08d72f3b82a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 00:21:33.6799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RwBYIerA7l7LAtkV1FUn0MAqaXZVfNetQQGjlRGiYuxNg7TRTeEsmzlzTRJkl5Ra6e+EksxbkGdwtr4R0/yn/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1945
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EswUYpYbMUeJmF4FpwgcXPFjs8cBvpHN9rnGpaby5c=;
 b=qSNP8msV3U89I/7EGwMO2nU2THumPc71AXoHTJZlV6jCvgbKjchCaEtTv74XzvKLAqaAHGErF2YVsBLPN9SJEum0zNwlHVttUjoREb7wi+PqK/k4/pDWr1/072EBa2hy6DbqdDfMsH8Rqs0Hxf6oFKUmEr7U8oKEIXUg2Vcc7ZM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KClNlbnQg
ZnJvbSBteSBpUGhvbmUKCj4gT24gU2VwIDEsIDIwMTksIGF0IDEzOjM5LCBBbGV4IERldWNoZXIg
PGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4gV2UgbmVlZCB0byBjaGVjayBpZiB0
aGUgbmJpb3MgZnVuY3MgZXhpc3QgYmVmb3JlCj4gY2hlY2tpbmcgdGhlIGluZGl2aWR1YWwgcG9p
bnRlcnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgo+IC0tLQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pcnEu
YyB8IDYgKysrKy0tCj4gMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2lycS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lycS5jCj4gaW5kZXgg
M2U0OWFhMTQ2NWUyLi4wNzgyZjkxNTNiNjAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2lycS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2lycS5jCj4gQEAgLTE1NiwxMCArMTU2LDEyIEBAIGlycXJldHVybl90IGFtZGdw
dV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICphcmcpCj4gICAgICogcmVnaXN0ZXIgdG8gY2hl
Y2sgd2hldGhlciB0aGUgaW50ZXJydXB0IGlzIHRyaWdnZXJlZCBvciBub3QsIGFuZCBwcm9wZXJs
eQo+ICAgICAqIGFjayB0aGUgaW50ZXJydXB0IGlmIGl0IGlzIHRoZXJlCj4gICAgICovCj4gLSAg
ICBpZiAoYWRldi0+bmJpby5mdW5jcy0+aGFuZGxlX3Jhc19jb250cm9sbGVyX2ludHJfbm9fYmlm
cmluZykKPiArICAgIGlmIChhZGV2LT5uYmlvLmZ1bmNzICYmCj4gKyAgICAgICAgYWRldi0+bmJp
by5mdW5jcy0+aGFuZGxlX3Jhc19jb250cm9sbGVyX2ludHJfbm9fYmlmcmluZykKPiAgICAgICAg
YWRldi0+bmJpby5mdW5jcy0+aGFuZGxlX3Jhc19jb250cm9sbGVyX2ludHJfbm9fYmlmcmluZyhh
ZGV2KTsKPiAKPiAtICAgIGlmIChhZGV2LT5uYmlvLmZ1bmNzLT5oYW5kbGVfcmFzX2Vycl9ldmVu
dF9hdGh1Yl9pbnRyX25vX2JpZnJpbmcpCj4gKyAgICBpZiAoYWRldi0+bmJpby5mdW5jcyAmJgo+
ICsgICAgICAgIGFkZXYtPm5iaW8uZnVuY3MtPmhhbmRsZV9yYXNfZXJyX2V2ZW50X2F0aHViX2lu
dHJfbm9fYmlmcmluZykKPiAgICAgICAgYWRldi0+bmJpby5mdW5jcy0+aGFuZGxlX3Jhc19lcnJf
ZXZlbnRfYXRodWJfaW50cl9ub19iaWZyaW5nKGFkZXYpOwo+IAo+ICAgIHJldHVybiByZXQ7Cj4g
LS0gCj4gMi4yMC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
