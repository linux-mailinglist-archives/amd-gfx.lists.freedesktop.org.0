Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D85E6D97E
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 05:51:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFD46E48B;
	Fri, 19 Jul 2019 03:51:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810078.outbound.protection.outlook.com [40.107.81.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473866E48B
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 03:51:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEqHrV+D4makje5HLTORt1CJFSsGC6f1I9r7xaLFMwCGx9lYE1D5dOfkhYiN3NWJGmR79rAX6+btoly8lGWBVqkJ3It/LEx0zobYtIyz14g/zpQAgwJ0bhnqhYxpsR5JFj7nmL2lxqK/RQX3qxcVr4CMc1KmDbb54/rTwyUDAFfoJv3qV9+tjuNMnHcOZArFjbWdqyM3ENU38RvKfZ4TBrSW1ks0eqQo2Q+N7Age2A5TVgHoIW5kSYslISPBvRgHZq3diqcl/jg7t8Li9MhimbhbLrNoELu1ozdNDl8Bmt8qaljcYZRHeVx5rLe4su2JhHbfhR3PtRNmnfRu2IpVow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VU6W8VuDedEqvVqp4PpwYZjcuQw0JIniXScK6TYX/6I=;
 b=lWx0L4f7FoKgg8kY7GMv3toVBc96hFntT/ZR+I4S53mQIA+fV+ff0/UX+YfjajK4U6KbERsb/6OuIi/eGjZDr0br2k2AkmMSH0iREUW6A1hUKfCnxmYP2duhQMSVz/1Oldza/3VJ1Mdq/0DEmzcDpAIFG0H2/KAh0oPM6QU6ayVx981//fZD4pU35gXtBQjzwPjD2BsrI+4U6/H2aLl6gF8vYYGWyg5Ku2IVMkxiovgLJBdlS15UIgBuvxfercKMhCYOMu6orf5EOSQDEaE4wO3Oya9nKUIG4gLAfO5LlHO0m83Gn0MUZSBlZlnFBQXf29OZLMlG0DhwjSKLYAbR/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Fri, 19 Jul 2019 03:51:23 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 03:51:23 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: custom peak clock freq for navi10
Thread-Topic: [PATCH] drm/amd/powerplay: custom peak clock freq for navi10
Thread-Index: AQHVPeRrrwjCEvFq1k2763SRVfn3ZabRTpJw
Date: Fri, 19 Jul 2019 03:51:23 +0000
Message-ID: <MN2PR12MB3309F47F9C77CEA3A643D56CECCB0@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190719034517.25780-1-kevin1.wang@amd.com>
In-Reply-To: <20190719034517.25780-1-kevin1.wang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ef02be6-5ca8-4e08-fcb5-08d70bfc5e13
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3536; 
x-ms-traffictypediagnostic: MN2PR12MB3536:
x-microsoft-antispam-prvs: <MN2PR12MB35361971286E14F456FB34F3ECCB0@MN2PR12MB3536.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:466;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(13464003)(189003)(199004)(3846002)(52536014)(66556008)(66446008)(66946007)(76116006)(64756008)(81156014)(186003)(81166006)(2906002)(6116002)(66476007)(71200400001)(71190400001)(53546011)(7696005)(6506007)(26005)(229853002)(5660300002)(102836004)(2501003)(76176011)(74316002)(86362001)(446003)(33656002)(11346002)(316002)(68736007)(53936002)(6246003)(478600001)(476003)(486006)(305945005)(7736002)(4326008)(6436002)(9686003)(55016002)(66066001)(256004)(14444005)(110136005)(8936002)(14454004)(54906003)(99286004)(8676002)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3536;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oT1OpS1FDYhvUnGrpLmvFBuZCcBo1qnNZj2SdeyBJloObt5fo3uR2FQK50mYd94bgBekAYWXR4YtxbPjvguiuyG0rz5gH9mxoqrvJhwBBgCgSQv7oGAON7h0zUYWz3rKHu2ORUW0JJWZU3mb8tUXHUTFB2ImcKu6TxyHEjB9TODC+ToxIXd5JwW5jU1PMiMUyR7ViOQP690hBKnzYb4txus50XisHH9sufNd25FqozfkHjgWhePdG0H92gkk2FC3e0FSvGB1lv6AVHoRC7RiuoTmtusqVp0oQfXJ6MG1d+FzmROaVER6VerjZPN0JcCbJhCvmHn+UCQqB/4MK29958aTly6F4RGPKWfihvAQE705zCK7at4PrTs7zl2OfxfXtxF1WUcwXrhfu+1m3YZD/1rbvCOw5J2HD2OlkhR3opk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef02be6-5ca8-4e08-fcb5-08d70bfc5e13
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 03:51:23.2637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruihuang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3536
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VU6W8VuDedEqvVqp4PpwYZjcuQw0JIniXScK6TYX/6I=;
 b=oo2h1gskt3syCDVyqIjwOZY1FbOKVUgvTJckGy0ZjsMkJTi+nxZjEsdBUDJSG+lo9vYZjOUS7PkFMUMUno83bEddFjMfa+QY03Q6CybjX9o+xEar3cUVtUsrHQg3moZ3pzsMFv52Km9p+lWduRX9nTAvonu5MefVxsZY+CoB8ds=
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>, "Gui, Jack" <Jack.Gui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdhbmcsIEtldmluKFlhbmcpIDxL
ZXZpbjEuV2FuZ0BhbWQuY29tPgo+IFNlbnQ6IEZyaWRheSwgSnVseSAxOSwgMjAxOSAxMTo0NiBB
TQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBGZW5nLCBLZW5uZXRo
IDxLZW5uZXRoLkZlbmdAYW1kLmNvbT47IFF1YW4sIEV2YW4KPiA8RXZhbi5RdWFuQGFtZC5jb20+
OyBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IFh1LCBGZWlmZWkKPiA8RmVpZmVpLlh1
QGFtZC5jb20+OyBHdWksIEphY2sgPEphY2suR3VpQGFtZC5jb20+OyBXYW5nLCBLZXZpbihZYW5n
KQo+IDxLZXZpbjEuV2FuZ0BhbWQuY29tPgo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZC9wb3dl
cnBsYXk6IGN1c3RvbSBwZWFrIGNsb2NrIGZyZXEgZm9yIG5hdmkxMAo+IAo+IDEuTkFWSTEwX1BF
QUtfU0NMS19YVFggICAgMTgzMCBNaHoKPiAyLk5BVkkxMF9QRUFLX1NDTEtfWFQgICAgIDE3NTUg
TWh6Cj4gMy5OQVZJMTBfUEVBS19TQ0xLX1hMICAgICAxNjI1IE1oego+IAo+IENoYW5nZS1JZDog
STQ4ODYzYTlkMGUyNjFiOWU3Nzc4YTZjMGU0YTg3NjJkN2M5NzhkYTYKPiBTaWduZWQtb2ZmLWJ5
OiBLZXZpbiBXYW5nIDxrZXZpbjEud2FuZ0BhbWQuY29tPgoKUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1
aSA8cmF5Lmh1YW5nQGFtZC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9hbWRncHVfc211LmMgICAgfCA2NSArKysrKysrKysrLS0tLS0tLS0tCj4gIC4uLi9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCAgICB8ICA0ICsrCj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyAgICB8IDU1ICsrKysrKysrKysrKysr
KysKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5oICAgIHwgIDQg
KysKPiAgNCBmaWxlcyBjaGFuZ2VkLCA5NyBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3Nt
dS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKPiBpbmRl
eCA3ZjUxYmJkMmFjOTAuLmFiMzg5ZGRlOTU2MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9hbWRncHVfc211LmMKPiBAQCAtMTM2MCwzNyArMTM2MCw0MCBAQCBpbnQgc211
X2FkanVzdF9wb3dlcl9zdGF0ZV9keW5hbWljKHN0cnVjdAo+IHNtdV9jb250ZXh0ICpzbXUsCj4g
IAl9Cj4gCj4gIAlpZiAoc211X2RwbV9jdHgtPmRwbV9sZXZlbCAhPSBsZXZlbCkgewo+IC0JCXN3
aXRjaCAobGV2ZWwpIHsKPiAtCQljYXNlIEFNRF9EUE1fRk9SQ0VEX0xFVkVMX0hJR0g6Cj4gLQkJ
CXJldCA9IHNtdV9mb3JjZV9kcG1fbGltaXRfdmFsdWUoc211LCB0cnVlKTsKPiAtCQkJYnJlYWs7
Cj4gLQkJY2FzZSBBTURfRFBNX0ZPUkNFRF9MRVZFTF9MT1c6Cj4gLQkJCXJldCA9IHNtdV9mb3Jj
ZV9kcG1fbGltaXRfdmFsdWUoc211LCBmYWxzZSk7Cj4gLQkJCWJyZWFrOwo+IC0KPiAtCQljYXNl
IEFNRF9EUE1fRk9SQ0VEX0xFVkVMX0FVVE86Cj4gLQkJY2FzZSBBTURfRFBNX0ZPUkNFRF9MRVZF
TF9QUk9GSUxFX1NUQU5EQVJEOgo+IC0JCQlyZXQgPSBzbXVfdW5mb3JjZV9kcG1fbGV2ZWxzKHNt
dSk7Cj4gLQkJCWJyZWFrOwo+IC0KPiAtCQljYXNlIEFNRF9EUE1fRk9SQ0VEX0xFVkVMX1BST0ZJ
TEVfTUlOX1NDTEs6Cj4gLQkJY2FzZSBBTURfRFBNX0ZPUkNFRF9MRVZFTF9QUk9GSUxFX01JTl9N
Q0xLOgo+IC0JCWNhc2UgQU1EX0RQTV9GT1JDRURfTEVWRUxfUFJPRklMRV9QRUFLOgo+IC0JCQly
ZXQgPSBzbXVfZ2V0X3Byb2ZpbGluZ19jbGtfbWFzayhzbXUsIGxldmVsLAo+IC0JCQkJCQkJICZz
Y2xrX21hc2ssCj4gLQkJCQkJCQkgJm1jbGtfbWFzaywKPiAtCQkJCQkJCSAmc29jX21hc2spOwo+
IC0JCQlpZiAocmV0KQo+IC0JCQkJcmV0dXJuIHJldDsKPiAtCQkJc211X2ZvcmNlX2Nsa19sZXZl
bHMoc211LCBTTVVfU0NMSywgMSA8PAo+IHNjbGtfbWFzayk7Cj4gLQkJCXNtdV9mb3JjZV9jbGtf
bGV2ZWxzKHNtdSwgU01VX01DTEssIDEgPDwKPiBtY2xrX21hc2spOwo+IC0JCQlzbXVfZm9yY2Vf
Y2xrX2xldmVscyhzbXUsIFNNVV9TT0NDTEssIDEgPDwKPiBzb2NfbWFzayk7Cj4gLQkJCWJyZWFr
Owo+IC0KPiAtCQljYXNlIEFNRF9EUE1fRk9SQ0VEX0xFVkVMX01BTlVBTDoKPiAtCQljYXNlIEFN
RF9EUE1fRk9SQ0VEX0xFVkVMX1BST0ZJTEVfRVhJVDoKPiAtCQlkZWZhdWx0Ogo+IC0JCQlicmVh
azsKPiArCQlyZXQgPSBzbXVfc2V0X3BlcmZvcm1hbmNlX2xldmVsKHNtdSwgbGV2ZWwpOwo+ICsJ
CWlmIChyZXQpIHsKPiArCQkJc3dpdGNoIChsZXZlbCkgewo+ICsJCQljYXNlIEFNRF9EUE1fRk9S
Q0VEX0xFVkVMX0hJR0g6Cj4gKwkJCQlyZXQgPSBzbXVfZm9yY2VfZHBtX2xpbWl0X3ZhbHVlKHNt
dSwgdHJ1ZSk7Cj4gKwkJCQlicmVhazsKPiArCQkJY2FzZSBBTURfRFBNX0ZPUkNFRF9MRVZFTF9M
T1c6Cj4gKwkJCQlyZXQgPSBzbXVfZm9yY2VfZHBtX2xpbWl0X3ZhbHVlKHNtdSwgZmFsc2UpOwo+
ICsJCQkJYnJlYWs7Cj4gKwo+ICsJCQljYXNlIEFNRF9EUE1fRk9SQ0VEX0xFVkVMX0FVVE86Cj4g
KwkJCWNhc2UKPiBBTURfRFBNX0ZPUkNFRF9MRVZFTF9QUk9GSUxFX1NUQU5EQVJEOgo+ICsJCQkJ
cmV0ID0gc211X3VuZm9yY2VfZHBtX2xldmVscyhzbXUpOwo+ICsJCQkJYnJlYWs7Cj4gKwo+ICsJ
CQljYXNlCj4gQU1EX0RQTV9GT1JDRURfTEVWRUxfUFJPRklMRV9NSU5fU0NMSzoKPiArCQkJY2Fz
ZQo+IEFNRF9EUE1fRk9SQ0VEX0xFVkVMX1BST0ZJTEVfTUlOX01DTEs6Cj4gKwkJCWNhc2UgQU1E
X0RQTV9GT1JDRURfTEVWRUxfUFJPRklMRV9QRUFLOgo+ICsJCQkJcmV0ID0gc211X2dldF9wcm9m
aWxpbmdfY2xrX21hc2soc211LCBsZXZlbCwKPiArCQkJCQkJCQkgJnNjbGtfbWFzaywKPiArCQkJ
CQkJCQkgJm1jbGtfbWFzaywKPiArCQkJCQkJCQkgJnNvY19tYXNrKTsKPiArCQkJCWlmIChyZXQp
Cj4gKwkJCQkJcmV0dXJuIHJldDsKPiArCQkJCXNtdV9mb3JjZV9jbGtfbGV2ZWxzKHNtdSwgU01V
X1NDTEssIDEgPDwKPiBzY2xrX21hc2spOwo+ICsJCQkJc211X2ZvcmNlX2Nsa19sZXZlbHMoc211
LCBTTVVfTUNMSywgMSA8PAo+IG1jbGtfbWFzayk7Cj4gKwkJCQlzbXVfZm9yY2VfY2xrX2xldmVs
cyhzbXUsIFNNVV9TT0NDTEssIDEKPiA8PCBzb2NfbWFzayk7Cj4gKwkJCQlicmVhazsKPiArCj4g
KwkJCWNhc2UgQU1EX0RQTV9GT1JDRURfTEVWRUxfTUFOVUFMOgo+ICsJCQljYXNlIEFNRF9EUE1f
Rk9SQ0VEX0xFVkVMX1BST0ZJTEVfRVhJVDoKPiArCQkJZGVmYXVsdDoKPiArCQkJCWJyZWFrOwo+
ICsJCQl9Cj4gIAkJfQo+IAo+ICAJCWlmICghcmV0KQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCj4gYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCj4gaW5kZXggNTE0ZDMxNTE4ODUzLi5iYTVk
ZGFmY2JkYmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5j
L2FtZGdwdV9zbXUuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9h
bWRncHVfc211LmgKPiBAQCAtNjMxLDYgKzYzMSw3IEBAIHN0cnVjdCBwcHRhYmxlX2Z1bmNzIHsK
PiAgCWludCAoKmdldF90aGVybWFsX3RlbXBlcmF0dXJlX3JhbmdlKShzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwKPiBzdHJ1Y3Qgc211X3RlbXBlcmF0dXJlX3JhbmdlICpyYW5nZSk7Cj4gIAlpbnQg
KCpnZXRfdWNsa19kcG1fc3RhdGVzKShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgdWludDMyX3QK
PiAqY2xvY2tzX2luX2toeiwgdWludDMyX3QgKm51bV9zdGF0ZXMpOwo+ICAJaW50ICgqc2V0X2Rl
ZmF1bHRfb2Rfc2V0dGluZ3MpKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBib29sCj4gaW5pdGlh
bGl6ZSk7Cj4gKwlpbnQgKCpzZXRfcGVyZm9ybWFuY2VfbGV2ZWwpKHN0cnVjdCBzbXVfY29udGV4
dCAqc211LCBpbnQzMl90IGxldmVsKTsKPiAgfTsKPiAKPiAgc3RydWN0IHNtdV9mdW5jcwo+IEBA
IC05MjgsNiArOTI5LDkgQEAgc3RydWN0IHNtdV9mdW5jcwo+ICAJKChzbXUpLT5mdW5jcy0+YmFj
b19nZXRfc3RhdGU/IChzbXUpLT5mdW5jcy0KPiA+YmFjb19nZXRfc3RhdGUoKHNtdSksIChzdGF0
ZSkpIDogMCkgICNkZWZpbmUgc211X2JhY29fcmVzZXQoc211KSBcCj4gIAkoKHNtdSktPmZ1bmNz
LT5iYWNvX3Jlc2V0PyAoc211KS0+ZnVuY3MtPmJhY29fcmVzZXQoKHNtdSkpIDogMCkKPiArI2Rl
ZmluZSBzbXVfc2V0X3BlcmZvcm1hbmNlX2xldmVsKHNtdSwgbGV2ZWwpIFwKPiArCSgoc211KS0+
cHB0X2Z1bmNzLT5zZXRfcGVyZm9ybWFuY2VfbGV2ZWw/Cj4gKyhzbXUpLT5wcHRfZnVuY3MtPnNl
dF9wZXJmb3JtYW5jZV9sZXZlbCgoc211KSwgKGxldmVsKSkgOiAtRUlOVkFMKTsKPiArCj4gCj4g
IGV4dGVybiBpbnQgc211X2dldF9hdG9tX2RhdGFfdGFibGUoc3RydWN0IHNtdV9jb250ZXh0ICpz
bXUsIHVpbnQzMl90Cj4gdGFibGUsCj4gIAkJCQkgICB1aW50MTZfdCAqc2l6ZSwgdWludDhfdCAq
ZnJldiwgdWludDhfdCAqY3JldiwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvbmF2aTEwX3BwdC5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9u
YXZpMTBfcHB0LmMKPiBpbmRleCBlNDQwNDFhMjVlNjQuLjkwMjRkOTE0NzdmMCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKPiBAQCAtMTU5MCw2ICsx
NTkwLDYwIEBAIHN0YXRpYyBpbnQgbmF2aTEwX3NldF9wcGZlYXR1cmVfc3RhdHVzKHN0cnVjdAo+
IHNtdV9jb250ZXh0ICpzbXUsCj4gIAlyZXR1cm4gMDsKPiAgfQo+IAo+ICtzdGF0aWMgaW50IG5h
dmkxMF9zZXRfcGVha19jbG9ja19ieV9kZXZpY2Uoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpIHsK
PiArCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gc211LT5hZGV2Owo+ICsJaW50IHJldCA9
IDA7Cj4gKwl1aW50MzJfdCBzY2xrX2ZyZXEgPSAwLCB1Y2xrX2ZyZXEgPSAwOwo+ICsJdWludDMy
X3QgdWNsa19sZXZlbCA9IDA7Cj4gKwo+ICsJc3dpdGNoIChhZGV2LT5yZXZfaWQpIHsKPiArCWNh
c2UgMHhmMDogLyogWFRYICovCj4gKwljYXNlIDB4QzA6Cj4gKwkJc2Nsa19mcmVxID0gTkFWSTEw
X1BFQUtfU0NMS19YVFg7Cj4gKwkJYnJlYWs7Cj4gKwljYXNlIDB4ZjE6IC8qIFhUICovCj4gKwlj
YXNlIDB4QzE6Cj4gKwkJc2Nsa19mcmVxID0gTkFWSTEwX1BFQUtfU0NMS19YVDsKPiArCQlicmVh
azsKPiArCWRlZmF1bHQ6IC8qIFhMICovCj4gKwkJc2Nsa19mcmVxID0gTkFWSTEwX1BFQUtfU0NM
S19YTDsKPiArCQlicmVhazsKPiArCX0KPiArCj4gKwlyZXQgPSBzbXVfZ2V0X2RwbV9sZXZlbF9j
b3VudChzbXUsIFNNVV9VQ0xLLCAmdWNsa19sZXZlbCk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVy
biByZXQ7Cj4gKwlyZXQgPSBzbXVfZ2V0X2RwbV9mcmVxX2J5X2luZGV4KHNtdSwgU01VX1VDTEss
IHVjbGtfbGV2ZWwgLSAxLAo+ICZ1Y2xrX2ZyZXEpOwo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm4g
cmV0Owo+ICsKPiArCXJldCA9IHNtdV9zZXRfc29mdF9mcmVxX3JhbmdlKHNtdSwgU01VX1NDTEss
IHNjbGtfZnJlcSwgc2Nsa19mcmVxKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiAr
CXJldCA9IHNtdV9zZXRfc29mdF9mcmVxX3JhbmdlKHNtdSwgU01VX1VDTEssIHVjbGtfZnJlcSwK
PiB1Y2xrX2ZyZXEpOwo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm4gcmV0Owo+ICsKPiArCXJldHVy
biByZXQ7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgbmF2aTEwX3NldF9wZXJmb3JtYW5jZV9sZXZl
bChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKPiAraW50MzJfdCBsZXZlbCkgewo+ICsJaW50IHJl
dCA9IDA7Cj4gKwo+ICsJc3dpdGNoIChsZXZlbCkgewo+ICsJY2FzZSBBTURfRFBNX0ZPUkNFRF9M
RVZFTF9QUk9GSUxFX1BFQUs6Cj4gKwkJcmV0ID0gbmF2aTEwX3NldF9wZWFrX2Nsb2NrX2J5X2Rl
dmljZShzbXUpOwo+ICsJCWJyZWFrOwo+ICsJZGVmYXVsdDoKPiArCQlyZXQgPSAtRUlOVkFMOwo+
ICsJCWJyZWFrOwo+ICsJfQo+ICsKPiArCXJldHVybiByZXQ7Cj4gK30KPiArCj4gIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyBuYXZpMTBfcHB0X2Z1bmNzID0gewo+ICAJLnRhYmxl
c19pbml0ID0gbmF2aTEwX3RhYmxlc19pbml0LAo+ICAJLmFsbG9jX2RwbV9jb250ZXh0ID0gbmF2
aTEwX2FsbG9jYXRlX2RwbV9jb250ZXh0LCBAQCAtMTYyNSw2Cj4gKzE2NzksNyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgbmF2aTEwX3BwdF9mdW5jcyA9IHsKPiAgCS5nZXRf
dWNsa19kcG1fc3RhdGVzID0gbmF2aTEwX2dldF91Y2xrX2RwbV9zdGF0ZXMsCj4gIAkuZ2V0X3Bw
ZmVhdHVyZV9zdGF0dXMgPSBuYXZpMTBfZ2V0X3BwZmVhdHVyZV9zdGF0dXMsCj4gIAkuc2V0X3Bw
ZmVhdHVyZV9zdGF0dXMgPSBuYXZpMTBfc2V0X3BwZmVhdHVyZV9zdGF0dXMsCj4gKwkuc2V0X3Bl
cmZvcm1hbmNlX2xldmVsID0gbmF2aTEwX3NldF9wZXJmb3JtYW5jZV9sZXZlbCwKPiAgfTsKPiAK
PiAgdm9pZCBuYXZpMTBfc2V0X3BwdF9mdW5jcyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkgZGlm
ZiAtLWdpdAo+IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5oCj4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmgKPiBpbmRleCA5NTcy
ODhlMjJmNDcuLjYyMGZmMTdjMmZlZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9uYXZpMTBfcHB0LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9uYXZpMTBfcHB0LmgKPiBAQCAtMjMsNiArMjMsMTAgQEAKPiAgI2lmbmRlZiBfX05BVkkx
MF9QUFRfSF9fCj4gICNkZWZpbmUgX19OQVZJMTBfUFBUX0hfXwo+IAo+ICsjZGVmaW5lIE5BVkkx
MF9QRUFLX1NDTEtfWFRYCQkoMTgzMCkKPiArI2RlZmluZSBOQVZJMTBfUEVBS19TQ0xLX1hUICAJ
CSgxNzU1KQo+ICsjZGVmaW5lIE5BVkkxMF9QRUFLX1NDTEtfWEwgIAkJKDE2MjUpCj4gKwo+ICBl
eHRlcm4gdm9pZCBuYXZpMTBfc2V0X3BwdF9mdW5jcyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSk7
Cj4gCj4gICNlbmRpZgo+IC0tCj4gMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
