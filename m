Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3887A96BE
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 00:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242BE89CB3;
	Wed,  4 Sep 2019 22:52:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770049.outbound.protection.outlook.com [40.107.77.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A44289CB3
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 22:52:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOXzI6N3GLD8nyx1hvq0AGswOC6GWAQNWBH8OVJxBbU7enc0fSfXyxW88hupsrDKkKZs8qTaXwHEotXbUgjuVXTZc1SKJQWx6vVC6b/nZeVY8knIAUkZqSf1yp3YXt/vKpYYIojz2VkU6FsgAUvaZfOVhqb/gFU4fzziZtg3JWAS7LXJXqHcxdgoQYr6e8RdC+2ayQMKkXm3x/95Tu+krRZWw21xuER7w3cKOipssDoS+xo6owXc+wL30GkkjqBt/z2jOvdHEvlb7aI2DLp7LAIUHfjrV8n5hl4ZJYFjTYmPofKGtyHe2HlT6f32TiOX7u7bZMVaPwYgSe+bB0eY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CnTK8qqAfYGYToub/SBpEdPst/i+wkvVZB14dTS8rVc=;
 b=nWvCXR9aT1moJl6JfRSuUfvYxNK8G6fPKjq13J5AowanIi4c3y3FLEl+GsPImvDN+qxB0JJ+Qmkl1zVWmcYx9jYZASZrLjAHxxa/wNAskhiZ3cR3qL7AvW4Zf9d/Rk4WRVoqQPeSiHUyoJcvyKz6yGeXWIdymuLpgHr5cFd95ih32s6W8JJRp4pM+EkA9GzlGb1uSsXOzhSW+OrAhAWZosexERYQQmZDiaLV9sUwgT9SD9eyiB2KdqqnvuPJol8mUjSTqS/28XjHtGYiYBn37rKDNxKPEfAGPQQr4jnFmVzTwnLpQxfJ5BDdif5YF0VqoNm7wqYe2karIv+AzradAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3690.namprd12.prod.outlook.com (10.255.76.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.22; Wed, 4 Sep 2019 22:52:52 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 22:52:52 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: Graceful page fault handling for Vega/Navi
Thread-Topic: Graceful page fault handling for Vega/Navi
Thread-Index: AQHVYzHNJ7LzOp8+Bk6tUzuCle68FaccIJKA
Date: Wed, 4 Sep 2019 22:52:52 +0000
Message-ID: <03e2274c-a0dd-41f4-c5e0-26e371d01d23@amd.com>
References: <20190904150230.13885-1-christian.koenig@amd.com>
In-Reply-To: <20190904150230.13885-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTBPR01CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::37) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7121295-f712-4135-c8dc-08d7318a9e29
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3690; 
x-ms-traffictypediagnostic: DM6PR12MB3690:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB3690F3E597F3AC89E681E38292B80@DM6PR12MB3690.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(53754006)(199004)(189003)(6512007)(2501003)(11346002)(8676002)(86362001)(99286004)(6306002)(110136005)(6116002)(3846002)(71190400001)(6436002)(31696002)(66574012)(316002)(71200400001)(5660300002)(76176011)(31686004)(36756003)(2906002)(966005)(14454004)(66946007)(476003)(66556008)(64756008)(14444005)(58126008)(305945005)(486006)(66476007)(65806001)(66446008)(256004)(66066001)(65956001)(186003)(53546011)(386003)(2616005)(26005)(229853002)(53936002)(6486002)(7736002)(478600001)(25786009)(446003)(81166006)(6506007)(102836004)(8936002)(81156014)(52116002)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3690;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2Y5gpuVBjOpH1mGE3hUNmXSRCrivVTPmT5YscjRUaEv95f3lH/bSzunB23qvKwMl28mzMjEtssfoafPy3KW+9jlPOINR1XGlRVstVl4m+b+l6W1DHRYcc0qcujScj5es//ePuMw5UT2ROnncA8qXf7iM+7pDcPMsBCCigTGPNYpahtxUA++uEd+Jo5aG5gIOG5RgNuWqmQT40IgxQ5kefZJW+oq/0hNo1csab4hRwRNdgLnGareQ+2WodFQRLgf1NWccDpNGGrplmUZsTEs+1RYYCf8NYJQYZkcOfafWEwk1vwl2wX/5qDPV2zK7kQjHKDUaQU3ksiuBoVSSEr+4+lnTs+VBio3v2EW7A//NFcwqwMBw+j6Jo5E9eH05jTR3dm/xpKUYMQr3VBT+BFX4wu+mGJnLCbn0Wn2lsT8199U=
x-ms-exchange-transport-forked: True
Content-ID: <0E67609901FCF0408D8C257D98710157@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7121295-f712-4135-c8dc-08d7318a9e29
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 22:52:52.6779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7nxIMUAKYTlVxcT6L6LyGRM408I2wIJSSsWvUmw+WhWT82NS58K2fn6xbgaa5L0c6xIT+FQA503wZ4+XzUlTew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3690
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CnTK8qqAfYGYToub/SBpEdPst/i+wkvVZB14dTS8rVc=;
 b=PMYHgRzuFbShiZwiwRWxcbpxeYg0hyw1mcMuMLZG5rsV+Nq7tbESNgqSObXlUFNate9m9WsCUi42ON7ZIs6rDUjJ17ILMwj54vGZLMLtstVLZ63EPF1c17qQNmd+StEpMfIJzT3RLvDx67bfCmwF/yB1uZWCZQK944V/ckEQ0/A=
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

DQpPbiAyMDE5LTA5LTA0IDExOjAyIGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+IEhp
IGV2ZXJ5b25lLA0KPg0KPiB0aGlzIHNlcmllcyBpcyB0aGUgbmV4dCBwdXp6bGUgcGllY2UgZm9y
IHJlY292ZXJhYmxlIHBhZ2UgZmF1bHQgaGFuZGxpbmcgb24gVmVnYSBhbmQgTmF2aS4NCj4NCj4g
SXQgYWRkcyBhIG5ldyBkaXJlY3Qgc2NoZWR1bGVyIGVudGl0eSBmb3IgVk0gdXBkYXRlcyB3aGlj
aCBpcyB0aGVuIHVzZWQgdG8gdXBkYXRlIHBhZ2UgdGFibGVzIGR1cmluZyBhIGZhdWx0Lg0KPg0K
PiBJbiBvdGhlciB3b3JkcyBwcmV2aW91c2x5IGFuIGFwcGxpY2F0aW9uIGRvaW5nIGFuIGludmFs
aWQgbWVtb3J5IGFjY2VzcyB3b3VsZCBqdXN0IGhhbmcgYW5kL29yIHJlcGVhdCB0aGUgaW52YWxp
ZCBhY2Nlc3Mgb3ZlciBhbmQgb3ZlciBhZ2Fpbi4gTm93IHRoZSBoYW5kbGluZyBpcyBtb2RpZmll
ZCBzbyB0aGF0IHRoZSBpbnZhbGlkIG1lbW9yeSBhY2Nlc3MgaXMgcmVkaXJlY3RlZCB0byB0aGUg
ZHVtbXkgcGFnZS4NCj4NCj4gVGhpcyBuZWVkcyB0aGUgZm9sbG93aW5nIHByZXJlcXVpc2l0ZXM6
DQo+IGEpIFRoZSBmaXJtd2FyZSBtdXN0IGJlIG5ldyBlbm91Z2ggc28gYWxsb3cgcmUtcm91dGlu
ZyBvZiBwYWdlIGZhdWx0cy4NCj4gYikgRmF1bHQgcmV0cnkgbXVzdCBiZSBlbmFibGVkIHVzaW5n
IHRoZSBhbWRncHUubm9yZXRyeT0wIHBhcmFtZXRlci4NCj4gYykgRW5vdWdoIGZyZWUgVlJBTSB0
byBhbGxvY2F0ZSBwYWdlIHRhYmxlcyB0byBwb2ludCB0byB0aGUgZHVtbXkgcGFnZS4NCj4NCj4g
VGhlIHJlLXJvdXRpbmcgb2YgcGFnZSBmYXVsdHMgY3VycmVudCBvbmx5IHdvcmtzIG9uIFZlZ2Ex
MCwgc28gVmVnYTIwIGFuZCBOYXZpIHdpbGwgc3RpbGwgbmVlZCBzb21lIG1vcmUgdGltZS4NCg0K
V2FpdCwgd2UgZG9uJ3QgZG8gdGhlIHBhZ2UgZmF1bHQgcmVyb3V0aW5nIG9uIFZlZ2EyMCB5ZXQ/
IFNvIHdlJ3JlIA0KZ2V0dGluZyB0aGUgZnVsbCBicnVudCBvZiB0aGUgZmF1bHQgc3Rvcm0gb24g
dGhlIG1haW4gaW50ZXJydXB0IHJpbmc/IEluIA0KdGhhdCBjYXNlLCB3ZSBzaG91bGQgcHJvYmFi
bHkgY2hhbmdlIHRoZSBkZWZhdWx0IHNldHRpbmcgb2YgDQphbWRncHUubm9yZXRyeT0xIGF0IGxl
YXN0IHVudGlsIHRoYXQncyBkb25lLg0KDQpPdGhlciB0aGFuIHRoYXQgdGhlIHBhdGNoIHNlcmll
cyBsb29rcyByZWFzb25hYmxlIHRvIG1lLiBJIGNvbW1lbnRlZCBvbiANCnBhdGNoZXMgNCBhbmQg
OSBzZXBhcmF0ZWx5Lg0KDQpQYXRjaCAxIGlzIEFja2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVs
aXguS3VlaGxpbmdAYW1kLmNvbT4NCg0KV2l0aCB0aGUgaXNzdWVzIGFkZHJlc3NlZCB0aGF0IEkg
cG9pbnRlZCBvdXQsIHRoZSByZXN0IGlzDQoNClJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8
RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQoNCj4gUGxl
YXNlIHJldmlldyBhbmQvb3IgY29tbWVudCwNCj4gQ2hyaXN0aWFuLg0KPg0KPg0KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxp
bmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
