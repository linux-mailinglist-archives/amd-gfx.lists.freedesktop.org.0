Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB6B956B7
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Aug 2019 07:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E346E5D4;
	Tue, 20 Aug 2019 05:36:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730043.outbound.protection.outlook.com [40.107.73.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1BA6E5D4
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 05:36:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKFmCWqoDZmLwBj7zqO7378powWgJ3xsZcrJYnzZiW8QQliMlVsL2NB8MFKXzZQLxY6DpEWZ02Q/jAHV/eKVJsRi6R1Npnjv/pGoBZdH2TGXq7gNaJz2boOXSfXTtjYgzT3RrB8Q8hkQJ7OJ9t7s36yMcahnIsJ5zQwgxDybzQdrIpHbb8BpufiRwP8sM5N85t8U3yUImoQn+dOR2vg8aMOSMBbslaq1bDJeNZuMC4fF/54RBDY95ZbIe675evi9GaE9tziXns54TfEI3QWz4h+C30VfSqvyW4zabm+YCgelqU+LJAc/fseNMHe4n4Bb8sym8BQ5ADcOdZViBvWuGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uo2PGdDbqM2Vk8Phyw91z8NF62qplxO+6Tjtx6Pq3Kg=;
 b=ZeXr0ZjrFxvW0ZGq87pUL8LdIB1T5CalFJz1yZ2WRdWwzqYAfuL/0D5UJQe23NLJ//g7mGY3iCSrl5jU2vDgRm5QxzMgTLKQaV1B4sltdvQgEfdyU9n2sN1lc+b2rahByMFx5X+F7NTeVaWLPLELUsGoBxne/Q6GpZTOGOtCwOrXA3cv4Apedb+5+ESmBCRrUqaV4tAeBl4EwFs2FBgBxj2AgTZnSFYkjnXLprdpnDLmPNOaMwZWxsuY/551mlO6M8ak5UTlCzADl0FZ7pVc7mdm7pM+lRj2TRZqd1S+8m0KP/uVedZEroQ5wCTkiYAFaOxYPpRuUjVdU+ExmGtz5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3103.namprd12.prod.outlook.com (20.178.241.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 05:36:52 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 05:36:52 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: remove duplicate macro
 smu_get_uclk_dpm_states in amdgpu_smu.h
Thread-Topic: [PATCH] drm/amd/powerplay: remove duplicate macro
 smu_get_uclk_dpm_states in amdgpu_smu.h
Thread-Index: AQHVVxkVKFwudqhgFkKbh9N9gzFIyKcDhCjQ
Date: Tue, 20 Aug 2019 05:36:52 +0000
Message-ID: <MN2PR12MB33094B3D3B765EE341B519E4ECAB0@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190820053503.2486-1-kevin1.wang@amd.com>
In-Reply-To: <20190820053503.2486-1-kevin1.wang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd18da65-4fdf-4163-0489-08d7253067f9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3103; 
x-ms-traffictypediagnostic: MN2PR12MB3103:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB310378B08648A36285584ACEECAB0@MN2PR12MB3103.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(13464003)(199004)(189003)(86362001)(76176011)(2906002)(99286004)(26005)(7696005)(6506007)(110136005)(102836004)(25786009)(478600001)(6246003)(5660300002)(2501003)(33656002)(316002)(14454004)(6436002)(53546011)(8676002)(81166006)(486006)(229853002)(9686003)(74316002)(476003)(305945005)(66446008)(64756008)(11346002)(66556008)(66476007)(76116006)(66946007)(446003)(7736002)(71190400001)(53936002)(3846002)(81156014)(52536014)(8936002)(66066001)(71200400001)(6116002)(186003)(55016002)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3103;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8jQXfj4W0ySEOWKv9mq93s8P1MGvm1C84HaDylUHWSzCq+w3KVYCaGLDfK0qEy38s6fUK/Cbt35NSQqXSg6qsTx2Vw55xee0JCHJdj/LW3oGYAJR2q/wkklVG2RCeoRSZwC0M419Deq7Rpr+q+EVfA4tiQUtkCrW1yVLEKN/IG0z9ouNLly9ownzCMd91joCqXnE3Px3sFSlpTdiZ5T/4/f5g83yEMDK7XyKglIsR0TtigCl9WUHuaeCajwd0Euq4PDeF/KL5LkRyp5IGJFV9sMzB5qyCTCwmiinQYEg1j+lpQZVcyvCfznrYZz+Py8wEVRjqHJZrEjNSK8ncVwtDT/YYHgcb/xlSGoJOhaIQPtDUtikNNRgYxm7wbWRnXiWG07fYAPNwPvr+/Wd+DJ2sUXO9GTSDYbPnj1waQLnjak=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd18da65-4fdf-4163-0489-08d7253067f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 05:36:52.6476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v67Z3ku96ptl4PZ5ypyYptSChfPlHUwzAC/HUVH8uVPjZu977r4lBJ7Yw3NauJSVLkqPZ6ArPLEdrW0oxWBYYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3103
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uo2PGdDbqM2Vk8Phyw91z8NF62qplxO+6Tjtx6Pq3Kg=;
 b=CWNFmJ64SL+KM42yrn4vwtTAjKpenaSbxuMCv4u3rxdjOd6Zb2y4Y0HORwbuEyEfQl/EpGwxSK8prG1WQuBVbmL7zKuWt6RFqpMynUGDFy6qVqObQ0wP87PM1Pa0D2tyfqp38NakHSZBzWfz7h+RbuN9FDrs2TjmXDoqdjylsxE=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdhbmcsIEtldmluKFlhbmcpIDxL
ZXZpbjEuV2FuZ0BhbWQuY29tPgo+IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAyMCwgMjAxOSAxOjM2
IFBNCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IEh1YW5nLCBSYXkg
PFJheS5IdWFuZ0BhbWQuY29tPjsgV2FuZywgS2V2aW4oWWFuZykKPiA8S2V2aW4xLldhbmdAYW1k
LmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWQvcG93ZXJwbGF5OiByZW1vdmUgZHVwbGlj
YXRlIG1hY3JvCj4gc211X2dldF91Y2xrX2RwbV9zdGF0ZXMgaW4gYW1kZ3B1X3NtdS5oCj4gCj4g
cmVtb3ZlIGR1cGxpY2F0ZSBtYWNybyBzbXVfZ2V0X3VjbGtfZHBtX3N0YXRlcyBpbiBhbWRncHVf
c211LmgKPiAKPiAiCj4gICNkZWZpbmUgc211X2dldF91Y2xrX2RwbV9zdGF0ZXMoc211LCBjbG9j
a3NfaW5fa2h6LCBudW1fc3RhdGVzKSBcCj4gICAgICAgICAgKChzbXUpLT5wcHRfZnVuY3MtPmdl
dF91Y2xrX2RwbV9zdGF0ZXMgPyAoc211KS0+cHB0X2Z1bmNzLQo+ID5nZXRfdWNsa19kcG1fc3Rh
dGVzKChzbXUpLCAoY2xvY2tzX2luX2toeiksIChudW1fc3RhdGVzKSkgOiAwKQo+ICAjZGVmaW5l
IHNtdV9nZXRfbWF4X3N1c3RhaW5hYmxlX2Nsb2Nrc19ieV9kYyhzbXUsIG1heF9jbG9ja3MpIFwK
PiAgICAgICAgICAoKHNtdSktPmZ1bmNzLT5nZXRfbWF4X3N1c3RhaW5hYmxlX2Nsb2Nrc19ieV9k
YyA/IChzbXUpLT5mdW5jcy0KPiA+Z2V0X21heF9zdXN0YWluYWJsZV9jbG9ja3NfYnlfZGMoKHNt
dSksIChtYXhfY2xvY2tzKSkgOiAwKQo+ICAjZGVmaW5lIHNtdV9nZXRfdWNsa19kcG1fc3RhdGVz
KHNtdSwgY2xvY2tzX2luX2toeiwgbnVtX3N0YXRlcykgXAo+ICAgICAgICAgICgoc211KS0+cHB0
X2Z1bmNzLT5nZXRfdWNsa19kcG1fc3RhdGVzID8gKHNtdSktPnBwdF9mdW5jcy0KPiA+Z2V0X3Vj
bGtfZHBtX3N0YXRlcygoc211KSwgKGNsb2Nrc19pbl9raHopLCAobnVtX3N0YXRlcykpIDogMCkK
PiAiCj4gCj4gU2lnbmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4K
ClJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgoKPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCB8IDIgLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKPiBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211LmgKPiBpbmRleCBjYTliOWVjMzlkZTguLmZjNTlk
OTY4NmU2MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMv
YW1kZ3B1X3NtdS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2Ft
ZGdwdV9zbXUuaAo+IEBAIC03MzAsOCArNzMwLDYgQEAgc3RydWN0IHNtdV9mdW5jcwo+ICAJKChz
bXUpLT5mdW5jcy0+cmVnaXN0ZXJfaXJxX2hhbmRsZXIgPyAoc211KS0+ZnVuY3MtCj4gPnJlZ2lz
dGVyX2lycV9oYW5kbGVyKHNtdSkgOiAwKQo+ICAjZGVmaW5lIHNtdV9zZXRfYXphbGlhX2QzX3Bt
ZShzbXUpIFwKPiAgCSgoc211KS0+ZnVuY3MtPnNldF9hemFsaWFfZDNfcG1lID8gKHNtdSktPmZ1
bmNzLQo+ID5zZXRfYXphbGlhX2QzX3BtZSgoc211KSkgOiAwKQo+IC0jZGVmaW5lIHNtdV9nZXRf
dWNsa19kcG1fc3RhdGVzKHNtdSwgY2xvY2tzX2luX2toeiwgbnVtX3N0YXRlcykgXAo+IC0JKChz
bXUpLT5wcHRfZnVuY3MtPmdldF91Y2xrX2RwbV9zdGF0ZXMgPyAoc211KS0+cHB0X2Z1bmNzLQo+
ID5nZXRfdWNsa19kcG1fc3RhdGVzKChzbXUpLCAoY2xvY2tzX2luX2toeiksIChudW1fc3RhdGVz
KSkgOiAwKQo+ICAjZGVmaW5lIHNtdV9nZXRfbWF4X3N1c3RhaW5hYmxlX2Nsb2Nrc19ieV9kYyhz
bXUsIG1heF9jbG9ja3MpIFwKPiAgCSgoc211KS0+ZnVuY3MtPmdldF9tYXhfc3VzdGFpbmFibGVf
Y2xvY2tzX2J5X2RjID8gKHNtdSktPmZ1bmNzLQo+ID5nZXRfbWF4X3N1c3RhaW5hYmxlX2Nsb2Nr
c19ieV9kYygoc211KSwgKG1heF9jbG9ja3MpKSA6IDApCj4gICNkZWZpbmUgc211X2dldF91Y2xr
X2RwbV9zdGF0ZXMoc211LCBjbG9ja3NfaW5fa2h6LCBudW1fc3RhdGVzKSBcCj4gLS0KPiAyLjIy
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
