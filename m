Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECF9EF851
	for <lists+amd-gfx@lfdr.de>; Tue,  5 Nov 2019 10:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA8D89483;
	Tue,  5 Nov 2019 09:13:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820050.outbound.protection.outlook.com [40.107.82.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE1589483
 for <amd-gfx@lists.freedesktop.org>; Tue,  5 Nov 2019 09:13:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adkAFb4p3Ep7+Vi/mGXxf6G7ejkmWyv7tr1rBD8l6TESgQ2iiSK3+ZDGHA+rhvR5uYekydoFSXWFBAqo/3vQwc4wEGo/FVKxiZ2x31V6ZDKIdfjPCX55NJF2BrN4mHtNdkT0DhySLjGJ/YOW/IPm4pZ/M5H8YidmVrYbWLu6y70xvdptt2M1fb3pnH2G6CnIXlT128BdARYksOFYnnKd3B6t3EretPEU3AOVYTktA2eldKNcc7I1zoqGlCaFJYhrG11vBijt444PaoIPr2sPatApbCKglIMxOnp7Tm6M8Uv+dK2UxmFatIFdj+VQWd448R2wTbSX2RWoWsJcsOWDAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgJbDEkr0/yWYiI6WBfQ16+GFh6svBYVt/Pxw0BCYC8=;
 b=EWuv1OxMMMrvhOl81zURdmxGaIvBmBth//HRx53SAov0QzIXZS7cQycwq9qblazWTEuKwBXF86/Q/dHu5KAkbZ9L0vBzJLlc+LbUqIoQUCvO+GBXVXEsUYCeX+HxYJI99/NpKa27XHMs6O+gG5kt3ApbGp8DdZ9XJaF+OaercjNyPoKAj3QrwpBxOvu8dDq5XW761AharLp5VP26SvOkrzIB8t3NAt2K6E4kgFlaFxFWxTUlmPakObWDryCb1cBfPDXkNJ85aadcDkY6Zb9Qe3FdSluM6mx6vreIFGjnHyuUrOBbJhW9RFcA/k3LPSGdxHfXiyuwZlI7n7klppmJJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2517.namprd12.prod.outlook.com (52.132.208.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Tue, 5 Nov 2019 09:13:19 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933%7]) with mapi id 15.20.2408.024; Tue, 5 Nov 2019
 09:13:19 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Zhu, Changfeng" <Changfeng.Zhu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Tuikov, Luben" <Luben.Tuikov@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>, "Huang, Shimmer" <Xinmei.Huang@amd.com>
Subject: Re: [PATCH] drm/amdgpu: add dummy read by engines for some GCVM
 status registers
Thread-Topic: [PATCH] drm/amdgpu: add dummy read by engines for some GCVM
 status registers
Thread-Index: AQHVk6LYILHuIniMyk+NMjNGBGRSLad8SziA
Date: Tue, 5 Nov 2019 09:13:19 +0000
Message-ID: <ee976d12-bed0-a3b2-92da-2c8d63cdf90a@amd.com>
References: <20191105063228.28185-1-changfeng.zhu@amd.com>
In-Reply-To: <20191105063228.28185-1-changfeng.zhu@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR10CA0021.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::31) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 41ed20cc-5cac-422c-21b3-08d761d065e3
x-ms-traffictypediagnostic: DM5PR12MB2517:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB25177A18AA01C92467793D04837E0@DM5PR12MB2517.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0212BDE3BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(199004)(189003)(71200400001)(7736002)(65806001)(65956001)(6512007)(6436002)(25786009)(229853002)(14444005)(46003)(31686004)(5660300002)(11346002)(256004)(476003)(6486002)(81156014)(8676002)(66476007)(8936002)(66556008)(66446008)(64756008)(386003)(66946007)(6116002)(81166006)(446003)(305945005)(6636002)(2501003)(52116002)(36756003)(86362001)(76176011)(486006)(6246003)(58126008)(2906002)(71190400001)(14454004)(99286004)(2616005)(478600001)(186003)(102836004)(316002)(6506007)(31696002)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2517;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: slvJeHu250PxQmXzPgxG7y8K3hCQUTfC1O/82qOdPLWMHRGuU1pIi2WWZQ8WsCfHaH1PwUomCJlONfNv84CMlABs3CpAYudKUi185hoAenxNQe92V9e4ypxOsIeXh0+groy4OoBkzMAX7Or6+B5rM5JO2QVioBUgjX3BGfwDIzP3fhz2FsIv7aMzlOg0f6oYuattD6igt6wgOouY45RVf3knQWqYhVWqTW++aG75l7WqhU3KpZsBz/C/SJ5TWXD3wgjkYVAcA8oJrjKODDiHPAKYACD5/W3cDc05uXNZ5ctaV6oonuB3EGe9GehWefVDd6Wj8kLvW6QR5QFFKB4W9+7WYDFAT6kVU++ySp65pRhoIA3s745yWbP+5OF5ZX7p42Zg8rHFKeHP+UPjny6gOKFB9DN7AUIcMB358Byg9qZqi3TuhUxHbC4e9mj+pNWb
Content-ID: <C007E90DF7760D4ABBE3722A99495114@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ed20cc-5cac-422c-21b3-08d761d065e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2019 09:13:19.0578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x5XwMs4F/ugCxmb4FJ3yhFv7y3PDriw5y1WgVyGlPzGTz+TFcjqUKGQFSgtKM1K6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2517
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgJbDEkr0/yWYiI6WBfQ16+GFh6svBYVt/Pxw0BCYC8=;
 b=mF/kV3EnGCmtflLTXfvxGymS50kxs8lwdTJjnVfdzEPzYXPW0pQU46LwHG6RkxVPj6+DLbvokw/ZxdiFlJt99gUpZ/zHroIyOwMkj4kqH/0KBS3AnVwz6s8de5Z9igbHe+4lqSm/s4bTeBEjaS3Y/bxgjaP9v2j14ldIHEQwbwo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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

QW0gMDUuMTEuMTkgdW0gMDc6MzIgc2NocmllYiBaaHUsIENoYW5nZmVuZzoNCj4gRnJvbTogY2hh
bmd6aHUgPENoYW5nZmVuZy5aaHVAYW1kLmNvbT4NCj4NCj4gVGhlIEdSQk0gcmVnaXN0ZXIgaW50
ZXJmYWNlIGlzIG5vdyBjYXBhYmxlIG9mIGJ1cnN0aW5nIDEgY3ljbGUgcGVyDQo+IHJlZ2lzdGVy
IHdyLT53ciwgd3ItPnJkIG11Y2ggZmFzdGVyIHRoYW4gcHJldmlvdXMgbXV0aWN5Y2xlIHBlcg0K
PiB0cmFuc2FjdGlvbiBkb25lIGludGVyZmFjZS4gIFRoaXMgaGFzIGNhdXNlZCBhIHByb2JsZW0g
d2hlcmUNCj4gc3RhdHVzIHJlZ2lzdGVycyByZXF1aXJpbmcgSFcgdG8gdXBkYXRlIGhhdmUgYSAx
IGN5Y2xlIGRlbGF5LCBkdWUNCj4gdG8gdGhlIHJlZ2lzdGVyIHVwZGF0ZSBoYXZpbmcgdG8gZ28g
dGhyb3VnaCBHUkJNLg0KPg0KPiBGb3IgY3AgdWNvZGUsIGl0IGhhcyByZWFsaXplZCBkdW1teSBy
ZWFkIGluIGNwIGZpcm13YXJlLkl0IGNvdmVycw0KPiB0aGUgdXNlIG9mIFdBSVRfUkVHX01FTSBv
cGVyYXRpb24gMSBjYXNlIG9ubHkuU28gaXQgbmVlZHMgdG8gY2FsbA0KPiBnZnhfdjEwXzBfd2Fp
dF9yZWdfbWVtIGluIGdmeDEwLiBCZXNpZGVzIGl0IGFsc28gbmVlZHMgdG8gYWRkIHdhcm5pbmcg
dG8NCj4gdXBkYXRlIGZpcm13YXJlIGluIGNhc2UgZmlybXdhcmUgaXMgdG9vIG9sZCB0byBoYXZl
IGZ1bmN0aW9uIHRvIHJlYWxpemUNCj4gZHVtbXkgcmVhZCBpbiBjcCBmaXJtd2FyZS4NCj4NCj4g
Rm9yIHNkbWEgdWNvZGUsIGl0IGhhc24ndCByZWFsaXplZCBkdW1teSByZWFkIGluIHNkbWEgZmly
bXdhcmUuIHNkbWEgaXMNCj4gbW92ZWQgdG8gZ2Z4aHViIGluIGdmeDEwLiBTbyBpdCBuZWVkcyB0
byBhZGQgZHVtbXkgcmVhZCBpbiBkcml2ZXINCj4gYmV0d2VlbiBhbWRncHVfcmluZ19lbWl0X3dy
ZWcgYW5kIGFtZGdwdV9yaW5nX2VtaXRfcmVnX3dhaXQgZm9yIHNkbWFfdjVfMC4NCg0KRmlyc3Qg
b2YgYWxsIHRoYW5rcyBmb3IgZ2V0dGluZyB5b3VyIGVudmlyb25tZW50IHNldHVwIHByb3Blcmx5
LCB3ZSBhcmUgDQpmaW5hbGx5IG1ha2luZyBwcm9ncmVzcyB3aXRoIHRoYXQgaXNzdWUuDQoNCkEg
YnVuY2ggb2YgbmljZSB0byBoYXZlIGNvbW1lbnRzIGJlbG93IGFuZCB0d28gbWFqb3IgYnVncy90
eXBvcyB3aGljaCANCnJlYWxseSBuZWVkcyB0byBiZSBmaXhlZC4NCg0KPg0KPiBDaGFuZ2UtSWQ6
IEllMDI4ZjM3ZWI3ODk5NjZkNDU5Mzk4NGJkNjYxYjI0OGViZWIxYWMzDQo+IFNpZ25lZC1vZmYt
Ynk6IGNoYW5nemh1IDxDaGFuZ2ZlbmcuWmh1QGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguaCB8ICAxICsNCj4gICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyAgfCA1MCArKysrKysrKysrKysrKysrKysrKysrKysr
DQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyAgIHwgIDcgKysrKw0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jICB8ICA4ICsrLS0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYyAgfCAxMyArKysrKystDQo+
ICAgNSBmaWxlcyBjaGFuZ2VkLCA3MyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPg0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5oIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5oDQo+IGluZGV4IDQ1OWFhOTA1
OTU0Mi4uYTc0ZWNkNDQ5Nzc1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZ2Z4LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2dmeC5oDQo+IEBAIC0yNjcsNiArMjY3LDcgQEAgc3RydWN0IGFtZGdwdV9nZnggew0KPiAg
IAl1aW50MzJfdAkJCW1lYzJfZmVhdHVyZV92ZXJzaW9uOw0KPiAgIAlib29sCQkJCW1lY19md193
cml0ZV93YWl0Ow0KPiAgIAlib29sCQkJCW1lX2Z3X3dyaXRlX3dhaXQ7DQo+ICsJYm9vbAkJCQlj
cF9md193cml0ZV93YWl0Ow0KPiAgIAlzdHJ1Y3QgYW1kZ3B1X3JpbmcJCWdmeF9yaW5nW0FNREdQ
VV9NQVhfR0ZYX1JJTkdTXTsNCj4gICAJdW5zaWduZWQJCQludW1fZ2Z4X3JpbmdzOw0KPiAgIAlz
dHJ1Y3QgYW1kZ3B1X3JpbmcJCWNvbXB1dGVfcmluZ1tBTURHUFVfTUFYX0NPTVBVVEVfUklOR1Nd
Ow0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYw0KPiBpbmRleCAxN2E1Y2Jm
ZDAwMjQuLjgxNDc2NDcyM2MyNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3YxMF8wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4
X3YxMF8wLmMNCj4gQEAgLTU2MSw2ICs1NjEsMzIgQEAgc3RhdGljIHZvaWQgZ2Z4X3YxMF8wX2Zy
ZWVfbWljcm9jb2RlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAgIAlrZnJlZShhZGV2
LT5nZngucmxjLnJlZ2lzdGVyX2xpc3RfZm9ybWF0KTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMg
dm9pZCBnZnhfdjEwXzBfY2hlY2tfZndfd3JpdGVfd2FpdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikNCj4gK3sNCj4gKwlhZGV2LT5nZnguY3BfZndfd3JpdGVfd2FpdCA9IGZhbHNlOw0KPiAr
DQo+ICsJc3dpdGNoIChhZGV2LT5hc2ljX3R5cGUpIHsNCj4gKwljYXNlIENISVBfTkFWSTEwOg0K
PiArCWNhc2UgQ0hJUF9OQVZJMTI6DQo+ICsJY2FzZSBDSElQX05BVkkxNDoNCj4gKwkJaWYgKChh
ZGV2LT5nZngubWVfZndfdmVyc2lvbiA+PSAweDAwMDAwMDQ2KSAmJg0KPiArCQkgICAgKGFkZXYt
PmdmeC5tZV9mZWF0dXJlX3ZlcnNpb24gPj0gMjcpICYmDQo+ICsJCSAgICAoYWRldi0+Z2Z4LnBm
cF9md192ZXJzaW9uID49IDB4MDAwMDAwNjgpICYmDQo+ICsJCSAgICAoYWRldi0+Z2Z4LnBmcF9m
ZWF0dXJlX3ZlcnNpb24gPj0gMjcpICYmDQo+ICsJCSAgICAoYWRldi0+Z2Z4Lm1lY19md192ZXJz
aW9uID49IDB4MDAwMDAwNWIpICYmDQo+ICsJCSAgICAoYWRldi0+Z2Z4Lm1lY19mZWF0dXJlX3Zl
cnNpb24gPj0gMjcpKQ0KPiArCQkJYWRldi0+Z2Z4LmNwX2Z3X3dyaXRlX3dhaXQgPSB0cnVlOw0K
PiArCQlicmVhazsNCj4gKwlkZWZhdWx0Og0KPiArCQlicmVhazsNCj4gKwl9DQo+ICsNCj4gKwlp
ZiAoYWRldi0+Z2Z4LmNwX2Z3X3dyaXRlX3dhaXQgPT0gZmFsc2UpDQo+ICsJCURSTV9XQVJOX09O
Q0UoIldhcm5pbmc6IGNoZWNrIGNwX2Z3X3ZlcnNpb24gYW5kIHVwZGF0ZSBpdCB0byByZWFsaXpl
IFwNCj4gKwkJCQkgIEdSQk0gcmVxdWlyZXMgMS1jeWNsZSBkZWxheSBpbiBjcCBmaXJtd2FyZVxu
Iik7DQo+ICt9DQo+ICsNCj4gKw0KPiAgIHN0YXRpYyB2b2lkIGdmeF92MTBfMF9pbml0X3JsY19l
eHRfbWljcm9jb2RlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAgIHsNCj4gICAJY29u
c3Qgc3RydWN0IHJsY19maXJtd2FyZV9oZWFkZXJfdjJfMSAqcmxjX2hkcjsNCj4gQEAgLTQ3Njgs
NiArNDc5NCwyOCBAQCBzdGF0aWMgdm9pZCBnZnhfdjEwXzBfcmluZ19lbWl0X3JlZ193YWl0KHN0
cnVjdCBhbWRncHVfcmluZyAqcmluZywgdWludDMyX3QgcmVnLA0KPiAgIAlnZnhfdjEwXzBfd2Fp
dF9yZWdfbWVtKHJpbmcsIDAsIDAsIDAsIHJlZywgMCwgdmFsLCBtYXNrLCAweDIwKTsNCj4gICB9
DQo+ICAgDQo+ICtzdGF0aWMgdm9pZCBnZnhfdjEwXzBfcmluZ19lbWl0X3JlZ193cml0ZV9yZWdf
d2FpdChzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsDQo+ICsJCQkJCQkgIHVpbnQzMl90IHJlZzAs
IHVpbnQzMl90IHJlZzEsDQo+ICsJCQkJCQkgIHVpbnQzMl90IHJlZiwgdWludDMyX3QgbWFzaykN
Cj4gK3sNCj4gKwlpbnQgdXNlcGZwID0gKHJpbmctPmZ1bmNzLT50eXBlID09IEFNREdQVV9SSU5H
X1RZUEVfR0ZYKTsNCj4gKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHJpbmctPmFkZXY7
DQo+ICsJYm9vbCBmd192ZXJzaW9uX29rID0gZmFsc2U7DQo+ICsNCj4gKwlnZnhfdjEwXzBfY2hl
Y2tfZndfd3JpdGVfd2FpdChhZGV2KTsNCj4gKw0KPiArCWlmIChyaW5nLT5mdW5jcy0+dHlwZSA9
PSBBTURHUFVfUklOR19UWVBFX0dGWCB8fA0KPiArCQlyaW5nLT5mdW5jcy0+dHlwZSA9PSBBTURH
UFVfUklOR19UWVBFX0NPTVBVVEUpDQoNClRoYXQgY2hlY2sgaXMgcHJvYmFibHkgc3VwZXJmbHVv
dXMuIEEgZmV3IGxpbmVzIGJlbG93IHlvdSBhcmUgdXNpbmcgdGhlIA0KZnVuY3Rpb24gaW4gdGhl
IGdmeF92MTBfMF9yaW5nX2Z1bmNzX2dmeCBhbmQgDQpnZnhfdjEwXzBfcmluZ19mdW5jc19jb21w
dXRlLCBzbyB0aGUgcmluZy0+ZnVuY3MtPnR5cGUgaXMgYWx3YXlzIGNvbnN0YW50Lg0KDQo+ICsJ
CWZ3X3ZlcnNpb25fb2sgPSBhZGV2LT5nZnguY3BfZndfd3JpdGVfd2FpdDsNCj4gKw0KPiArCWlm
IChmd192ZXJzaW9uX29rKQ0KPiArCQlnZnhfdjEwXzBfd2FpdF9yZWdfbWVtKHJpbmcsIHVzZXBm
cCwgMCwgMSwgcmVnMCwgcmVnMSwNCj4gKwkJCQkgICAgICByZWYsIG1hc2ssIDB4MjApOw0KPiAr
CWVsc2UNCj4gKwkJYW1kZ3B1X3JpbmdfZW1pdF9yZWdfd3JpdGVfcmVnX3dhaXRfaGVscGVyKHJp
bmcsIHJlZzAsIHJlZzEsDQo+ICsJCQkJCQkJICAgcmVmLCBtYXNrKTsNCj4gK30NCj4gKw0KPiAg
IHN0YXRpYyB2b2lkDQo+ICAgZ2Z4X3YxMF8wX3NldF9nZnhfZW9wX2ludGVycnVwdF9zdGF0ZShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gICAJCQkJICAgICAgdWludDMyX3QgbWUsIHVp
bnQzMl90IHBpcGUsDQo+IEBAIC01MTU4LDYgKzUyMDYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGFtZGdwdV9yaW5nX2Z1bmNzIGdmeF92MTBfMF9yaW5nX2Z1bmNzX2dmeCA9IHsNCj4gICAJLmVt
aXRfdG16ID0gZ2Z4X3YxMF8wX3JpbmdfZW1pdF90bXosDQo+ICAgCS5lbWl0X3dyZWcgPSBnZnhf
djEwXzBfcmluZ19lbWl0X3dyZWcsDQo+ICAgCS5lbWl0X3JlZ193YWl0ID0gZ2Z4X3YxMF8wX3Jp
bmdfZW1pdF9yZWdfd2FpdCwNCj4gKwkuZW1pdF9yZWdfd3JpdGVfcmVnX3dhaXQgPSBnZnhfdjEw
XzBfcmluZ19lbWl0X3JlZ193cml0ZV9yZWdfd2FpdCwNCj4gICB9Ow0KPiAgIA0KPiAgIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3JpbmdfZnVuY3MgZ2Z4X3YxMF8wX3JpbmdfZnVuY3NfY29t
cHV0ZSA9IHsNCj4gQEAgLTUxOTEsNiArNTI0MCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1k
Z3B1X3JpbmdfZnVuY3MgZ2Z4X3YxMF8wX3JpbmdfZnVuY3NfY29tcHV0ZSA9IHsNCj4gICAJLnBh
ZF9pYiA9IGFtZGdwdV9yaW5nX2dlbmVyaWNfcGFkX2liLA0KPiAgIAkuZW1pdF93cmVnID0gZ2Z4
X3YxMF8wX3JpbmdfZW1pdF93cmVnLA0KPiAgIAkuZW1pdF9yZWdfd2FpdCA9IGdmeF92MTBfMF9y
aW5nX2VtaXRfcmVnX3dhaXQsDQo+ICsJLmVtaXRfcmVnX3dyaXRlX3JlZ193YWl0ID0gZ2Z4X3Yx
MF8wX3JpbmdfZW1pdF9yZWdfd3JpdGVfcmVnX3dhaXQsDQo+ICAgfTsNCj4gICANCj4gICBzdGF0
aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9yaW5nX2Z1bmNzIGdmeF92MTBfMF9yaW5nX2Z1bmNzX2tp
cSA9IHsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8w
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+IGluZGV4IDlkNWY5
MDBlM2UxYy4uZjUyZmNiODk1ZDUxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjlfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92OV8wLmMNCj4gQEAgLTk4Miw2ICs5ODIsMTMgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfY2hl
Y2tfZndfd3JpdGVfd2FpdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gICAJYWRldi0+
Z2Z4Lm1lX2Z3X3dyaXRlX3dhaXQgPSBmYWxzZTsNCj4gICAJYWRldi0+Z2Z4Lm1lY19md193cml0
ZV93YWl0ID0gZmFsc2U7DQo+ICAgDQo+ICsJaWYgKChhZGV2LT5nZngubWVjX2Z3X3ZlcnNpb24g
PCAweDAwMDAwMWE1KSB8fA0KPiArCSAgICAoYWRldi0+Z2Z4Lm1lY19mZWF0dXJlX3ZlcnNpb24g
PCA0NikgfHwNCj4gKwkgICAgKGFkZXYtPmdmeC5wZnBfZndfdmVyc2lvbiA8IDB4MDAwMDAwYjcp
IHx8DQo+ICsJICAgIChhZGV2LT5nZngucGZwX2ZlYXR1cmVfdmVyc2lvbiA8IDQ2KSkNCj4gKwkJ
RFJNX1dBUk5fT05DRSgiV2FybmluZzogY2hlY2sgY3BfZndfdmVyc2lvbiBhbmQgdXBkYXRlIGl0
IHRvIHJlYWxpemUgXA0KPiArCQkJCQkgICBHUkJNIHJlcXVpcmVzIDEtY3ljbGUgZGVsYXkgaW4g
Y3AgZmlybXdhcmVcbiIpOw0KPiArDQoNCk5vdCBhIGhhcmQgcmVxdWlyZW1lbnQsIGJ1dCBpdCB3
b3VsZCBiZSBuaWNlIHRvIGhhdmUgdGhpcyBpbiBhIHNlcGFyYXRlIA0KcGF0Y2guIFNvIHRoYXQg
Z2Z4OSBhbmQgZ2Z4MTAgY2hhbmdlcyBhcmUgY2xlYXJseSBzZXBhcmF0ZWQuDQoNCj4gICAJc3dp
dGNoIChhZGV2LT5hc2ljX3R5cGUpIHsNCj4gICAJY2FzZSBDSElQX1ZFR0ExMDoNCj4gICAJCWlm
ICgoYWRldi0+Z2Z4Lm1lX2Z3X3ZlcnNpb24gPj0gMHgwMDAwMDA5YykgJiYNCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMNCj4gaW5kZXggM2IwMGJjZTE0Y2ZiLi45ZmYzZWMx
NTMxZWQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBf
MC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jDQo+IEBA
IC0zNDQsMTEgKzM0NCw5IEBAIHN0YXRpYyB1aW50NjRfdCBnbWNfdjEwXzBfZW1pdF9mbHVzaF9n
cHVfdGxiKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywNCj4gICAJYW1kZ3B1X3JpbmdfZW1pdF93
cmVnKHJpbmcsIGh1Yi0+Y3R4MF9wdGJfYWRkcl9oaTMyICsgKDIgKiB2bWlkKSwNCj4gICAJCQkg
ICAgICB1cHBlcl8zMl9iaXRzKHBkX2FkZHIpKTsNCj4gICANCj4gLQlhbWRncHVfcmluZ19lbWl0
X3dyZWcocmluZywgaHViLT52bV9pbnZfZW5nMF9yZXEgKyBlbmcsIHJlcSk7DQo+IC0NCj4gLQkv
KiB3YWl0IGZvciB0aGUgaW52YWxpZGF0ZSB0byBjb21wbGV0ZSAqLw0KPiAtCWFtZGdwdV9yaW5n
X2VtaXRfcmVnX3dhaXQocmluZywgaHViLT52bV9pbnZfZW5nMF9hY2sgKyBlbmcsDQo+IC0JCQkJ
ICAxIDw8IHZtaWQsIDEgPDwgdm1pZCk7DQo+ICsJYW1kZ3B1X3JpbmdfZW1pdF9yZWdfd3JpdGVf
cmVnX3dhaXQocmluZywgaHViLT52bV9pbnZfZW5nMF9yZXEgKyBlbmcsDQo+ICsJCQkJCQlodWIt
PnZtX2ludl9lbmcwX2FjaywNCg0KVGhhdCByZWdpc3RlciBvZmZzZXQgaXMgd3JvbmchIFRoaXMg
bmVlZHMgdG8gYmUgImh1Yi0+dm1faW52X2VuZzBfYWNrICsgDQplbmciLg0KDQo+ICsJCQkJCQly
ZXEsIDEgPDwgdm1pZCk7DQo+ICAgDQo+ICAgCXJldHVybiBwZF9hZGRyOw0KPiAgIH0NCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMNCj4gaW5kZXggMzQ2MGMwMGYzZWFhLi40
Y2Y4ZTNkMjNjNjAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nk
bWFfdjVfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5j
DQo+IEBAIC0xMTcwLDYgKzExNzAsMTYgQEAgc3RhdGljIHZvaWQgc2RtYV92NV8wX3JpbmdfZW1p
dF9yZWdfd2FpdChzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IHJlZywNCj4gICAJ
CQkgIFNETUFfUEtUX1BPTExfUkVHTUVNX0RXNV9JTlRFUlZBTCgxMCkpOw0KPiAgIH0NCj4gICAN
Cj4gK3N0YXRpYyB2b2lkIHNkbWFfdjVfMF9yaW5nX2VtaXRfcmVnX3dyaXRlX3JlZ193YWl0KHN0
cnVjdCBhbWRncHVfcmluZyAqcmluZywNCj4gKwkJCQkJCQkJCQkJCSB1aW50MzJfdCByZWcwLCB1
aW50MzJfdCByZWcxLA0KPiArCQkJCQkJCQkJCQkJIHVpbnQzMl90IHJlZiwgdWludDMyX3QgbWFz
aykNCj4gK3sNCj4gKwlhbWRncHVfcmluZ19lbWl0X3dyZWcocmluZywgcmVnMCwgcmVmKTsNCj4g
KwkvKiB3YWl0IGZvciBhIGN5Y2xlIHRvIHJlc2V0IHZtX2ludl9lbmcqX2FjayAqLw0KPiArCWFt
ZGdwdV9yaW5nX2VtaXRfcmVnX3dhaXQocmluZywgcmVnMCwgbWFzaywgbWFzayk7DQoNCldlbGws
IHRoYXQncyBleGFjdGx5IHdoYXQgd29uJ3Qgd29yay4gUGxlYXNlIHVzZSB0aGUgZm9sbG93aW5n
IGluc3RlYWQ6DQoNCmFtZGdwdV9yaW5nX2VtaXRfcmVnX3dhaXQocmluZywgcmVnMSwgMCwgMCk7
DQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4uDQoNCj4gKwlhbWRncHVfcmluZ19lbWl0X3JlZ193YWl0
KHJpbmcsIHJlZzEsIG1hc2ssIG1hc2spOw0KPiArfQ0KPiArDQo+ICAgc3RhdGljIGludCBzZG1h
X3Y1XzBfZWFybHlfaW5pdCh2b2lkICpoYW5kbGUpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsNCj4gQEAgLTE1
ODUsNyArMTU5NSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3JpbmdfZnVuY3Mgc2Rt
YV92NV8wX3JpbmdfZnVuY3MgPSB7DQo+ICAgCQk2ICsgLyogc2RtYV92NV8wX3JpbmdfZW1pdF9w
aXBlbGluZV9zeW5jICovDQo+ICAgCQkvKiBzZG1hX3Y1XzBfcmluZ19lbWl0X3ZtX2ZsdXNoICov
DQo+ICAgCQlTT0MxNV9GTFVTSF9HUFVfVExCX05VTV9XUkVHICogMyArDQo+IC0JCVNPQzE1X0ZM
VVNIX0dQVV9UTEJfTlVNX1JFR19XQUlUICogNiArDQo+ICsJCVNPQzE1X0ZMVVNIX0dQVV9UTEJf
TlVNX1JFR19XQUlUICogNiAqIDIgKw0KPiAgIAkJMTAgKyAxMCArIDEwLCAvKiBzZG1hX3Y1XzBf
cmluZ19lbWl0X2ZlbmNlIHgzIGZvciB1c2VyIGZlbmNlLCB2bSBmZW5jZSAqLw0KPiAgIAkuZW1p
dF9pYl9zaXplID0gNyArIDYsIC8qIHNkbWFfdjVfMF9yaW5nX2VtaXRfaWIgKi8NCj4gICAJLmVt
aXRfaWIgPSBzZG1hX3Y1XzBfcmluZ19lbWl0X2liLA0KPiBAQCAtMTU5OSw2ICsxNjA5LDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfcmluZ19mdW5jcyBzZG1hX3Y1XzBfcmluZ19mdW5j
cyA9IHsNCj4gICAJLnBhZF9pYiA9IHNkbWFfdjVfMF9yaW5nX3BhZF9pYiwNCj4gICAJLmVtaXRf
d3JlZyA9IHNkbWFfdjVfMF9yaW5nX2VtaXRfd3JlZywNCj4gICAJLmVtaXRfcmVnX3dhaXQgPSBz
ZG1hX3Y1XzBfcmluZ19lbWl0X3JlZ193YWl0LA0KPiArCS5lbWl0X3JlZ193cml0ZV9yZWdfd2Fp
dCA9IHNkbWFfdjVfMF9yaW5nX2VtaXRfcmVnX3dyaXRlX3JlZ193YWl0LA0KPiAgIAkuaW5pdF9j
b25kX2V4ZWMgPSBzZG1hX3Y1XzBfcmluZ19pbml0X2NvbmRfZXhlYywNCj4gICAJLnBhdGNoX2Nv
bmRfZXhlYyA9IHNkbWFfdjVfMF9yaW5nX3BhdGNoX2NvbmRfZXhlYywNCj4gICAJLnByZWVtcHRf
aWIgPSBzZG1hX3Y1XzBfcmluZ19wcmVlbXB0X2liLA0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
