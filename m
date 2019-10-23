Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBE7E1203
	for <lists+amd-gfx@lfdr.de>; Wed, 23 Oct 2019 08:20:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20D26E954;
	Wed, 23 Oct 2019 06:20:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810053.outbound.protection.outlook.com [40.107.81.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4EFE6E954
 for <amd-gfx@lists.freedesktop.org>; Wed, 23 Oct 2019 06:19:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kv3PbI7t9Tys041icBb/gKZXAU0BUEO5vkgEiNGxkV8aRWnAi2UcW7Q3JgIU/BO71tC+MCq1WfJFTCHvS3SQzu1rmji4XG1oK/SKsyGHP/6B7BF3OWJ2gUiBHN0nf06IlSbT1blSrG11IydU7YeKJk9wKA0PF7fPxFfOCtr78FkpibiMDYQOytvYeO06B0z2fk/qLZAV50Jo00+csL0jRWD+R1xZcNmnPKqpuCfF6ddR7k6BewnPkhfxPsVGwpUidhhZoCoxSzpp32UNBgZazsnMvy4dF/NPbu4Rc+C0W1rKpISzIFvkQEGhnbb8WQv5NeO++VglNTu/fhOeHYEGVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XevqL/B8uQmAytFcN1vQ2hdUiMlqjO1lVId2Vizv6A=;
 b=PNu/dNrDD5kp/bfUD1/GWCpa/8DOu2EQMwjt1SmLHvubBmo/l30m9YLBqz9z2jVEzueKcaHmSAdg7rOZ+2dF11qmWmHZ/l9YyxoYg5TUnS20df6cweFA1Dy7IUP1wiAGBM4W3xEeb9ruy7q9OIh9MXAfQ0JgL++liWw8ktkLn3h3ZYhWGa+syf/OMSHHjMbY0NrnGEZ1ot29NxwUxZ38HJKK0PLHcoMq3iafQLuJ+Q8uvTZhJlYi2J+Ck8XXnYz2A/YyxnwdUv99p+nm9OuTYk4JnIxqjaKb5tK2OOSkMKNAc93mwJ8XjNS96ge5oIe7sdnRrcwRMO8l7b1Dbc3M/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3248.namprd12.prod.outlook.com (20.179.80.74) by
 MN2PR12MB3358.namprd12.prod.outlook.com (20.178.244.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Wed, 23 Oct 2019 06:19:56 +0000
Received: from MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::dd77:dfe4:1913:9d7e]) by MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::dd77:dfe4:1913:9d7e%4]) with mapi id 15.20.2347.029; Wed, 23 Oct 2019
 06:19:56 +0000
From: "S, Shirish" <sshankar@amd.com>
To: "Li, Ching-shih (Louis)" <Ching-shih.Li@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] UPSTREAM: drm/amd/display: Fix Apple dongle cannot be
 successfully detected
Thread-Topic: [PATCH] UPSTREAM: drm/amd/display: Fix Apple dongle cannot be
 successfully detected
Thread-Index: AQHVh+SjANijc0rxOkyLOKOiSjJhlqdnxTmA
Date: Wed, 23 Oct 2019 06:19:56 +0000
Message-ID: <2d745e77-c6be-fb02-a1ee-c07664b911cd@amd.com>
References: <20191021075439.1066-1-Ching-shih.Li@amd.com>
In-Reply-To: <20191021075439.1066-1-Ching-shih.Li@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:49::22) To MN2PR12MB3248.namprd12.prod.outlook.com
 (2603:10b6:208:a9::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.157.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 38dffa35-58a8-472d-d8ce-08d75781065e
x-ms-traffictypediagnostic: MN2PR12MB3358:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3358EE1DFE6F6116D95A0A16F26B0@MN2PR12MB3358.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(47660400002)(189003)(199004)(8676002)(66946007)(478600001)(81156014)(31686004)(81166006)(3846002)(14454004)(6116002)(7736002)(305945005)(66066001)(446003)(11346002)(8936002)(4326008)(110136005)(6246003)(486006)(476003)(316002)(2616005)(54906003)(2906002)(2501003)(64756008)(66446008)(66556008)(66476007)(6512007)(25786009)(229853002)(6486002)(6436002)(14444005)(256004)(99286004)(52116002)(76176011)(386003)(71190400001)(71200400001)(5660300002)(36756003)(26005)(31696002)(6506007)(102836004)(186003)(53546011)(46800400005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3358;
 H:MN2PR12MB3248.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fMYa6At3nQ9UWGyaF9NartY68Sqez4Svw5qkLqPaWq+R4TXBW84lJdGryWKMY31MAORjdjSqUJ0fbzI6kXMgUtfzQYr8shc59WYAHcIQfylvE/vjvDiHSOH1BknAx211q5UFFWtaccQFFLuVmaraO9EnHA0y6Ndaf1WaQSwmnzsOjNT1McWqIAFUQfuPhLVDTZca1GCPTB4bB9733Nm1H/Zh6Mc1fTUjIRpCfUn4VJPqbB0+pTInOMruhdueLr9z9Iba/jHgsSqWQS8zeBIIoI63DffNQR1Nc6IYJN6KNmQfZyX778gS7EGSaN/gE+kpap6cZ6Jiu3YAAWjnVIh4dYI2zqmuTdvD9CfhjmfsA9MnHmZVDVh9ajOn1YDR4KaKWo1emPxQuRu2T/Xq9Bsqh7OR3SUBqYpnrpsIwHPY+f/Q2X9pb6gGVdS9fmKoEV7v
Content-ID: <638349B04A563545A061462996A9FE0F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38dffa35-58a8-472d-d8ce-08d75781065e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 06:19:56.7969 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pmdlUzhWmshJGSeZw0jM8wxEyXhi3VokXpyMdbgoJ3su/EBt3adRzi0EE1w7X9yUefc/U1rd2HMwaxyFAN19mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3358
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XevqL/B8uQmAytFcN1vQ2hdUiMlqjO1lVId2Vizv6A=;
 b=HE/MPa0Y7QlCRqvPw27bVnXbWzjyPHkjpnH32oc0leQZuwTs3c2GywxLHp+q1AUr+iOhBr6/kmORG1v1ofGT3UWtm8kLW5g7fxu3sWaODy0avmHgK0+OzGsWobrmH7isVIq6BFak3nHcGsWQp/AJFnB4Vwqaxwxx2Uj9pIKSt8I=
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
Cc: "Wentland, Harry" <Harry.Wentland@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIFVQU1RSRUFNIHRhZyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgbmVlZHMgdG8gYmUgcmVtb3Zl
ZC4NCg0KT24gMTAvMjEvMjAxOSAxOjI0IFBNLCBMb3VpcyBMaSB3cm90ZToNCj4gW1doeV0NCj4g
RXh0ZXJuYWwgbW9uaXRvciBjYW5ub3QgYmUgZGlzcGxheWVkIGNvbnNpc3RlbnRseSwgaWYgY29u
bmVjdGluZw0KPiB2aWEgdGhpcyBBcHBsZSBkb25nbGUgKEExNjIxLCBVU0IgVHlwZS1DIHRvIEhE
TUkpLg0KPiBCeSBleHBlcmltZW50cywgaXQgaXMgY29uZmlybWVkIHRoYXQgdGhlIGRvbmdsZSBu
ZWVkcyAyMDBtcyBhdCBsZWFzdA0KPiB0byBiZSByZWFkeSBmb3IgY29tbXVuaWNhdGlvbiwgYWZ0
ZXIgaXQgc2V0cyBIUEQgc2lnbmFsIGhpZ2guDQo+DQo+IFtIb3ddDQo+IFdoZW4gcmVjZWl2aW5n
IEhQRCBJUlEsIGRlbGF5IDUwMG1zIGF0IHRoZSBiZWdpbm5pbmcgb2YgaGFuZGxlX2hwZF9pcnEo
KS4NCg0KQW0gbm90IHN1cmUgaG93IHRoaXMgZGVsYXkgc2hhbGwgaW1wYWN0IG9uIGRvbmdsZXMg
dGhhdCBkb24ndCBuZWVkIGl0LA0KDQppZGVhbGx5IGl0IHNob3VsZCBiZSBhZGRlZCBhcyBxdWly
aywgYXQgbGVhc3QgcmVzdHJpY3QgaXQgdG8gdGhlc2UgDQpzcGVjaWZpYyB2ZW5kb3JzLg0KDQpJ
bnN0ZWFkIG9mIGRlbGF5LCBjYW4geW91IGZpbmQgYW55IHBhcmFtZXRlciB0byB3YWl0IGZvciBm
b3IgdGhlIA0KY29tbXVuaWNhdGlvbiB0byBiZSByZWFkeSwNCg0KaW4gdGhhdCB3YXkgaXQgc2hh
bGwgYmUgZmFpbHNhZmUuDQoNCj4gVGhlbiBydW4gdGhlIG9yaWdpbmFsIHByb2NlZHVyZS4NCj4g
V2l0aCB0aGlzIHBhdGNoIGFwcGxpZWQsIHRoZSBwcm9ibGVtIGNhbm5vdCBiZSByZXByb2R1Y2Vk
Lg0KPiBXaXRoIG90aGVyIGRvbmdsZXMsIHRlc3QgcmVzdWx0cyBhcmUgUEFTUy4NCj4gVGVzdCBy
ZXN1bHQgaXMgUEFTUyBhZnRlciBzeXN0ZW0gcmVzdW1lcyBmcm9tIHN1c3BlbmQuDQo+DQo+IFNp
Z25lZC1vZmYtYnk6IExvdWlzIExpIDxDaGluZy1zaGloLkxpQGFtZC5jb20+DQo+IC0tLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCA1ICsr
KysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gaW5kZXgg
MGFlZjkyYjdjMDM3Li4wNDNkZGFjNzM4NjIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPiBAQCAtMTAyNSw2ICsxMDI1
LDExIEBAIHN0YXRpYyB2b2lkIGhhbmRsZV9ocGRfaXJxKHZvaWQgKnBhcmFtKQ0KPiAgIAlzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2ID0gY29ubmVjdG9yLT5kZXY7DQo+ICAgCWVudW0gZGNfY29ubmVj
dGlvbl90eXBlIG5ld19jb25uZWN0aW9uX3R5cGUgPSBkY19jb25uZWN0aW9uX25vbmU7DQo+ICAg
DQo+ICsgICAgLyogU29tZSBtb25pdG9ycy9kb25nbGVzIG5lZWQgYXJvdW5kIDIwMG1zIHRvIGJl
IHJlYWR5IGZvciBjb21tdW5pY2F0aW9uDQo+ICsgICAgICogYWZ0ZXIgdGhleSBkcml2ZSBIUEQg
c2lnbmFsIGhpZ2guDQo+ICsgICAgICovDQo+ICsgICAgbWRlbGF5KDUwMCk7DQo+ICsNCj4gICAJ
LyogSW4gY2FzZSBvZiBmYWlsdXJlIG9yIE1TVCBubyBuZWVkIHRvIHVwZGF0ZSBjb25uZWN0b3Ig
c3RhdHVzIG9yIG5vdGlmeSB0aGUgT1MNCj4gICAJICogc2luY2UgKGZvciBNU1QgY2FzZSkgTVNU
IGRvZXMgdGhpcyBpbiBpdCdzIG93biBjb250ZXh0Lg0KPiAgIAkgKi8NCg0KLS0gDQpSZWdhcmRz
LA0KU2hpcmlzaCBTDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
