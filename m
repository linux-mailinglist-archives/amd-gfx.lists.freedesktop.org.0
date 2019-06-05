Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E666360D7
	for <lists+amd-gfx@lfdr.de>; Wed,  5 Jun 2019 18:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4344E89D39;
	Wed,  5 Jun 2019 16:08:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690065.outbound.protection.outlook.com [40.107.69.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C1B89D3E
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Jun 2019 16:08:22 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2820.namprd12.prod.outlook.com (20.177.240.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 16:08:20 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 16:08:20 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/6] drm/amdkfd: Only initialize sdma vm for sdma queues
Thread-Topic: [PATCH 1/6] drm/amdkfd: Only initialize sdma vm for sdma queues
Thread-Index: AQHVG7ipr8M+4A73IECYhNkp7rggpqaNOgqg
Date: Wed, 5 Jun 2019 16:08:20 +0000
Message-ID: <BL0PR12MB2580ED20758049617DB85CFD80160@BL0PR12MB2580.namprd12.prod.outlook.com>
References: <1559750793-16608-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1559750793-16608-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd2cb553-ccfd-4ed4-d0f8-08d6e9d0077c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2820; 
x-ms-traffictypediagnostic: BL0PR12MB2820:
x-microsoft-antispam-prvs: <BL0PR12MB2820F445BC1869E0783E9F9A80160@BL0PR12MB2820.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(39860400002)(136003)(376002)(346002)(13464003)(199004)(189003)(9686003)(305945005)(55016002)(4326008)(478600001)(2906002)(5640700003)(86362001)(256004)(7736002)(76116006)(81156014)(81166006)(66946007)(5660300002)(66446008)(64756008)(68736007)(66556008)(66476007)(73956011)(2351001)(486006)(11346002)(476003)(2501003)(52536014)(8936002)(8676002)(446003)(53936002)(14454004)(316002)(74316002)(25786009)(71200400001)(33656002)(71190400001)(6246003)(102836004)(66066001)(6916009)(26005)(53546011)(186003)(6506007)(99286004)(72206003)(6116002)(3846002)(6436002)(54906003)(229853002)(76176011)(7696005)(309714004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2820;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RZ0apeSr7vTfa1Rxn9j1quFoR2eIcdkngadwm4OQko2bWtP4uQYq2k3Kv3quBpXt85+7Hhgig7p5OjAqixKJD6nNcJh8ijU02Q7ogGQMP8AL/6BmF3VsDusTcgv1+hDsrNgMEz3s7zCXAKqgy7aTYF3UtQiT/UjtCF/QJssOASc92qLb1B2mrCwUkvp++nsZnTuMGHNyu/4d3rgEfe/OZxGNr8FNOF7GaqWkPJhBmgplBAxR3S34yMVebiw1uj0u9mWf5CZcz19LnmC6ssFrPQmN4MpNwp4eZrq3WpbKP/6oZGEpCsbs2pSf9t+HdD7YdOlnPr0nj/a8Za8Pz8yMME5ouBbmJd/Bej8GAHVBpRr5Jwa0PFkYK9wia3KgsH8oPUFdHlNlMOIStZYdAUzc5740oYWc+zRuYAI6S+najyg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2cb553-ccfd-4ed4-d0f8-08d6e9d0077c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 16:08:20.5954 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2820
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcabwK5aDcgqZrXTBuRrbWKq2rkAUQaoG9jVgo1etUc=;
 b=Yo/E1tTDSXeVnFBE7OP1Urcd04Sum2Ccof6YRRlavnBaZb56m1BCPtiPICogV3IG/G+VZnniSW602nQjM9u7r4owqKQHuhdYXhNOij9s5DphdFuxuVHaUoGUdBsWRBU18CE/SMXWhOzMxA5bVyZjq+xOJIzv0gqcUOIlKIUHixk=
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Freehill, Chris" <Chris.Freehill@amd.com>,
 "Liu, Alex" <Alex.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgRmVsaXgsDQoNCkkgcmViYXNlZCB0aGlzIHNlcmllcyB0byB0aGUgbGF0ZXN0IGRybS1uZXh0
IGNvZGUgYmFzZS4NCg0KUmVnYXJkcywNCk9haw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KRnJvbTogWmVuZywgT2FrIDxPYWsuWmVuZ0BhbWQuY29tPiANClNlbnQ6IFdlZG5lc2RheSwg
SnVuZSA1LCAyMDE5IDEyOjA3IFBNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
CkNjOiBLdWVobGluZywgRmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBaaGFvLCBZb25n
IDxZb25nLlpoYW9AYW1kLmNvbT47IExpdSwgQWxleCA8QWxleC5MaXVAYW1kLmNvbT47IEZyZWVo
aWxsLCBDaHJpcyA8Q2hyaXMuRnJlZWhpbGxAYW1kLmNvbT47IFplbmcsIE9hayA8T2FrLlplbmdA
YW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSCAxLzZdIGRybS9hbWRrZmQ6IE9ubHkgaW5pdGlhbGl6
ZSBzZG1hIHZtIGZvciBzZG1hIHF1ZXVlcw0KDQpEb24ndCBkbyB0aGUgc2FtZSBmb3IgY29tcHV0
ZSBxdWV1ZXMNCg0KQ2hhbmdlLUlkOiBJZDVmNzQzY2ExMGMyYjc2MTU5MGJmZTE4Y2FiMmY4MDJk
M2MwNGQyZA0KU2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQotLS0N
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyB8
IDUgKysrLS0NCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9x
dWV1ZV9tYW5hZ2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1
ZXVlX21hbmFnZXIuYw0KaW5kZXggYzE4MzU1ZC4uMDBjYTNkZCAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQorKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KQEAg
LTEyMDksOCArMTIwOSw5IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3F1ZXVlX2Nwc2NoKHN0cnVjdCBk
ZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLCBzdHJ1Y3QgcXVldWUgKnEsDQogCSAqIHVwZGF0ZXMg
dGhlIGlzX2V2aWN0ZWQgZmxhZyBidXQgaXMgYSBuby1vcCBvdGhlcndpc2UuDQogCSAqLw0KIAlx
LT5wcm9wZXJ0aWVzLmlzX2V2aWN0ZWQgPSAhIXFwZC0+ZXZpY3RlZDsNCi0NCi0JZHFtLT5hc2lj
X29wcy5pbml0X3NkbWFfdm0oZHFtLCBxLCBxcGQpOw0KKwlpZiAocS0+cHJvcGVydGllcy50eXBl
ID09IEtGRF9RVUVVRV9UWVBFX1NETUEgfHwNCisJCXEtPnByb3BlcnRpZXMudHlwZSA9PSBLRkRf
UVVFVUVfVFlQRV9TRE1BX1hHTUkpDQorCQlkcW0tPmFzaWNfb3BzLmluaXRfc2RtYV92bShkcW0s
IHEsIHFwZCk7DQogCXEtPnByb3BlcnRpZXMudGJhX2FkZHIgPSBxcGQtPnRiYV9hZGRyOw0KIAlx
LT5wcm9wZXJ0aWVzLnRtYV9hZGRyID0gcXBkLT50bWFfYWRkcjsNCiAJcmV0dmFsID0gbXFkX21n
ci0+aW5pdF9tcWQobXFkX21nciwgJnEtPm1xZCwgJnEtPm1xZF9tZW1fb2JqLA0KLS0gDQoyLjcu
NA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
