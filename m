Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF726C052
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 19:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3765F6E245;
	Wed, 17 Jul 2019 17:23:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700051.outbound.protection.outlook.com [40.107.70.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25C36E245
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 17:23:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AG2F9hHNJnYcFxCvoWW8ywv/LNkD+txk75uPYtVX4V2hyQ2IY7xy6XAQRJil7c8s2Ot4EMLJa0fc1pft5tcfcCcC9jw+qDvR/GkxSCkmfu1aVOJDNyN2GK1hK11g3jMs0Bm0CfKXHjobDqdRn5xKFpRvBvG+DNyYXxJWPb2iw7Sb4kf3mTTKLTVo3wLspEzEarHceFTzrsmF31Oea3krd8GCY0HzhuFncI0oddCCWU7SCHaOf7qrRMWbVPJ2NdtabLWLoSDHrFBQ5OMwk9QSwYjeIdnX6CLh77u0S91HJQOm/LF0RuSM4uU2bKIld7SnMIllcW6xryxSA0L7TJcEbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULeWPXInKluymUG8rrojbciDWzG9ibQAD3unwFW4b24=;
 b=Kq4mIXh7YLAJ66syRdXgjP3+UYn6siESUgvt277Lp8P9vpUg81I6cvad4oWYWoi/tAmil5dLo9YWttRFk22sRxAn2h2R38d64N6f1xO8Qo9AKZVbi/JJppTYmfv9DxgBLM/UmEIBE6R9O3Ybt8eUU+Rl0EXysGxnylfgp8/3+H6D6+ZbZ0lHWFZ5o6llNWxkWDN8cV0WZPdWQhRpDwat9YVmQFd0Hs4t2rmorD+B72KpW7OqXirsdpY8GgJsYnxzHPb/J8D/tXd3JN7XmbTo2/HuoCENPz5LBPJPvOWGNR8tDEL71mB7DX/5cLE6R6XL6TXdp47/s7QXhEDl6Qmd4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2956.namprd12.prod.outlook.com (20.179.104.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Wed, 17 Jul 2019 17:23:50 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 17:23:50 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Greathouse, Joseph" <Joseph.Greathouse@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Default disable GDS for compute VMIDs
Thread-Topic: [PATCH] drm/amdgpu: Default disable GDS for compute VMIDs
Thread-Index: AQHVPMKrK4O8cemj3k+JH+L9x7bb5KbPD0QA
Date: Wed, 17 Jul 2019 17:23:50 +0000
Message-ID: <28783441-080b-1696-b4ea-f6ec24901fb1@amd.com>
References: <20190717171112.4962-1-Joseph.Greathouse@amd.com>
In-Reply-To: <20190717171112.4962-1-Joseph.Greathouse@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3b6aff0-5080-4464-abac-08d70adb888d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2956; 
x-ms-traffictypediagnostic: DM6PR12MB2956:
x-microsoft-antispam-prvs: <DM6PR12MB2956B180BCFC51CEE1B5D60792C90@DM6PR12MB2956.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(199004)(189003)(14454004)(31686004)(6246003)(66066001)(53936002)(102836004)(65956001)(65806001)(229853002)(64756008)(26005)(66446008)(186003)(66556008)(110136005)(3846002)(6116002)(52116002)(99286004)(81156014)(5660300002)(7736002)(8936002)(2501003)(25786009)(36756003)(68736007)(305945005)(81166006)(478600001)(71200400001)(71190400001)(76176011)(486006)(316002)(386003)(6506007)(53546011)(446003)(11346002)(476003)(31696002)(2616005)(256004)(14444005)(58126008)(86362001)(6436002)(6486002)(2906002)(65826007)(64126003)(8676002)(66946007)(66476007)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2956;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Tm9e/Xej0cPDHC052NBQJ8XAA0YubKFD2wZirNiQyaTfanZT6oq/l8KkopqJZMx6zWUfq3mncBmQ5OM7aKbltLmn/zfWxn2ClA1rD8467pcJfJIYzGsCY7k+SpCb9bSwlNg/bBKpds6yR8VdqJs0/Z1u/pg3mOXECmW9N+zHtRN/UO4+ZpBmGF3rLfOWLSueG5wAbRcuEm/ZZjvtTNiWZaSVpcywX9D8e6+B5jKMXonMjw03pK9f+b4zq1nmEaX4HLGigONFmrhoKnhWMfvUXbc8jnixpjzJSciG+E/EQrs2XYcLvDk4f9kLh9qgJhMlm2tQ/F1NULLpmDvdskN4ljd3xgTKp/+buKSuJ79ReylGK5uxWpUoo/HBAikypakA3hGWWFUZOEDgK5p0vKCjOOmALU4K+zUlvK58K4vEd/Q=
Content-ID: <BBA23A50C7C8194A9352208467E07DFE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b6aff0-5080-4464-abac-08d70adb888d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 17:23:50.3394 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2956
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULeWPXInKluymUG8rrojbciDWzG9ibQAD3unwFW4b24=;
 b=glMxA8C/gIhc+F9pyelqXmovoVl5KnYupTe6afCSWkzCuF6AeKuvFYITOsD9p77Dr1MG8hCt566GBU7TjHjeJTLYrs+W1CvMAdvuxoRiuBVMeI+Xw2wD7z5UJEYamMLBB34PPQTVJD3SqbRxOW0neutuw85BjCAE9vRXs3lkPaU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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

T24gMjAxOS0wNy0xNyAxMzoxMSwgR3JlYXRob3VzZSwgSm9zZXBoIHdyb3RlOg0KPiBUaGUgR0RT
IGFuZCBHV1MgYmxvY2tzIGRlZmF1bHQgdG8gYWxsb3dpbmcgYWxsIFZNSURzIHRvDQo+IGFjY2Vz
cyBhbGwgZW50cmllcy4gR3JhcGhpY3MgVk1JRHMgY2FuIGhhbmRsZSBzZXR0aW5nDQo+IHRoZXNl
IGxpbWl0cyB3aGVuIHRoZSBkcml2ZXIgbGF1bmNoZXMgd29yay4gSG93ZXZlciwNCj4gY29tcHV0
ZSB3b3JrbG9hZHMgdW5kZXIgSFdTIGNvbnRyb2wgZG9uJ3QgZ28gdGhyb3VnaCB0aGUNCj4ga2Vy
bmVsIGRyaXZlci4gSW5zdGVhZCwgSFdTIGZpcm13YXJlIHNob3VsZCBzZXQgdGhlc2UNCj4gbGlt
aXRzIHdoZW4gYSBwcm9jZXNzIGlzIHB1dCBpbnRvIGEgVk1JRCBzbG90Lg0KPg0KPiBEaXNhYmxl
IGFjY2VzcyB0byB0aGVzZSBkZXZpY2VzIGJ5IGRlZmF1bHQgYnkgdHVybmluZyBvZmYNCj4gYWxs
IG1hc2sgYml0cyAoZm9yIE9BKSBhbmQgc2V0dGluZyBCQVNFPVNJWkU9MCAoZm9yIEdEUw0KPiBh
bmQgR1dTKSBmb3IgYWxsIGNvbXB1dGUgVk1JRHMuIElmIGEgcHJvY2VzcyB3YW50cyB0byB1c2UN
Cj4gdGhlc2UgcmVzb3VyY2VzLCB0aGV5IGNhbiByZXF1ZXN0IHRoaXMgZnJvbSB0aGUgSFdTDQo+
IGZpcm13YXJlICh3aGVuIHN1Y2ggY2FwYWJpbGl0aWVzIGFyZSBlbmFibGVkKS4gSFdTIHdpbGwN
Cj4gdGhlbiBoYW5kbGUgc2V0dGluZyB0aGUgYmFzZSBhbmQgbGltaXQgZm9yIHRoZSBwcm9jZXNz
IHdoZW4NCj4gaXQgaXMgYXNzaWduZWQgdG8gYSBWTUlELg0KPg0KPiBUaGlzIHdpbGwgYWxzbyBw
cmV2ZW50IHVzZXIga2VybmVscyBmcm9tIGdldHRpbmcgJ3N0dWNrJyBpbg0KPiBHV1MgYnkgYWNj
aWRlbnQgaWYgdGhleSB3cml0ZSBHV1MtdXNpbmcgY29kZSBidXQgSFdTDQo+IGZpcm13YXJlIGlz
IG5vdCBzZXQgdXAgdG8gaGFuZGxlIEdXUyByZXNldC4gVW50aWwgSFdTIGlzDQo+IGVuYWJsZWQg
dG8gaGFuZGxlIEdXUyBwcm9wZXJseSwgYWxsIEdXUyBhY2Nlc3NlcyB3aWxsDQo+IE1FTV9WSU9M
IGZhdWx0IHRoZSBrZXJuZWwuDQo+DQo+IENoYW5nZS1JZDogSTJhNzA5ZmRjYjI0Njg1MTE3NTRm
MmU1ZWFlNzU1NDY3NTFjMGU2ZjANCj4gU2lnbmVkLW9mZi1ieTogSm9zZXBoIEdyZWF0aG91c2Ug
PEpvc2VwaC5HcmVhdGhvdXNlQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92MTBfMC5jIHwgNiArKysrKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjdfMC5jICB8IDYgKysrKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3Y4XzAuYyAgfCA2ICsrKysrKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92OV8wLmMgIHwgNiArKysrKysNCj4gICA0IGZpbGVzIGNoYW5nZWQsIDI0IGluc2Vy
dGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92MTBfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMNCj4gaW5k
ZXggNjE4MjkxZGY2NTliLi4zMmRhNWE5MWFiZmIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dmeF92MTBfMC5jDQo+IEBAIC0xNTEzLDYgKzE1MTMsMTIgQEAgc3RhdGljIHZvaWQg
Z2Z4X3YxMF8wX2luaXRfY29tcHV0ZV92bWlkKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0K
PiAgIAkJLyogQ1AgYW5kIHNoYWRlcnMgKi8NCj4gICAJCVdSRUczMl9TT0MxNShHQywgMCwgbW1T
SF9NRU1fQ09ORklHLCBERUZBVUxUX1NIX01FTV9DT05GSUcpOw0KPiAgIAkJV1JFRzMyX1NPQzE1
KEdDLCAwLCBtbVNIX01FTV9CQVNFUywgc2hfbWVtX2Jhc2VzKTsNCj4gKwkJLyogSW5pdGlhbGl6
ZSBhbGwgY29tcHV0ZSBWTUlEcyB0byBoYXZlIG5vIEdEUywgR1dTLCBvciBPQQ0KPiArCQkgICBh
Y2NjZXNzLiBUaGVzZSBzaG91bGQgYmUgZW5hYmxlZCBieSBGVyBmb3IgdGFyZ2V0IFZNSUQuICov
DQo+ICsJCVdSRUczMl9TT0MxNV9PRkZTRVQoR0MsIDAsIG1tR0RTX1ZNSUQwX0JBU0UsIDIgKiBp
LCAweDAwMDAwMDAwKTsNCj4gKwkJV1JFRzMyX1NPQzE1X09GRlNFVChHQywgMCwgbW1HRFNfVk1J
RDBfU0laRSwgMiAqIGksIDB4MDAwMDAwMDApOw0KPiArCQlXUkVHMzJfU09DMTVfT0ZGU0VUKEdD
LCAwLCBtbUdEU19HV1NfVk1JRDAsIGksIDB4MDAwMDAwMDApOw0KPiArCQlXUkVHMzJfU09DMTVf
T0ZGU0VUKEdDLCAwLCBtbUdEU19PQV9WTUlEMCwgaSwgMHgwMDAwMDAwMCk7DQpJJ2QgcHJlZmVy
IHRoZXNlIHJlZ2lzdGVyIGluaXRpYWxpemF0aW9ucyBpbiBhIHNlcGFyYXRlIGxvb3Agb3V0c2lk
ZSB0aGUgDQpzcmJtX211dGV4LCBiZWNhdXNlIHRoZXkgZG9uJ3QgZGVwZW5kIG9uIHRoZSBzcmJt
L2dyYm1fc2VsZWN0IGJpdHMuIFNhbWUgDQpmb3IgdGhlIG90aGVyIEdGWCBJUCB2ZXJzaW9ucy4N
Cg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQoNCj4gICAJfQ0KPiAgIAludl9ncmJtX3NlbGVjdChh
ZGV2LCAwLCAwLCAwLCAwKTsNCj4gICAJbXV0ZXhfdW5sb2NrKCZhZGV2LT5zcmJtX211dGV4KTsN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92N18wLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjdfMC5jDQo+IGluZGV4IGUxZTJhNDRlZTEz
Yy4uODllYTBkNzk5YzEyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjdfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92N18w
LmMNCj4gQEAgLTE4NzQsNiArMTg3NCwxMiBAQCBzdGF0aWMgdm9pZCBnZnhfdjdfMF9pbml0X2Nv
bXB1dGVfdm1pZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gICAJCVdSRUczMihtbVNI
X01FTV9BUEUxX0JBU0UsIDEpOw0KPiAgIAkJV1JFRzMyKG1tU0hfTUVNX0FQRTFfTElNSVQsIDAp
Ow0KPiAgIAkJV1JFRzMyKG1tU0hfTUVNX0JBU0VTLCBzaF9tZW1fYmFzZXMpOw0KPiArCQkvKiBJ
bml0aWFsaXplIGFsbCBjb21wdXRlIFZNSURzIHRvIGhhdmUgbm8gR0RTLCBHV1MsIG9yIE9BDQo+
ICsJCSAgIGFjY2Nlc3MuIFRoZXNlIHNob3VsZCBiZSBlbmFibGVkIGJ5IEZXIGZvciB0YXJnZXQg
Vk1JRC4gKi8NCj4gKwkJV1JFRzMyKGFtZGdwdV9nZHNfcmVnX29mZnNldFtpXS5tZW1fYmFzZSwg
MCk7DQo+ICsJCVdSRUczMihhbWRncHVfZ2RzX3JlZ19vZmZzZXRbaV0ubWVtX3NpemUsIDApOw0K
PiArCQlXUkVHMzIoYW1kZ3B1X2dkc19yZWdfb2Zmc2V0W2ldLmd3cywgMCk7DQo+ICsJCVdSRUcz
MihhbWRncHVfZ2RzX3JlZ19vZmZzZXRbaV0ub2EsIDApOw0KPiAgIAl9DQo+ICAgCWNpa19zcmJt
X3NlbGVjdChhZGV2LCAwLCAwLCAwLCAwKTsNCj4gICAJbXV0ZXhfdW5sb2NrKCZhZGV2LT5zcmJt
X211dGV4KTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
OF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jDQo+IGluZGV4IDhj
NTkwYTU1NDY3NS4uNTNkOWEyMjNmOGMxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjhfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeF92OF8wLmMNCj4gQEAgLTM2OTksNiArMzY5OSwxMiBAQCBzdGF0aWMgdm9pZCBnZnhfdjhf
MF9pbml0X2NvbXB1dGVfdm1pZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gICAJCVdS
RUczMihtbVNIX01FTV9BUEUxX0JBU0UsIDEpOw0KPiAgIAkJV1JFRzMyKG1tU0hfTUVNX0FQRTFf
TElNSVQsIDApOw0KPiAgIAkJV1JFRzMyKG1tU0hfTUVNX0JBU0VTLCBzaF9tZW1fYmFzZXMpOw0K
PiArCQkvKiBJbml0aWFsaXplIGFsbCBjb21wdXRlIFZNSURzIHRvIGhhdmUgbm8gR0RTLCBHV1Ms
IG9yIE9BDQo+ICsJCSAgIGFjY2Nlc3MuIFRoZXNlIHNob3VsZCBiZSBlbmFibGVkIGJ5IEZXIGZv
ciB0YXJnZXQgVk1JRC4gKi8NCj4gKwkJV1JFRzMyKGFtZGdwdV9nZHNfcmVnX29mZnNldFtpXS5t
ZW1fYmFzZSwgMCk7DQo+ICsJCVdSRUczMihhbWRncHVfZ2RzX3JlZ19vZmZzZXRbaV0ubWVtX3Np
emUsIDApOw0KPiArCQlXUkVHMzIoYW1kZ3B1X2dkc19yZWdfb2Zmc2V0W2ldLmd3cywgMCk7DQo+
ICsJCVdSRUczMihhbWRncHVfZ2RzX3JlZ19vZmZzZXRbaV0ub2EsIDApOw0KPiAgIAl9DQo+ICAg
CXZpX3NyYm1fc2VsZWN0KGFkZXYsIDAsIDAsIDAsIDApOw0KPiAgIAltdXRleF91bmxvY2soJmFk
ZXYtPnNyYm1fbXV0ZXgpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCj4g
aW5kZXggNWFmNjBlMWM3MzVhLi5iOWVkMDNhOGE1NjEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KPiBAQCAtMjAyMiw2ICsyMDIyLDEyIEBAIHN0YXRpYyB2b2lk
IGdmeF92OV8wX2luaXRfY29tcHV0ZV92bWlkKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0K
PiAgIAkJLyogQ1AgYW5kIHNoYWRlcnMgKi8NCj4gICAJCVdSRUczMl9TT0MxNV9STEMoR0MsIDAs
IG1tU0hfTUVNX0NPTkZJRywgc2hfbWVtX2NvbmZpZyk7DQo+ICAgCQlXUkVHMzJfU09DMTVfUkxD
KEdDLCAwLCBtbVNIX01FTV9CQVNFUywgc2hfbWVtX2Jhc2VzKTsNCj4gKwkJLyogSW5pdGlhbGl6
ZSBhbGwgY29tcHV0ZSBWTUlEcyB0byBoYXZlIG5vIEdEUywgR1dTLCBvciBPQQ0KPiArCQkgICBh
Y2NjZXNzLiBUaGVzZSBzaG91bGQgYmUgZW5hYmxlZCBieSBGVyBmb3IgdGFyZ2V0IFZNSUQuICov
DQo+ICsJCVdSRUczMl9TT0MxNV9PRkZTRVQoR0MsIDAsIG1tR0RTX1ZNSUQwX0JBU0UsIDIgKiBp
LCAweDAwMDAwMDAwKTsNCj4gKwkJV1JFRzMyX1NPQzE1X09GRlNFVChHQywgMCwgbW1HRFNfVk1J
RDBfU0laRSwgMiAqIGksIDB4MDAwMDAwMDApOw0KPiArCQlXUkVHMzJfU09DMTVfT0ZGU0VUKEdD
LCAwLCBtbUdEU19HV1NfVk1JRDAsIGksIDB4MDAwMDAwMDApOw0KPiArCQlXUkVHMzJfU09DMTVf
T0ZGU0VUKEdDLCAwLCBtbUdEU19PQV9WTUlEMCwgaSwgMHgwMDAwMDAwMCk7DQo+ICAgCX0NCj4g
ICAJc29jMTVfZ3JibV9zZWxlY3QoYWRldiwgMCwgMCwgMCwgMCk7DQo+ICAgCW11dGV4X3VubG9j
aygmYWRldi0+c3JibV9tdXRleCk7DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
