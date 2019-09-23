Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B67E7BB2DF
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 13:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA0B6E88F;
	Mon, 23 Sep 2019 11:34:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790047.outbound.protection.outlook.com [40.107.79.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A716E88F
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 11:34:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1FnJDcfQskn+zKr87TkGsF2vM41bFHI8bXJUIMnLhEAX7ZVcpeiKM7tO8IRmTDPBQjbQ/52rJYHfn0Qfa+H/vxUv3R2QzRKrmsrbp8WPlUs4XIwxobllMPAwQxpb8vBnlfajDGZm+oetySFIHy4R1sHeBpQxuI3vHD7a6JbJR7CU8diAQssC1VopIIi8YvjAFcQZ7wXavin8HjYCBk4HVql8S62MPwg3xsJi983z5Tsj9teJa6ltCDaQI0noBNcUcffjvxSe3lavok/WuLqlHeOTOdE1t24qoqPUoVsZjJSCLHgwSyl9QrvSAx2mIQMR6dkFPKZjjo/IxnQ7W5eHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpN0UTPpapgzs0EEVxgHe/5ucZsTuzbI3pBaj2TIRcs=;
 b=Fgk8LbqshDyi5oCJyPKVNxAuAp2b/BEm/Bap0NVmuq2nalje8DMwsUrkamY+btGdXhlhde7ysY8Q20KbA4KvYpYxjKNTEgkXbAT7rQdTIUIxGCG6W5F1FbyFQljeE+1dY6cFDIDbfuJDe/RN+a9yYqCmPIph7EdFSzpfof92zbVlo3znG2l4CTUdXjqocrf5lbHKt02bKF67pc0G1rmfdS10CugD05tqazqRstY5YN3zj9hNQ78R/3+LaB0prl7WTPRf55JSyjJHeBZT/TiZyUq/IwuyFMLmDnzMxYvC0ZGOkal5898FRuIBD1/APfappF25/H7IH6CFjZNdrNIOag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB4333.namprd12.prod.outlook.com (52.135.48.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Mon, 23 Sep 2019 11:34:23 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 11:34:23 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Chen, Guchun"
 <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 05/21] drm/amdgpu: refine sdma4 ras_data_cb
Thread-Topic: [PATCH 05/21] drm/amdgpu: refine sdma4 ras_data_cb
Thread-Index: AQHVbrmfh65heiGeKkKEN1nt4WVKzaczB1SAgAANj4CABhMtoA==
Date: Mon, 23 Sep 2019 11:34:22 +0000
Message-ID: <MN2PR12MB305455DC616A0D549637A73AB0850@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <20190919071115.16552-1-tao.zhou1@amd.com>
 <20190919071115.16552-6-tao.zhou1@amd.com>
 <BYAPR12MB280631BB2C0981BAFE4FE991F1890@BYAPR12MB2806.namprd12.prod.outlook.com>
 <DM5PR12MB14183065D27A0C25D8A8EC2BFC890@DM5PR12MB1418.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB14183065D27A0C25D8A8EC2BFC890@DM5PR12MB1418.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0b2baeb-7024-4fae-6a1b-08d74019fb4f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4333; 
x-ms-traffictypediagnostic: MN2PR12MB4333:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4333798453B8C08E1D3AF916B0850@MN2PR12MB4333.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(189003)(199004)(13464003)(66066001)(33656002)(81166006)(305945005)(316002)(66476007)(99286004)(66556008)(64756008)(66446008)(71190400001)(71200400001)(102836004)(66946007)(76116006)(6246003)(52536014)(186003)(76176011)(110136005)(26005)(74316002)(486006)(256004)(446003)(476003)(2501003)(6436002)(229853002)(5660300002)(6506007)(2906002)(14454004)(11346002)(55016002)(53546011)(7696005)(86362001)(25786009)(81156014)(3846002)(8936002)(6116002)(478600001)(7736002)(8676002)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4333;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gCRM76Xl4jm/svMKihFu5Wa4Ey9DcixZlyEf9vCx5SEsF5/cWKKlkQqz9DEQJ0Csz9eOyvxlpmFS+/8idZpjLTkg7E9w01QzRv5FV+21bl2Tu1oPjSbj+b2akLoOZXyWylUTuuW0C+ONFXjVpb3/bEQU3b5zQv8K/50fsgnwlT1UTMxepW61a2Lkn/rAd8P1WRa1G1LmMtJe2/AzatcGPzwn96uReSQKtpKA6iWiHEU5gskyzIP6/ptHKIyHsu2zEODoWeNeC2BpZU549y1gWD7iuyROofG7754tGO6574fOUcQiTU5tjp9IyNnNqwqRADgAV/BhEpwQ58hzYwtag9dLsU58RT93ESwLpn3V3xfQoJYQLBusL+dRCILTgGq665Ww8FR6Ei/xa4fVENxda7C8ya+ye1NRoMVKW2MZpBs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b2baeb-7024-4fae-6a1b-08d74019fb4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 11:34:22.9680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RS3ZhdyC05qh/Fx7NySQgXdQgjH7KORASNZxLSBw9q4vNnrwtT8aOosYT/DzRpKz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4333
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpN0UTPpapgzs0EEVxgHe/5ucZsTuzbI3pBaj2TIRcs=;
 b=pRsSo0zeiiFCPybJyoN+w/0LRBlFRKFIrmigfUkxqDS2ZIX+Y7kKhOKrLwdikk7mmCj6aK0HE1FD9WCpeyXqpKg/AXS0cQS4QpofsQXF1lQcFXBTesEZ8xfeXTVEb7yFhdIQJ5IV7XCrSkD/pv1saM0Sc/IJXV3J0b0daY3y/no=
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

SSdsbCBhZGQgYSBuZXcgcGF0Y2guDQoNClJlZ2FyZHMsDQpUYW8NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQu
Y29tPg0KPiBTZW50OiAyMDE55bm0OeaciDE55pelIDIyOjQ4DQo+IFRvOiBDaGVuLCBHdWNodW4g
PEd1Y2h1bi5DaGVuQGFtZC5jb20+OyBaaG91MSwgVGFvDQo+IDxUYW8uWmhvdTFAYW1kLmNvbT47
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggMDUv
MjFdIGRybS9hbWRncHU6IHJlZmluZSBzZG1hNCByYXNfZGF0YV9jYg0KPiANCj4gTGV0J3MgYWRk
IGNvbW1lbnRzIHRvIGNsYXJpZnlpbmcgd2h5IGNoZWNraW5nIEdGWCBJUCBCTE9DSyBmb3IgU0RN
QQ0KPiBpbnRlcnJ1cHQgc28gcGVvcGxlIHdpbGwgbm90IGJlIGNvbmZ1c2luZyBoZXJlLg0KPiAN
Cj4gUmVnYXJkcywNCj4gSGF3a2luZw0KPiANCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogQ2hlbiwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPg0KPiBTZW50OiAyMDE5
5bm0OeaciDE55pelIDIxOjU5DQo+IFRvOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiBaaGFuZywgSGF3a2luZyA8SGF3a2lu
Zy5aaGFuZ0BhbWQuY29tPg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIDA1LzIxXSBkcm0vYW1kZ3B1
OiByZWZpbmUgc2RtYTQgcmFzX2RhdGFfY2INCj4gDQo+IA0KPiANCj4gDQo+IFJlZ2FyZHMsDQo+
IEd1Y2h1bg0KPiANCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWmhvdTEs
IFRhbyA8VGFvLlpob3UxQGFtZC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMTks
IDIwMTkgMzoxMyBQTQ0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IENoZW4s
IEd1Y2h1bg0KPiA8R3VjaHVuLkNoZW5AYW1kLmNvbT47IFpoYW5nLCBIYXdraW5nIDxIYXdraW5n
LlpoYW5nQGFtZC5jb20+DQo+IENjOiBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT4NCj4g
U3ViamVjdDogW1BBVENIIDA1LzIxXSBkcm0vYW1kZ3B1OiByZWZpbmUgc2RtYTQgcmFzX2RhdGFf
Y2INCj4gDQo+IHNpbXBsaWZ5IGNvZGUgbG9naWMgYW5kIHJlZmluZSByZXR1cm4gdmFsdWUNCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4NCj4gLS0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyB8IDMyICsrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTUg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvc2RtYV92NF8wLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAu
Yw0KPiBpbmRleCBhOGU0YjdkODgwZmUuLmY2ODVhMjM3NzYxNSAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMNCj4gQEAgLTE5NDIsMjUgKzE5NDIsMjcgQEAgc3Rh
dGljIGludA0KPiBzZG1hX3Y0XzBfcHJvY2Vzc19yYXNfZGF0YV9jYihzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwNCj4gIAl1aW50MzJfdCBlcnJfc291cmNlOw0KPiAgCWludCBpbnN0YW5jZTsN
Cj4gDQo+IC0JaWYgKCFhbWRncHVfcmFzX2lzX3N1cHBvcnRlZChhZGV2LCBBTURHUFVfUkFTX0JM
T0NLX19HRlgpKSB7DQo+IC0JCWluc3RhbmNlID0gc2RtYV92NF8wX2lycV9pZF90b19zZXEoZW50
cnktPmNsaWVudF9pZCk7DQo+IC0JCWlmIChpbnN0YW5jZSA8IDApDQo+IC0JCQlyZXR1cm4gMDsN
Cj4gKwlpZiAoYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQoYWRldiwgQU1ER1BVX1JBU19CTE9DS19f
R0ZYKSkNCj4gKwkJZ290byBvdXQ7DQo+IA0KPiAtCQlzd2l0Y2ggKGVudHJ5LT5zcmNfaWQpIHsN
Cj4gLQkJY2FzZSBTRE1BMF80XzBfX1NSQ0lEX19TRE1BX1NSQU1fRUNDOg0KPiAtCQkJZXJyX3Nv
dXJjZSA9IDA7DQo+IC0JCQlicmVhazsNCj4gLQkJY2FzZSBTRE1BMF80XzBfX1NSQ0lEX19TRE1B
X0VDQzoNCj4gLQkJCWVycl9zb3VyY2UgPSAxOw0KPiAtCQkJYnJlYWs7DQo+IC0JCWRlZmF1bHQ6
DQo+IC0JCQlyZXR1cm4gMDsNCj4gLQkJfQ0KPiArCWluc3RhbmNlID0gc2RtYV92NF8wX2lycV9p
ZF90b19zZXEoZW50cnktPmNsaWVudF9pZCk7DQo+ICsJaWYgKGluc3RhbmNlIDwgMCkNCj4gKwkJ
Z290byBvdXQ7DQo+IA0KPiAtCQlhbWRncHVfc2RtYV9wcm9jZXNzX3Jhc19kYXRhX2NiKGFkZXYs
IGVycl9kYXRhLCBlbnRyeSk7DQo+ICsJc3dpdGNoIChlbnRyeS0+c3JjX2lkKSB7DQo+ICsJY2Fz
ZSBTRE1BMF80XzBfX1NSQ0lEX19TRE1BX1NSQU1fRUNDOg0KPiArCQllcnJfc291cmNlID0gMDsN
Cj4gW0d1Y2h1bl1Mb29rcyBubyBvbmUgdXNlcyB0aGlzIHZhcmlhYmxlLiBDYW4gd2UgcmVtb3Zl
IGl0IGRpcmVjdGx5PyBJIGFtIG5vdA0KPiBzdXJlIHdoeSB3ZSBhZGRlZCBvbmUgc3dpdGNoIGNh
c2UgaGVyZS4NCj4gDQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgU0RNQTBfNF8wX19TUkNJRF9fU0RN
QV9FQ0M6DQo+ICsJCWVycl9zb3VyY2UgPSAxOw0KPiArCQlicmVhazsNCj4gKwlkZWZhdWx0Og0K
PiArCQlnb3RvIG91dDsNCj4gIAl9DQo+IA0KPiArCWFtZGdwdV9zZG1hX3Byb2Nlc3NfcmFzX2Rh
dGFfY2IoYWRldiwgZXJyX2RhdGEsIGVudHJ5KTsNCj4gKw0KPiArb3V0Og0KPiAgCXJldHVybiBB
TURHUFVfUkFTX1NVQ0NFU1M7DQo+ICB9DQo+IA0KPiAtLQ0KPiAyLjE3LjENCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
