Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 219DF6874A
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 12:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953648994A;
	Mon, 15 Jul 2019 10:47:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810071.outbound.protection.outlook.com [40.107.81.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1461F8993B
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 10:47:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXxn4bSMXZFRjKRVGZ/b42dgHT1ME2ERqxaYioZOwzBHJ3iMWNH+RG4OPS84FyKYLjsffnJY1fQiS+IMB63zyVESnN84hdRowjJPzIVlSvWphPNIwKTI9JrbasCPJOGuK9U3ZBcLgRrXmpNi0Vrq7XK+D3qiIxU5CTbOkVMyLF8/W9nZPpMsL6YmWLMTHsbvCM8CJPRPLJ5pDFhTbt/HdIZj983A7MeREvOE/DXP3QfVATI73e/LSbkvcOJdZT4nmbnDD38vrL93wEBjOHq/5WrEbCEZeeQFvUjoVbFyPcA8FNIwLigGn6shIh7FN54cjKPTOZxf8hApDuraB7xuGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0+7Ouvhd7mUfjw+sRF6Kpon6KsA1gGTPHB7nS1xjWA=;
 b=A/4yBNUvCmO5CyEWZEuEkGiqZrSpfh1eXoZK2XmPnsdkr2W699mieXQDjaiAuBTdwb2YJlZ/OivKVHWvSXi/lkBIX8iGifEkMVoavSOvdGrbcn7pQ5RRn+iBONavcM4WhEDQPamPUHA3YjKSTS3rWWD7TnSC1wCk2+MIcm5J6w/APL1Vtbrxd4hNGh2DRTsQAzGSC2PKy0HTTpNgqXFL63/l+yeqB4nnWsroBYj7BbCugFfhhmqJ6sKLjd/qCdjlLGqZi80rjS3rgcogxpH75kZzkjTtYH9h7wP30a1sl8n9TJyKZAwy7+7hp2snpXCTt8/0xdkLomGUj7WjX3v7ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB4160.namprd12.prod.outlook.com (10.255.125.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.11; Mon, 15 Jul 2019 10:47:52 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::78b4:3df5:c92a:e02a]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::78b4:3df5:c92a:e02a%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 10:47:52 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>
Subject: RE: [PATCH] drm/ttm: Fix the memory delay free issue
Thread-Topic: [PATCH] drm/ttm: Fix the memory delay free issue
Thread-Index: AQHVNwIC8YI0Xjw0H02CS/7Sp4MSRKbD2JCAgAdrA7CAAC5ngIAAAL4AgAACEQCAABKScA==
Date: Mon, 15 Jul 2019 10:47:52 +0000
Message-ID: <MN2PR12MB29758D1F45E8A8FEA883C4ED8FCF0@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <1562750971-1628-1-git-send-email-Emily.Deng@amd.com>
 <a9974a9a-37b2-2310-4073-94eef570f37c@amd.com>
 <MN2PR12MB297593776F81FE032B2145218FCF0@MN2PR12MB2975.namprd12.prod.outlook.com>
 <550628f4-eb76-23aa-bc33-e9841e6d017b@amd.com>
 <MN2PR12MB2975EA6482B987399797B0328FCF0@MN2PR12MB2975.namprd12.prod.outlook.com>
 <a9deb404-6041-299e-60fc-d2356b729664@amd.com>
In-Reply-To: <a9deb404-6041-299e-60fc-d2356b729664@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 849bb793-e813-409e-dc3a-08d70911e2f8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4160; 
x-ms-traffictypediagnostic: MN2PR12MB4160:
x-microsoft-antispam-prvs: <MN2PR12MB416092FC08E405D37336A2D58FCF0@MN2PR12MB4160.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(396003)(39860400002)(136003)(346002)(13464003)(199004)(189003)(64756008)(55016002)(66556008)(53936002)(9686003)(66476007)(6436002)(66446008)(478600001)(33656002)(66946007)(71190400001)(26005)(66066001)(6636002)(71200400001)(7696005)(86362001)(316002)(76116006)(186003)(229853002)(110136005)(99286004)(76176011)(2906002)(6246003)(3846002)(6116002)(5660300002)(81166006)(81156014)(4326008)(68736007)(52536014)(6506007)(74316002)(14454004)(53546011)(8936002)(14444005)(256004)(305945005)(25786009)(7736002)(102836004)(476003)(446003)(486006)(11346002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4160;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: g20reR7fMTaW9sT6hVRabhtUhe/08/s7etyxf7ShZJRO9bwjBdQxGkP02pGZ/l+Z4UgDbISpiG5koWPSSk90MqYoNBubwguheIHPGZe6iOuHhFL2tZ5Z2d9+b/YlxGsLVx6f6fteVa6k0YYZEkBhsIvlWiVOb8jQJQUnQ6nET3fSEFL0B1uz0iA0tFMWYonDIFeVlJieUkcPJoz7XKsiAeV9QW33XKY3Ydoi0e5Zrp3iocYr2Spx570SNYGLPx/tJ8UxOQ9D7R0dhdZwWQ4/R6O6d9KDSwT3G1CAE3WLjhVXQ4PQxxT+ZAd8GwMHo0yljP5y9dOmZOGAjnTUz8tIdfEmMWfDEXGD8bU2zCchPnWhHLjm1GsiEclSn75ZpJanmlJx+OHpB9LVWRLluxcuR/LLi/EXLFchTBfFObRj2Bg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 849bb793-e813-409e-dc3a-08d70911e2f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 10:47:52.0650 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqdeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4160
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0+7Ouvhd7mUfjw+sRF6Kpon6KsA1gGTPHB7nS1xjWA=;
 b=hc/OuvBpI1zPJLsbofhH1TOx55lxBQcvfnpl2BLpdGWr1BCdHquhZDJay3QSsnHDbapvZFTsU2IBpSPbso4g5CHKdqEMAeJueNA8yz2a3MWv9LTl8g5yop6rQJUsrfwWFNnAOgbE9LV8d0PF2souBPoHMk8KmpdVd28TGX8zu7A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLA0KICAgICBEbyB5b3UgdGhpbmsgd2UgY291bGQgZnJlZSBhbGwgdGhvc2Ug
Ym9zIHRob3NlIGFyZSBpbiBjdXJyZW50IGRlc3Ryb3kgbGlzdCB3aGVuIHRoZSBjdXJyZW50IHJl
c3YgaXMgc2lnbmFsIGluIHR0bV9ib19jbGVhbnVwX3JlZnM/DQoNCkJlc3Qgd2lzaGVzDQpFbWls
eSBEZW5nDQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEtvZW5pZywgQ2hy
aXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+DQo+U2VudDogTW9uZGF5LCBKdWx5IDE1
LCAyMDE5IDU6NDEgUE0NCj5UbzogRGVuZywgRW1pbHkgPEVtaWx5LkRlbmdAYW1kLmNvbT47IFpo
b3UsIERhdmlkKENodW5NaW5nKQ0KPjxEYXZpZDEuWmhvdUBhbWQuY29tPg0KPkNjOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPlN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS90dG06IEZp
eCB0aGUgbWVtb3J5IGRlbGF5IGZyZWUgaXNzdWUNCj4NCj4+IERvIHlvdSB0aGluayB3ZSBkb24n
dCBuZWVkIHRvIGZpeCBpdD8NCj5Obywgd2hlbiB0aGUgYXBwbGljYXRpb24gaXMgZXhoYXVzdGlu
ZyBtZW1vcnkgdGhlbiB3ZSBjYW4ndCBleHBlY3QgYW55dGhpbmcNCj5lbHNlIGhlcmUuDQo+DQo+
U2VlIG1lbW9yeSBmcmVlaW5nIGlzIGFsd2F5cyBkZWxheWVkIHVudGlsIGl0IGlzbid0IHVzZWQg
YW55IG1vcmUgb3Igd2hlbiB0aGUNCj5wcm9jZXNzIGlzIGtpbGxlZCBhZnRlciBhY2Nlc3MgaXMg
cHJldmVudGVkIChieSBjbGVhcmluZyBwYWdlIHRhYmxlcyBmb3IgZXhhbXBsZSkuDQo+DQo+V2hh
dCB3ZSBjb3VsZCBkbyBpcyBtYXliZSBsb29rIGludG8gd2h5IHdlIGRvbid0IGJsb2NrIHVudGls
IHRoZSBtZW1vcnkgaXMNCj5mcmVlZCBkdXJpbmcgY29tbWFuZCBzdWJtaXNzaW9uLCBidXQgYXBh
cnQgZnJvbSB0aGF0IHRoaXMgc291bmRzIGxpa2UNCj5wZXJmZWN0bHkgZXhwZWN0ZWQgYmVoYXZp
b3IuDQo+DQo+UmVnYXJkcywNCj5DaHJpc3RpYW4uDQo+DQo+QW0gMTUuMDcuMTkgdW0gMTE6MzQg
c2NocmllYiBEZW5nLCBFbWlseToNCj4+IEhpIENocmlzdGlhbiwNCj4+ICAgICAgQXMgaGFzIHRo
aXMgYmVoYXZpb3IsIHdoZW4gdGVzdCB2dWxrYW4gY3RzIGFsbG9jYXRpb24gdGVzdCwgaXQgd2ls
bA0KPmV4aGF1c3RpbmcgdGhlIG1lbW9yeSwgYW5kIGNhdXNlIG91dCBvZiBtZW1vcnkuIERvIHlv
dSB0aGluayB3ZSBkb24ndA0KPm5lZWQgdG8gZml4IGl0Pw0KPj4NCj4+IEJlc3Qgd2lzaGVzDQo+
PiBFbWlseSBEZW5nDQo+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+PiBGcm9tOiBL
b2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KPj4+IFNlbnQ6IE1v
bmRheSwgSnVseSAxNSwgMjAxOSA1OjMxIFBNDQo+Pj4gVG86IERlbmcsIEVtaWx5IDxFbWlseS5E
ZW5nQGFtZC5jb20+OyBaaG91LCBEYXZpZChDaHVuTWluZykNCj4+PiA8RGF2aWQxLlpob3VAYW1k
LmNvbT4NCj4+PiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+PiBTdWJqZWN0
OiBSZTogW1BBVENIXSBkcm0vdHRtOiBGaXggdGhlIG1lbW9yeSBkZWxheSBmcmVlIGlzc3VlDQo+
Pj4NCj4+PiBIaSBndXlzLA0KPj4+DQo+Pj4+IERvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9uIGFi
b3V0IHRoaXM/IEZvciBwZXIgdm0gYm8sIGl0IHNlZW1zDQo+Pj4+IGFsd2F5cw0KPj4+IGRlbGF5
IHRvIGZyZWUgdGhlIHR0bSBiby4NCj4+PiBZZWFoLCBhbmQgdGhhdCBpcyBjb3JyZWN0IGJlaGF2
aW9yLg0KPj4+DQo+Pj4gU2luY2Ugd2UgZG9uJ3Qga25vdyB3aG8gaXMgdXNpbmcgYSBwZXItdm0g
Qk8gd2UgbmVlZCB0byB3YWl0IGZvciBhbGwNCj4+PiBjb21tYW5kIHN1Ym1pc3Npb25zIGluIGZs
aWdodCB3aGVuIGl0IGlzIGZyZWVkLg0KPj4+DQo+Pj4gRm9yIHRoaXMgd2UgY29weSB0aGUgY3Vy
cmVudCBzdGF0ZSBvZiB0aGUgc2hhcmVkIHJlc2VydmF0aW9uIG9iamVjdA0KPj4+IGludG8gdGhl
IHByaXZhdGUgb25lIGluIHR0bV9ib19pbmRpdmlkdWFsaXplX3Jlc3YuDQo+Pj4NCj4+PiBSZWdh
cmRzLA0KPj4+IENocmlzdGlhbi4NCj4+Pg0KPj4+IEFtIDE1LjA3LjE5IHVtIDA4OjQ5IHNjaHJp
ZWIgRGVuZywgRW1pbHk6DQo+Pj4+IEhpIERhdmlkLA0KPj4+PiAgICAgICAgWW91IGFyZSByaWdo
dCwgaXQgd2lsbCBjb3B5IHBlci12bSByZXN2Lg0KPj4+PiAgICAgICAgQnV0IGN1cnJlbnRseSwg
aXQgc3RpbGwgaGFzIHRoZSBkZWxheSBmcmVlIGlzc3VlIHdoaWNoIG5vbg0KPj4+PiBwZXIgdm0g
Ym8gZG9lc24ndA0KPj4+IGhhcy4gTWF5YmUgaXQgYWxyZWFkeSBoYXMgbmV3IGZlbmNlcyBhcHBl
bmQgdG8gdGhpcyByZXN2IG9iamVjdCBiZWZvcmUNCj5jb3B5Lg0KPj4+PiBIaSBDaHJpc3RpYW4s
DQo+Pj4+ICAgICAgIERvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9uIGFib3V0IHRoaXM/IEZvciBw
ZXIgdm0gYm8sIGl0IHNlZW1zDQo+Pj4+IGFsd2F5cw0KPj4+IGRlbGF5IHRvIGZyZWUgdGhlIHR0
bSBiby4NCj4+Pj4gQmVzdCB3aXNoZXMNCj4+Pj4gRW1pbHkgRGVuZw0KPj4+Pj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4+Pj4+IEZyb206IFpob3UsIERhdmlkKENodW5NaW5nKSA8RGF2
aWQxLlpob3VAYW1kLmNvbT4NCj4+Pj4+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSAxMCwgMjAxOSA5
OjI4IFBNDQo+Pj4+PiBUbzogRGVuZywgRW1pbHkgPEVtaWx5LkRlbmdAYW1kLmNvbT47IGFtZC0N
Cj5nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Pj4+PiBTdWJqZWN0OiBSZTogW1BBVENIXSBk
cm0vdHRtOiBGaXggdGhlIG1lbW9yeSBkZWxheSBmcmVlIGlzc3VlDQo+Pj4+Pg0KPj4+Pj4gSXQg
ZG9lc24ndCBtYWtlIHNlbnNlIHRoYXQgZnJlZWluZyBCTyBzdGlsbCB1c2VzIHBlci12bSByZXN2
Lg0KPj4+Pj4NCj4+Pj4+IEkgcmVtZW1iZXIgd2hlbiBCTyBpcyBpbiByZWxlYXNlIGxpc3QsIGl0
cyByZXN2IHdpbGwgYmUgZnJvbSBwZXItdm0gcmVzdg0KPmNvcHkuDQo+Pj4+PiBDb3VsZCB5b3Ug
Y2hlY2sgaXQ/DQo+Pj4+Pg0KPj4+Pj4gLURhdmlkDQo+Pj4+Pg0KPj4+Pj4g5ZyoIDIwMTkvNy8x
MCAxNzoyOSwgRW1pbHkgRGVuZyDlhpnpgZM6DQo+Pj4+Pj4gRm9yIHZ1bGthbiBjdHMgYWxsb2Nh
dGlvbiB0ZXN0IGNhc2VzLCB0aGV5IHdpbGwgY3JlYXRlIGEgc2VyaWVzIG9mDQo+Pj4+Pj4gYm9z
LCBhbmQgdGhlbiBmcmVlIHRoZW0uIEFzIGl0IGhhcyBsb3RzIG9mIGFsbG9jdGlvbiB0ZXN0IGNh
c2VzDQo+Pj4+Pj4gd2l0aCB0aGUgc2FtZSB2bSwgYXMgcGVyIHZtIGJvIGZlYXR1cmUgZW5hYmxl
LCBhbGwgb2YgdGhvc2UgYm9zJw0KPj4+Pj4+IHJlc3YgYXJlIHRoZSBzYW1lLiBCdXQgdGhlIGJv
IGZyZWUgaXMgcXVpdGUgc2xvdywgYXMgdGhleSB1c2UgdGhlDQo+Pj4+Pj4gc2FtZSByZXN2IG9i
amVjdCwgZm9yIGV2ZXJ5IHRpbWUsIGZyZWUgYSBibywgaXQgd2lsbCBjaGVjayB0aGUNCj4+Pj4+
PiByZXN2IHdoZXRoZXIgc2lnbmFsLCBpZiBpdCBzaWduYWwsIHRoZW4gd2lsbCBmcmVlIGl0LiBC
dXQgYXMgdGhlDQo+Pj4+Pj4gdGVzdCBjYXNlcyB3aWxsIGNvbnRpbnVlIHRvIGNyZWF0ZSBibywg
YW5kIHRoZSByZXN2IGZlbmNlIGlzDQo+Pj4+Pj4gaW5jcmVhc2luZy4gU28gdGhlIGZyZWUgaXMg
bW9yZQ0KPj4+Pj4gc2xvd2VyIHRoYW4gY3JlYXRpbmcuIEl0IHdpbGwgY2F1c2UgbWVtb3J5IGV4
aGF1c3RpbmcuDQo+Pj4+Pj4gTWV0aG9kOg0KPj4+Pj4+IFdoZW4gdGhlIHJlc3Ygc2lnbmFsLCBy
ZWxlYXNlIGFsbCB0aGUgYm9zIHdoaWNoIGFyZSB1c2UgdGhlIHNhbWUNCj4+Pj4+PiByZXN2IG9i
amVjdC4NCj4+Pj4+Pg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEVtaWx5IERlbmcgPEVtaWx5LkRl
bmdAYW1kLmNvbT4NCj4+Pj4+PiAtLS0NCj4+Pj4+PiAgICAgZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm8uYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0NCj4tDQo+Pj4+Pj4gICAg
IDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPj4+Pj4+
DQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMNCj4+Pj4+
PiBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgaW5kZXggZjlhM2Q0Yy4uNTdlYzU5YiAx
MDA2NDQNCj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jDQo+Pj4+Pj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KPj4+Pj4+IEBAIC01NDMsNiArNTQz
LDcgQEAgc3RhdGljIGludCB0dG1fYm9fY2xlYW51cF9yZWZzKHN0cnVjdA0KPj4+Pj4gdHRtX2J1
ZmZlcl9vYmplY3QgKmJvLA0KPj4+Pj4+ICAgICB7DQo+Pj4+Pj4gICAgIAlzdHJ1Y3QgdHRtX2Jv
X2dsb2JhbCAqZ2xvYiA9IGJvLT5iZGV2LT5nbG9iOw0KPj4+Pj4+ICAgICAJc3RydWN0IHJlc2Vy
dmF0aW9uX29iamVjdCAqcmVzdjsNCj4+Pj4+PiArCXN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAq
cmVzdl9ibywgKnJlc3ZfYm9fbmV4dDsNCj4+Pj4+PiAgICAgCWludCByZXQ7DQo+Pj4+Pj4NCj4+
Pj4+PiAgICAgCWlmICh1bmxpa2VseShsaXN0X2VtcHR5KCZiby0+ZGRlc3Ryb3kpKSkNCj4+Pj4+
PiBAQCAtNTY2LDEwICs1NjcsMTQgQEAgc3RhdGljIGludCB0dG1fYm9fY2xlYW51cF9yZWZzKHN0
cnVjdA0KPj4+Pj4gdHRtX2J1ZmZlcl9vYmplY3QgKmJvLA0KPj4+Pj4+ICAgICAJCQkJCQkJICAg
aW50ZXJydXB0aWJsZSwNCj4+Pj4+PiAgICAgCQkJCQkJCSAgIDMwICogSFopOw0KPj4+Pj4+DQo+
Pj4+Pj4gLQkJaWYgKGxyZXQgPCAwKQ0KPj4+Pj4+ICsJCWlmIChscmV0IDwgMCkgew0KPj4+Pj4+
ICsJCQlrcmVmX3B1dCgmYm8tPmxpc3Rfa3JlZiwgdHRtX2JvX3JlbGVhc2VfbGlzdCk7DQo+Pj4+
Pj4gICAgIAkJCXJldHVybiBscmV0Ow0KPj4+Pj4+IC0JCWVsc2UgaWYgKGxyZXQgPT0gMCkNCj4+
Pj4+PiArCQl9DQo+Pj4+Pj4gKwkJZWxzZSBpZiAobHJldCA9PSAwKSB7DQo+Pj4+Pj4gKwkJCWty
ZWZfcHV0KCZiby0+bGlzdF9rcmVmLCB0dG1fYm9fcmVsZWFzZV9saXN0KTsNCj4+Pj4+PiAgICAg
CQkJcmV0dXJuIC1FQlVTWTsNCj4+Pj4+PiArCQl9DQo+Pj4+Pj4NCj4+Pj4+PiAgICAgCQlzcGlu
X2xvY2soJmdsb2ItPmxydV9sb2NrKTsNCj4+Pj4+PiAgICAgCQlpZiAodW5sb2NrX3Jlc3YgJiYN
Cj4+Pj4+PiAha2NsX3Jlc2VydmF0aW9uX29iamVjdF90cnlsb2NrKGJvLT5yZXN2KSkNCj4+Pj4+
IHsgQEANCj4+Pj4+PiAtNTgyLDYgKzU4Nyw3IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2NsZWFudXBf
cmVmcyhzdHJ1Y3QNCj4+Pj4+PiB0dG1fYnVmZmVyX29iamVjdA0KPj4+Pj4gKmJvLA0KPj4+Pj4+
ICAgICAJCQkgKiBoZXJlLg0KPj4+Pj4+ICAgICAJCQkgKi8NCj4+Pj4+PiAgICAgCQkJc3Bpbl91
bmxvY2soJmdsb2ItPmxydV9sb2NrKTsNCj4+Pj4+PiArCQkJa3JlZl9wdXQoJmJvLT5saXN0X2ty
ZWYsIHR0bV9ib19yZWxlYXNlX2xpc3QpOw0KPj4+Pj4+ICAgICAJCQlyZXR1cm4gMDsNCj4+Pj4+
PiAgICAgCQl9DQo+Pj4+Pj4gICAgIAkJcmV0ID0gMDsNCj4+Pj4+PiBAQCAtNTkxLDE1ICs1OTcs
MjkgQEAgc3RhdGljIGludCB0dG1fYm9fY2xlYW51cF9yZWZzKHN0cnVjdA0KPj4+Pj4gdHRtX2J1
ZmZlcl9vYmplY3QgKmJvLA0KPj4+Pj4+ICAgICAJCWlmICh1bmxvY2tfcmVzdikNCj4+Pj4+PiAg
ICAgCQkJa2NsX3Jlc2VydmF0aW9uX29iamVjdF91bmxvY2soYm8tPnJlc3YpOw0KPj4+Pj4+ICAg
ICAJCXNwaW5fdW5sb2NrKCZnbG9iLT5scnVfbG9jayk7DQo+Pj4+Pj4gKwkJa3JlZl9wdXQoJmJv
LT5saXN0X2tyZWYsIHR0bV9ib19yZWxlYXNlX2xpc3QpOw0KPj4+Pj4+ICAgICAJCXJldHVybiBy
ZXQ7DQo+Pj4+Pj4gICAgIAl9DQo+Pj4+Pj4NCj4+Pj4+PiAgICAgCXR0bV9ib19kZWxfZnJvbV9s
cnUoYm8pOw0KPj4+Pj4+ICAgICAJbGlzdF9kZWxfaW5pdCgmYm8tPmRkZXN0cm95KTsNCj4+Pj4+
PiAgICAgCWtyZWZfcHV0KCZiby0+bGlzdF9rcmVmLCB0dG1fYm9fcmVmX2J1Zyk7DQo+Pj4+Pj4g
LQ0KPj4+Pj4+ICAgICAJc3Bpbl91bmxvY2soJmdsb2ItPmxydV9sb2NrKTsNCj4+Pj4+PiAgICAg
CXR0bV9ib19jbGVhbnVwX21lbXR5cGVfdXNlKGJvKTsNCj4+Pj4+PiArCWtyZWZfcHV0KCZiby0+
bGlzdF9rcmVmLCB0dG1fYm9fcmVsZWFzZV9saXN0KTsNCj4+Pj4+PiArDQo+Pj4+Pj4gKwlzcGlu
X2xvY2soJmdsb2ItPmxydV9sb2NrKTsNCj4+Pj4+PiArCWxpc3RfZm9yX2VhY2hfZW50cnlfc2Fm
ZShyZXN2X2JvLCByZXN2X2JvX25leHQsICZiby0+YmRldi0NCj4+Pj4+PiBkZGVzdHJveSwgZGRl
c3Ryb3kpIHsNCj4+Pj4+PiArCQlpZiAocmVzdl9iby0+cmVzdiA9PSBiby0+cmVzdikgew0KPj4+
Pj4+ICsJCQl0dG1fYm9fZGVsX2Zyb21fbHJ1KHJlc3ZfYm8pOw0KPj4+Pj4+ICsJCQlsaXN0X2Rl
bF9pbml0KCZyZXN2X2JvLT5kZGVzdHJveSk7DQo+Pj4+Pj4gKwkJCXNwaW5fdW5sb2NrKCZnbG9i
LT5scnVfbG9jayk7DQo+Pj4+Pj4gKwkJCXR0bV9ib19jbGVhbnVwX21lbXR5cGVfdXNlKHJlc3Zf
Ym8pOw0KPj4+Pj4+ICsJCQlrcmVmX3B1dCgmcmVzdl9iby0+bGlzdF9rcmVmLA0KPnR0bV9ib19y
ZWxlYXNlX2xpc3QpOw0KPj4+Pj4+ICsJCQlzcGluX2xvY2soJmdsb2ItPmxydV9sb2NrKTsNCj4+
Pj4+PiArCQl9DQo+Pj4+Pj4gKwl9DQo+Pj4+Pj4gKwlzcGluX3VubG9jaygmZ2xvYi0+bHJ1X2xv
Y2spOw0KPj4+Pj4+DQo+Pj4+Pj4gICAgIAlpZiAodW5sb2NrX3Jlc3YpDQo+Pj4+Pj4gICAgIAkJ
a2NsX3Jlc2VydmF0aW9uX29iamVjdF91bmxvY2soYm8tPnJlc3YpOw0KPj4+Pj4+IEBAIC02Mzks
OSArNjU5LDggQEAgc3RhdGljIGJvb2wgdHRtX2JvX2RlbGF5ZWRfZGVsZXRlKHN0cnVjdA0KPj4+
Pj4gdHRtX2JvX2RldmljZSAqYmRldiwgYm9vbCByZW1vdmVfYWxsKQ0KPj4+Pj4+ICAgICAJCQl0
dG1fYm9fY2xlYW51cF9yZWZzKGJvLCBmYWxzZSwgIXJlbW92ZV9hbGwsDQo+dHJ1ZSk7DQo+Pj4+
Pj4gICAgIAkJfSBlbHNlIHsNCj4+Pj4+PiAgICAgCQkJc3Bpbl91bmxvY2soJmdsb2ItPmxydV9s
b2NrKTsNCj4+Pj4+PiArCQkJa3JlZl9wdXQoJmJvLT5saXN0X2tyZWYsIHR0bV9ib19yZWxlYXNl
X2xpc3QpOw0KPj4+Pj4+ICAgICAJCX0NCj4+Pj4+PiAtDQo+Pj4+Pj4gLQkJa3JlZl9wdXQoJmJv
LT5saXN0X2tyZWYsIHR0bV9ib19yZWxlYXNlX2xpc3QpOw0KPj4+Pj4+ICAgICAJCXNwaW5fbG9j
aygmZ2xvYi0+bHJ1X2xvY2spOw0KPj4+Pj4+ICAgICAJfQ0KPj4+Pj4+ICAgICAJbGlzdF9zcGxp
Y2VfdGFpbCgmcmVtb3ZlZCwgJmJkZXYtPmRkZXN0cm95KTsNCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
