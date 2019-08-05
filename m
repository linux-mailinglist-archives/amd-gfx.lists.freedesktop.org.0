Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 074D28163C
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 12:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98CB26E3DB;
	Mon,  5 Aug 2019 10:01:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820078.outbound.protection.outlook.com [40.107.82.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35186E3D6
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 10:01:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IemVP43qjpUbTag8ld84+P8lweDIxZS34AWKPfrzIeAI3GBmmlhbzpfwYG2oHSmIwcsaDa03fuBWe1ORQSsvv8JK2lBsFAOwKxITYJpSghTs/1lkkviW+Ip1w2wo/mN/YkWzHBCNezIBbKJVdzsKmjWwB7dEE9B+F8GXFsozVFFHc+BzNWery4kCpFekWyM9PAIof/SJVqrOV1EjhBV8ANcLVAwZEBEkTgc0ZpRq5MXQCiIt1aU3gBw2+TczpFUDn06m74w+TGklcAryPanE1967O0LjGWEAXJdakfRJE48Xi9VYzXlyIh2X7fcjoXrXmAr7zwWKpKbPQIMXeUPEFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9UzC637fnpna3UTXY81SO6gEdZdlFEmDMfj1c3XxKA=;
 b=AD31q+gizsnFxjVU0qyg6zOm257ln7IwHXQj65pICTXM40BOqPagAz13akMKMlKt2WvnV8MFuGoMOpTB11D0iE7hlSu9XJH1VwZ2M379Vc/HjuurbZzOT0oe9HJqOlXYQoP/P+0OgTzwCYdyaVrQKPA4Y2H0lWRUPWx4Kh1vK2ZacUMqm7reo0doikcFKGeqFWJXpZm/e8jy5Dgqq2K4iJp7EjNSEMYrzvnNdgtlHhGBlv1+G100w9MqL7EG40ri2r+TDZ5REdWnLHYVspPKoTdPkqzkc6gyIbxs4OH3YzwRWtLZ6ZNPOGKy/AWaOOf1eW0UZBX7jPQ+JcLXS+T0eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB2391.namprd12.prod.outlook.com (52.132.141.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 10:01:52 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e%3]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 10:01:52 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/discovery: move common discovery code out of
 navi1*_reg_base_init()
Thread-Topic: [PATCH] drm/amdgpu/discovery: move common discovery code out of
 navi1*_reg_base_init()
Thread-Index: AQHVS3PpzpCXA2t0LkqC1GwxlE0066bsUpxA
Date: Mon, 5 Aug 2019 10:01:52 +0000
Message-ID: <DM5PR12MB1418805075424A71FD90D77DFCDA0@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20190805095509.18449-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190805095509.18449-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 684347ae-e593-44a7-2bb4-08d7198bf09b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2391; 
x-ms-traffictypediagnostic: DM5PR12MB2391:
x-microsoft-antispam-prvs: <DM5PR12MB2391641E6103363C475B1A67FCDA0@DM5PR12MB2391.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(189003)(199004)(13464003)(6246003)(229853002)(2906002)(256004)(26005)(66066001)(53936002)(14444005)(25786009)(71190400001)(478600001)(64756008)(66556008)(8936002)(76116006)(66446008)(5660300002)(6436002)(81166006)(55016002)(81156014)(9686003)(66946007)(6116002)(3846002)(66476007)(52536014)(71200400001)(446003)(11346002)(316002)(33656002)(7736002)(74316002)(305945005)(76176011)(7696005)(4326008)(8676002)(102836004)(6506007)(476003)(53546011)(186003)(110136005)(2501003)(486006)(68736007)(99286004)(86362001)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2391;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wMOg66gzLCQdqapf0HBvvBcRDh1yAhhyn0u+zhvcQvbfoxQOPmUOzzsLzng/+iCTonEAwh2yWomeHX7FzWjY10Yub5p3eW+xBr0wy0ldKd83x0hczF6AsNNUN9ibo2d9WsFGH0mYMkG1c4I2AiFDEMdA4U6nyLyTwLwxr78pWx17Xw/7T1O9sna4Wjjpt3pAkT+8e/PmINSogTEoYDv+OKsMlv7Yk5Grg/H/8vUsOeqXiL96XJAkqUTJTEOkhQYl7GZ9MGL4QPQhdwBnxNoOWDjF4OF+rCUwYkFoWOeDHe4cTqqmv6LbhqIVBBxPNU3erNmv/zpiLRmJROpPm1X4Edc1/CPY7WO6qWRNA1WGw2FNuaPMELoVP254BANuVdGaenP5dYA7TpMZqVSwj2FtAcHWFI6u4rP1D5oV5EVDf0c=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 684347ae-e593-44a7-2bb4-08d7198bf09b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 10:01:52.2215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2391
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9UzC637fnpna3UTXY81SO6gEdZdlFEmDMfj1c3XxKA=;
 b=xDldH0mNIBU/4tEV+d8Fex9QvU9kWOvAYQUkSGvaqYLFGA2GLoZr0RyxUGvhqRHvM3L4NPsDdyVrw/tclYWURCSYh7d5Fki0ACgOSSZrcLqGc0s0WalWdAx5t5unoC8K0BKEq3yK3iD+1e1CTJKnfQlP1mdr96aaFp430CavW+E=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCg0KUmVn
YXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBZdWFuLCBY
aWFvamllIDxYaWFvamllLll1YW5AYW1kLmNvbT4gDQpTZW50OiAyMDE55bm0OOaciDXml6UgMTc6
NTUNClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IFpoYW5nLCBIYXdraW5n
IDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBYaWFvLCBKYWNrIDxKYWNrLlhpYW9AYW1kLmNvbT47
IFl1YW4sIFhpYW9qaWUgPFhpYW9qaWUuWXVhbkBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIXSBk
cm0vYW1kZ3B1L2Rpc2NvdmVyeTogbW92ZSBjb21tb24gZGlzY292ZXJ5IGNvZGUgb3V0IG9mIG5h
dmkxKl9yZWdfYmFzZV9pbml0KCkNCg0KbW92ZSBhbWRncHVfZGlzY292ZXJ5X3JlZ19iYXNlX2lu
aXQoKSBmcm9tIG5hdmkxKl9yZWdfYmFzZV9pbml0KCkgdG8gYSBjb21tb24gZnVuY3Rpb24gbnZf
cmVnX2Jhc2VfaW5pdCgpLg0KDQpTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUu
eXVhbkBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmF2aTEwX3Jl
Z19pbml0LmMgfCAxNCArLS0tLS0tLS0tICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYXZp
MTRfcmVnX2luaXQuYyB8IDE0ICstLS0tLS0tLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9udi5jICAgICAgICAgICAgICB8IDI5ICsrKysrKysrKysrKysrKysrKy0tDQogMyBmaWxlcyBj
aGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25hdmkxMF9yZWdfaW5pdC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvbmF2aTEwX3JlZ19pbml0LmMNCmluZGV4IDU1MDE0Y2U4NjcwYS4u
YTU2YzkzNjIwZTc4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmF2
aTEwX3JlZ19pbml0LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25hdmkxMF9y
ZWdfaW5pdC5jDQpAQCAtMjksMjAgKzI5LDggQEANCiANCiBpbnQgbmF2aTEwX3JlZ19iYXNlX2lu
aXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpICB7DQotCWludCByLCBpOw0KKwlpbnQgaTsN
CiANCi0JaWYgKGFtZGdwdV9kaXNjb3ZlcnkpIHsNCi0JCXIgPSBhbWRncHVfZGlzY292ZXJ5X3Jl
Z19iYXNlX2luaXQoYWRldik7DQotCQlpZiAocikgew0KLQkJCURSTV9XQVJOKCJmYWlsZWQgdG8g
aW5pdCByZWcgYmFzZSBmcm9tIGlwIGRpc2NvdmVyeSB0YWJsZSwgIg0KLQkJCQkJImZhbGxiYWNr
IHRvIGxlZ2FjeSBpbml0IG1ldGhvZFxuIik7DQotCQkJZ290byBsZWdhY3lfaW5pdDsNCi0JCX0N
Ci0NCi0JCXJldHVybiAwOw0KLQl9DQotDQotbGVnYWN5X2luaXQ6DQogCWZvciAoaSA9IDAgOyBp
IDwgTUFYX0lOU1RBTkNFIDsgKytpKSB7DQogCQlhZGV2LT5yZWdfb2Zmc2V0W0dDX0hXSVBdW2ld
ID0gKHVpbnQzMl90ICopKCYoR0NfQkFTRS5pbnN0YW5jZVtpXSkpOw0KIAkJYWRldi0+cmVnX29m
ZnNldFtIRFBfSFdJUF1baV0gPSAodWludDMyX3QgKikoJihIRFBfQkFTRS5pbnN0YW5jZVtpXSkp
OyBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmF2aTE0X3JlZ19pbml0
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYXZpMTRfcmVnX2luaXQuYw0KaW5kZXgg
ODY0NjY4YTdmMWQyLi4zYjVmMGY2NWUwOTYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9uYXZpMTRfcmVnX2luaXQuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvbmF2aTE0X3JlZ19pbml0LmMNCkBAIC0yOSwyMCArMjksOCBAQA0KIA0KIGludCBuYXZp
MTRfcmVnX2Jhc2VfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikgIHsNCi0JaW50IHIs
IGk7DQorCWludCBpOw0KIA0KLQlpZiAoYW1kZ3B1X2Rpc2NvdmVyeSkgew0KLQkJciA9IGFtZGdw
dV9kaXNjb3ZlcnlfcmVnX2Jhc2VfaW5pdChhZGV2KTsNCi0JCWlmIChyKSB7DQotCQkJRFJNX1dB
Uk4oImZhaWxlZCB0byBpbml0IHJlZyBiYXNlIGZyb20gaXAgZGlzY292ZXJ5IHRhYmxlLCAiDQot
CQkJCQkiZmFsbGJhY2sgdG8gbGVnYWN5IGluaXQgbWV0aG9kXG4iKTsNCi0JCQlnb3RvIGxlZ2Fj
eV9pbml0Ow0KLQkJfQ0KLQ0KLQkJcmV0dXJuIDA7DQotCX0NCi0NCi1sZWdhY3lfaW5pdDoNCiAJ
Zm9yIChpID0gMCA7IGkgPCBNQVhfSU5TVEFOQ0UgOyArK2kpIHsNCiAJCWFkZXYtPnJlZ19vZmZz
ZXRbR0NfSFdJUF1baV0gPSAodWludDMyX3QgKikoJihHQ19CQVNFLmluc3RhbmNlW2ldKSk7DQog
CQlhZGV2LT5yZWdfb2Zmc2V0W0hEUF9IV0lQXVtpXSA9ICh1aW50MzJfdCAqKSgmKEhEUF9CQVNF
Lmluc3RhbmNlW2ldKSk7IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9u
di5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyBpbmRleCA5NjE0YzY1ZmEyOTIu
LjllM2Q4ZDRhMGQ4NiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252
LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMNCkBAIC0zNzUsOSArMzc1
LDIyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2lwX2Jsb2NrX3ZlcnNpb24gbnZfY29t
bW9uX2lwX2Jsb2NrID0NCiAJLmZ1bmNzID0gJm52X2NvbW1vbl9pcF9mdW5jcywNCiB9Ow0KIA0K
LWludCBudl9zZXRfaXBfYmxvY2tzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KK3N0YXRp
YyBpbnQgbnZfcmVnX2Jhc2VfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiB7DQot
CS8qIFNldCBJUCByZWdpc3RlciBiYXNlIGJlZm9yZSBhbnkgSFcgcmVnaXN0ZXIgYWNjZXNzICov
DQorCWludCByOw0KKw0KKwlpZiAoYW1kZ3B1X2Rpc2NvdmVyeSkgew0KKwkJciA9IGFtZGdwdV9k
aXNjb3ZlcnlfcmVnX2Jhc2VfaW5pdChhZGV2KTsNCisJCWlmIChyKSB7DQorCQkJRFJNX1dBUk4o
ImZhaWxlZCB0byBpbml0IHJlZyBiYXNlIGZyb20gaXAgZGlzY292ZXJ5IHRhYmxlLCAiDQorCQkJ
CQkiZmFsbGJhY2sgdG8gbGVnYWN5IGluaXQgbWV0aG9kXG4iKTsNCisJCQlnb3RvIGxlZ2FjeV9p
bml0Ow0KKwkJfQ0KKw0KKwkJcmV0dXJuIDA7DQorCX0NCisNCitsZWdhY3lfaW5pdDoNCiAJc3dp
dGNoIChhZGV2LT5hc2ljX3R5cGUpIHsNCiAJY2FzZSBDSElQX05BVkkxMDoNCiAJCW5hdmkxMF9y
ZWdfYmFzZV9pbml0KGFkZXYpOw0KQEAgLTM5Miw2ICs0MDUsMTggQEAgaW50IG52X3NldF9pcF9i
bG9ja3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQogCQlyZXR1cm4gLUVJTlZBTDsNCiAJ
fQ0KIA0KKwlyZXR1cm4gMDsNCit9DQorDQoraW50IG52X3NldF9pcF9ibG9ja3Moc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpIHsNCisJaW50IHI7DQorDQorCS8qIFNldCBJUCByZWdpc3RlciBi
YXNlIGJlZm9yZSBhbnkgSFcgcmVnaXN0ZXIgYWNjZXNzICovDQorCXIgPSBudl9yZWdfYmFzZV9p
bml0KGFkZXYpOw0KKwlpZiAocikNCisJCXJldHVybiByOw0KKw0KIAlhZGV2LT5uYmlvX2Z1bmNz
ID0gJm5iaW9fdjJfM19mdW5jczsNCiANCiAJYWRldi0+bmJpb19mdW5jcy0+ZGV0ZWN0X2h3X3Zp
cnQoYWRldik7DQotLQ0KMi4yMC4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
