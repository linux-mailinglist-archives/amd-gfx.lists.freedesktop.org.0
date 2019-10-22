Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F75CE0522
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 15:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007DF6E7BC;
	Tue, 22 Oct 2019 13:33:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4568C6E7BC
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 13:33:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGfe99jPiyPgX2c+L4SQTlAINSYWyDtDW+XXUGzc/NFwQ7O9uHRVnTlwv6Jmm6KpLy797Qt/stGQjg5jb8N3E4ShTsys5IQwBeLKe07yc+RiNiMlW7esDYmkYT/Ns1Xr2eLW/NpkH0LZxCqeqq4g50w0iFRx4azDA/SXlv9Tq92hr4rW76EV66q6TwspOP9OQmLj7NtRw8TwslVb36BaB14pMhUGIcJ+ngjf+raM7SZKH61AW0QetRmyJlnLqaptq/YI5QTauoHfm1qNDRtLT8nlCLGncFEaUP2G/gkTzrhuQEY3aroHqqI8Lry5wLyy+AewevPL8CyS+Zx/gfxyIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GX1HU3B3NAdmdIIrH/lD152MkHz+Eb3P99+qd29vVz8=;
 b=CG1nTe45dzBRaJsfa1o37zA9F1v+T5pas1aCwmUhHzKC/h6DUflPH0F+TecPXsI09gBqWvkEM0oIGfJSc/uwLPgnVApII6x5ZSOCp9PpGPdzxHSOy9J9ZZdmkdc6yyuciRMq2m66lhWK9HFT3CSRn7NxmCw72HqHRJE2bYKoVycY3Okt68m9ZfvwvzxYQBC41Zl1lrGxAI1E7rtjRru8fApF261Va9ae6V3LDTmhf11YHfHmt5vDg2gCOh1ijWkTDDfeSahwSF7Vg1/sQJcCGtpZM4qNtCk8heMAie7j1GvsiRlIdhQRpFkmVu6gSs7IhIuAeggoTbR8inTUAFGwCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL0PR12MB2820.namprd12.prod.outlook.com (20.177.240.11) by
 BL0PR12MB2401.namprd12.prod.outlook.com (52.132.11.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Tue, 22 Oct 2019 13:33:56 +0000
Received: from BL0PR12MB2820.namprd12.prod.outlook.com
 ([fe80::b827:bd63:aea:d241]) by BL0PR12MB2820.namprd12.prod.outlook.com
 ([fe80::b827:bd63:aea:d241%7]) with mapi id 15.20.2347.029; Tue, 22 Oct 2019
 13:33:56 +0000
From: "Li, Roman" <Roman.Li@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] drm/amdgpu/display: add dc feature mask for psr enablement
Thread-Topic: [PATCH] drm/amdgpu/display: add dc feature mask for psr
 enablement
Thread-Index: AQHViFjUjIwcPLaSUEm1+euOHhV4h6dmmq4AgAANCNA=
Date: Tue, 22 Oct 2019 13:33:56 +0000
Message-ID: <BL0PR12MB28204625E85855DA3144096F89680@BL0PR12MB2820.namprd12.prod.outlook.com>
References: <1571694305-14820-1-git-send-email-Roman.Li@amd.com>
 <f446a637-23b0-a876-7e6d-899483d0bdc6@amd.com>
In-Reply-To: <f446a637-23b0-a876-7e6d-899483d0bdc6@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3fe2fa24-b206-476c-a10f-08d756f47d0c
x-ms-traffictypediagnostic: BL0PR12MB2401:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB2401F9AAE1CEDF913CB8646689680@BL0PR12MB2401.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(189003)(199004)(13464003)(25786009)(52536014)(74316002)(76176011)(478600001)(54906003)(110136005)(7696005)(14454004)(316002)(99286004)(256004)(66066001)(966005)(71190400001)(14444005)(33656002)(71200400001)(7736002)(305945005)(6636002)(186003)(4326008)(2906002)(4001150100001)(64756008)(66476007)(66946007)(86362001)(11346002)(102836004)(66556008)(66446008)(81166006)(6436002)(55016002)(476003)(81156014)(6306002)(6116002)(76116006)(3846002)(53546011)(6506007)(2501003)(5660300002)(8936002)(26005)(229853002)(6246003)(8676002)(486006)(446003)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2401;
 H:BL0PR12MB2820.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CjO+X1U+/CtpBsh5wrPtHWQNHD0vHhLFUfmo/ebiAWrWz0B+SadM/TnqhKs3fXih7NXyCkeHo/EBTGkyLO+3zJK032n55BxTK8XPTr3Xq/Sz1pZObUPFGi7CLaBnbtxTlCtx9+3Wlb1JWTf1LeLwdkihO/F9cwmNpHwjQzKHTTNX2YjoVW6CORwOSKFBSHgEoHvEGafcs2b69/XY8HFBFFvISbwJ+cJPYOiCYgha0VTTybtIQL7CHMFboFeyITw+u+2s6FxLaspZQezT5tggPsPtohNDkBiKipZmL/wVX/edVXjWKAmviLdBxqWzYCBODtOXbb4HYN5UIKG+XtDRC2nJwHukMU6DtEqIoEwzyvcW0+flgAYyi7jYBtC5cxIdExmfmLLN/owbMMAIExfZ9KkmP6zlGeNFmDAnznGw2EY3M83vQKeianwo+B3R3toBJUVR3qc0tAO6YWTXyvlbIA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe2fa24-b206-476c-a10f-08d756f47d0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 13:33:56.4024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fHRPrD6XA+E6lNqSd8sMHJ8rdY8ldKrL8zNbElIeEm8QJ995XZ1DG6HoulYVEe30
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2401
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GX1HU3B3NAdmdIIrH/lD152MkHz+Eb3P99+qd29vVz8=;
 b=T98QAp5zh/2TVxHwjSHFvjuFmOkMiUErdpmL0g+YTzFKo15chwd97RAfmggWG9FD3sbD2FwIMQy8GjDz8g9S73QMYvsjBE2LgJsLZMTxk8KcLEvjaFkDzuskbSHAcY8ewbfMWjIUBPtOpNgVFyU6/OJNIVF0CfOnwuilzK3b234=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Roman.Li@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiBBbnkgcmVhc29uIHdoeSB3ZSdyZSBza2lwcGluZyBhIGZsYWcgaGVyZSBnb2luZyBmcm9tIDB4
MiB0byAweDg/DQoNCjB4NCBpcyByZXNlcnZlZCBmb3IgZnJhY3Rpb25hbCBwd20gIG1hc2s6DQpo
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzM2OTIzLw0KDQpUaGFuayB5
b3UgTmljaG9sYXMgZm9yIHRoZSByZXZpZXcuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQpGcm9tOiBLYXpsYXVza2FzLCBOaWNob2xhcyA8TmljaG9sYXMuS2F6bGF1c2thc0BhbWQuY29t
PiANClNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMjIsIDIwMTkgODozOSBBTQ0KVG86IExpLCBSb21h
biA8Um9tYW4uTGlAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBEZXVj
aGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+DQpDYzogV2VudGxhbmQs
IEhhcnJ5IDxIYXJyeS5XZW50bGFuZEBhbWQuY29tPjsgTGFraGEsIEJoYXdhbnByZWV0IDxCaGF3
YW5wcmVldC5MYWtoYUBhbWQuY29tPjsgTGksIFN1biBwZW5nIChMZW8pIDxTdW5wZW5nLkxpQGFt
ZC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYW1kZ3B1L2Rpc3BsYXk6IGFkZCBkYyBm
ZWF0dXJlIG1hc2sgZm9yIHBzciBlbmFibGVtZW50DQoNCk9uIDIwMTktMTAtMjEgNTo0NSBwLm0u
LCBSb21hbi5MaUBhbWQuY29tIHdyb3RlOg0KPiBGcm9tOiBSb21hbiBMaSA8Um9tYW4uTGlAYW1k
LmNvbT4NCj4gDQo+IFtXaHldDQo+IEFkZGluZyBwc3IgbWFzayB0byBkYyBmZWF0dXJlcyBhbGxv
d3Mgc2VsZWN0aXZlbHkgZGlzYWJsZS9lbmFibGUgcHNyLg0KPiBDdXJyZW50IHBzciBpbXBsZW1l
bnRhdGlvbiBtYXkgbm90IHdvcmsgd2l0aCBub24tcGFnZWZsaXBwaW5nIGFwcGxpY2F0aW9uLg0K
PiBVbnRpbCByZXNvbHZlZCBpdCBzaG91bGQgYmUgZGlzYWJsZWQgYnkgZGVmYXVsdC4NCj4gDQo+
IFtIb3ddDQo+IEFkZCBkY2ZlYXR1cmVtYXNrIGZvciBwc3IgZW5hYmxlbWVudC4gRGlzYWJsZSBi
eSBkZWZhdWx0Lg0KPiBUbyBlbmFibGUgc2V0IGFtZGdwdS5kY2ZlYXR1cmVtYXNrPTB4OCBpbiBn
cnViIGtlcm5lbCBjb21tYW5kIGxpbmUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb21hbiBMaSA8
Um9tYW4uTGlAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDMgKystDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9p
bmNsdWRlL2FtZF9zaGFyZWQuaCAgICAgICAgICB8IDEgKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyANCj4gYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+IGluZGV4IDFjZjRi
ZWIuLjBmMDg4NzkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPiBAQCAtMjQyNCw3ICsyNDI0LDggQEAgc3RhdGljIGlu
dCBhbWRncHVfZG1faW5pdGlhbGl6ZV9kcm1fZGV2aWNlKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQ0KPiAgIAkJfSBlbHNlIGlmIChkY19saW5rX2RldGVjdChsaW5rLCBERVRFQ1RfUkVBU09O
X0JPT1QpKSB7DQo+ICAgCQkJYW1kZ3B1X2RtX3VwZGF0ZV9jb25uZWN0b3JfYWZ0ZXJfZGV0ZWN0
KGFjb25uZWN0b3IpOw0KPiAgIAkJCXJlZ2lzdGVyX2JhY2tsaWdodF9kZXZpY2UoZG0sIGxpbmsp
Ow0KPiAtCQkJYW1kZ3B1X2RtX3NldF9wc3JfY2FwcyhsaW5rKTsNCj4gKwkJCWlmIChhbWRncHVf
ZGNfZmVhdHVyZV9tYXNrICYgRENfUFNSX01BU0spDQo+ICsJCQkJYW1kZ3B1X2RtX3NldF9wc3Jf
Y2FwcyhsaW5rKTsNCj4gICAJCX0NCj4gICANCj4gICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvaW5jbHVkZS9hbWRfc2hhcmVkLmggDQo+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9pbmNsdWRlL2FtZF9zaGFyZWQuaA0KPiBpbmRleCA4ODg5YWFjLi4xZGFhMjIxIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvYW1kX3NoYXJlZC5oDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9hbWRfc2hhcmVkLmgNCj4gQEAgLTE0Myw2ICsx
NDMsNyBAQCBlbnVtIFBQX0ZFQVRVUkVfTUFTSyB7DQo+ICAgZW51bSBEQ19GRUFUVVJFX01BU0sg
ew0KPiAgIAlEQ19GQkNfTUFTSyA9IDB4MSwNCj4gICAJRENfTVVMVElfTU9OX1BQX01DTEtfU1dJ
VENIX01BU0sgPSAweDIsDQo+ICsJRENfUFNSX01BU0sgPSAweDgsDQoNCkNhbiB0aGlzIGp1c3Qg
YmUgMHg0IGluc3RlYWQ/IEFueSByZWFzb24gd2h5IHdlJ3JlIHNraXBwaW5nIGEgZmxhZyBoZXJl
IGdvaW5nIGZyb20gMHgyIHRvIDB4OD8NCg0KWW91IGNhbiBzdGlsbCBoYXZlIG15Og0KDQpSZXZp
ZXdlZC1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29t
Pg0KDQpidXQgbXkgcHJlZmVyZW5jZSB3b3VsZCBiZSBvbiBmaXhpbmcgdGhpcyB1cCB0byBhIDB4
NCBmaXJzdCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgLyBEQ19GRUFUVVJFX01BU0suDQoNCk5pY2hv
bGFzIEthemxhdXNrYXMNCg0KPiAgIH07DQo+ICAgDQo+ICAgZW51bSBhbWRfZHBtX2ZvcmNlZF9s
ZXZlbDsNCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
