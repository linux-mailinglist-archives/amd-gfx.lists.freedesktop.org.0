Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8849BEBF
	for <lists+amd-gfx@lfdr.de>; Sat, 24 Aug 2019 18:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEED26E0DC;
	Sat, 24 Aug 2019 16:24:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780048.outbound.protection.outlook.com [40.107.78.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80696E0D7
 for <amd-gfx@lists.freedesktop.org>; Sat, 24 Aug 2019 16:24:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdUzsZebBvkeVV7ujQMGo0N8O9l6BS7/lGj9qlUal5X6nZ7WeGY5glLT9V6pcsQXSatwCtZLiT3nk7HKEN0remszWZVXHWJTOUTS6g9wWAtbZAc1MrIcm0D8e6GCbkOmMTZ5xhoDuud6Kqa124R75oTanJdbFXFiNCCG9SJ6f2HxwblfGkaPBTX7eo8eHBXdgV29wzVJ1AJ26UYwhEYJqF+KPTfZyFS9OaoomrEjxNosaInwK0jc8XL7A1+/BoULQncrlSotd4bB08iabD7aWANwv/s311doXl3cpj96rOnWQKiJouyvJSd9TcuT4oDRqZH2gUTvntjIOoooAvPc8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=272hJ24D5JGk09eT/P3PgVOLyzIEo/tM9ugSxZ83EaM=;
 b=HUlqpbXna8LqxrX1hJR5VCmuf3RFvi8SKhJwfykN6EJ/5XM2CBvJP4eWqPtmHzeMAZ7qmShxKwFn8WzwFEdaK77liVCF8NIEw6xvIgwKGU/w9EN7LcPto9GVTjuiECgxBd/ccU1oQeXBEwzPibWA2VGqnu/DWdVhYOoBN5XF/xeEl95T+UZbjMyVpphzNwIUIcZao84pr6SCpEeDMgSNSoZXKmI6GEdHOenGtwbNRrxgv7B9wxxGKVpjIJfey8KgCpyFQMSptelZlRw+b0sAHHFrEjxgJlzkSeJm9DD+d7JUyCnVPZ6aZxF8zTo7NxDe988lO58ioMf3jgeEeN2UZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3548.namprd12.prod.outlook.com (20.179.106.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Sat, 24 Aug 2019 16:24:06 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c%5]) with mapi id 15.20.2178.020; Sat, 24 Aug 2019
 16:24:06 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/amdgpu: Support snooped PTE flag
Thread-Topic: [PATCH 3/4] drm/amdgpu: Support snooped PTE flag
Thread-Index: AQHVWfpyCsVjPVucSk2VZpnIFr9zeacKJd+AgABW24A=
Date: Sat, 24 Aug 2019 16:24:05 +0000
Message-ID: <a7f9ad48-2e46-5415-e2a8-1738a101d716@amd.com>
References: <20190823213249.10749-1-Felix.Kuehling@amd.com>
 <20190823213249.10749-4-Felix.Kuehling@amd.com>
 <f09e6893-347b-4ade-76e5-ad37d8e4e782@gmail.com>
In-Reply-To: <f09e6893-347b-4ade-76e5-ad37d8e4e782@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [142.116.67.22]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTBPR01CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::40) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16ce158f-28bf-461b-0735-08d728af7bb3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3548; 
x-ms-traffictypediagnostic: DM6PR12MB3548:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3548BC228834585AF2F72B9D92A70@DM6PR12MB3548.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0139052FDB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(346002)(376002)(39860400002)(136003)(189003)(199004)(58126008)(6436002)(478600001)(6512007)(3846002)(26005)(2501003)(53936002)(102836004)(14454004)(186003)(53546011)(8676002)(6506007)(386003)(305945005)(71200400001)(71190400001)(7736002)(66574012)(229853002)(6116002)(25786009)(31686004)(5660300002)(81156014)(14444005)(2906002)(256004)(99286004)(81166006)(4326008)(8936002)(66476007)(66946007)(66556008)(66446008)(64756008)(36756003)(6246003)(446003)(11346002)(76176011)(486006)(86362001)(2616005)(66066001)(65956001)(316002)(52116002)(31696002)(65806001)(476003)(6486002)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3548;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tyOlmK6QTZy5UoQ7K+iOEVPIQgVOZg9/ZJPmDjQ8BlIHKi1/Ldl/aFsEDV9w5tjnejPy5Ef3ouGKBGAMsHuknCgXn9IBiz65QI4I98Dx4nnONSClotQgjx0xSQ6gDRhB/Yq8yoq8LSVAR3ZrCfMMz+cem//eBVaVEwQnP6hbDja7BX1euGGHNGpIgrpOM1zTQJuENlULmTaPsxytamIbqgyzU560vPj89QBzdUVWMU+zUuz5wvJMpkyQri265Y9MSyAv5AAR49bZxiWV0epUwejvgy0QSmpMmAHSTtsTbRjg5b9QnJI7dBoMGEtk8jYcB0SGxkQ6uiReI23Y7YXY+OnLswAcZwEYNuIZX3grGk2VDM5UCF8iY22XI5zre5WNCB0BajIUtRM+hlyhht9oF0BwdxGkffHB87tFCx8I9Lo=
Content-ID: <D184D9F20840F14BB8D9715195A5F3FE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ce158f-28bf-461b-0735-08d728af7bb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2019 16:24:05.8921 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jy9DOJ9uf2BCX9cG4IIh4nHG/iFxebVmW/PYaEZQZmTVRQsgeHW6eBUdWxKRA8OMdHYpmAOrQvl/+v6nBgMbuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3548
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=272hJ24D5JGk09eT/P3PgVOLyzIEo/tM9ugSxZ83EaM=;
 b=fCuOHZzR273CuqykU4f5Ya1QqppgX8j0L5ZQemFMb3xtb+7onOdKiljoIJ8yfKasy34kAknRoO0XqcYUD/ivynmTVXy+rjjfSdG89ArjUPHZi7kKStAoUab6k+8ycINcl8lskY8YQ2gAEWGLgZmXSQQPBmyQjBQ6PsXr9nrLl3s=
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wOC0yNCA3OjEzLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPiBBbSAyMy4wOC4x
OSB1bSAyMzozMyBzY2hyaWViIEt1ZWhsaW5nLCBGZWxpeDoNCj4+IEZyb206IE9hayBaZW5nIDxP
YWsuWmVuZ0BhbWQuY29tPg0KPj4NCj4+IFNldCBzbm9vcGVkIFBURSBmbGFnIGFjY29yZGluZyB0
byBtYXBwaW5nIGZsYWcuIFdyaXRlIHJlcXVlc3QgdG8gYQ0KPj4gcGFnZSB3aXRoIHNub29wZWQg
Yml0IHNldCwgd2lsbCBzZW5kIG91dCBpbnZhbGlkYXRlIHByb2JlIHJlcXVlc3QNCj4+IHRvIFRD
QyBvZiB0aGUgcmVtb3RlIEdQVSB3aGVyZSB0aGUgdnJhbSBwYWdlIHJlc2lkZXMuDQo+Pg0KPj4g
Q2hhbmdlLUlkOiBJNzk5ZjY4ZWM3YTVhMWFiZjMyMDc1ZjVlZjMxMDUxNjQxYTBiMzczNg0KPj4g
U2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQo+PiAtLS0NCj4+IMKg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgfCAzICsrKw0KPj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nbWNfdjlfMC5jDQo+PiBpbmRleCA5YWFmY2RhNmM0ODguLjhhN2M0ZWM2OWFlOCAx
MDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4+IEBAIC02MDQs
NiArNjA0LDkgQEAgc3RhdGljIHVpbnQ2NF90IGdtY192OV8wX2dldF92bV9wdGVfZmxhZ3Moc3Ry
dWN0IA0KPj4gYW1kZ3B1X2RldmljZSAqYWRldiwNCj4+IMKgwqDCoMKgwqAgaWYgKGZsYWdzICYg
QU1ER1BVX1ZNX1BBR0VfUFJUKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHB0ZV9mbGFnIHw9IEFN
REdQVV9QVEVfUFJUOw0KPj4gwqAgK8KgwqDCoCBpZiAoZmxhZ3MgJiBBTURHUFVfVk1fUEFHRV9J
TlZBTElEQVRFX1BST0JFKQ0KPj4gK8KgwqDCoMKgwqDCoMKgIHB0ZV9mbGFnIHw9IEFNREdQVV9Q
VEVfU05PT1BFRDsNCj4+ICsNCj4NCj4gVGhhdCBpcyBzdGlsbCBhIE5BSyB3aXRob3V0IGZ1cnRo
ZXIgY2hlY2tzLiBXZSBuZWVkIHRvIG1ha2UgYWJzb2x1dGVseSANCj4gc3VyZSB0aGF0IHdlIGRv
bid0IHNldCB0aGlzIHdoZW4gUENJZSByb3V0aW5nIGlzIGluIHVzZS4NCg0KVGhlIG9ubHkgcGxh
Y2Ugd2hlcmUgQU1ER1BVX1ZNXy4uLiBmbGFncyBhcmUgYWNjZXB0ZWQgZnJvbSB1c2VyIG1vZGUg
DQpzZWVtcyB0byBiZSBhbWRncHVfZ2VtX3ZhX2lvY3RsLiBJdCBoYXMgYW4gZXhwbGljaXQgc2V0
IG9mIHZhbGlkX2ZsYWdzIA0KaXQgYWNjZXB0cy4gVGhlIG5ldyBJTlZBTElEQVRFX1BST0JFIGZs
YWcgaXMgbm90IHBhcnQgb2YgaXQuIFRoYXQgbWVhbnMgDQp1c2VyIG1vZGUgd2lsbMKgIG5vdCBi
ZSBhYmxlIHRvIHNldCBpdCBkaXJlY3RseS4gSWYgd2UgYWRkZWQgaXQgdG8gdGhlIA0Kc2V0IG9m
IHZhbGlkX2ZsYWdzIGluIGFtZGdwdV9nZW1fdmFfaW9jdGwsIHdlJ2QgbmVlZCB0byBhZGQgYXBw
cm9wcmlhdGUgDQpjaGVja3MgYXQgdGhlIHNhbWUgdGltZS4NCg0KS0ZEIGRvZXMgbm90IGV4cG9z
ZSBBTURHUFVfVk1fLi4uIGZsYWdzIGRpcmVjdGx5IHRvIHVzZXIgbW9kZS4gSXQgb25seSANCnNl
dHMgdGhlIElOVkFMSURBVEVfUFJPQkUgZmxhZyBpbiBrZXJuZWwgbW9kZSBmb3IgbWFwcGluZ3Mg
aW4gdGhlIHNhbWUgDQpYR01JIGhpdmUgb24gQXJ0dXJ1cyAoaW4gcGF0Y2ggNCkuDQoNCklmIHRo
ZXJlIGlzIHNvbWV0aGluZyBJJ20gbWlzc2luZywgcGxlYXNlIHBvaW50IGl0IG91dC4gQnV0IEFG
QUlDVCB0aGUgDQpjaGVja2luZyB0aGF0IGlzIGN1cnJlbnRseSBkb25lIHNob3VsZCBzYXRpc2Z5
IHlvdXIgcmVxdWlyZW1lbnRzLg0KDQpSZWdhcmRzLA0KIMKgIEZlbGl4DQoNCj4NCj4gQ2hyaXN0
aWFuLg0KPg0KPj4gwqDCoMKgwqDCoCByZXR1cm4gcHRlX2ZsYWc7DQo+PiDCoCB9DQo+DQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
