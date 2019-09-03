Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0166BA6C89
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 17:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8032C890EE;
	Tue,  3 Sep 2019 15:09:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710078.outbound.protection.outlook.com [40.107.71.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D66C890EE
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 15:09:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2/OmxMX0v0kLmFc8klb9FhjUzUQBmR9+EZXiL2NLTaXSBk0yor4zm4Uhw4reItlsySX6O+RKGUaaCb6Ts71g1q+nYUmrjPbFWI5fLFP3d0LFrQkRSH5nenZowLCGAZVyAby1KjeO4yxro3fx7KYveUFNmvS18982hRMqXJ+3pEBx9JB5lQm4M0mYSiOA+G9DmVGaZWO3qXS82x4YimQuAe+R2cBYB92APWgsQD6akWXFvcYPT1TaS+vOz9vYChDVRLArT0i+hLY6C9EIiGV7+mq4Kxb6ik3aKM9ptfMwNWeRMF1r/ODRdCJAuy38oWPdLsFl22rf2/ln3nE+SL4bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAdRUR5Wnw+hAJ+w42cXHSG5YqXjishgukcCQnFYb00=;
 b=BpSOqQzFmb13mZo2fuZGaTpn/6wfXR/2f1zd/lhQ3cN2odD/6PIzCX9TFCAtLePPu+IBgwIimvu2xQ7bafyoluJ9YQ7FwoaIg9ZswxkSAlXgiqet00dspW0Ho/Jvq+sb2R6SVMotrWuivnmU/VOgbl4/gXW48nWKvubXCjUOgFfl7iB9Ke5fpQav8mUDjGuP5KEEC5DJ0aVUGgg7iXSgzlAGtkI+kbwFWSGZZPXfNevOgztvZdydcRDf44CvuUSdFjzZ3csJF7ruejmxe8tIMOKtj4MAN2tkSYD7mppUB+obuvJcl/VLvm7jUjj0yWaJlzjyI2rruGX3oWbNGlb5IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2514.namprd12.prod.outlook.com (52.132.30.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Tue, 3 Sep 2019 15:09:51 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543%7]) with mapi id 15.20.2220.022; Tue, 3 Sep 2019
 15:09:51 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu: Disable page faults while reading user
 wptrs
Thread-Topic: [PATCH 2/2] drm/amdgpu: Disable page faults while reading user
 wptrs
Thread-Index: AQHVXvHmbWbrFrCbNki5cdr1PaZS1acaFSWg
Date: Tue, 3 Sep 2019 15:09:51 +0000
Message-ID: <BL0PR12MB25805CD72F3654969AF2F47B80B90@BL0PR12MB2580.namprd12.prod.outlook.com>
References: <20190830051443.3906-1-Felix.Kuehling@amd.com>
 <20190830051443.3906-2-Felix.Kuehling@amd.com>
In-Reply-To: <20190830051443.3906-2-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.228.209.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e0c60c2-2ee0-4c67-c421-08d73080c4c5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2514; 
x-ms-traffictypediagnostic: BL0PR12MB2514:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB25148CF4C8A5133FEF58968180B90@BL0PR12MB2514.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(189003)(199004)(13464003)(316002)(2906002)(478600001)(9686003)(6306002)(6116002)(6436002)(76176011)(7696005)(229853002)(26005)(6506007)(81166006)(81156014)(66946007)(3846002)(52536014)(53546011)(66066001)(110136005)(53936002)(6246003)(55016002)(186003)(102836004)(8936002)(99286004)(25786009)(446003)(966005)(71190400001)(71200400001)(14444005)(256004)(305945005)(74316002)(11346002)(66476007)(66556008)(64756008)(66446008)(2501003)(476003)(14454004)(5660300002)(486006)(86362001)(7736002)(33656002)(8676002)(76116006)(17423001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2514;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WjkqK18ACy+5Zx/6KgaN3/6EUYi7FYtaiVdiCJzbuCOEX6bnW3u6L4MNOSjZU6HZQI3IJo9Ni0laeNQe7XySicDVY9jAwB+qRbnvFU1C/ShfbchkArBHznPU2RV3pjC45SVtZ1HjzIdJhPL1QBFiR/VV/eLHJ/+I50E8s2k9vrukV/vy1QSHYj6MxXj73KkVa7QQrE7kGeBqHPPY1BEWbPq6OTqcwESikKhl+LF8RyBWA/G8NdR6LZCSjBd6lMEqzYMBo1O8qQdI5qtqjn0xm9wndmPTmFf643paNfQItyLfRNF7mw8O0Y00OSH4hBeFlkwgwUOl/8PEpybOWrvdyy0UqNZ+3ESSgUBd9ixPkF+ufH/D1uRjtHoN/wyWgMKOBJIz+YVM5t9eyC2HkHcWjXHYmXo1AGxod7qqIB4dYjI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0c60c2-2ee0-4c67-c421-08d73080c4c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 15:09:51.0557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SMLHCvji5UUcvC08GJ7fQE9FQxGYt+AjBn7u91kKrGFR6p2HkecAEAQQs7wB6cEO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2514
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAdRUR5Wnw+hAJ+w42cXHSG5YqXjishgukcCQnFYb00=;
 b=TzkQ2X+sLCw1/oQzVymIijgMuxztWXNB1QpNCvrrj6pUe5hSYeVjy9REav6UVaGu6862LTQRKkzma63hXqiG/mT1qi1QdXplOpz9jiJwTZC3xttxHzkttWDfN69vc9ggaWif4brf93jXKS3/UOIo+J6rWs9TESPPHiOfltNrX+g=
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

UmV2aWV3ZWQtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPg0KDQpSZWdhcmRzLA0KT2Fr
DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgS3VlaGxpbmcsIEZlbGl4
DQpTZW50OiBGcmlkYXksIEF1Z3VzdCAzMCwgMjAxOSAxOjE1IEFNDQpUbzogYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFtQQVRDSCAyLzJdIGRybS9hbWRncHU6IERpc2Fi
bGUgcGFnZSBmYXVsdHMgd2hpbGUgcmVhZGluZyB1c2VyIHdwdHJzDQoNClRoZXNlIHdwdHJzIG11
c3QgYmUgcGlubmVkIGFuZCBHUFUgYWNjZXNzaWJsZSB3aGVuIHRoaXMgaXMgY2FsbGVkIGZyb20g
aHFkX2xvYWQgZnVuY3Rpb25zLiBTbyB0aGV5IHNob3VsZCBuZXZlciBmYXVsdC4gVGhpcyByZXNv
bHZlcyBhIGNpcmN1bGFyIGxvY2sgZGVwZW5kZW5jeSBpc3N1ZSBpbnZvbHZpbmcgZm91ciBsb2Nr
cyBpbmNsdWRpbmcgdGhlIERRTSBsb2NrIGFuZCBtbWFwX3NlbS4NCg0KU2lnbmVkLW9mZi1ieTog
RmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmggfCA4ICsrKysrKysrDQogMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2FtZGtmZC5oDQppbmRleCAxYWY4ZjgzZjdlMDIuLmMwMDNkOTI3NTgzNyAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaA0KKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oDQpAQCAtMTc5LDEwICsxNzks
MTcgQEAgdWludDY0X3QgYW1kZ3B1X2FtZGtmZF9nZXRfbW1pb19yZW1hcF9waHlzX2FkZHIoc3Ry
dWN0IGtnZF9kZXYgKmtnZCk7ICB1aW50MzJfdCBhbWRncHVfYW1ka2ZkX2dldF9udW1fZ3dzKHN0
cnVjdCBrZ2RfZGV2ICprZ2QpOyAgdWludDhfdCBhbWRncHVfYW1ka2ZkX2dldF94Z21pX2hvcHNf
Y291bnQoc3RydWN0IGtnZF9kZXYgKmRzdCwgc3RydWN0IGtnZF9kZXYgKnNyYyk7DQogDQorLyog
UmVhZCB1c2VyIHdwdHIgZnJvbSBhIHNwZWNpZmllZCB1c2VyIGFkZHJlc3Mgc3BhY2Ugd2l0aCBw
YWdlIGZhdWx0DQorICogZGlzYWJsZWQuIFRoZSBtZW1vcnkgbXVzdCBiZSBwaW5uZWQgYW5kIG1h
cHBlZCB0byB0aGUgaGFyZHdhcmUgd2hlbg0KKyAqIHRoaXMgaXMgY2FsbGVkIGluIGhxZF9sb2Fk
IGZ1bmN0aW9ucywgc28gaXQgc2hvdWxkIG5ldmVyIGZhdWx0IGluDQorICogdGhlIGZpcnN0IHBs
YWNlLiBUaGlzIHJlc29sdmVzIGEgY2lyY3VsYXIgbG9jayBkZXBlbmRlbmN5IGludm9sdmluZw0K
KyAqIGZvdXIgbG9ja3MsIGluY2x1ZGluZyB0aGUgRFFNIGxvY2sgYW5kIG1tYXBfc2VtLg0KKyAq
Lw0KICNkZWZpbmUgcmVhZF91c2VyX3dwdHIobW1wdHIsIHdwdHIsIGRzdCkJCQkJXA0KIAkoewkJ
CQkJCQkJXA0KIAkJYm9vbCB2YWxpZCA9IGZhbHNlOwkJCQkJXA0KIAkJaWYgKChtbXB0cikgJiYg
KHdwdHIpKSB7CQkJCVwNCisJCQlwYWdlZmF1bHRfZGlzYWJsZSgpOwkJCQlcDQogCQkJaWYgKCht
bXB0cikgPT0gY3VycmVudC0+bW0pIHsJCQlcDQogCQkJCXZhbGlkID0gIWdldF91c2VyKChkc3Qp
LCAod3B0cikpOwlcDQogCQkJfSBlbHNlIGlmIChjdXJyZW50LT5tbSA9PSBOVUxMKSB7CQlcDQpA
QCAtMTkwLDYgKzE5Nyw3IEBAIHVpbnQ4X3QgYW1kZ3B1X2FtZGtmZF9nZXRfeGdtaV9ob3BzX2Nv
dW50KHN0cnVjdCBrZ2RfZGV2ICpkc3QsIHN0cnVjdCBrZ2RfZGV2ICpzDQogCQkJCXZhbGlkID0g
IWdldF91c2VyKChkc3QpLCAod3B0cikpOwlcDQogCQkJCXVudXNlX21tKG1tcHRyKTsJCQlcDQog
CQkJfQkJCQkJCVwNCisJCQlwYWdlZmF1bHRfZW5hYmxlKCk7CQkJCVwNCiAJCX0JCQkJCQkJXA0K
IAkJdmFsaWQ7CQkJCQkJCVwNCiAJfSkNCi0tDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
