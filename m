Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81070A4F65
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Sep 2019 08:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD5289BA1;
	Mon,  2 Sep 2019 06:57:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800051.outbound.protection.outlook.com [40.107.80.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D840089BA1
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Sep 2019 06:57:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDQiTE8icC0PDPSrL5LZJh3CrMBYxpfsszvd58wyyZqh8IHYKscIZCbSphtn8cb69B9VWf2dlA46e7j3EfK4RkX21OlvBzgUxK2vjWLF9GRA5XOzWTSvANqsObh2+WGj4gvFwf02phezR00YwtcaSydVwOeQauOmjKgpyzBdAg2X7xl+noxCehaQP17e4e88LR1CEqrwOjsnPqT+c2sEcVG8aYHiQnRFVqlmKbarR9CZXdYI4wFDxUxPkFzdBQR9zmo7feO0DjTs51unNGpQmYkwdK5yprrmR6K6NjH8TtCEcjm1N/xcXSbraIMeYLLRPTTFh9wGGg/Of47H6/9OEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpe6Oquwjmr+Ny8e6e4yrfeVy9rS17Pl11lzoORkHMY=;
 b=WBVj73/wE/y5TZMe35jiBhWvtmJGoN+eVg4HTmkxMTnVowHTdCSEELXqNhd7cMxQ+i+2LriFBBK1CzGdWKfC3PAMXChKwZgXDh6uTl2T4ncizGXK2ZkVm9dUIJb8qbGNXoJiwCni59LjySd1FCKO5G1DlkgU2peVEmDDZf+06NczPJTqb7zjYypweROko3306cmWfI8VEPdVRAtFM8vOqkLPHUFdzAmgw0iz6VZMpnmOl5I3OW5FyZHSrwzQx2XuAn18TrQ/kQ/yCcgGN9SwQxY0xZu4DrjZD9ipa0cKuNXJPHBTWa51O3IT62Twh6Rzee0BL4ACkN7BKBDKHwkWmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1899.namprd12.prod.outlook.com (10.175.91.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Mon, 2 Sep 2019 06:57:23 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2220.022; Mon, 2 Sep 2019
 06:57:23 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/amdgpu: Use optimal mtypes and PTE bits for
 Arcturus
Thread-Topic: [PATCH 4/4] drm/amdgpu: Use optimal mtypes and PTE bits for
 Arcturus
Thread-Index: AQHVXGMAt/Kzb1cSiUGWAryuYKkGfqcUMtqAgAPLsIA=
Date: Mon, 2 Sep 2019 06:57:23 +0000
Message-ID: <bc29e9db-2fa9-e73b-04d0-20bafaa5739f@amd.com>
References: <20190826230355.25007-1-Felix.Kuehling@amd.com>
 <20190826230355.25007-4-Felix.Kuehling@amd.com>
 <f907eff1-a056-aa99-2214-169319461f00@amd.com>
In-Reply-To: <f907eff1-a056-aa99-2214-169319461f00@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0171.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::15) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb0d6ff2-eb6c-42a3-cbbe-08d72f72ce55
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1899; 
x-ms-traffictypediagnostic: DM5PR12MB1899:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1899AC255E17558CC7ACABAF83BE0@DM5PR12MB1899.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(189003)(199004)(65956001)(8936002)(478600001)(446003)(8676002)(305945005)(46003)(31686004)(186003)(2906002)(81156014)(110136005)(76176011)(5660300002)(6486002)(81166006)(229853002)(2501003)(58126008)(7736002)(102836004)(64756008)(66556008)(66476007)(66446008)(25786009)(86362001)(386003)(6506007)(53546011)(66946007)(316002)(6436002)(53936002)(52116002)(4326008)(256004)(14444005)(31696002)(36756003)(14454004)(2616005)(476003)(486006)(6116002)(11346002)(65806001)(6246003)(99286004)(71190400001)(71200400001)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1899;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GsTPl8vuCZJys5CBPHqSW9PTV1ngNYF5UOf3x4deFvdkGcSqhTMuKuCikZpwDAkKrPxnsqoGPI2IzNXxu/uLHMp+1Bz2Tym63DXmX52YSjdLW1PysmGUSZS7DEySGAhz7dn31QuhGwfn9gw4qIPefb5lvoTSP+fc2nhZUCyxAaJCtbCgxOU+UfKs9ElsnE6UF1+qONLzQYk69U5YbusrSO7/DhMe6WobLtFbzHSpfVVme3xl9QFdq89TwNJIvUj+/StLJ2ZxHX44QuhjmnB4dg1SPjuDwCwz5hfWoJPQWu1T/gixnQz46xkaqAiF0gY7bo9h1zMCDdWEpFE6TkangUcohSjBuNk70N+Gpb9lI36ATAXptTXlVPiyvDZl1vyT7MWIpwv+VtLkuDZojjGdP6uJ3pmEzSaH4ATit7QGmFc=
Content-ID: <27BB4F3EC1BE1441A82278A6894DD7CF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0d6ff2-eb6c-42a3-cbbe-08d72f72ce55
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 06:57:23.3489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HV198tDOr9chiGCjRuZf9fn+kdKkwoTJYXQD3iWgs7KEN38IG01XQz+cK+hJozht
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1899
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpe6Oquwjmr+Ny8e6e4yrfeVy9rS17Pl11lzoORkHMY=;
 b=I+h9bgEbNCKYJ64wdKIBKzLOVFVBpDgqhW7Zv/szUbVnQCSVpuDBYYrBqtLImCxtsCm0ad+0FyyM9xl+Jd5n6HbgkWPTQr12Ho15c+K7usqDCRljCnmpo8Mw7bvLVvVQOuOGeFOVxz6q+p0iBjx9f5Fi/r/8QQURphgY/3S9Lvo=
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

WWVhaCwgZ2V0X3B0ZV9mbGFncyB3YXMgcmVhbGx5IGFkZGVkIGluIHRoZSB3cm9uZyBwbGFjZS4g
V2Ugc2hvdWxkIGhhdmUgDQpyYXRoZXIganVzdCBtYXBwZWQgdGhlIE1UWVBFIEFTSUMgZ2VuZXJh
dGlvbiBkZWZlbmRhbnQuDQoNCkknbSBnb2luZyB0byBjbGVhbiB0aGF0IHVwLA0KQ2hyaXN0aWFu
Lg0KDQpBbSAzMC4wOC4xOSB1bSAyMjo1OSBzY2hyaWViIExpdSwgU2hhb3l1bjoNCj4gU2VyaWFs
cyBhcmUgcmV2aWV3ZWQgYnkgOsKgIHNoYW95dW5sIDxTaGFveXVuLkxpdUBhbWQuY29tPg0KPg0K
PiBMb29rcyBsaWtlIGEgbGl0dGxlIGJpdCBjb25mdXNpbmcgdGhhdCB3ZSBoYXZlwqAgdHdvIHBs
YWNlIGZvciB0aGUgcHRlDQo+IGZsYWdzIC7CoCBnZXRfcHRlX2ZsYWdzwqAgYWxyZWFkeSBnZXQg
YXNpYyBzcGVjaWZpYyBtYXBwaW5nIGZsYWdzwqAgYW5kDQo+IGluc2lkZSBhbWRncHVfdm1fYm9f
c3BsaXRfbWFwcGluZyAsIGRyaXZlciBhZGp1c3QgdGhlIHJlYWwgSFcgbWFwcGluZw0KPiBmbGFn
cyBhZ2FpbiAuwqAgTWF5YmXCoCBiZXR0ZXIganVzdCBrZWVwIHRoZSBsb2dpYyBpbiBvbmUgcGxh
Y2UgaW4gdGhlDQo+IGZ1dHVyZSAuDQo+DQo+DQo+IFJlZ2FyZHMNCj4NCj4gc2hhb3l1bi5saXUN
Cj4NCj4NCj4NCj4gT24gMjAxOS0wOC0yNiA3OjA3IHAubS4sIEt1ZWhsaW5nLCBGZWxpeCB3cm90
ZToNCj4+IEZvciBjb21wdXRlIFZSQU0gYWxsb2NhdGlvbnMgb24gQXJ0dXJ1cyB1c2UgdGhlIG5l
dyBSVyBtdHlwZQ0KPj4gZm9yIG5vbi1jb2hlcmVudCBsb2NhbCBtZW1vcnksIENDIG10eXBlIGZv
ciBjb2hlcmVudCBsb2NhbA0KPj4gbWVtb3J5IGFuZCBQVEVfU05PT1BFRCBiaXQgZm9yIGludmFs
aWRhdGluZyBub24tZGlydHkgY2FjaGUNCj4+IGxpbmVzIG9uIHJlbW90ZSBYR01JIG1hcHBpbmdz
Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0Bh
bWQuY29tPg0KPj4gLS0tDQo+PiAgICAuLi4vZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRr
ZmRfZ3B1dm0uYyAgfCAyMCArKysrKysrKysrKysrKysrKy0tDQo+PiAgICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyAgICAgICAgfCAgNCArKysrDQo+PiAgICAyIGZpbGVz
IGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYw0KPj4gaW5k
ZXggMWI3MzQwYTE4ZjY3Li5jNWMxOGUyOTJhZTMgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMNCj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYw0KPj4gQEAgLTM1Nyw2ICsz
NTcsNyBAQCBzdGF0aWMgaW50IHZtX3VwZGF0ZV9wZHMoc3RydWN0IGFtZGdwdV92bSAqdm0sIHN0
cnVjdCBhbWRncHVfc3luYyAqc3luYykNCj4+ICAgIA0KPj4gICAgc3RhdGljIHVpbnQzMl90IGdl
dF9wdGVfZmxhZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBrZ2RfbWVtICpt
ZW0pDQo+PiAgICB7DQo+PiArCXN0cnVjdCBhbWRncHVfZGV2aWNlICpib19hZGV2ID0gYW1kZ3B1
X3R0bV9hZGV2KG1lbS0+Ym8tPnRiby5iZGV2KTsNCj4+ICAgIAlib29sIGNvaGVyZW50ID0gbWVt
LT5hbGxvY19mbGFncyAmIEFMTE9DX01FTV9GTEFHU19DT0hFUkVOVDsNCj4+ICAgIAl1aW50MzJf
dCBtYXBwaW5nX2ZsYWdzOw0KPj4gICAgDQo+PiBAQCAtMzY2LDggKzM2NywyMyBAQCBzdGF0aWMg
dWludDMyX3QgZ2V0X3B0ZV9mbGFncyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0
IGtnZF9tZW0gKm1lbSkNCj4+ICAgIAlpZiAobWVtLT5hbGxvY19mbGFncyAmIEFMTE9DX01FTV9G
TEFHU19FWEVDVVRBQkxFKQ0KPj4gICAgCQltYXBwaW5nX2ZsYWdzIHw9IEFNREdQVV9WTV9QQUdF
X0VYRUNVVEFCTEU7DQo+PiAgICANCj4+IC0JbWFwcGluZ19mbGFncyB8PSBjb2hlcmVudCA/DQo+
PiAtCQlBTURHUFVfVk1fTVRZUEVfVUMgOiBBTURHUFVfVk1fTVRZUEVfTkM7DQo+PiArCXN3aXRj
aCAoYWRldi0+YXNpY190eXBlKSB7DQo+PiArCWNhc2UgQ0hJUF9BUkNUVVJVUzoNCj4+ICsJCWlm
IChtZW0tPmFsbG9jX2ZsYWdzICYgQUxMT0NfTUVNX0ZMQUdTX1ZSQU0pIHsNCj4+ICsJCQlpZiAo
Ym9fYWRldiA9PSBhZGV2KQ0KPj4gKwkJCQltYXBwaW5nX2ZsYWdzIHw9IGNvaGVyZW50ID8NCj4+
ICsJCQkJCUFNREdQVV9WTV9NVFlQRV9DQyA6IEFNREdQVV9WTV9NVFlQRV9SVzsNCj4+ICsJCQll
bHNlDQo+PiArCQkJCW1hcHBpbmdfZmxhZ3MgfD0gQU1ER1BVX1ZNX01UWVBFX1VDOw0KPj4gKwkJ
fSBlbHNlIHsNCj4+ICsJCQltYXBwaW5nX2ZsYWdzIHw9IGNvaGVyZW50ID8NCj4+ICsJCQkJQU1E
R1BVX1ZNX01UWVBFX1VDIDogQU1ER1BVX1ZNX01UWVBFX05DOw0KPj4gKwkJfQ0KPj4gKwkJYnJl
YWs7DQo+PiArCWRlZmF1bHQ6DQo+PiArCQltYXBwaW5nX2ZsYWdzIHw9IGNvaGVyZW50ID8NCj4+
ICsJCQlBTURHUFVfVk1fTVRZUEVfVUMgOiBBTURHUFVfVk1fTVRZUEVfTkM7DQo+PiArCX0NCj4+
ICAgIA0KPj4gICAgCXJldHVybiBhbWRncHVfZ21jX2dldF9wdGVfZmxhZ3MoYWRldiwgbWFwcGlu
Z19mbGFncyk7DQo+PiAgICB9DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0u
Yw0KPj4gaW5kZXggN2RkY2EzZWViNmNmLi4xODlhZDU2OTk5NDYgMTAwNjQ0DQo+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYw0KPj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMNCj4+IEBAIC0xNTkyLDYgKzE1OTIsMTAgQEAg
c3RhdGljIGludCBhbWRncHVfdm1fYm9fc3BsaXRfbWFwcGluZyhzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwNCj4+ICAgIAkJfQ0KPj4gICAgCQlmbGFncyAmPSB+QU1ER1BVX1BURV9WQUxJRDsN
Cj4+ICAgIAl9DQo+PiArCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9BUkNUVVJVUyAmJg0K
Pj4gKwkgICAgIShmbGFncyAmIEFNREdQVV9QVEVfU1lTVEVNKSAmJg0KPj4gKwkgICAgbWFwcGlu
Zy0+Ym9fdmEtPmlzX3hnbWkpDQo+PiArCQlmbGFncyB8PSBBTURHUFVfUFRFX1NOT09QRUQ7DQo+
PiAgICANCj4+ICAgIAl0cmFjZV9hbWRncHVfdm1fYm9fdXBkYXRlKG1hcHBpbmcpOw0KPj4gICAg
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
