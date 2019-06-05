Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBA235508
	for <lists+amd-gfx@lfdr.de>; Wed,  5 Jun 2019 03:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28D789CCB;
	Wed,  5 Jun 2019 01:35:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760070.outbound.protection.outlook.com [40.107.76.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAB089CCB
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Jun 2019 01:35:22 +0000 (UTC)
Received: from MN2PR12MB3248.namprd12.prod.outlook.com (20.179.80.74) by
 MN2PR12MB3872.namprd12.prod.outlook.com (10.255.237.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Wed, 5 Jun 2019 01:35:19 +0000
Received: from MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::9549:fb7a:6814:2aa6]) by MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::9549:fb7a:6814:2aa6%6]) with mapi id 15.20.1965.011; Wed, 5 Jun 2019
 01:35:19 +0000
From: "S, Shirish" <sshankar@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "S, Shirish" <Shirish.S@amd.com>
Subject: Re: [PATCH] drm/amdgpu/{uvd,vcn}: fetch ring's read_ptr after alloc
Thread-Topic: [PATCH] drm/amdgpu/{uvd,vcn}: fetch ring's read_ptr after alloc
Thread-Index: AQHVGu+OrT/8P8EeokmFRVCBZI4FaqaLqvYAgACddIA=
Date: Wed, 5 Jun 2019 01:35:19 +0000
Message-ID: <1f3e3699-31ff-1806-97ea-cc8273d0380c@amd.com>
References: <1559664412-5512-1-git-send-email-shirish.s@amd.com>
 <CADnq5_O2aB+5-tGSxo_ObqEGnCdgDEXyd99nnop6sDO2sKVVrw@mail.gmail.com>
In-Reply-To: <CADnq5_O2aB+5-tGSxo_ObqEGnCdgDEXyd99nnop6sDO2sKVVrw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR0101CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::20) To MN2PR12MB3248.namprd12.prod.outlook.com
 (2603:10b6:208:a9::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 158c8c57-f415-46d0-0219-08d6e95611a5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3872; 
x-ms-traffictypediagnostic: MN2PR12MB3872:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3872239FBF80047F0CF4C2A1F2160@MN2PR12MB3872.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:663;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(376002)(396003)(346002)(366004)(189003)(199004)(316002)(76176011)(66446008)(99286004)(68736007)(73956011)(6246003)(66476007)(486006)(64756008)(2906002)(476003)(36756003)(66946007)(6636002)(66556008)(4326008)(446003)(31686004)(11346002)(66066001)(2616005)(25786009)(52116002)(72206003)(53936002)(8936002)(966005)(3846002)(229853002)(6116002)(54906003)(6436002)(71190400001)(71200400001)(110136005)(6486002)(102836004)(386003)(305945005)(6306002)(186003)(6506007)(26005)(53546011)(7736002)(81156014)(14454004)(8676002)(478600001)(81166006)(6512007)(256004)(5660300002)(31696002)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3872;
 H:MN2PR12MB3248.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2GV94tjyArA+IEr9CZAHVawRsyhkvtqCXW81RK9yzr5U7Coo3cvppMcL8JxJIizhhSXIBgU4I6ly0Zbh/UdPjHjstFAurH9qrYwnGyeJwD60mBZCRhaWBuAOOg30Mhrne7djy2RXgzks3r77lnNud+RVkQxHpqDOQ5ijdn4d6lSMhSPeDVmwYBkXIZHnkqo4KDYyTGLG1hI77aZuNz0DwMjB/VVQOrXQ/D4Wzji0llnhfM6UuPcIfvtxKzQKij2vbPiHszb1t+l7fXaRct7WKYYOns18b5SIj9i/sTvOD/hdwtCc4tc9xQZ9TLa9Z0oWCDu8DlzcvfNrax61v7nySzBemh66b8W/kTTTdBYsvYjAn3UMx8dj94igWFoIwL4MIcBzKAXvUdcnz0vM76FZWtb80/kqFzYmfGsZ0wjQ0cQ=
Content-ID: <960A89F63AAF3B4C9BA4629304A2450A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 158c8c57-f415-46d0-0219-08d6e95611a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 01:35:19.5217 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sshankar@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3872
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwNvEoFIFg4VtAP7a9xUTPgDhfuPsZqKOlQZeaLBGdo=;
 b=UfkjNRULAktS58jMUwZ+DwAQPV5UfsGvAHi4wFSy6/yLs7UzNBCvAdOFv0BYqDAOQ85y9oCNTpkIGXDmYFnO/LYh/AdHt8UJH8rbMZnbHWLWNwrLtlBKPQFkBGcdgkNWJziIrRoDjaA3ujEGr+oyrm4olLG+IlEB8PZpbbLKLgc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shirish.S@amd.com; 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deng,
 Emily" <Emily.Deng@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Liu, Leo" <Leo.Liu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Li, Ching-shih \(Louis\)" <Ching-shih.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQWxleCwNCg0KT24gNi80LzIwMTkgOTo0MyBQTSwgQWxleCBEZXVjaGVyIHdyb3RlOg0KPiBP
biBUdWUsIEp1biA0LCAyMDE5IGF0IDEyOjA3IFBNIFMsIFNoaXJpc2ggPFNoaXJpc2guU0BhbWQu
Y29tPiB3cm90ZToNCj4+IFtXaGF0XQ0KPj4gcmVhZHB0ciByZWFkIGFsd2F5cyByZXR1cm5zIHpl
cm8sIHNpbmNlIG1vc3QgbGlrZWx5DQo+PiBVVkQgYmxvY2sgaXMgZWl0aGVyIHBvd2VyIG9yIGNs
b2NrIGdhdGVkLg0KPj4NCj4+IFtIb3ddDQo+PiBmZXRjaCBycHRyIGFmdGVyIGFtZGdwdV9yaW5n
X2FsbG9jKCkgd2hpY2ggaW5mb3Jtcw0KPj4gdGhlIHBvd2VyIG1hbmFnZW1lbnQgY29kZSB0aGF0
IHRoZSBibG9jayBpcyBhYm91dCB0byBiZQ0KPj4gdXNlZCBhbmQgaGVuY2UgdGhlIGdhdGluZyBp
cyB0dXJuZWQgb2ZmLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IExvdWlzIExpIDxDaGluZy1zaGlo
LkxpQGFtZC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBTaGlyaXNoIFMgPHNoaXJpc2guc0BhbWQu
Y29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24u
YyB8IDQgKysrLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjZfMC5jICAg
fCA1ICsrKystDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92N18wLmMgICB8
IDUgKysrKy0NCj4gV2hhdCBhYm91dCB1dmQgNC4yLCA1LjAgYW5kIFZDRSAyLjAsIDMuMCwgNC4w
Pw0KYW1kZ3B1X3ZjZV9yaW5nX3Rlc3RfcmluZygpIGlzIHRoZSBjb21tb24gZnVuY3Rpb24gZm9y
IFZDRSAyLjAsIDMuMCAmIDQuMA0KYW5kIHBhdGNoIHRoYXQgZml4ZXMgaXQsIGlzIGFscmVhZHkg
cmV2aWV3ZWQuDQoNClVWRCA0LjIgJiA1LjDCoCB1c2UgbW1VVkRfQ09OVEVYVF9JRCBpbnN0ZWFk
IG9mIHJlYWRwdHIsDQpzbyBpIGJlbGVpdmUgdGhpcyBmaXggaXMgbm90IGFwcGxpY2FibGUgZm9y
IHRoZW0uDQpSZWdhcmRzLA0KU2hpcmlzaCBTDQo+DQo+IEFsZXgNCj4NCj4+ICAgMyBmaWxlcyBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMNCj4+IGluZGV4IDExODQ1MWYuLmQ3ODYwOTgg
MTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMN
Cj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYw0KPj4gQEAg
LTQ2OCw3ICs0NjgsNyBAQCBpbnQgYW1kZ3B1X3Zjbl9kZWNfcmluZ190ZXN0X2liKHN0cnVjdCBh
bWRncHVfcmluZyAqcmluZywgbG9uZyB0aW1lb3V0KQ0KPj4gICBpbnQgYW1kZ3B1X3Zjbl9lbmNf
cmluZ190ZXN0X3Jpbmcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQ0KPj4gICB7DQo+PiAgICAg
ICAgICBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHJpbmctPmFkZXY7DQo+PiAtICAgICAg
IHVpbnQzMl90IHJwdHIgPSBhbWRncHVfcmluZ19nZXRfcnB0cihyaW5nKTsNCj4+ICsgICAgICAg
dWludDMyX3QgcnB0cjsNCj4+ICAgICAgICAgIHVuc2lnbmVkIGk7DQo+PiAgICAgICAgICBpbnQg
cjsNCj4+DQo+PiBAQCAtNDc2LDYgKzQ3Niw4IEBAIGludCBhbWRncHVfdmNuX2VuY19yaW5nX3Rl
c3RfcmluZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpDQo+PiAgICAgICAgICBpZiAocikNCj4+
ICAgICAgICAgICAgICAgICAgcmV0dXJuIHI7DQo+Pg0KPj4gKyAgICAgICBycHRyID0gYW1kZ3B1
X3JpbmdfZ2V0X3JwdHIocmluZyk7DQo+PiArDQo+PiAgICAgICAgICBhbWRncHVfcmluZ193cml0
ZShyaW5nLCBWQ05fRU5DX0NNRF9FTkQpOw0KPj4gICAgICAgICAgYW1kZ3B1X3JpbmdfY29tbWl0
KHJpbmcpOw0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91
dmRfdjZfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYw0KPj4gaW5k
ZXggYzYxYTMxNC4uMTY2ODJiNyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3V2ZF92Nl8wLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2
ZF92Nl8wLmMNCj4+IEBAIC0xNzAsMTMgKzE3MCwxNiBAQCBzdGF0aWMgdm9pZCB1dmRfdjZfMF9l
bmNfcmluZ19zZXRfd3B0cihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpDQo+PiAgIHN0YXRpYyBp
bnQgdXZkX3Y2XzBfZW5jX3JpbmdfdGVzdF9yaW5nKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykN
Cj4+ICAgew0KPj4gICAgICAgICAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSByaW5nLT5h
ZGV2Ow0KPj4gLSAgICAgICB1aW50MzJfdCBycHRyID0gYW1kZ3B1X3JpbmdfZ2V0X3JwdHIocmlu
Zyk7DQo+PiArICAgICAgIHVpbnQzMl90IHJwdHI7DQo+PiAgICAgICAgICB1bnNpZ25lZCBpOw0K
Pj4gICAgICAgICAgaW50IHI7DQo+Pg0KPj4gICAgICAgICAgciA9IGFtZGdwdV9yaW5nX2FsbG9j
KHJpbmcsIDE2KTsNCj4+ICAgICAgICAgIGlmIChyKQ0KPj4gICAgICAgICAgICAgICAgICByZXR1
cm4gcjsNCj4+ICsNCj4+ICsgICAgICAgcnB0ciA9IGFtZGdwdV9yaW5nX2dldF9ycHRyKHJpbmcp
Ow0KPj4gKw0KPj4gICAgICAgICAgYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgSEVWQ19FTkNfQ01E
X0VORCk7DQo+PiAgICAgICAgICBhbWRncHVfcmluZ19jb21taXQocmluZyk7DQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92N18wLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjdfMC5jDQo+PiBpbmRleCBjZGI5NmQ0Li43NDgxMWIy
IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y3XzAuYw0K
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y3XzAuYw0KPj4gQEAgLTE3
NSw3ICsxNzUsNyBAQCBzdGF0aWMgdm9pZCB1dmRfdjdfMF9lbmNfcmluZ19zZXRfd3B0cihzdHJ1
Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpDQo+PiAgIHN0YXRpYyBpbnQgdXZkX3Y3XzBfZW5jX3Jpbmdf
dGVzdF9yaW5nKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykNCj4+ICAgew0KPj4gICAgICAgICAg
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSByaW5nLT5hZGV2Ow0KPj4gLSAgICAgICB1aW50
MzJfdCBycHRyID0gYW1kZ3B1X3JpbmdfZ2V0X3JwdHIocmluZyk7DQo+PiArICAgICAgIHVpbnQz
Ml90IHJwdHI7DQo+PiAgICAgICAgICB1bnNpZ25lZCBpOw0KPj4gICAgICAgICAgaW50IHI7DQo+
Pg0KPj4gQEAgLTE4NSw2ICsxODUsOSBAQCBzdGF0aWMgaW50IHV2ZF92N18wX2VuY19yaW5nX3Rl
c3RfcmluZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpDQo+PiAgICAgICAgICByID0gYW1kZ3B1
X3JpbmdfYWxsb2MocmluZywgMTYpOw0KPj4gICAgICAgICAgaWYgKHIpDQo+PiAgICAgICAgICAg
ICAgICAgIHJldHVybiByOw0KPj4gKw0KPj4gKyAgICAgICBycHRyID0gYW1kZ3B1X3JpbmdfZ2V0
X3JwdHIocmluZyk7DQo+PiArDQo+PiAgICAgICAgICBhbWRncHVfcmluZ193cml0ZShyaW5nLCBI
RVZDX0VOQ19DTURfRU5EKTsNCj4+ICAgICAgICAgIGFtZGdwdV9yaW5nX2NvbW1pdChyaW5nKTsN
Cj4+DQo+PiAtLQ0KPj4gMi43LjQNCj4+DQo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KPj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4+IGFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCg0KLS0gDQpSZWdhcmRzLA0KU2hpcmlzaCBTDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
