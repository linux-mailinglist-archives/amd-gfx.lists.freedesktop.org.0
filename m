Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFA65DAA8
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Jul 2019 03:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6306E0B4;
	Wed,  3 Jul 2019 01:21:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820058.outbound.protection.outlook.com [40.107.82.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312746E0B4
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Jul 2019 01:21:17 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2452.namprd12.prod.outlook.com (52.132.11.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 01:21:15 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::84a6:9940:df8d:5c0a]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::84a6:9940:df8d:5c0a%2]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 01:21:15 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/amdkfd: Add chained_runlist_idle_disable flag to
 pm4_mes_runlist
Thread-Topic: [PATCH 1/2] drm/amdkfd: Add chained_runlist_idle_disable flag to
 pm4_mes_runlist
Thread-Index: AQHVJ510MSBuJg2pPEm3H7nb3OJCdKak6/4wgAADFYCAEzzL0A==
Date: Wed, 3 Jul 2019 01:21:14 +0000
Message-ID: <BL0PR12MB2580219476B12C6E6BF51ED480FB0@BL0PR12MB2580.namprd12.prod.outlook.com>
References: <20190620192155.20226-1-Felix.Kuehling@amd.com>
 <BL0PR12MB2580EA675A1B1F9AE6EC4B3F80E40@BL0PR12MB2580.namprd12.prod.outlook.com>
 <2d78acdf-7d6c-d0c5-8fe0-ff26dc7ce3cb@amd.com>
In-Reply-To: <2d78acdf-7d6c-d0c5-8fe0-ff26dc7ce3cb@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c748388-94e5-4e71-300d-08d6ff54be0c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2452; 
x-ms-traffictypediagnostic: BL0PR12MB2452:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BL0PR12MB24521994869D46F26DD6160D80FB0@BL0PR12MB2452.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(199004)(189003)(13464003)(8936002)(6436002)(8676002)(316002)(86362001)(53546011)(81156014)(81166006)(6506007)(25786009)(2906002)(102836004)(64756008)(66946007)(66556008)(66446008)(73956011)(66476007)(229853002)(33656002)(186003)(76116006)(76176011)(71190400001)(71200400001)(74316002)(476003)(14444005)(68736007)(305945005)(6306002)(2501003)(7736002)(446003)(486006)(7696005)(99286004)(256004)(66066001)(3846002)(6116002)(53936002)(9686003)(110136005)(478600001)(5660300002)(6246003)(72206003)(14454004)(966005)(11346002)(55016002)(52536014)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2452;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UQTEQfBtVvHSHZ0i793TCwSHbg850Zrl7YrLdp9oh6ANfQhcoop5sXrSrd2E3C7CR5eiY7Xs35ClVz6NOIogfszIHl1H0+UcCQELD2Drl6GlMB5oOC/aWVCzSymWUcXNbfU+W+h9cypLNnfWmaXUehTPMmffzwCAeKf9C+pQzeJ78Z1hv0tT2pdLKTHAs5L/XMxdGzHuGvIcbGWBbv4rfGW8++qCXS2LsffbcakKqOvW+4eFaClUzaeNOwSVrRz9F2UHrSSR+u9m60CmJ2yERmxTvrLarO4hYWoPnlRyG7/sKvN9PyoaRojKpmME50XHMkIm+pRPtpZgpxdRvUHKQitQFXqGSh0eKflBA2oLiMV84HEwcCRWwmACm1XkP4WCQufTZdDa2IvQHKvQFDxW9VQ0ow7wTpuuN/5d92C+BsU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c748388-94e5-4e71-300d-08d6ff54be0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 01:21:14.8520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2452
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xohaoh6fIc6oOuVnYO3DVKPEEqiP3JXU3Hjwk5XBi1c=;
 b=Nu6Qor2ZiunsaC6pFvsUABLqrG1ddQ+jTMOBqNWUFCZEUtlpoYBW1jfg8qxT3YAdsbEdmeRfHPlK7KkNi9BMTS+f5B1ToqDcVYiu1Rx441rnJ0AJeh3q32gshlHnWqJbWAvdVCAhZs5vaPFeujoAOAsNHZVF+MRk6ICV2MJoBBQ=
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

U2VyaWVzIGlzIFJldmlld2VkLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4NCg0KUmVn
YXJkcywNCk9haw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogS3VlaGxpbmcs
IEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPiANClNlbnQ6IEZyaWRheSwgSnVuZSAyMSwg
MjAxOSAzOjM0IEFNDQpUbzogWmVuZywgT2FrIDxPYWsuWmVuZ0BhbWQuY29tPjsgYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSBkcm0vYW1ka2Zk
OiBBZGQgY2hhaW5lZF9ydW5saXN0X2lkbGVfZGlzYWJsZSBmbGFnIHRvIHBtNF9tZXNfcnVubGlz
dA0KDQpZZXMuIE1FQyBmaXJtd2FyZSB2ZXJzaW9uICM0MjUgc2hvdWxkIGhhdmUgdGhlIG5lY2Vz
c2FyeSBjaGFuZ2UuDQoNClJlZ2FyZHMsDQogwqAgRmVsaXgNCg0KT24gMjAxOS0wNi0yMCAzOjIz
IHAubS4sIFplbmcsIE9hayB3cm90ZToNCj4gSGkgRmVsaXgsDQo+DQo+IERvZXMgdGhpcyByZXF1
aXJlIGEgTUVDIGZpcm13YXJlIGNoYW5nZT8NCj4NCj4gUmVnYXJkcywNCj4gT2FrDQo+DQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNl
c0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBLdWVobGluZywgRmVsaXgNCj4g
U2VudDogVGh1cnNkYXksIEp1bmUgMjAsIDIwMTkgMzoyMiBQTQ0KPiBUbzogYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEt1ZWhsaW5nLCBGZWxpeCA8RmVsaXguS3VlaGxpbmdA
YW1kLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDEvMl0gZHJtL2FtZGtmZDogQWRkIGNoYWluZWRf
cnVubGlzdF9pZGxlX2Rpc2FibGUgZmxhZyB0byBwbTRfbWVzX3J1bmxpc3QNCj4NCj4gTmV3IGZs
YWcgdG8gZGlzYWJsZSBhbiBpZGxlIHJ1bmxpc3Qgb3B0aW1pemF0aW9uIHRoYXQgaXMgY2F1c2lu
ZyBzb2Z0IGhhbmdzIHdpdGggc29tZSBkaWZmdWx0LXRvLXJlcHJvZHVjZSBjdXN0b21lciB3b3Jr
bG9hZHMuIFRoaXMgd2lsbCBzZXJ2ZSBhcyBhIHdvcmthcm91bmQgdW50aWwgdGhlIHByb2JsZW0g
Y2FuIGJlIHJlcHJvZHVjZWQgYW5kIHRoZSByb290LWNhdXNlIGRldGVybWluZWQuDQo+DQo+IFNp
Z25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KPiAt
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcG00X2hlYWRlcnNfYWkuaCB8
IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkN
Cj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wbTRfaGVh
ZGVyc19haS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3BtNF9oZWFkZXJzX2Fp
LmgNCj4gaW5kZXggNDlhYjY2YjcwM2ZhLi5lM2UyMTQwNGNmYTAgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wbTRfaGVhZGVyc19haS5oDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wbTRfaGVhZGVyc19haS5oDQo+IEBAIC0xMjAs
NyArMTIwLDcgQEAgc3RydWN0IHBtNF9tZXNfcnVubGlzdCB7DQo+ICAgCQkJdWludDMyX3QgaWJf
c2l6ZToyMDsNCj4gICAJCQl1aW50MzJfdCBjaGFpbjoxOw0KPiAgIAkJCXVpbnQzMl90IG9mZmxv
YWRfcG9sbGluZzoxOw0KPiAtCQkJdWludDMyX3QgcmVzZXJ2ZWQyOjE7DQo+ICsJCQl1aW50MzJf
dCBjaGFpbmVkX3J1bmxpc3RfaWRsZV9kaXNhYmxlOjE7DQo+ICAgCQkJdWludDMyX3QgdmFsaWQ6
MTsNCj4gICAJCQl1aW50MzJfdCBwcm9jZXNzX2NudDo0Ow0KPiAgIAkJCXVpbnQzMl90IHJlc2Vy
dmVkMzo0Ow0KPiAtLQ0KPiAyLjE3LjENCj4NCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
