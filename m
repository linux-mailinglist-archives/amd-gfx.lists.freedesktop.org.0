Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1718731A
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 09:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6516E178;
	Fri,  9 Aug 2019 07:34:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720050.outbound.protection.outlook.com [40.107.72.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3036E178
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 07:34:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nB6Uk05aXICQKgRINdHB4iIlqTIa2Gigrl56YDqgoRmn5I34EgupgIXP6+QiaTeyOqUw6ttJ4VHYVlLmFKB3tbfqEsbZ/eQ+3bkx0f5lji333TMCWp09/Xj2BItkieQci3JRvicW68ayA93O3in8W+uS9fSHRF+K8d08YlO9JecMkDE/OBJy+CwurGY0FlJWs+dt34JiztA8Iq98TLd/Oto36Q7DpbqudD397SyHwnc5tIiQYclva4ZZizpd5EvKbkzwo+N80G/9v8MLU+bib6jlpJZj49i6TygsO+Y0k5+XSqN0fPRnRKE9TdxJOLOwjziw5L/XxawbQ9H82AiX+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7dc4OrqocTz8kIfVFsljTk4bA/eltjTiBvvF8XHFas=;
 b=jEgZQ0dZC/l3uui0tDVHyql2qHuOU8KqTQ6dp3G9sotqCB1kWOWC0RNYbFBttxSi1zSVahG9oreawQ8EZkZ3xpxvPJZfBBxJKQW8g94tjTDoUtcG/IRyJj20WuGXeJsDgxV4KjK8tMxqTxERGVh9VkP+8T77mVHYYDc2Uajmc/35IwRZ2FbjNbqPVVLd8eJBKeBNicfm4wmBrniuKye/zwRDhGqWdtWs59G9YW+vTJkWegcCmVjmyoQyBHs9tqA8ntIKxH6A+xXhi/evvFitBwvUfnsc1/pE35uzFQfc48hbv64zuzRVYcD1aapADwTnzeg2XbbHLYrkq+1raEbULg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3391.namprd12.prod.outlook.com (20.178.240.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Fri, 9 Aug 2019 07:34:37 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::90f0:834e:73ee:76c7]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::90f0:834e:73ee:76c7%5]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 07:34:37 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>
Subject: RE: [PATCH 1/2] drm/amdgpu: implement UMC 64 bits REG operations
Thread-Topic: [PATCH 1/2] drm/amdgpu: implement UMC 64 bits REG operations
Thread-Index: AQHVTmrdC4wxrEEOKUqhHpcJ6WGAYKbyXh4AgAAMLuA=
Date: Fri, 9 Aug 2019 07:34:36 +0000
Message-ID: <MN2PR12MB3054DD48E40857ADD26956FFB0D60@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <20190809042731.30491-1-tao.zhou1@amd.com>
 <fb018011-ec77-19d7-0639-ca67abb597dc@amd.com>
In-Reply-To: <fb018011-ec77-19d7-0639-ca67abb597dc@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ef4889e-9871-4624-d571-08d71c9c07f2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3391; 
x-ms-traffictypediagnostic: MN2PR12MB3391:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3391362A21FA5134822B600FB0D60@MN2PR12MB3391.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(13464003)(189003)(199004)(3846002)(8676002)(81166006)(25786009)(81156014)(8936002)(229853002)(53546011)(476003)(6636002)(76176011)(6116002)(102836004)(5660300002)(33656002)(486006)(6506007)(66066001)(7736002)(305945005)(2501003)(6436002)(446003)(55016002)(9686003)(26005)(2906002)(11346002)(110136005)(316002)(99286004)(186003)(53936002)(14444005)(7696005)(66446008)(14454004)(66556008)(64756008)(66946007)(76116006)(66476007)(478600001)(6246003)(71190400001)(71200400001)(86362001)(256004)(52536014)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3391;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Wmhy1FGseIR95JCo1EKLpr7Zu7M+46eqpjbPEWMBJT9/yYls84fLSSSy9Bhnwfs+xjXUo/9ca5uOO+C6w/ypDCUhij7xUg3ndaokcql191hebX35PgQt2qgSp/rTmWxRXWm6cDZ0l6Hvhs5uGAfAHB0mOHbAio2wKha6jrT0YkKFMpdx+Aq4pDaTPdtxdqj+picIoMAC9KHrHzHAlp9BsIUfZnTVra59OzNCfPuUHnB3HiVvbcGeE0/jSEdnnQ//ajA0X4/vSuxLiBZQKn0Tc+UszprrrSpzn/w5zgvxuGXfgRaJkWgqq0WrRU8G9PAI5sXVGF7MnMVGdiLnRzNL3Az4Rm8y5p4NYQvUx6cnp+k5oFopd8jyUyW6D7bn+BPSgK1TFNVs5FSOtPhZr05SHYRpGKOwqozx9gEw6WULgWY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef4889e-9871-4624-d571-08d71c9c07f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 07:34:36.8815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5N1MTT6bz2DTWzcUhHpCcoYvVvBvpv/+AlfKms82n+xbyNfJ7P7su7uwDbGkjOiz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3391
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7dc4OrqocTz8kIfVFsljTk4bA/eltjTiBvvF8XHFas=;
 b=kM/zxxwzhfPZd/KvAyKgw7wXwWrjjKdnmNpHyHkO3r5g7Chp2tWTHCGUq4v8xplRWjAiWatYA9yHFtDUxy/vhD6099lRngq65/Fuy54bs97Eosg313myPd7oThngMTUwkqdf6KYUrBCsJWDZ/J6CMx0B7AMWsGA33hpFgoQrXMM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS29lbmlnLCBDaHJpc3Rp
YW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NCj4gU2VudDogMjAxOeW5tDjmnIg55pelIDE0
OjQyDQo+IFRvOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnOw0KPiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVy
QGFtZC5jb20+OyBaaGFuZywgSGF3a2luZw0KPiA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIDEvMl0gZHJtL2FtZGdwdTogaW1wbGVtZW50IFVNQyA2NCBiaXRz
IFJFRw0KPiBvcGVyYXRpb25zDQo+IA0KPiBBbSAwOS4wOC4xOSB1bSAwNjoyNyBzY2hyaWViIFRh
byBaaG91Og0KPiA+IGltcGxlbWVudCA2NCBiaXRzIG9wZXJhdGlvbnMgdmlhIDMyIGJpdHMgaW50
ZXJmYWNlDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5j
b20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1j
LmggfCAgOSArKysrKysrKysNCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192
Nl8xLmMgICB8IDEwICsrKysrLS0tLS0NCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV91bWMuaA0KPiA+IGluZGV4IDllZmRkNjYyNzllNS4uYTYxN2RjYzlkMjU3
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMu
aA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuaA0KPiA+
IEBAIC0yMSw2ICsyMSwxNSBAQA0KPiA+ICAgI2lmbmRlZiBfX0FNREdQVV9VTUNfSF9fDQo+ID4g
ICAjZGVmaW5lIF9fQU1ER1BVX1VNQ19IX18NCj4gPg0KPiA+ICsvKiBpbXBsZW1lbnQgNjQgYml0
cyBSRUcgb3BlcmF0aW9ucyB2aWEgMzIgYml0cyBpbnRlcmZhY2UgKi8NCj4gPiArI2RlZmluZSBS
UkVHNjRfVU1DKHJlZykJKFJSRUczMihyZWcpIHwgXA0KPiA+ICsJCQkJKCh1aW50NjRfdClSUkVH
MzIoKHJlZykgKyAxKSA8PCAzMikpDQo+ID4gKyNkZWZpbmUgV1JFRzY0X1VNQyhyZWcsIHYpCVwN
Cj4gDQo+IE1heWJlIGNhbGwgdGhpcyBXUkVHX0xPX0hJIGFuZCBSUkVHX0xPX0hJIHRvIGV4cGxp
Y2l0bHkgbm90ZSB3aGF0IHRoZXkNCj4gYXJlIGRvaW5nLiBUaGlzIHdheSB3ZSBjYW4gcHJvYmFi
bHkga2VlcCB0aGVtIGluIGFtZGdwdS5oIGFzIHdlbGwuDQpbVGFvXSBUaGUgdHdvIG1hY3JvcyBh
cmUgbm9uLWF0b21pYywgcHV0dGluZyB0aGVtIGluIGFtZGdwdS5oIG1heSBsZWFkIHRvIHRoZWly
IGFidXNlIGluIHRoZSBmdXJ0dXJlLg0KDQo+IA0KPiA+ICsJZG8gewlcDQo+ID4gKwkJV1JFRzMy
KChyZWcpLCAodWludDMyX3QpKCh2KSAmIDB4ZmZmZmZmZmYpKTsJXA0KPiA+ICsJCVdSRUczMigo
cmVnKSArIDEsICh1aW50MzJfdCkoKHYpID4+IDMyKSk7CVwNCj4gDQo+IEkgdGhpbmsgSSBub3cg
dW5kZXJzdGFuZCB3aHkgeW91IHdhbnRlZCB0byBoYXZlIHRoaXMgbWFjcm8uDQo+IA0KPiBXZSBo
YXZlIGV4cGxpY2l0IGxvd2VyXzMyX2JpdHMoKSBhbmQgdXBwZXJfMzJfYml0cygpIGZ1bmN0aW9u
cyB0byBhdm9pZCB0aGUNCj4gbWFza2luZyBhbmQgc2hpZnRpbmcgYW5kIG1ha2UgdGhlIGNvZGUg
bW9yZSByZWFkYWJsZS4NCj4gDQo+IEZvciBleGFtcGxlIHNlZSB0aGUgVVZEIGNvZGU6DQo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFdSRUczMl9TT0MxNShVVkQsIDAsDQo+ID4g
bW1VVkRfTE1JX1ZDUFVfQ0FDSEVfNjRCSVRfQkFSX0xPVywNCj4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxvd2VyXzMyX2JpdHMoYWRldi0+dmNuLmdw
dV9hZGRyKSk7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFdSRUczMl9TT0Mx
NShVVkQsIDAsDQo+ID4gbW1VVkRfTE1JX1ZDUFVfQ0FDSEVfNjRCSVRfQkFSX0hJR0gsDQo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1cHBlcl8zMl9i
aXRzKGFkZXYtPnZjbi5ncHVfYWRkcikpOw0KPiANCj4gSSBzdWdnZXN0IHRvIHVzZSB0aG9zZSBp
biB5b3VyIG1hY3JvIGhlcmUgYXMgd2VsbCwgYXBhcnQgZnJvbSB0aGF0IHRoZSBwYXRjaA0KPiBs
b29rcyBnb29kIHRvIG1lLg0KW1Rhb10gT0ssIEknbGwgY2hhbmdlIHRvIHVzZSBsb3dlcl8zMl9i
aXRzKCkgYW5kIHVwcGVyXzMyX2JpdHMoKS4NCg0KPiANCj4gVGhhbmtzIGZvciB0YWtpbmcgY2Fy
ZSBvZiB0aGlzLA0KPiBDaHJpc3RpYW4uDQo+IA0KPiA+ICsJfSB3aGlsZSAoMCkNCj4gPiArDQo+
ID4gICAvKg0KPiA+ICAgICogdm9pZCAoKmZ1bmMpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LCBzdHJ1Y3QgcmFzX2Vycl9kYXRhICplcnJfZGF0YSwNCj4gPiAgICAqCQkJCXVpbnQzMl90IHVt
Y19yZWdfb2Zmc2V0LCB1aW50MzJfdA0KPiBjaGFubmVsX2luZGV4KQ0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jDQo+ID4gYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jDQo+ID4gaW5kZXggNjRkZjM3Yjg2MGRkLi44NTAy
ZTczNmY3MjEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1j
X3Y2XzEuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMN
Cj4gPiBAQCAtMTE2LDcgKzExNiw3IEBAIHN0YXRpYyB2b2lkDQo+ID4gdW1jX3Y2XzFfcXVlcnlf
Y29ycmVjdGFibGVfZXJyb3JfY291bnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ID4N
Cj4gPiAgIAkvKiBjaGVjayBmb3IgU1JBTSBjb3JyZWN0YWJsZSBlcnJvcg0KPiA+ICAgCSAgTUNV
TUNfU1RBVFVTIGlzIGEgNjQgYml0IHJlZ2lzdGVyICovDQo+ID4gLQltY191bWNfc3RhdHVzID0g
UlJFRzY0KG1jX3VtY19zdGF0dXNfYWRkciArIHVtY19yZWdfb2Zmc2V0KTsNCj4gPiArCW1jX3Vt
Y19zdGF0dXMgPSBSUkVHNjRfVU1DKG1jX3VtY19zdGF0dXNfYWRkciArDQo+IHVtY19yZWdfb2Zm
c2V0KTsNCj4gPiAgIAlpZiAoUkVHX0dFVF9GSUVMRChtY191bWNfc3RhdHVzLA0KPiBNQ0FfVU1D
X1VNQzBfTUNVTUNfU1RBVFVTVDAsIEVycm9yQ29kZUV4dCkgPT0gNiAmJg0KPiA+ICAgCSAgICBS
RUdfR0VUX0ZJRUxEKG1jX3VtY19zdGF0dXMsDQo+IE1DQV9VTUNfVU1DMF9NQ1VNQ19TVEFUVVNU
MCwgVmFsKSA9PSAxICYmDQo+ID4gICAJICAgIFJFR19HRVRfRklFTEQobWNfdW1jX3N0YXR1cywN
Cj4gTUNBX1VNQ19VTUMwX01DVU1DX1NUQVRVU1QwLCBDRUNDKQ0KPiA+ID09IDEpIEBAIC0xMzQs
NyArMTM0LDcgQEAgc3RhdGljIHZvaWQNCj4gdW1jX3Y2XzFfcXVlcnJ5X3VuY29ycmVjdGFibGVf
ZXJyb3JfY291bnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYNCj4gPiAgICAgICAgICAgICAg
ICAgICBTT0MxNV9SRUdfT0ZGU0VUKFVNQywgMCwNCj4gPiBtbU1DQV9VTUNfVU1DMF9NQ1VNQ19T
VEFUVVNUMCk7DQo+ID4NCj4gPiAgIAkvKiBjaGVjayB0aGUgTUNVTUNfU1RBVFVTICovDQo+ID4g
LQltY191bWNfc3RhdHVzID0gUlJFRzY0KG1jX3VtY19zdGF0dXNfYWRkciArIHVtY19yZWdfb2Zm
c2V0KTsNCj4gPiArCW1jX3VtY19zdGF0dXMgPSBSUkVHNjRfVU1DKG1jX3VtY19zdGF0dXNfYWRk
ciArDQo+IHVtY19yZWdfb2Zmc2V0KTsNCj4gPiAgIAlpZiAoKFJFR19HRVRfRklFTEQobWNfdW1j
X3N0YXR1cywNCj4gTUNBX1VNQ19VTUMwX01DVU1DX1NUQVRVU1QwLCBWYWwpID09IDEpICYmDQo+
ID4gICAJICAgIChSRUdfR0VUX0ZJRUxEKG1jX3VtY19zdGF0dXMsDQo+IE1DQV9VTUNfVU1DMF9N
Q1VNQ19TVEFUVVNUMCwgRGVmZXJyZWQpID09IDEgfHwNCj4gPiAgIAkgICAgUkVHX0dFVF9GSUVM
RChtY191bWNfc3RhdHVzLA0KPiBNQ0FfVU1DX1VNQzBfTUNVTUNfU1RBVFVTVDAsIFVFQ0MpDQo+
ID4gPT0gMSB8fCBAQCAtMTczLDExICsxNzMsMTEgQEAgc3RhdGljIHZvaWQNCj4gdW1jX3Y2XzFf
cXVlcnlfZXJyb3JfYWRkcmVzcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gPiAgIAkv
KiBza2lwIGVycm9yIGFkZHJlc3MgcHJvY2VzcyBpZiAtRU5PTUVNICovDQo+ID4gICAJaWYgKCFl
cnJfZGF0YS0+ZXJyX2FkZHIpIHsNCj4gPiAgIAkJLyogY2xlYXIgdW1jIHN0YXR1cyAqLw0KPiA+
IC0JCVdSRUc2NChtY191bWNfc3RhdHVzX2FkZHIgKyB1bWNfcmVnX29mZnNldCwgMHgwVUxMKTsN
Cj4gPiArCQlXUkVHNjRfVU1DKG1jX3VtY19zdGF0dXNfYWRkciArIHVtY19yZWdfb2Zmc2V0LA0K
PiAweDBVTEwpOw0KPiA+ICAgCQlyZXR1cm47DQo+ID4gICAJfQ0KPiA+DQo+ID4gLQltY191bWNf
c3RhdHVzID0gUlJFRzY0KG1jX3VtY19zdGF0dXNfYWRkciArIHVtY19yZWdfb2Zmc2V0KTsNCj4g
PiArCW1jX3VtY19zdGF0dXMgPSBSUkVHNjRfVU1DKG1jX3VtY19zdGF0dXNfYWRkciArDQo+IHVt
Y19yZWdfb2Zmc2V0KTsNCj4gPg0KPiA+ICAgCS8qIGNhbGN1bGF0ZSBlcnJvciBhZGRyZXNzIGlm
IHVlL2NlIGVycm9yIGlzIGRldGVjdGVkICovDQo+ID4gICAJaWYgKFJFR19HRVRfRklFTEQobWNf
dW1jX3N0YXR1cywNCj4gTUNBX1VNQ19VTUMwX01DVU1DX1NUQVRVU1QwLCBWYWwpDQo+ID4gPT0g
MSAmJiBAQCAtMjAwLDcgKzIwMCw3IEBAIHN0YXRpYyB2b2lkDQo+IHVtY192Nl8xX3F1ZXJ5X2Vy
cm9yX2FkZHJlc3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ID4gICAJfQ0KPiA+DQo+
ID4gICAJLyogY2xlYXIgdW1jIHN0YXR1cyAqLw0KPiA+IC0JV1JFRzY0KG1jX3VtY19zdGF0dXNf
YWRkciArIHVtY19yZWdfb2Zmc2V0LCAweDBVTEwpOw0KPiA+ICsJV1JFRzY0X1VNQyhtY191bWNf
c3RhdHVzX2FkZHIgKyB1bWNfcmVnX29mZnNldCwgMHgwVUxMKTsNCj4gPiAgIH0NCj4gPg0KPiA+
ICAgc3RhdGljIHZvaWQgdW1jX3Y2XzFfcXVlcnlfcmFzX2Vycm9yX2FkZHJlc3Moc3RydWN0IGFt
ZGdwdV9kZXZpY2UNCj4gPiAqYWRldiwNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
