Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD506D5F2
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 22:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D766E464;
	Thu, 18 Jul 2019 20:46:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710087.outbound.protection.outlook.com [40.107.71.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD7A6E464
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 20:46:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1S0UPmORZX7vBn3mrukZJOp+/XcNoibv5pwHiK+in744wlAiCj84IxQSajj4k4NJKZ+m+VITSvpZKuWkbijXuVCQrcxB0GJGHWW4W+Yoqu6HxS89Xl7Qxo0X0AIlzk2XJaQ7Frh2IdOyLxm0CtVjX8MWO0cbn15i1tI7pCto16EOn9S6A0S1DDr4nD4zSzJAIYX/k5u9dXX71uqBggY2lp6kibpCEDUBxj2kVCgRL45SuCese25HLkbXYzUuVW3ZLoRrsCUWLq7v6CcUGo25+8iO4wsS9V8aeMoMPcbB8CDKiVXp2AMDes4N6WtQlJxoBxQzXwddUZTZVMRt5xHsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Obr2TqZoJ6FLBrGIi6JzUAELA2G41OrCzYzk0+/ivYY=;
 b=ZvU0AYDjsh5BDYHTL23+Z02wLm27eFhmi5jXKv/QGqwAQT8mE5IDpT4Agm5dMPQcqfCt8kxVm7AEXWTm+haMUCesmGettixtgyhTXuEgfDqcZxFjCDjo2/QwReoeYLcNSVPEi5Nnv5/pJJAq6b80xWmPNxJ9M0xhlpj7hF0KT+ZCguCbHyRRc2lxWTEUBhR6NAXQ8GPcl3cmLVDJ4gWiLKb7/MVx5eUoDYdyRDfQRd8dL8Fes6OjQS3UcwT5AsjrPTlW6LlWmwHJpsxIhPkki/PeFpBIctHuiJ74SIZEL7S3gvzyy6vvlaboy9BIL/6iIiA1B3rqWFMJM3Mc9dtf5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from CY4PR12MB1767.namprd12.prod.outlook.com (10.175.62.137) by
 CY4PR12MB1750.namprd12.prod.outlook.com (10.175.60.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 20:46:00 +0000
Received: from CY4PR12MB1767.namprd12.prod.outlook.com
 ([fe80::9d27:7add:4f59:7269]) by CY4PR12MB1767.namprd12.prod.outlook.com
 ([fe80::9d27:7add:4f59:7269%5]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 20:46:00 +0000
From: "Greathouse, Joseph" <Joseph.Greathouse@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/amdgpu: Default disable GDS for compute VMIDs
Thread-Topic: [PATCH v2] drm/amdgpu: Default disable GDS for compute VMIDs
Thread-Index: AQHVPMy2BCSk0kBEt0iE3V1wxr2qhabPPYoAgADKfwCAAH9KAA==
Date: Thu, 18 Jul 2019 20:46:00 +0000
Message-ID: <CY4PR12MB17679E12D3513F612E48AB55F9C80@CY4PR12MB1767.namprd12.prod.outlook.com>
References: <28783441-080b-1696-b4ea-f6ec24901fb1@amd.com>
 <20190717182233.93031-1-Joseph.Greathouse@amd.com>
 <268d3673-da7f-8e75-6131-3de9291d77d4@amd.com>
 <42627d7f-2431-6b17-72aa-e448b4937c53@gmail.com>
In-Reply-To: <42627d7f-2431-6b17-72aa-e448b4937c53@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68a3080b-8622-4131-7df7-08d70bc0f157
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR12MB1750; 
x-ms-traffictypediagnostic: CY4PR12MB1750:
x-microsoft-antispam-prvs: <CY4PR12MB1750A410ACD0E3A3AC404623F9C80@CY4PR12MB1750.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(189003)(199004)(13464003)(99286004)(86362001)(9686003)(68736007)(55016002)(53936002)(229853002)(81166006)(6246003)(81156014)(6436002)(8936002)(316002)(33656002)(66066001)(110136005)(14454004)(53546011)(66476007)(66556008)(66946007)(66446008)(64756008)(76116006)(2501003)(2906002)(5660300002)(25786009)(486006)(74316002)(6116002)(3846002)(6506007)(71200400001)(71190400001)(478600001)(7736002)(305945005)(7696005)(8676002)(476003)(11346002)(66574012)(186003)(26005)(102836004)(52536014)(14444005)(256004)(76176011)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1750;
 H:CY4PR12MB1767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5x6CVUAHH6bjlZ80nhelh0JXxqJF9Q+nEuG6GbFyCnqZBjlogkqLo8tbhHT+6sXBu6PtNIDam7aN/UHwmUPqIAfEgQosTQigBfqnHDL7Lh5kv7vdDSY+NQmf0gT3eCVf7xe1YmxvaXWEFchBT2aTN4fJRV+vLc6nIi434dGH/m+EiZRoD3mANnLQNbWI3mbzVnjY4edd1H7fppib8LWlGz96R6l5qUYLU8dqtTm8j8EwmFHZX4HxC/YUL4dYrgeQyq5G8npn7EhlgxuW2Uh4ZHJYHbvt6/OKxAm5DD+Wjv7EwEUFfkq5/MtHZfQNfscAhlAO0R6VBUiJyNHBxep6J+f5YIGO31zT1FmqXMHkPk5fdydsPVPjChfA6TTpk8L4DL9L8eIGsKYR7OX6RwNgC02j7QPuaLApr0HV02PHiXI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a3080b-8622-4131-7df7-08d70bc0f157
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 20:46:00.5114 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgreatho@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1750
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Obr2TqZoJ6FLBrGIi6JzUAELA2G41OrCzYzk0+/ivYY=;
 b=nGjsyhlyM/kWncvtFYE5GNrwZYvzONrOqhP2lH+5EPKSi26XLSES9wrg3ozdM+S0PnAbLFoUUAV3m7j+tvPdiuKVN4R0NLPLLv/LcVykmuQNwICvYAPhJmt1k/0Az07kqa1FnDGB8nlXEcn/0yGloHnr5aIVAsSk5bzHXxf7SgI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Joseph.Greathouse@amd.com; 
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxj
a29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEp1bHkg
MTgsIDIwMTkgMzoxNCBBTQ0KPiBUbzogS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0Bh
bWQuY29tPjsgR3JlYXRob3VzZSwgSm9zZXBoDQo+IDxKb3NlcGguR3JlYXRob3VzZUBhbWQuY29t
PjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
Ml0gZHJtL2FtZGdwdTogRGVmYXVsdCBkaXNhYmxlIEdEUyBmb3IgY29tcHV0ZQ0KPiBWTUlEcw0K
PiANCj4gQW0gMTcuMDcuMTkgdW0gMjI6MDkgc2NocmllYiBLdWVobGluZywgRmVsaXg6DQo+ID4g
T24gMjAxOS0wNy0xNyAxNDoyMywgR3JlYXRob3VzZSwgSm9zZXBoIHdyb3RlOg0KPiA+PiBUaGUg
R0RTIGFuZCBHV1MgYmxvY2tzIGRlZmF1bHQgdG8gYWxsb3dpbmcgYWxsIFZNSURzIHRvDQo+ID4+
IGFjY2VzcyBhbGwgZW50cmllcy4gR3JhcGhpY3MgVk1JRHMgY2FuIGhhbmRsZSBzZXR0aW5nDQo+
ID4+IHRoZXNlIGxpbWl0cyB3aGVuIHRoZSBkcml2ZXIgbGF1bmNoZXMgd29yay4gSG93ZXZlciwN
Cj4gPj4gY29tcHV0ZSB3b3JrbG9hZHMgdW5kZXIgSFdTIGNvbnRyb2wgZG9uJ3QgZ28gdGhyb3Vn
aCB0aGUNCj4gPj4ga2VybmVsIGRyaXZlci4gSW5zdGVhZCwgSFdTIGZpcm13YXJlIHNob3VsZCBz
ZXQgdGhlc2UNCj4gPj4gbGltaXRzIHdoZW4gYSBwcm9jZXNzIGlzIHB1dCBpbnRvIGEgVk1JRCBz
bG90Lg0KPiA+Pg0KPiA+PiBEaXNhYmxlIGFjY2VzcyB0byB0aGVzZSBkZXZpY2VzIGJ5IGRlZmF1
bHQgYnkgdHVybmluZyBvZmYNCj4gPj4gYWxsIG1hc2sgYml0cyAoZm9yIE9BKSBhbmQgc2V0dGlu
ZyBCQVNFPVNJWkU9MCAoZm9yIEdEUw0KPiA+PiBhbmQgR1dTKSBmb3IgYWxsIGNvbXB1dGUgVk1J
RHMuIElmIGEgcHJvY2VzcyB3YW50cyB0byB1c2UNCj4gPj4gdGhlc2UgcmVzb3VyY2VzLCB0aGV5
IGNhbiByZXF1ZXN0IHRoaXMgZnJvbSB0aGUgSFdTDQo+ID4+IGZpcm13YXJlICh3aGVuIHN1Y2gg
Y2FwYWJpbGl0aWVzIGFyZSBlbmFibGVkKS4gSFdTIHdpbGwNCj4gPj4gdGhlbiBoYW5kbGUgc2V0
dGluZyB0aGUgYmFzZSBhbmQgbGltaXQgZm9yIHRoZSBwcm9jZXNzIHdoZW4NCj4gPj4gaXQgaXMg
YXNzaWduZWQgdG8gYSBWTUlELg0KPiA+Pg0KPiA+PiBUaGlzIHdpbGwgYWxzbyBwcmV2ZW50IHVz
ZXIga2VybmVscyBmcm9tIGdldHRpbmcgJ3N0dWNrJyBpbg0KPiA+PiBHV1MgYnkgYWNjaWRlbnQg
aWYgdGhleSB3cml0ZSBHV1MtdXNpbmcgY29kZSBidXQgSFdTDQo+ID4+IGZpcm13YXJlIGlzIG5v
dCBzZXQgdXAgdG8gaGFuZGxlIEdXUyByZXNldC4gVW50aWwgSFdTIGlzDQo+ID4+IGVuYWJsZWQg
dG8gaGFuZGxlIEdXUyBwcm9wZXJseSwgYWxsIEdXUyBhY2Nlc3NlcyB3aWxsDQo+ID4+IE1FTV9W
SU9MIGZhdWx0IHRoZSBrZXJuZWwuDQo+ID4+DQo+ID4+IHYyOiBNb3ZlIGluaXRpYWxpemF0aW9u
IG91dHNpZGUgb2YgU1JCTSBtdXRleA0KPiA+Pg0KPiA+PiBDaGFuZ2UtSWQ6IEk4ZWRjZWE5ZDBi
MTRkMTZhNzQ0NGJjZjlmYmY5NDUxYWVmOGI3MDdkDQo+ID4+IFNpZ25lZC1vZmYtYnk6IEpvc2Vw
aCBHcmVhdGhvdXNlIDxKb3NlcGguR3JlYXRob3VzZUBhbWQuY29tPg0KPiA+IFJldmlld2VkLWJ5
OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCj4gDQo+IE1pZ2h0IGJl
IGEgZ29vZCBpZGVhIHRvIGRvIHRoaXMgZm9yIGFsbCBWTUlEcyBkdXJpbmcgaW5pdGlhbGl6YXRp
b24gYW5kDQo+IG5vdCBqdXN0IGZvciB0aGUgb25lcyB1c2VkIGZvciBjb21wdXRlLg0KPiANCj4g
QnV0IGFueXdheSBwYXRjaCBpcyBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZw0KPiA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPi4NCg0KSG1tLCBnb29kIHBvaW50LiBJdCBsb29rcyBsaWtl
IGdyYXBoaWNzIGpvYnMgd2lsbCBldmVudHVhbGx5IGNhbGwgdGhyb3VnaCB0byBlbWl0X2dkc19z
d2l0Y2goKSB0byBzZXQgdGhlc2Ugd2hlbiBsYXVuY2hpbmcgYSBqb2IsIGJ1dCBpdCBtYXkgYmUg
d29ydGh3aGlsZSB0byBzZXQgdGhlc2UgdG8gemVybyBhcyBhIGRlZmF1bHQuIEkgZGlkbid0IHdh
bnQgdG8gc3RlcCBvbiBhbnkgdG9lcyBvbiB0aGUgZ3JhcGhpY3Mgc2lkZSB3aXRob3V0IGNoZWNr
aW5nIGZpcnN0Lg0KDQpEbyB5b3UgaGF2ZSBvcGluaW9ucyBvbiB0aGUgbW9zdCByZWFzb25hYmxl
IGxvY2F0aW9uIHRvIGRvIHRoaXM/IGVhcmx5X2luaXQoKSwgbGF0ZV9pbml0KCk/IFRoZSB2YXJp
b3VzIGdmeF92Kl9zZXRfZ2RzX2luaXQoKSBtaWdodCBiZSBhIGdvb2QgcGxhY2UgLS0gYSBxdWlj
ayB0ZXN0IG9mIHNldHRpbmcgYWxsIDE2IFZNSURzIGluIGdmeF92OV8wX3NldF9nZHNfaW5pdCgp
IGFwcGVhcnMgdG8gd29yayBmaW5lIG9uIG15IFZlZ2EgMjAuDQoNCi1Kb2UNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
