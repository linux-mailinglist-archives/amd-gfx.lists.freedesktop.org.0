Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B2EBC721
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 13:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A52890BA;
	Tue, 24 Sep 2019 11:48:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680079.outbound.protection.outlook.com [40.107.68.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F0E890BA;
 Tue, 24 Sep 2019 11:48:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iP++p7AWB08BWQ6L1CEJFEMJpoqrakccI9jCmxMr15URtLnUkET96WLsN44byqQjxNDQ7TTygfbEM26tYCVjQgKFVkTCNfXcEtzxM9aVRph3klN/Ihxl3y0s6ywJiGA4cfqXZ49JtyWVfI2NK3D7pwdG02PTH8eF/vnxv84YZ5G5qIm3capO8kPBHd5zBZ3TtNsSDzsnd+kNLjGJHJ+4kTqCeGRcG4Ce1luaEgCpqTcZ5YgfHisGNVY1wcVHRCAlMRRlUuKTI9+0UNxeshWR2DJCWIhYasOXlo5x7ttfbbHCA619S4g/KQgekGDFInQ0Nm4k7qw62sVsCP03T2Xrkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOb5Hqgmb1hKJlu7MamtyG/yIBoVZqQwcLkGjse5MrM=;
 b=NU3X/4xc3h2jrPJG2xhkXIOcdWFQ+solYE3OlrmcPCX9Z7pu4VUGHGPhRSFCdyatILIe+fVm6hNFgTBxP95WKm4PO+fK7PU+87KVWShMVT5qjZAZrdtCQgLMlZ1Io0AzMnkam19PIWRzGPIvTrHPs40OoM9IBpfIOtyYStJJjBJlSaqycFozm7cLP5lo4pOLF/cl17rdi+gJ+ORAgn09mcp8yjo9ZMo0FDAyQvvyo4sl/smj693uJbw+Ir3zghAMrazyDQ49uKe3v/yUTk4I7QggVj78PLHAVqXeOcQSbePox1GCsLXy5QN+X0qbNf1QlXAuGHJXuNKI5D2p6izyVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3743.namprd12.prod.outlook.com (10.255.236.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Tue, 24 Sep 2019 11:48:43 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 11:48:43 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: RE: [PATCH 14/14] drm/amdgpu: set TMZ bits in PTEs for secure bo (v2)
Thread-Topic: [PATCH 14/14] drm/amdgpu: set TMZ bits in PTEs for secure bo (v2)
Thread-Index: AQHVaJcopKpC1OzuDEifbwgZtSrWx6cmY2qAgAH6I4D//5FCAIASzzYw
Date: Tue, 24 Sep 2019 11:48:43 +0000
Message-ID: <MN2PR12MB33099517C5365BD6274A1491EC840@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <1568202584-14471-1-git-send-email-ray.huang@amd.com>
 <1568202584-14471-15-git-send-email-ray.huang@amd.com>
 <5704cdc8-754e-538e-9547-738ef81efa7c@amd.com>
 <MN2PR12MB3309544896408F62494EC8B3ECB00@MN2PR12MB3309.namprd12.prod.outlook.com>
 <26355f8a-d16b-e406-8cfc-b30742419121@amd.com>
In-Reply-To: <26355f8a-d16b-e406-8cfc-b30742419121@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fa47852-2bdc-4aab-7aa5-08d740e5266f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3743; 
x-ms-traffictypediagnostic: MN2PR12MB3743:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB37439B440BD3FAA6C75A1ED1EC840@MN2PR12MB3743.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(13464003)(199004)(189003)(76116006)(450100002)(81156014)(81166006)(8676002)(8936002)(71200400001)(7736002)(186003)(66476007)(102836004)(478600001)(64756008)(26005)(14454004)(71190400001)(6862004)(66946007)(6116002)(3846002)(4326008)(14444005)(486006)(2906002)(66556008)(74316002)(33656002)(6506007)(99286004)(305945005)(7696005)(25786009)(76176011)(66446008)(256004)(53546011)(6636002)(316002)(55016002)(11346002)(446003)(476003)(6246003)(66066001)(86362001)(6436002)(52536014)(9686003)(54906003)(5660300002)(229853002)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3743;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ut1t1sOWp4M2OFP1fhaTCdnfaDO6GBIKBUxzzIyKXALJD5eJXxPfPn+3AXYziFD3Bcm7AQvv91TYmKPDiKJpRyVVCmmlQPke7nOMBmtQiDI5/VNqWWP7OdtqNaS96aMDUEDd7Dl2tDfIQZxA81fDQWtO3+w9Z5oKVFvYL9BuGyFkg1X5onu6la5L2kVJ9sY8t9yKuS+4GPvki+I2tNx++jrwJqLT9yZ3hCKVzsIOc48EbkzQNyfAlVe/JzvE2+r9MHmBsAlxxlAJ9TMOcOBcTBIGVUjbI2gizO35yTu58w/L/KB2zll/N9kJ/57U4peCsvmBUXtDseSZ0xj9fDTWvDLJUSrzByMiO2LpoeNL8B2S+xxrQ0lk96nNgIE3gy6ivzndp0KtRQFfVoVhfZPsgbIwULTUUtJjmadZh9jvG/Q=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa47852-2bdc-4aab-7aa5-08d740e5266f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 11:48:43.0834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LI1oRrCjhvzsd+9E/z3SBtsWQ+Zj3G+RM7ijn33UvbpOUubtb4+Aygetljy8XHnbc0MxmP+nE+bVkS5hGIIGEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3743
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOb5Hqgmb1hKJlu7MamtyG/yIBoVZqQwcLkGjse5MrM=;
 b=K29Rn+V5kB1zSFEd88zqnI3N44qart4qofKqx2PEbu7wqQxf4RCQzwhDvyYneaqK5Bwx267uQDRefUqO5GBp9LGZK2VVkIc3912LPvEuGQ9gK+skZ+/VpEULGNFWqI8nKSbOZWBCi6foKeIxuIbpF1TAsaebeuAmFMvscd3Jnqc=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Liu,
 Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLb2VuaWcsIENocmlzdGlhbiA8
Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDEy
LCAyMDE5IDc6NDkgUE0NCj4gVG86IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPg0KPiBD
YzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7DQo+IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNv
bT47IFR1aWtvdiwgTHViZW4NCj4gPEx1YmVuLlR1aWtvdkBhbWQuY29tPjsgTGl1LCBBYXJvbiA8
QWFyb24uTGl1QGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMTQvMTRdIGRybS9hbWRn
cHU6IHNldCBUTVogYml0cyBpbiBQVEVzIGZvciBzZWN1cmUgYm8NCj4gKHYyKQ0KPiANCj4gQW0g
MTIuMDkuMTkgdW0gMTI6Mjcgc2NocmllYiBIdWFuZywgUmF5Og0KPiA+IE9uIFdlZCwgU2VwIDEx
LCAyMDE5IGF0IDA4OjEzOjE5UE0gKzA4MDAsIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPiA+
PiBBbSAxMS4wOS4xOSB1bSAxMzo1MCBzY2hyaWViIEh1YW5nLCBSYXk6DQo+ID4+PiBGcm9tOiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+ID4+Pg0KPiA+Pj4gSWYg
b25lIGJvIGlzIHNlY3VyZSAoY3JlYXRlZCB3aXRoIEFNREdQVV9HRU1fQ1JFQVRFX0VOQ1JZUFRF
RCksDQo+IHRoZQ0KPiA+Pj4gVE1aIGJpdHMgb2YgUFRFcyB0aGF0IGJlbG9uZ3MgdGhhdCBibyBz
aG91bGQgYmUgc2V0LiBUaGVuIHBzcCBpcw0KPiA+Pj4gYWJsZSB0byBwcm90ZWN0IHRoZSBwYWdl
cyBvZiB0aGlzIGJvIHRvIGF2b2lkIHRoZSBhY2Nlc3MgZnJvbSBhbiAidW50cnVzdCINCj4gZG9t
YWluIHN1Y2ggYXMgQ1BVLg0KPiA+Pj4NCj4gPj4+IHYxOiBkZXNpZ24gYW5kIGRyYWZ0IHRoZSBz
a2VsZXRpb24gb2YgdG16IGJpdHMgc2V0dGluZyBvbiBQVEVzDQo+ID4+PiAoQWxleCkNCj4gPj4+
IHYyOiByZXR1cm4gZmFpbHVyZSBvbmNlIGNyZWF0ZSBzZWN1cmUgYm8gb24gbm8tdG16IHBsYXRm
b3JtICAoUmF5KQ0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gPj4+IFJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJh
eS5odWFuZ0BhbWQuY29tPg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVh
bmdAYW1kLmNvbT4NCj4gPj4+IC0tLQ0KPiA+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2dlbS5jICAgIHwgMTIgKysrKysrKysrKystDQo+ID4+PiAgICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmggfCAxMCArKysrKysrKysrDQo+ID4+PiAg
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgICAgfCAgNSArKysrKw0K
PiA+Pj4gICAgMyBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9nZW0uYw0KPiA+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Vt
LmMNCj4gPj4+IGluZGV4IDIyZWFiNzQuLjUzMzIxMDQgMTAwNjQ0DQo+ID4+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMNCj4gPj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYw0KPiA+Pj4gQEAgLTIyMiw3ICsyMjIsOCBA
QCBpbnQgYW1kZ3B1X2dlbV9jcmVhdGVfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UNCj4gKmRldiwg
dm9pZCAqZGF0YSwNCj4gPj4+ICAgIAkJICAgICAgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9V
U1dDIHwNCj4gPj4+ICAgIAkJICAgICAgQU1ER1BVX0dFTV9DUkVBVEVfVlJBTV9DTEVBUkVEIHwN
Cj4gPj4+ICAgIAkJICAgICAgQU1ER1BVX0dFTV9DUkVBVEVfVk1fQUxXQVlTX1ZBTElEIHwNCj4g
Pj4+IC0JCSAgICAgIEFNREdQVV9HRU1fQ1JFQVRFX0VYUExJQ0lUX1NZTkMpKQ0KPiA+Pj4gKwkJ
ICAgICAgQU1ER1BVX0dFTV9DUkVBVEVfRVhQTElDSVRfU1lOQyB8DQo+ID4+PiArCQkgICAgICBB
TURHUFVfR0VNX0NSRUFURV9FTkNSWVBURUQpKQ0KPiA+Pj4NCj4gPj4+ICAgIAkJcmV0dXJuIC1F
SU5WQUw7DQo+ID4+Pg0KPiA+Pj4gQEAgLTIzMCw2ICsyMzEsMTEgQEAgaW50IGFtZGdwdV9nZW1f
Y3JlYXRlX2lvY3RsKHN0cnVjdA0KPiBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+ID4+
PiAgICAJaWYgKGFyZ3MtPmluLmRvbWFpbnMgJiB+QU1ER1BVX0dFTV9ET01BSU5fTUFTSykNCj4g
Pj4+ICAgIAkJcmV0dXJuIC1FSU5WQUw7DQo+ID4+Pg0KPiA+Pj4gKwlpZiAoIWFkZXYtPnRtei5l
bmFibGVkICYmIChmbGFncyAmDQo+IEFNREdQVV9HRU1fQ1JFQVRFX0VOQ1JZUFRFRCkpIHsNCj4g
Pj4+ICsJCURSTV9FUlJPUigiQ2Fubm90IGFsbG9jYXRlIHNlY3VyZSBidWZmZXIgd2hpbGUgdG16
IGlzDQo+IGRpc2FibGVkXG4iKTsNCj4gPj4+ICsJCXJldHVybiAtRUlOVkFMOw0KPiA+Pj4gKwl9
DQo+ID4+PiArDQo+ID4+PiAgICAJLyogY3JlYXRlIGEgZ2VtIG9iamVjdCB0byBjb250YWluIHRo
aXMgb2JqZWN0IGluICovDQo+ID4+PiAgICAJaWYgKGFyZ3MtPmluLmRvbWFpbnMgJiAoQU1ER1BV
X0dFTV9ET01BSU5fR0RTIHwNCj4gPj4+ICAgIAkgICAgQU1ER1BVX0dFTV9ET01BSU5fR1dTIHwg
QU1ER1BVX0dFTV9ET01BSU5fT0EpKQ0KPiB7IEBAIC0yNTEsNg0KPiA+Pj4gKzI1NywxMCBAQCBp
bnQgYW1kZ3B1X2dlbV9jcmVhdGVfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gdm9p
ZCAqZGF0YSwNCj4gPj4+ICAgIAkJcmVzdiA9IHZtLT5yb290LmJhc2UuYm8tPnRiby5yZXN2Ow0K
PiA+Pj4gICAgCX0NCj4gPj4+DQo+ID4+PiArCWlmIChmbGFncyAmIEFNREdQVV9HRU1fQ1JFQVRF
X0VOQ1JZUFRFRCkgew0KPiA+Pj4gKwkJLyogWFhYOiBwYWQgb3V0IGFsaWdubWVudCB0byBtZWV0
IFRNWiByZXF1aXJlbWVudHMgKi8NCj4gPj4+ICsJfQ0KPiA+Pj4gKw0KPiA+Pj4gICAgCXIgPSBh
bWRncHVfZ2VtX29iamVjdF9jcmVhdGUoYWRldiwgc2l6ZSwgYXJncy0+aW4uYWxpZ25tZW50LA0K
PiA+Pj4gICAgCQkJCSAgICAgKHUzMikoMHhmZmZmZmZmZiAmIGFyZ3MtPmluLmRvbWFpbnMpLA0K
PiA+Pj4gICAgCQkJCSAgICAgZmxhZ3MsIHR0bV9ib190eXBlX2RldmljZSwgcmVzdiwgJmdvYmop
Ow0KPiBkaWZmIC0tZ2l0DQo+ID4+PiBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9vYmplY3QuaA0KPiA+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2Jq
ZWN0LmgNCj4gPj4+IGluZGV4IDVhM2MxNzcuLjI4NmUyZTIgMTAwNjQ0DQo+ID4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgNCj4gPj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaA0KPiA+Pj4gQEAgLTIyNCw2
ICsyMjQsMTYgQEAgc3RhdGljIGlubGluZSBib29sDQo+IGFtZGdwdV9ib19leHBsaWNpdF9zeW5j
KHN0cnVjdCBhbWRncHVfYm8gKmJvKQ0KPiA+Pj4gICAgCXJldHVybiBiby0+ZmxhZ3MgJiBBTURH
UFVfR0VNX0NSRUFURV9FWFBMSUNJVF9TWU5DOw0KPiA+Pj4gICAgfQ0KPiA+Pj4NCj4gPj4+ICsv
KioNCj4gPj4+ICsgKiBhbWRncHVfYm9fZW5jcnlwdGVkIC0gcmV0dXJuIHdoZXRoZXIgdGhlIGJv
IGlzIGVuY3J5cHRlZCAgKi8NCj4gPj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgYW1kZ3B1X2JvX2Vu
Y3J5cHRlZChzdHJ1Y3QgYW1kZ3B1X2JvICpibykgew0KPiA+Pj4gKwlzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiA9IGFtZGdwdV90dG1fYWRldihiby0+dGJvLmJkZXYpOw0KPiA+Pj4gKw0KPiA+
Pj4gKwlyZXR1cm4gYWRldi0+dG16LmVuYWJsZWQgJiYgKGJvLT5mbGFncyAmDQo+ID4+PiArQU1E
R1BVX0dFTV9DUkVBVEVfRU5DUllQVEVEKTsNCj4gPj4gQ2hlY2tpbmcgdGhlIGFkZXYtPnRtei5l
bmFibGVkIGZsYWdzIHNob3VsZCBiZSBkcm9wcGVkIGhlcmUuDQo+ID4+DQo+ID4gVGhhdCdzIGZp
bmUuIEJPIHNob3VsZCBiZSB2YWxpZGF0ZWQgd2hpbGUgaXQgaXMgY3JlYXRlZC4NCj4gPg0KPiA+
IEJ1dCBpZiB0aGUgQk8gaXMgY3JlYXRlZCBieSB2bWlkIDAsIGlzIHRoaXMgY2hlY2tpbmcgbmVl
ZGVkPw0KPiA+DQo+ID4+PiArfQ0KPiA+Pj4gKw0KPiA+Pj4gICAgYm9vbCBhbWRncHVfYm9faXNf
YW1kZ3B1X2JvKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pOw0KPiA+Pj4gICAgdm9pZCBh
bWRncHVfYm9fcGxhY2VtZW50X2Zyb21fZG9tYWluKHN0cnVjdCBhbWRncHVfYm8gKmFibywNCj4g
dTMyDQo+ID4+PiBkb21haW4pOw0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCj4gPj4+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+ID4+PiBpbmRleCAzNjYzNjU1Li44ZjAwYmIyIDEwMDY0
NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+
ID4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCj4gPj4+
IEBAIC0xNDM0LDYgKzE0MzQsOCBAQCBib29sIGFtZGdwdV90dG1fdHRfaXNfcmVhZG9ubHkoc3Ry
dWN0DQo+IHR0bV90dCAqdHRtKQ0KPiA+Pj4gICAgdWludDY0X3QgYW1kZ3B1X3R0bV90dF9wZGVf
ZmxhZ3Moc3RydWN0IHR0bV90dCAqdHRtLCBzdHJ1Y3QNCj4gdHRtX21lbV9yZWcgKm1lbSkNCj4g
Pj4+ICAgIHsNCj4gPj4+ICAgIAl1aW50NjRfdCBmbGFncyA9IDA7DQo+ID4+PiArCXN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdCAqdGJvID0gdHRtX21lbV9yZWdfdG9fYm8obWVtKTsNCj4gPj4+ICsJ
c3RydWN0IGFtZGdwdV9ibyAqYWJvID0gdHRtX3RvX2FtZGdwdV9ibyh0Ym8pOw0KPiA+PiBUaGF0
J3MgYSBjbGVhciBOQUsuIFRoZSBmdW5jdGlvbiBpcyBub3QgbmVjZXNzYXJpbHkgY2FsbGVkIHdp
dGgNCj4gPj4gJmJvLT5tZW0sIHdoaWNoIGlzIGFsc28gdGhlIHJlYXNvbiB3aHkgdGhpcyBmdW5j
dGlvbiBkb2Vzbid0IGdldHMgdGhlDQo+ID4+IEJPIGFzIHBhcmFtZXRlci4NCj4gPj4NCj4gPiBE
byB5b3UgbWVhbiB3ZSBjYW4gcmV2aXNlIHRoZSBiZWxvdyBmdW5jdGlvbnMgdG8gdXNlIGJvIGFz
IHRoZQ0KPiA+IHBhcmFtZXRlciBpbnN0ZWFkPw0KPiA+DQo+ID4gdWludDY0X3QgYW1kZ3B1X3R0
bV90dF9wZGVfZmxhZ3Moc3RydWN0IHR0bV90dCAqdHRtLCBzdHJ1Y3QgYW1kZ3B1X2JvDQo+ID4g
KmJvKSB1aW50NjRfdCBhbWRncHVfdHRtX3R0X3B0ZV9mbGFncyhzdHJ1Y3QgdHRtX3R0ICp0dG0s
IHN0cnVjdA0KPiA+IGFtZGdwdV9ibyAqYm8pDQo+IA0KPiBJZiB0aGF0IGlzIHBvc3NpYmxlIHRo
ZW4gdGhpcyB3b3VsZCBpbmRlZWQgYmUgYSBzb2x1dGlvbiBmb3IgdGhlIHByb2JsZW0uDQo+IA0K
DQpTb3JyeSB0byBsYXRlIHJlc3BvbnNlLCBJIHdhcyByZXZpc2luZyB0aGUgdW5pdCB0ZXN0IGZv
ciBzZWN1cmUgbWVtb3J5IGZldyBkYXlzIGFnby4gDQoNCk1vc3Qgb2YgY2FzZXMgY2FuIGJlIHVw
ZGF0ZWQgdG8gYW1kZ3B1X3R0bV90dF9wdGVfZmxhZ3Mgd2l0aCBhbWRncHVfYm8gYXMgdGhlIHBh
cmFtZXRlciBleGNlcHQgb25lIGNhc2UgaW4NCmFtZGdwdV90dG1fYmFja2VuZF9iaW5kKCkuIEl0
IHdpbGwgYmUgY2FsbGVkIGJ5IHR0bV90dF9iaW5kKCkgdW5kZXIgYW1kZ3B1X21vdmVfdnJhbV9y
YW0oKS4gQnV0IHR0bV9tZW1fcmVnIGlzIG5ldyBhc3NpZ25lZC4gDQoNCkhvdyBhYm91dCB1c2lu
ZyBtb2RpZnkgdGhlIGJpbmQgY2FsbGJhY2sgaW4gdHRtX2JhY2tlbmRfZnVuYzoNCg0KaW50ICgq
YmluZCkgKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIHN0cnVjdCB0dG1fbWVtX3JlZyAq
Ym9fbWVtKTsNCg0KVGhlbiB3ZSBjYW4gdXBkYXRlIHRoZSBmb2xsb3dpbmcgZnVuY3Rpb25zIGFz
Og0KDQp1aW50NjRfdCBhbWRncHVfdHRtX3R0X3B0ZV9mbGFncyhzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICp0Ym8sICBzdHJ1Y3QgdHRtX21lbV9y
ZWcgKm1lbSk7DQp1aW50NjRfdCBhbWRncHVfdHRtX3R0X3BkZV9mbGFncyhzdHJ1Y3QgdHRtX2J1
ZmZlcl9vYmplY3QgKnRibywgc3RydWN0IHR0bV9tZW1fcmVnICptZW0pOw0KDQpJdCBsb29rcyBi
ZXR0ZXIgdGhhbiBiZWZvcmUuDQoNClRoYW5rcywNClJheQ0KDQo+IENocmlzdGlhbi4NCj4gDQo+
ID4NCj4gPiBUaGFua3MsDQo+ID4gUmF5DQo+ID4NCj4gPj4gQ2hyaXN0aWFuLg0KPiA+Pg0KPiA+
Pj4NCj4gPj4+ICAgIAlpZiAobWVtICYmIG1lbS0+bWVtX3R5cGUgIT0gVFRNX1BMX1NZU1RFTSkN
Cj4gPj4+ICAgIAkJZmxhZ3MgfD0gQU1ER1BVX1BURV9WQUxJRDsNCj4gPj4+IEBAIC0xNDQ0LDYg
KzE0NDYsOSBAQCB1aW50NjRfdCBhbWRncHVfdHRtX3R0X3BkZV9mbGFncyhzdHJ1Y3QNCj4gdHRt
X3R0ICp0dG0sIHN0cnVjdCB0dG1fbWVtX3JlZyAqbWVtKQ0KPiA+Pj4gICAgCQlpZiAodHRtLT5j
YWNoaW5nX3N0YXRlID09IHR0X2NhY2hlZCkNCj4gPj4+ICAgIAkJCWZsYWdzIHw9IEFNREdQVV9Q
VEVfU05PT1BFRDsNCj4gPj4+ICAgIAl9DQo+ID4+PiArCWlmIChhbWRncHVfYm9fZW5jcnlwdGVk
KGFibykpIHsNCj4gPj4+ICsJCWZsYWdzIHw9IEFNREdQVV9QVEVfVE1aOw0KPiA+Pj4gKwl9DQo+
ID4+Pg0KPiA+Pj4gICAgCXJldHVybiBmbGFnczsNCj4gPj4+ICAgIH0NCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
