Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D945235AE8
	for <lists+amd-gfx@lfdr.de>; Wed,  5 Jun 2019 13:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8E5892A4;
	Wed,  5 Jun 2019 11:10:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700071.outbound.protection.outlook.com [40.107.70.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744E6892A4
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Jun 2019 11:10:32 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1260.namprd12.prod.outlook.com (10.168.239.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 11:10:30 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 11:10:30 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Liu, Monk" <Monk.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: FW: [PATCH] drm/ttm: fix ttm client driver (e.g. amdgpu) reload
 issue
Thread-Topic: FW: [PATCH] drm/ttm: fix ttm client driver (e.g. amdgpu) reload
 issue
Thread-Index: AQHVG2oudZY69HM9mkCE8kosxqR2paaMqc8AgAA95QA=
Date: Wed, 5 Jun 2019 11:10:30 +0000
Message-ID: <8dbf96e5-056f-b2bb-b0d3-9376b92b0140@amd.com>
References: <1559717076-25471-1-git-send-email-Monk.Liu@amd.com>
 <MN2PR12MB393308FE408E9E41EF0D615184160@MN2PR12MB3933.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB393308FE408E9E41EF0D615184160@MN2PR12MB3933.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6PR07CA0024.eurprd07.prod.outlook.com
 (2603:10a6:209:2a::37) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3911418f-c6c7-4f00-aafe-08d6e9a66ba5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1260; 
x-ms-traffictypediagnostic: DM5PR12MB1260:
x-microsoft-antispam-prvs: <DM5PR12MB1260E4850FDF9F34FB77018E83160@DM5PR12MB1260.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(396003)(136003)(376002)(366004)(189003)(13464003)(199004)(71200400001)(386003)(31686004)(71190400001)(6506007)(5660300002)(11346002)(46003)(99286004)(81156014)(65806001)(478600001)(8936002)(53546011)(2501003)(36756003)(316002)(65956001)(229853002)(31696002)(81166006)(14444005)(102836004)(86362001)(76176011)(256004)(6486002)(52116002)(14454004)(7736002)(2906002)(2616005)(68736007)(73956011)(486006)(65826007)(186003)(72206003)(66946007)(6246003)(8676002)(64756008)(66446008)(66476007)(58126008)(305945005)(6116002)(66556008)(110136005)(53936002)(6436002)(6512007)(25786009)(64126003)(446003)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1260;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 32XEV7RGXejq4XvhwvMG5bb9OvuH6zwgO7RhZGOXgsL7IQsnZ1XOcQIX50eoTwQCJYybI0VS/Sz6E3RoxKVY6wpyABShuzcM80y0hM8ucLut1Q1jKOze2v+sAJ+6Ua7n9xmWFwG1SKBCc84VWJNNIMaCFYhQ1nqqzlg4GOKn1NQDV88Nw16FL92jqAzEqLBvWa6b2UwHk5grn8qyP2ONQEo6mHaMaEdV42kCErddyCrzfSZkXZ3u2pW4sMTWzesT8q7hJEGNpsTanGXnRBFRq5BwaLGOXoJNf1f/bcg+1GhMXhj7MfY47j3/ClHjGE51SVw6onxbSujHDOJTPLOXKtVoTOcOSkTNor9wobkJ9Mhk3GZviewi2X1dZBbMRWNScUn7y1VcjvRLbaoGStnTxTivS1/ysyfQAsxXz9itke8=
Content-ID: <39467CD17BFC584E949DF01C313BDF7E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3911418f-c6c7-4f00-aafe-08d6e9a66ba5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 11:10:30.5341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1260
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=068wdyUizej8Hm48dM8iab8tYjWsS0EOtC8G5/QSStk=;
 b=rnNxD1zHIGCSOtP2sfN0ZReE/JoVu7w8fJ5BdCxz1Gxce1ddw8nsmj5BCJq0vkBGnUng7x84V9THD+lCOZVlst9sNQl3MA0nvZdbh7OU1FFbYsV/YKmwDZ4Aw/7uCx6b5h1qO5GrAsc+OtyBclCS/M2iroKnwabSI4dpskKAU4g=
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

VGhpcyBzaG91bGQgYWxyZWFkeSBiZSBmaXhlZCBieSBwYXRjaCAiZHJtL3R0bTogZml4IHJlLWlu
aXQgb2YgZ2xvYmFsIA0Kc3RydWN0dXJlcyIuDQoNCkNocmlzdGlhbi4NCg0KQW0gMDUuMDYuMTkg
dW0gMDk6Mjkgc2NocmllYiBMaXUsIE1vbms6DQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IE1vbmsgTGl1IDxNb25rLkxpdUBhbWQuY29tPg0KPiBTZW50OiBXZWRuZXNk
YXksIEp1bmUgNSwgMjAxOSAyOjQ1IFBNDQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiBDYzogTGl1LCBNb25rIDxNb25rLkxpdUBhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFU
Q0hdIGRybS90dG06IGZpeCB0dG0gY2xpZW50IGRyaXZlciAoZS5nLiBhbWRncHUpIHJlbG9hZCBp
c3N1ZQ0KPg0KPiBuZWVkIHRvIGNsZWFyIGJvIGdsb2IgYW5kIG1lbSBnbG9iIGR1cmluZyB0aGVp
ciByZWxlYXNlIG90aGVyd2lzZSB0aGVpciBtZW1iZXIgdmFsdWUgd291bGQgYmUgd3JvbmdseSB1
c2VkIGluIHRoZSBuZXh0IGdsb2IgaW5pdCBzdGFnZSBhbmQgbGVhZCB0byB3aWxkIHBvaW50ZXIg
YWNjZXNzIHByb2JsZW1zOg0KPg0KPiAxKSBrb2JqLnN0YXRlX2luaXRpYWxpemVkIGlzIDENCj4g
MikgdHRtX2JvX2dsb2IuYm9fY291bnQgaXNuJ3QgY2xlYXJlZCBhbmQgcmVmZXJlbmNlZCB2aWEg
aXQNCj4gICAgIG9uIG1lbWJlciAic3dhcF9scnUiIHdvdWxkIGhpdCBvdXQgb2YgYm91bmQgYXJy
YXkgYWNjZXNzaW5nDQo+ICAgICBidWcNCj4NCj4gU2lnbmVkLW9mZi1ieTogTW9uayBMaXUgPE1v
bmsuTGl1QGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMg
ICAgIHwgMiArKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX21lbW9yeS5jIHwgOCArKysr
KysrKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmMgaW5kZXggYzdkZTY2Ny4uNjQzNGVhYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
DQo+IEBAIC0xNjA0LDYgKzE2MDQsOCBAQCBzdGF0aWMgdm9pZCB0dG1fYm9fZ2xvYmFsX2tvYmpf
cmVsZWFzZShzdHJ1Y3Qga29iamVjdCAqa29iaikNCj4gICAJCWNvbnRhaW5lcl9vZihrb2JqLCBz
dHJ1Y3QgdHRtX2JvX2dsb2JhbCwga29iaik7DQo+ICAgDQo+ICAgCV9fZnJlZV9wYWdlKGdsb2It
PmR1bW15X3JlYWRfcGFnZSk7DQo+ICsNCj4gKwltZW1zZXQoZ2xvYiwgMCwgc2l6ZW9mKCpnbG9i
KSk7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyB2b2lkIHR0bV9ib19nbG9iYWxfcmVsZWFzZSh2
b2lkKSBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fbWVtb3J5LmMgYi9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9tZW1vcnkuYw0KPiBpbmRleCA4NjE3OTU4Li43MTI4YmJmIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9tZW1vcnkuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9tZW1vcnkuYw0KPiBAQCAtMjI5LDkgKzIyOSwxNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IHN5c2ZzX29wcyB0dG1fbWVtX2dsb2JhbF9vcHMgPSB7DQo+ICAg
CS5zdG9yZSA9ICZ0dG1fbWVtX2dsb2JhbF9zdG9yZSwNCj4gICB9Ow0KPiAgIA0KPiArdm9pZCB0
dG1fbWVtX2dsb2Jfa29ial9yZWxlYXNlKHN0cnVjdCBrb2JqZWN0ICprb2JqKSB7DQo+ICsJc3Ry
dWN0IHR0bV9tZW1fZ2xvYmFsICpnbG9iID0gY29udGFpbmVyX29mKGtvYmosIHN0cnVjdA0KPiAr
dHRtX21lbV9nbG9iYWwsIGtvYmopOw0KPiArDQo+ICsJbWVtc2V0KGdsb2IsIDAsIHNpemVvZigq
Z2xvYikpOw0KPiArfQ0KPiArDQo+ICAgc3RhdGljIHN0cnVjdCBrb2JqX3R5cGUgdHRtX21lbV9n
bG9iX2tvYmpfdHlwZSA9IHsNCj4gICAJLnN5c2ZzX29wcyA9ICZ0dG1fbWVtX2dsb2JhbF9vcHMs
DQo+ICAgCS5kZWZhdWx0X2F0dHJzID0gdHRtX21lbV9nbG9iYWxfYXR0cnMsDQo+ICsJLnJlbGVh
c2UgPSB0dG1fbWVtX2dsb2Jfa29ial9yZWxlYXNlLA0KPiAgIH07DQo+ICAgDQo+ICAgc3RhdGlj
IGJvb2wgdHRtX3pvbmVzX2Fib3ZlX3N3YXBfdGFyZ2V0KHN0cnVjdCB0dG1fbWVtX2dsb2JhbCAq
Z2xvYiwNCj4gLS0NCj4gMi43LjQNCj4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
