Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CED03BCAF3
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 17:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF7589A4E;
	Tue, 24 Sep 2019 15:15:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1798C6E93A
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 15:15:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8YzYLEPylHzl40k5EjNAlBgwbP0vKmbMkUSITNutR1W3cW9Qb6EeXFM0eK7pBu9chTeKuqlgdVuSs95bJLcAQMg8NxL8MVhkD+bm0DSzS9+mmyPj/boVDMWfAHMftljH1gbLnjaMe54+w29n1+HLHw8zAQ3YNPAWCJRx3c/DXRMtdbxEedzuguE9hegLiZLT9YoGjPi/UXAAxuPEixfMYCSvmaVwsE2hslsZkAwzsG3iHaq95TEHd4g3pN+AF0ws1NqE6coBeaR/7XuTouHJvI6sdNwcraJi81p74Qa91T+zPHMPVfecSr7nhtBndgf+W3sOzH9ydTyDMiLC94O1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgzifRMkj8JdZ3BiN3LzNvs2YlGxnxHA9TYwGQKW0xQ=;
 b=AZWZtYlfjn96WbIHEttQ4L7jTDdBUnRVpxYlrebza59geQL1w2FSRCPRPu2TLHOwYrseSXhwFfdIUd03/3Ose4RFtHEdWeDwAE7ytXZlYhCiz5PuyA2RlLpgEuJ1L7g0uI/Ie6vy5g3fBL0mXEM13/RABJ5pMCEM5blLvrGiBPgdihAazjo2C8yY2XLenjwKUDT/ouUiLkduyZe+iGu0myH1ddDQpLQBf16OUWts7EEu414u6a0ei4kiIapZzyNLOrJAxnUb5sz5eXZyuPJ/F5l6o4+jZt0FZ2Bb1julnMoAlYKIWRAapnML8zBCOO5divRbb5Rl/yq6M6VEvpGlkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0007.namprd12.prod.outlook.com (10.172.118.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Tue, 24 Sep 2019 15:15:19 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0%11]) with mapi id 15.20.2284.023; Tue, 24 Sep
 2019 15:15:19 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu/display: include slab.h in dcn21_resource.c
Thread-Topic: [PATCH] drm/amdgpu/display: include slab.h in dcn21_resource.c
Thread-Index: AQHVclGhPH1nX8YEI0SYS3gJtNz1bac5wzqAgAAK/4CAASLgAA==
Date: Tue, 24 Sep 2019 15:15:18 +0000
Message-ID: <4a0d452b-8795-20d4-972d-7063dcdc9a92@amd.com>
References: <20190923205804.12300-1-alexander.deucher@amd.com>
 <9ad314e5-1a6f-f17f-ac1c-ec33aed2912e@amd.com>
 <CADnq5_NK57bqucbjp9Dn73kKPnhAqEvVHO68vZOvatOZ4pwCyw@mail.gmail.com>
In-Reply-To: <CADnq5_NK57bqucbjp9Dn73kKPnhAqEvVHO68vZOvatOZ4pwCyw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
x-clientproxiedby: YTOPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::31) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ea6bd99-79e5-42e5-3b0c-08d7410202af
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0007; 
x-ms-traffictypediagnostic: CY4PR1201MB0007:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0007B5E79B91096877267DB08C840@CY4PR1201MB0007.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(199004)(189003)(5660300002)(386003)(478600001)(966005)(14454004)(31696002)(6916009)(2906002)(305945005)(2616005)(476003)(66476007)(64756008)(6506007)(66946007)(99286004)(66556008)(31686004)(1411001)(53546011)(7736002)(26005)(186003)(6116002)(3846002)(102836004)(52116002)(66446008)(76176011)(25786009)(6512007)(6246003)(446003)(11346002)(81166006)(486006)(6436002)(36756003)(229853002)(4326008)(6306002)(54906003)(6486002)(71200400001)(65806001)(71190400001)(8676002)(316002)(58126008)(8936002)(81156014)(66066001)(65956001)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0007;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xf5/vbQ+y6vfokS0NrFuvl5cStGVeKUFmoZjNesK14XAh/Fmw4iKpEf6Uqbs5npO2ZM8QULnJeekdhD+P1S8WCMqV/tlW/oXPWGC+26W9hfaljeAPN8Vn92whIbS3+XHzmtCT39UHaNdrr/86bl05/Bxrj7lHS40nTZB/6VRwc6nZsEOQS9DsUQe/jCaYywJg5RKe20dMsoqXRwNefClLIEhrtMe9lDX5nrYqVnZmH01/V7VUWecsHobX1dJxMX1kIg23Q0ZzuPaob9uSqWOef+BCwfcH+qNAE+Pc2i3fjFABDXCKXjA4RXm39oS2CiOnSdY29ylc8E3mTHaTvirpqAe+HfR0XcC87/W3JZH58LePpFweiGGb6FZCrF8GZ8MtDorB/iBHmH6QGrcjiTqGeTMn3Insenilbweso3lVxI=
Content-ID: <B87B089B8090874480562BE75EC3F76B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea6bd99-79e5-42e5-3b0c-08d7410202af
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 15:15:18.9002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WLg47EbIXORirZRycCowXvwcwkI/NhUwopd+y9Z/dJuZPfInmK110pzraDIhXRJ6MgLIdsylt9KQ2z+SeeMfVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0007
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgzifRMkj8JdZ3BiN3LzNvs2YlGxnxHA9TYwGQKW0xQ=;
 b=Q+8TUWJU5F9agiqS9T+DZ04zSOOj/xBs05DfctTngaHclSuY0RiqoYiPAIf1yc4re1TX4R2AxAcFb7n8uPIujDNU4lhXA4uPNBaRwhVHT5onQT/hUHFjKqMe/KV2GnT52kRRi/UnB15o3YFPOxzfYCxoHztY38vrEHcB/8ysZDw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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

T24gMjAxOS0wOS0yMyA1OjU0IHAubS4sIEFsZXggRGV1Y2hlciB3cm90ZToNCj4gT24gTW9uLCBT
ZXAgMjMsIDIwMTkgYXQgNToxNCBQTSBIYXJyeSBXZW50bGFuZCA8aHdlbnRsYW5AYW1kLmNvbT4g
d3JvdGU6DQo+Pg0KPj4gT24gMjAxOS0wOS0yMyA0OjU4IHAubS4sIEFsZXggRGV1Y2hlciB3cm90
ZToNCj4+PiBJdCdzIGFwcGFyZW50bHkgbmVlZGVkIGluIHNvbWUgY29uZmlndXJhdGlvbnMuDQo+
Pg0KPj4gQ3VyaW91cyB3aGljaCBjb25maWcgZmFpbHMgYW5kIHdoYXQgY29tcGlsZXIgZXJyb3Jz
IHdlIGdldC4uLiBTb3VuZHMNCj4+IGxpa2Ugb3VyIGluY2x1ZGVzIGFyZSBtZXNzZWQgdXAgc29t
ZXdoZXJlLg0KPiANCj4gTm90IHN1cmUgZXhhY3RseToNCj4gaHR0cHM6Ly9sa21sLm9yZy9sa21s
LzIwMTkvOS8yMC85OTgNCj4gDQoNCkp1c3Qgbm90aWNlZCB0aGUgb3RoZXIgZGNuWFlfcmVzb3Vy
Y2UuYyBmaWxlcyBoYXZlIHRoYXQgYXMgd2VsbC4NCg0KUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRs
YW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPg0KDQpIYXJyeQ0KDQo+IEFsZXgNCj4gDQo+Pg0K
Pj4gSGFycnkNCj4+DQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+DQo+Pj4gLS0tDQo+Pj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jIHwgMiArKw0KPj4+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVzb3VyY2UuYw0KPj4+IGluZGV4IDNjYTUx
MzlmMTI3My4uZGUxODIxODVmZTFmIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jDQo+Pj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLmMNCj4+PiBAQCAtMjMs
NiArMjMsOCBAQA0KPj4+ICAgKg0KPj4+ICAgKi8NCj4+Pg0KPj4+ICsjaW5jbHVkZSA8bGludXgv
c2xhYi5oPg0KPj4+ICsNCj4+PiAgI2luY2x1ZGUgImRtX3NlcnZpY2VzLmgiDQo+Pj4gICNpbmNs
dWRlICJkYy5oIg0KPj4+DQo+Pj4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
