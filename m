Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52667103EEE
	for <lists+amd-gfx@lfdr.de>; Wed, 20 Nov 2019 16:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69016E798;
	Wed, 20 Nov 2019 15:38:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770082.outbound.protection.outlook.com [40.107.77.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C276E798
 for <amd-gfx@lists.freedesktop.org>; Wed, 20 Nov 2019 15:38:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMAUoK7+YW7S2ffmtYlsR65CrN6zTkSqQiksFuK5v3Zg+Dnw+0a0TZOz+fhLJMntOqQyWyjE69/NUbnWzvmJQrhMpEDzttFbEm9WsIlI4YL5ogYNI5Z86vxO6fH9uWmyfzs8rsfNdpauYEr8uSUyS+jdS+X20NZYCpgO4V+puphWPWFUMSmPpTuUixZsn6XAqgIZJaLkJjC/OXVWbLUoi5mtFa0gVw2eanGJH25yXyuD2f3wZPxKlYdu01+WK+HdlFsXtqexGmdVRLgvRNpYmuK4vl1i5BaUyZpThT4NPLrQgS4w7LqkhBpU73nrhuSSXHdy4FkvRtpcYPZpo1rrQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldV5mlQcn4V7hKECPZXMF/PHVY+wStbwL0wxrZK7zPk=;
 b=XJJ6uOHbSdatNJWHX7R9+PHbd/TutxD7A35u/u0g/J8E2wQgvXGgG5hVYyMn+CjuOTL8r2xIEqNTbN6q+V3hz062pQn2/c7IDo0JJ5dHssx75qZYwsnbtn5zFfDLkRL+Sttr/0OUvVkUL3d783oxOWVUizTRuN1UdocfxvgsSf7o1b15DEska3vmKFodrEHVxQpPeho9Zu3pIxPWlrmV2TIywEYlseCUsuhSJGNeBPcuky6VK4F3xfL6BQtfVEcqLHNLAOp/ME5Mgsd8iHuyongf+cezQ0wYR5j2HAZNBmkVpQRZu4DGg4ldvCStuSEHNf0P3Og9HL/h6LnCLZAF8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2532.namprd12.prod.outlook.com (52.132.9.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.18; Wed, 20 Nov 2019 15:38:36 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::55f1:f8d5:e7d0:f595]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::55f1:f8d5:e7d0:f595%2]) with mapi id 15.20.2474.015; Wed, 20 Nov 2019
 15:38:36 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Liu, Monk"
 <Monk.Liu@amd.com>, "Zhu, Changfeng" <Changfeng.Zhu@amd.com>, "Xiao, Jack"
 <Jack.Xiao@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Huang, Ray"
 <Ray.Huang@amd.com>, "Huang, Shimmer" <Xinmei.Huang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOetlOWkjTogW1BBVENIIDEvMl0gZHJtL2FtZGdwdTogaW52YWxpZGF0?=
 =?utf-8?Q?e_mmhub_semphore_workaround_in_amdgpu=5Fvirt?=
Thread-Topic: =?utf-8?B?562U5aSNOiBbUEFUQ0ggMS8yXSBkcm0vYW1kZ3B1OiBpbnZhbGlkYXRlIG1t?=
 =?utf-8?Q?hub_semphore_workaround_in_amdgpu=5Fvirt?=
Thread-Index: AQHVn4cQrm7Cde/P3UGP5nYbS7R1T6eUCt8AgAAAu4CAABsNYIAABH0AgAAGqiA=
Date: Wed, 20 Nov 2019 15:38:36 +0000
Message-ID: <BL0PR12MB2580062E72CCFCDCD812484E804F0@BL0PR12MB2580.namprd12.prod.outlook.com>
References: <20191120091418.26526-1-changfeng.zhu@amd.com>
 <MN2PR12MB3933863C8DFCE1F68A44EFFA844F0@MN2PR12MB3933.namprd12.prod.outlook.com>
 <1d7cd15c-f529-93da-c15e-a1fde745e6c5@amd.com>
 <BL0PR12MB2580D7594496F74418BC57D1804F0@BL0PR12MB2580.namprd12.prod.outlook.com>
 <4d57d0bb-c10d-4aa3-b95a-06e4aaa92679@amd.com>
In-Reply-To: <4d57d0bb-c10d-4aa3-b95a-06e4aaa92679@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.228.101.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 221c377c-3165-4a56-6241-08d76dcfb536
x-ms-traffictypediagnostic: BL0PR12MB2532:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB2532660E2A88DF8C0ADDAA83804F0@BL0PR12MB2532.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(189003)(199004)(13464003)(25786009)(6506007)(53546011)(6436002)(966005)(2906002)(76176011)(7696005)(478600001)(102836004)(3846002)(6116002)(55016002)(256004)(26005)(14444005)(6306002)(110136005)(99286004)(9686003)(224303003)(7736002)(186003)(14454004)(66446008)(5660300002)(81156014)(229853002)(52536014)(66574012)(81166006)(66476007)(64756008)(66556008)(66946007)(66066001)(74316002)(76116006)(33656002)(2501003)(71200400001)(71190400001)(305945005)(446003)(8936002)(316002)(11346002)(486006)(6246003)(86362001)(476003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2532;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K9rXHU+3YXny2IJDpaR5iKPmt9WMwI1u3hDBDNYuK+EoCHm/yWCe05tJsOEqkhH2myAcKidmUm/N6FuTGxCKLQ/gzy/m5zJoKZtVbZWwrVJZHM61h39DaT2omVPcx9RoTVK9sBg6xbEahDqz+WhCXiN7h3VyiaPRSRqpi+yX6mVWXI7yEgl0nefo419YNd0+HbrDchatgWIRVigl8m7w9mYNZwDmadjqVMa8X0lAEhnmNGPOKkrrXDbpPoAWDwYnTuBlpqSAnfZgscdS7JEmkJQ/lEHAiDhrSJ8/PWNTTpHEvjzlLE9zmt54hCSdwf+o0B1DN3clH3eLgEkWD8NsemR5tptak0Nye/9Q82bEGS7fPtPnwLSoqykB//8dfilfalW5lyZi4LDSY7gDPUzy/2hW8JL4KLXfcKqHsMqIvkGX6C3pyWfOM2TA5hEVE+kDxsDG9F+QejhJwDYOgKiE/1rpLjmaiLfO2JIH78kdeeM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 221c377c-3165-4a56-6241-08d76dcfb536
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 15:38:36.0563 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6J4gPNupfeJRlk2fEPgn29PfZizfUpC0Uy1G+gLXPy//8UZJijWeXyPRZCUGFf0C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2532
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldV5mlQcn4V7hKECPZXMF/PHVY+wStbwL0wxrZK7zPk=;
 b=cTd8vuBK/hx32E9f3GDdFYJaENpioYcGgGxSwtYwKeirlrS+Y3Pe5TNitCZGWUALeJQdULhvZQPn/Prtua6NOAIp3uCKcl6fMs0+VBX44SJTl/U9aO0SJbsqUsyVwDlYaHphZgCfL6bX6tY1iHqScBEEjvB736RmzdIHwd9OjTY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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

VGhhbmsgeW91IENocmlzdGlhbi4gTWF5YmUgaW4gdGhlIGZ1dHVyZSB3ZSBjYW4gbWFrZSB0aGUg
aW52YWxpZGF0aW9uIGFjayB0byBiZSBpbnRlcnJ1cHQgYmFzZWQgaW5zdGVhZCBvZiBwb2xsaW5n
Lg0KDQpSZWdhcmRzLA0KT2FrDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBL
b2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPiANClNlbnQ6IFdlZG5l
c2RheSwgTm92ZW1iZXIgMjAsIDIwMTkgMTA6MTQgQU0NClRvOiBaZW5nLCBPYWsgPE9hay5aZW5n
QGFtZC5jb20+OyBMaXUsIE1vbmsgPE1vbmsuTGl1QGFtZC5jb20+OyBaaHUsIENoYW5nZmVuZyA8
Q2hhbmdmZW5nLlpodUBhbWQuY29tPjsgWGlhbywgSmFjayA8SmFjay5YaWFvQGFtZC5jb20+OyBa
aG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQu
Y29tPjsgSHVhbmcsIFNoaW1tZXIgPFhpbm1laS5IdWFuZ0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiDnrZTlpI06IFtQQVRDSCAxLzJdIGRybS9h
bWRncHU6IGludmFsaWRhdGUgbW1odWIgc2VtcGhvcmUgd29ya2Fyb3VuZCBpbiBhbWRncHVfdmly
dA0KDQpIaSBPYWssDQoNCj4gW09ha10gSSBhbSBub3QgZmFtaWxpYXIgYWJvdXQgdGhlIHBvd2Vy
IGdhdGluZyBzZXF1ZW5jZSBidXQgZnJvbSBmaXJzdCBnbGFuY2UsIHNob3VsZCB0aGUgcG93ZXIg
Z2F0aW5nIHNlcXVlbmNlIG1ha2Ugc3VyZSB0aGF0IEhXIGlzIHJlYWR5IChpZGxlKSBmb3IgcG93
ZXIgZ2F0aW5nIGJlZm9yZSBwdXQgdGhlIHN5c3RlbSB0byBwb3dlciBnYXRpbmc/DQpUaGUgcHJv
YmxlbSBpcyB0aGF0IHRoZSBoYXJkd2FyZSBpcyBhY3R1YWxseSBpZGxlIHdoZW4gZ2F0ZWQuDQoN
ClNlZSB3aGF0IGhhcHBlbnMgaXMgdGhlIGZvbGxvd2luZzoNCg0KMS4gUmluZyBBIHNlbmRzIGFu
IGludmFsaWRhdGUgY29tbWFuZCB0byBWTSBpbnZhbGlkYXRpb24gZW5naW5lIFguDQoNCjIuIFZN
IGludmFsaWRhdGlvbiBlbmdpbmUgWCB3YWtlcyB1cCBhbmQgaXMgdW5nYXRlZCBiZWNhdXNlIGl0
IG5vdyBoYXMgd29yay4NCg0KMy4gVk0gaW52YWxpZGF0aW9uIGVuZ2luZSBYIGZpbmlzaGVzIHRo
ZSBpbnZhbGlkYXRpb24gYW5kIGdvZXMgYmFjayB0byBiZSBnYXRlZCBhZ2Fpbi4NCg0KNC4gTm93
IHJpbmcgQSBwb2xscyBmb3IgdGhlIGludmFsaWRhdGlvbiBvbiBlbmdpbmUgWCB0byBjb21wbGV0
ZSwgYnV0IHNpbmNlIGl0IGdvdCBiYWNrIHRvIGJlIGdhdGVkIGFnYWluIGl0IGhhcyBmb3Jnb3R0
ZW4gdGhhdCB3ZSBoYXZlIGZpbmlzaGVkIHRoYXQgaW52YWxpZGF0aW9uLiBCQU0hIFJpbmcgQSB3
aWxsIHBvbGwgZm9yZXZlci4NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0KQW0gMjAuMTEuMTkg
dW0gMTY6MDQgc2NocmllYiBaZW5nLCBPYWs6DQo+IFNlZSBhbiBpbmxpbmUgY29tbWVudA0KPg0K
PiBSZWdhcmRzLA0KPiBPYWsNCj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVo
YWxmIE9mIA0KPiBDaHJpc3RpYW4gS8O2bmlnDQo+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIg
MjAsIDIwMTkgODoyMSBBTQ0KPiBUbzogTGl1LCBNb25rIDxNb25rLkxpdUBhbWQuY29tPjsgWmh1
LCBDaGFuZ2ZlbmcgDQo+IDxDaGFuZ2ZlbmcuWmh1QGFtZC5jb20+OyBYaWFvLCBKYWNrIDxKYWNr
LlhpYW9AYW1kLmNvbT47IFpob3UxLCBUYW8gDQo+IDxUYW8uWmhvdTFAYW1kLmNvbT47IEh1YW5n
LCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgSHVhbmcsIFNoaW1tZXIgDQo+IDxYaW5tZWkuSHVh
bmdAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJl
OiDnrZTlpI06IFtQQVRDSCAxLzJdIGRybS9hbWRncHU6IGludmFsaWRhdGUgbW1odWIgc2VtcGhv
cmUgDQo+IHdvcmthcm91bmQgaW4gYW1kZ3B1X3ZpcnQNCj4NCj4gSGkgTW9uaywNCj4NCj4gdGhp
cyBpcyBhIGZpeCBmb3IgcG93ZXIgZ2F0aW5nIHRoZSBNTUhVQi4NCj4NCj4gQmFzaWMgcHJvYmxl
bSBpcyB0aGF0IHRoZSBNTUhVQiBjYW4gcG93ZXIgZ2F0ZSB3aGlsZSBhbiBpbnZhbGlkYXRpb24g
DQo+IGlzIGluIHByb2dyZXNzIFtPYWtdIEkgYW0gbm90IGZhbWlsaWFyIGFib3V0IHRoZSBwb3dl
ciBnYXRpbmcgc2VxdWVuY2UgYnV0IGZyb20gZmlyc3QgZ2xhbmNlLCBzaG91bGQgdGhlIHBvd2Vy
IGdhdGluZyBzZXF1ZW5jZSBtYWtlIHN1cmUgdGhhdCBIVyBpcyByZWFkeSAoaWRsZSkgZm9yIHBv
d2VyIGdhdGluZyBiZWZvcmUgcHV0IHRoZSBzeXN0ZW0gdG8gcG93ZXIgZ2F0aW5nPyBFLmcuLCBi
ZWZvcmUgd2UgcHV0IHRoZSBzeXN0ZW0gdG8gcG93ZXIgZ2F0aW5nLCBzaG91bGQgd2UgZW5xdWly
eSBlYWNoIEhXIGJsb2NrcyB0byBzZWUgd2hldGhlciB0aGUgSFcgaXMgaWRsZT8gSWYgbm90IChs
aWtlIHRoZSBjYXNlIHlvdSBtZW50aW9uZWQgc29tZSBpbnZhbGlkYXRpb24gYWN0aXZpdGllcyBp
cyBzdGlsbCBvbmdvaW5nKSB0aGUgcG93ZXIgZ2F0aW5nIGNvbmRpdGlvbiBpcyBub3QgbWF0dXJl
IGFuZCB3ZSBzaG91bGQgd2Ugd2FpdC4gT3IgaWYgdGhlIHBvd2VyIGdhdGluZyBpcyB0cmlnZ2Vy
L2luaXRpYXRlZCBieSBIVyAoSSBhbSBub3Qgc3VyZSksIEhXIHNob3VsZCBndWFyYW50ZWUgaXQg
aXMgaWRsZT8NCj4NCj4gICB3aGljaCBsb29zZXMgYWxsIGJpdHMgaW4gdGhlIEFDSyByZWdpc3Rl
ciBhbmQgc28gZGVhZGxvY2tzIHRoZSBlbmdpbmUgd2FpdGluZyBmb3IgdGhlIGludmFsaWRhdGlv
biB0byBmaW5pc2guDQo+DQo+IFRoaXMgYnVnIGlzIGhpdCBpbW1lZGlhdGVseSB3aGVuIHdlIGVu
YWJsZSBwb3dlciBnYXRpbmcgb2YgdGhlIE1NSFVCLg0KPg0KPiBSZWdhcmRzLA0KPiBDaHJpc3Rp
YW4uDQo+DQo+IEFtIDIwLjExLjE5IHVtIDE0OjE4IHNjaHJpZWIgTGl1LCBNb25rOg0KPj4gSGkg
Q2hhbmdmZW5nDQo+Pg0KPj4gRmlycyBvZiBhbGwsIHRoZXJlIGlzIG5vIHBvd2VyLWdhdGluZyBv
ZmYgY2lyY2xlIGludm9sdmVkIGluIEFNREdQVSANCj4+IFNSSU9WLCBzaW5jZSB3ZSBkb24ndCBh
bGxvdyBWRi9WTSBkbyBzdWNoIHRoaW5ncyBzbyBJIGRvIGZlZWwgc3RyYW5nZSANCj4+IHdoeSB5
b3UgcG9zdCBzb21ldGhpbmcgbGlrZSB0aGlzIEVzcGVjaWFsbHkgb24gVkVHQTEwIHNlcmlhbHMg
d2hpY2ggDQo+PiBsb29rcyBkb2Vzbid0IGhhdmUgYW55IGlzc3VlIG9uIHRob3NlIGdwdV9mbHVz
aCBwYXJ0DQo+Pg0KPj4gSGVyZSBpcyBteSBxdWVzdGlvbnMgZm9yIHlvdToNCj4+IDEpIENhbiB5
b3UgcG9pbnQgbWUgd2hhdCBpc3N1ZSBoYWQgeW91IGJlZW4gZXhwZXJpZW5jZWQgPyBhbmQgaG93
IHRvIA0KPj4gcmVwcm8gdGhlIGJ1Zw0KPj4gMikgaWYgeW91IGRvIGhpdCBzb21lIGlzc3Vlcywg
ZGlkIHlvdSB2ZXJpZmllZCB0aGF0IHlvdXIgcGF0Y2ggY2FuIGZpeCBpdCA/DQo+Pg0KPj4gYmVz
aWRlcw0KPj4NCj4+IC9Nb25rDQo+Pg0KPj4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0KPj4g5Y+R
5Lu25Lq6OiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiDk
u6PooaggQ2hhbmdmZW5nLlpodQ0KPj4g5Y+R6YCB5pe26Ze0OiAyMDE55bm0MTHmnIgyMOaXpSAx
NzoxNA0KPj4g5pS25Lu25Lq6OiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0Bh
bWQuY29tPjsgWGlhbywgSmFjayANCj4+IDxKYWNrLlhpYW9AYW1kLmNvbT47IFpob3UxLCBUYW8g
PFRhby5aaG91MUBhbWQuY29tPjsgSHVhbmcsIFJheSANCj4+IDxSYXkuSHVhbmdAYW1kLmNvbT47
IEh1YW5nLCBTaGltbWVyIDxYaW5tZWkuSHVhbmdAYW1kLmNvbT47IA0KPj4gYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4+IOaKhOmAgTogWmh1LCBDaGFuZ2ZlbmcgPENoYW5nZmVuZy5a
aHVAYW1kLmNvbT4NCj4+IOS4u+mimDogW1BBVENIIDEvMl0gZHJtL2FtZGdwdTogaW52YWxpZGF0
ZSBtbWh1YiBzZW1waG9yZSB3b3JrYXJvdW5kIGluIA0KPj4gYW1kZ3B1X3ZpcnQNCj4+DQo+PiBG
cm9tOiBjaGFuZ3podSA8Q2hhbmdmZW5nLlpodUBhbWQuY29tPg0KPj4NCj4+IEl0IG1heSBsb3Nl
IGdwdXZtIGludmFsaWRhdGUgYWNrbm93bGRlZ2Ugc3RhdGUgYWNyb3NzIHBvd2VyLWdhdGluZyBv
ZmYgY3ljbGUuIFRvIGF2b2lkIHRoaXMgaXNzdWUgaW4gdmlydCBpbnZhbGlkYXRpb24sIGFkZCBz
ZW1hcGhvcmUgYWNxdWlyZSBiZWZvcmUgaW52YWxpZGF0aW9uIGFuZCBzZW1hcGhvcmUgcmVsZWFz
ZSBhZnRlciBpbnZhbGlkYXRpb24uDQo+Pg0KPj4gQ2hhbmdlLUlkOiBJZTk4MzA0ZTQ3NTE2NmI1
M2VlZDAzMzQ2MmQ3NjQyM2I2YjBmYzI1Yg0KPj4gU2lnbmVkLW9mZi1ieTogY2hhbmd6aHUgPENo
YW5nZmVuZy5aaHVAYW1kLmNvbT4NCj4+IC0tLQ0KPj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3ZpcnQuYyB8IDI2ICsrKysrKysrKysrKysrKysrKysrKystLSAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZpcnQuaCB8ICAzICsrLQ0KPj4gICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyAgICB8ICAzICsrLQ0KPj4gICAgMyBmaWxl
cyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmlydC5jDQo+PiBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92aXJ0LmMNCj4+IGluZGV4IGYwNGViMWE2
NDI3MS4uNzBmZmFmOTFjZDEyIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3ZpcnQuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3ZpcnQuYw0KPj4gQEAgLTEzNSw3ICsxMzUsOCBAQCB2b2lkIGFtZGdwdV92aXJ0X2tp
cV93cmVnKHN0cnVjdCBhbWRncHVfZGV2aWNlIA0KPj4gKmFkZXYsIHVpbnQzMl90IHJlZywgdWlu
dDMyX3QgdikNCj4+ICAgIA0KPj4gICAgdm9pZCBhbWRncHVfdmlydF9raXFfcmVnX3dyaXRlX3Jl
Z193YWl0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPj4gICAgCQkJCQl1aW50MzJfdCBy
ZWcwLCB1aW50MzJfdCByZWcxLA0KPj4gLQkJCQkJdWludDMyX3QgcmVmLCB1aW50MzJfdCBtYXNr
KQ0KPj4gKwkJCQkJdWludDMyX3QgcmVmLCB1aW50MzJfdCBtYXNrLA0KPj4gKwkJCQkJdWludDMy
X3Qgc2VtKQ0KPj4gICAgew0KPj4gICAgCXN0cnVjdCBhbWRncHVfa2lxICpraXEgPSAmYWRldi0+
Z2Z4LmtpcTsNCj4+ICAgIAlzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcgPSAma2lxLT5yaW5nOyBA
QCAtMTQ0LDkgKzE0NSwzMCBAQCB2b2lkIGFtZGdwdV92aXJ0X2tpcV9yZWdfd3JpdGVfcmVnX3dh
aXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+PiAgICAJdWludDMyX3Qgc2VxOw0KPj4g
ICAgDQo+PiAgICAJc3Bpbl9sb2NrX2lycXNhdmUoJmtpcS0+cmluZ19sb2NrLCBmbGFncyk7DQo+
PiAtCWFtZGdwdV9yaW5nX2FsbG9jKHJpbmcsIDMyKTsNCj4+ICsJYW1kZ3B1X3JpbmdfYWxsb2Mo
cmluZywgNjApOw0KPj4gKw0KPj4gKwkvKg0KPj4gKwkgKiBJdCBtYXkgbG9zZSBncHV2bSBpbnZh
bGlkYXRlIGFja25vd2xkZWdlIHN0YXRlIGFjcm9zcyBwb3dlci1nYXRpbmcNCj4+ICsJICogb2Zm
IGN5Y2xlLCBhZGQgc2VtYXBob3JlIGFjcXVpcmUgYmVmb3JlIGludmFsaWRhdGlvbiBhbmQgc2Vt
YXBob3JlDQo+PiArCSAqIHJlbGVhc2UgYWZ0ZXIgaW52YWxpZGF0aW9uIHRvIGF2b2lkIGVudGVy
aW5nIHBvd2VyIGdhdGVkIHN0YXRlDQo+PiArCSAqIHRvIFdBIHRoZSBJc3N1ZQ0KPj4gKwkgKi8N
Cj4+ICsNCj4+ICsJLyogYSByZWFkIHJldHVybiB2YWx1ZSBvZiAxIG1lYW5zIHNlbWFwaG9yZSBh
Y3VxaXJlICovDQo+PiArCWlmIChyaW5nLT5mdW5jcy0+dm1odWIgPT0gQU1ER1BVX01NSFVCXzAg
fHwNCj4+ICsJICAgIHJpbmctPmZ1bmNzLT52bWh1YiA9PSBBTURHUFVfTU1IVUJfMSkNCj4+ICsJ
YW1kZ3B1X3JpbmdfZW1pdF9yZWdfd2FpdChyaW5nLCBzZW0sIDB4MSwgMHgxKTsNCj4+ICsNCj4+
ICAgIAlhbWRncHVfcmluZ19lbWl0X3JlZ193cml0ZV9yZWdfd2FpdChyaW5nLCByZWcwLCByZWcx
LA0KPj4gICAgCQkJCQkgICAgcmVmLCBtYXNrKTsNCj4+ICsJLyoNCj4+ICsJICogYWRkIHNlbWFw
aG9yZSByZWxlYXNlIGFmdGVyIGludmFsaWRhdGlvbiwNCj4+ICsJICogd3JpdGUgd2l0aCAwIG1l
YW5zIHNlbWFwaG9yZSByZWxlYXNlDQo+PiArCSAqLw0KPj4gKwlpZiAocmluZy0+ZnVuY3MtPnZt
aHViID09IEFNREdQVV9NTUhVQl8wIHx8DQo+PiArCSAgICByaW5nLT5mdW5jcy0+dm1odWIgPT0g
QU1ER1BVX01NSFVCXzEpDQo+PiArCWFtZGdwdV9yaW5nX2VtaXRfd3JlZyhyaW5nLCBzZW0sIDAp
Ow0KPj4gKw0KPj4gICAgCWFtZGdwdV9mZW5jZV9lbWl0X3BvbGxpbmcocmluZywgJnNlcSk7DQo+
PiAgICAJYW1kZ3B1X3JpbmdfY29tbWl0KHJpbmcpOw0KPj4gICAgCXNwaW5fdW5sb2NrX2lycXJl
c3RvcmUoJmtpcS0+cmluZ19sb2NrLCBmbGFncyk7IGRpZmYgLS1naXQgDQo+PiBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92aXJ0LmgNCj4+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3ZpcnQuaA0KPj4gaW5kZXggYjBiMmJkYzc1MGRmLi5iZGE2YTJmMzdk
YzAgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmly
dC5oDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmlydC5oDQo+
PiBAQCAtMjk1LDcgKzI5NSw4IEBAIHVpbnQzMl90IGFtZGdwdV92aXJ0X2tpcV9ycmVnKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCByZWcpOyAgdm9pZCBhbWRncHVfdmlydF9r
aXFfd3JlZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3QgcmVnLCB1aW50MzJf
dCB2KTsgIHZvaWQgYW1kZ3B1X3ZpcnRfa2lxX3JlZ193cml0ZV9yZWdfd2FpdChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwNCj4+ICAgIAkJCQkJdWludDMyX3QgcmVnMCwgdWludDMyX3QgcnJl
ZzEsDQo+PiAtCQkJCQl1aW50MzJfdCByZWYsIHVpbnQzMl90IG1hc2spOw0KPj4gKwkJCQkJdWlu
dDMyX3QgcmVmLCB1aW50MzJfdCBtYXNrLA0KPj4gKwkJCQkJdWludDMyX3Qgc2VtKTsNCj4+ICAg
IGludCBhbWRncHVfdmlydF9yZXF1ZXN0X2Z1bGxfZ3B1KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LCBib29sIA0KPj4gaW5pdCk7ICBpbnQgYW1kZ3B1X3ZpcnRfcmVsZWFzZV9mdWxsX2dwdShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgDQo+PiBib29sIGluaXQpOyAgaW50IGFtZGdwdV92
aXJ0X3Jlc2V0X2dwdShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7IA0KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4+IGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPj4gaW5kZXggZjI1Y2Q5N2JhNWYyLi4xYWU1
OWFmNzgzNmEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djlfMC5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+
PiBAQCAtNDQ4LDkgKzQ0OCwxMCBAQCBzdGF0aWMgdm9pZCBnbWNfdjlfMF9mbHVzaF9ncHVfdGxi
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCB2bWlkLA0KPj4gICAgCQkJIWFk
ZXYtPmluX2dwdV9yZXNldCkgew0KPj4gICAgCQl1aW50MzJfdCByZXEgPSBodWItPnZtX2ludl9l
bmcwX3JlcSArIGVuZzsNCj4+ICAgIAkJdWludDMyX3QgYWNrID0gaHViLT52bV9pbnZfZW5nMF9h
Y2sgKyBlbmc7DQo+PiArCQl1aW50MzJfdCBzZW0gPSBodWItPnZtX2ludl9lbmcwX3NlbSArIGVu
ZzsNCj4+ICAgIA0KPj4gICAgCQlhbWRncHVfdmlydF9raXFfcmVnX3dyaXRlX3JlZ193YWl0KGFk
ZXYsIHJlcSwgYWNrLCB0bXAsDQo+PiAtCQkJCTEgPDwgdm1pZCk7DQo+PiArCQkJCQkJICAgMSA8
PCB2bWlkLCBzZW0pOw0KPj4gICAgCQlyZXR1cm47DQo+PiAgICAJfQ0KPj4gICAgDQo+PiAtLQ0K
Pj4gMi4xNy4xDQo+Pg0KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCj4+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
