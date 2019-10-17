Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 869C3DB2F0
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 19:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C0F6E071;
	Thu, 17 Oct 2019 17:04:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710056.outbound.protection.outlook.com [40.107.71.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755736E071
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 17:04:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThJV63oih/eDN3vNVNA/eqRxkJPC0gkr+xwxrmrfM99D9ttjSTZ7VA06a5Ba9xa8GIkPn4IzUVQbrnJBAJ1QcNdZ2pFvup+nUvMFaFQoPvn/OARNCwU/nby6gm750GGd9OWOzGxs+hSeP1oEqET4JKsKoLFbOUwNb7qTt43dgdb57AJ77t5DIBR95Qs+ftxosBWt7PTuiAJex5x7QyBmDQAupRl0g7AQjXypPE11JpyhUCg7xmM6CrT4BBLSu89QkPTpU/xW+h65Km6cQtOBVo8lRxiUCSYS7Eq+xWuVTOITr1WhwJQe4YZGIFGf2pikqTbdF6h4tCq/IkI1VkTlvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ns5PgFnU0zQRn7KOPjx2z/QYbqvKiBwLCDQfDzw1Ck8=;
 b=gQ/jKxKQ8X4F5Alp5KoR5TAPDJdua/WCUTHMPmWfQTABQOtu44E5l5pn/YWnhiZH+DSmsrSEk4sr4pER4a/VshWPuKunsIsmRSHdiZ/76cqh7GgKDltaXz/ktVDYlQTn6Sj8HF7KFbAdUsmSUJSUXO6TEvas11E88J4XJ0B3yh6qnxhW2ptc26vU+9twgmNxhT4uUuxNSDk4XfcgD0U7B5VFi6coczzPV8BbsaVwPad2lh89fkTIj0nlGNg102h3aqeYzC/7E9j4Ky0dpgZnIG8qoMLwc04G9++sij+aMLus5Oa1D6X80Q6mBTNoYzoyZ4PrhFhyeqUAF1Uq8vy7kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR12MB1254.namprd12.prod.outlook.com (10.168.169.17) by
 CY4PR12MB1559.namprd12.prod.outlook.com (10.172.70.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.19; Thu, 17 Oct 2019 17:04:36 +0000
Received: from CY4PR12MB1254.namprd12.prod.outlook.com
 ([fe80::88ff:f1df:158e:2add]) by CY4PR12MB1254.namprd12.prod.outlook.com
 ([fe80::88ff:f1df:158e:2add%11]) with mapi id 15.20.2347.023; Thu, 17 Oct
 2019 17:04:36 +0000
From: James Zhu <jamesz@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amdgpu/vce: fix allocation size in enc ring test
Thread-Topic: [PATCH 1/2] drm/amdgpu/vce: fix allocation size in enc ring test
Thread-Index: AQHVhQHbOXQcANogJUKIN/OeHP81GqdfD+IA
Date: Thu, 17 Oct 2019 17:04:36 +0000
Message-ID: <c237a8d4-176f-8d74-b936-b04525af81c3@amd.com>
References: <20191017154456.335015-1-alexander.deucher@amd.com>
In-Reply-To: <20191017154456.335015-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::21) To CY4PR12MB1254.namprd12.prod.outlook.com
 (2603:10b6:903:41::17)
x-originating-ip: [165.204.55.251]
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2a7b449-4695-412d-273e-08d7532416b6
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR12MB1559:
x-microsoft-antispam-prvs: <CY4PR12MB15592C010CAEF3DB582E8D50E46D0@CY4PR12MB1559.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(189003)(199004)(316002)(66946007)(25786009)(229853002)(14444005)(256004)(6486002)(486006)(8936002)(14454004)(478600001)(2351001)(8676002)(66476007)(66446008)(64756008)(66556008)(31696002)(476003)(81156014)(66066001)(4001150100001)(71200400001)(71190400001)(81166006)(2616005)(7736002)(52116002)(76176011)(386003)(53546011)(6506007)(6246003)(3846002)(6116002)(446003)(5640700003)(305945005)(2906002)(102836004)(186003)(26005)(31686004)(6512007)(11346002)(5660300002)(99286004)(36756003)(6436002)(6916009)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1559;
 H:CY4PR12MB1254.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YmKkqP2C06Gn7wxQrhPSiguDBmBbeYMT9/vfxHxwvlHzYxN6EsLMnhedfXuG9YcLNQr0NjWBNPde1piejdM8rDE/fCLNR32Votn/XWj07pYyxKm7dQXVbExVOmKGkZ+OUxq7pL9DDjk1tp8ho5GI71TAL3DzRK+kycSAvO1/nGNusKNIW7P+1DZZVJJbEjEMh81+AH5wle+vdwiSKQXiN9/wcIVY/XHp9wmHU8ycCa/So/lxDy2ylQx3eE/6OGQdF0FH9EDgruADVMiA7JxWJUJY2EPrBZ4DKimiL6dnFqWsU3Hct5IXGl662jtFrkbbYe24kGsaeRE+5qRsyeOB3fHJRdrLkXqCWeaKzSGg9/qmTwMgvsVd6Buj5huAKVBbT7VweQGJpJGEcNoAAwuBOmNMt6ONphYYPTd+KscH05Y=
x-ms-exchange-transport-forked: True
Content-ID: <E17F0BCCBDE7914298E1716379A73CB2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a7b449-4695-412d-273e-08d7532416b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 17:04:36.4057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9XFkaZ1gEgZvB34ugZ/5W/8fmdWyWZBxeAPbOTDUQn+HiTTNbl7wXVzh1YH/HlGe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1559
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ns5PgFnU0zQRn7KOPjx2z/QYbqvKiBwLCDQfDzw1Ck8=;
 b=ZClQ7Cc2SWuOSuB7SqSk3UBch19tUiYUu6pL7zStMT/KvydX8a4TZ0N5IOllueh8xk+x1O9PI/EcaokgfAzTByl9J4sWGlnnPQ505dGh7NXsl9LMEtjsunB+ccV6mcQLBsQlZ257CejenKy0PYqjYMhFTAKVIvc9lADDh7Ego7Y=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=James.Zhu@amd.com; 
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

UmV2aWV3ZWQtYnk6IEphbWVzIFpodTxKYW1lcy5aaHVAYW1kLmNvbT4gIGZvciB0aGlzIHNlcmll
cw0KDQpPbiAyMDE5LTEwLTE3IDExOjQ0IGEubS4sIEFsZXggRGV1Y2hlciB3cm90ZToNCj4gV2Ug
bmVlZCB0byBhbGxvY2F0ZSBhIGxhcmdlIGVub3VnaCBidWZmZXIgZm9yIHRoZQ0KPiBmZWVkYmFj
ayBidWZmZXIsIG90aGVyd2lzZSB0aGUgSUIgdGVzdCBjYW4gb3ZlcndyaXRlDQo+IG90aGVyIG1l
bW9yeS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dmNlLmMgfCAyMCArKysrKysrKysrKysrKystLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92Y2UuaCB8ICAxICsNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdmNlLmMNCj4gaW5kZXggYjcwYjNjNDViYjI5Li42NTA0NGIxYjNkNGMgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmMNCj4gQEAgLTQyOSwxMyArNDI5
LDE0IEBAIHZvaWQgYW1kZ3B1X3ZjZV9mcmVlX2hhbmRsZXMoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsIHN0cnVjdCBkcm1fZmlsZSAqZmlscCkNCj4gICAgKiBPcGVuIHVwIGEgc3RyZWFtIGZv
ciBIVyB0ZXN0DQo+ICAgICovDQo+ICAgaW50IGFtZGdwdV92Y2VfZ2V0X2NyZWF0ZV9tc2coc3Ry
dWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1aW50MzJfdCBoYW5kbGUsDQo+ICsJCQkgICAgICBzdHJ1
Y3QgYW1kZ3B1X2JvICpibywNCj4gICAJCQkgICAgICBzdHJ1Y3QgZG1hX2ZlbmNlICoqZmVuY2Up
DQo+ICAgew0KPiAgIAljb25zdCB1bnNpZ25lZCBpYl9zaXplX2R3ID0gMTAyNDsNCj4gICAJc3Ry
dWN0IGFtZGdwdV9qb2IgKmpvYjsNCj4gICAJc3RydWN0IGFtZGdwdV9pYiAqaWI7DQo+ICAgCXN0
cnVjdCBkbWFfZmVuY2UgKmYgPSBOVUxMOw0KPiAtCXVpbnQ2NF90IGR1bW15Ow0KPiArCXVpbnQ2
NF90IGFkZHI7DQo+ICAgCWludCBpLCByOw0KPiAgIA0KPiAgIAlyID0gYW1kZ3B1X2pvYl9hbGxv
Y193aXRoX2liKHJpbmctPmFkZXYsIGliX3NpemVfZHcgKiA0LCAmam9iKTsNCj4gQEAgLTQ0NCw3
ICs0NDUsNyBAQCBpbnQgYW1kZ3B1X3ZjZV9nZXRfY3JlYXRlX21zZyhzdHJ1Y3QgYW1kZ3B1X3Jp
bmcgKnJpbmcsIHVpbnQzMl90IGhhbmRsZSwNCj4gICANCj4gICAJaWIgPSAmam9iLT5pYnNbMF07
DQo+ICAgDQo+IC0JZHVtbXkgPSBpYi0+Z3B1X2FkZHIgKyAxMDI0Ow0KPiArCWFkZHIgPSBhbWRn
cHVfYm9fZ3B1X29mZnNldChibyk7DQo+ICAgDQo+ICAgCS8qIHN0aXRjaCB0b2dldGhlciBhbiBW
Q0UgY3JlYXRlIG1zZyAqLw0KPiAgIAlpYi0+bGVuZ3RoX2R3ID0gMDsNCj4gQEAgLTQ3Niw4ICs0
NzcsOCBAQCBpbnQgYW1kZ3B1X3ZjZV9nZXRfY3JlYXRlX21zZyhzdHJ1Y3QgYW1kZ3B1X3Jpbmcg
KnJpbmcsIHVpbnQzMl90IGhhbmRsZSwNCj4gICANCj4gICAJaWItPnB0cltpYi0+bGVuZ3RoX2R3
KytdID0gMHgwMDAwMDAxNDsgLyogbGVuICovDQo+ICAgCWliLT5wdHJbaWItPmxlbmd0aF9kdysr
XSA9IDB4MDUwMDAwMDU7IC8qIGZlZWRiYWNrIGJ1ZmZlciAqLw0KPiAtCWliLT5wdHJbaWItPmxl
bmd0aF9kdysrXSA9IHVwcGVyXzMyX2JpdHMoZHVtbXkpOw0KPiAtCWliLT5wdHJbaWItPmxlbmd0
aF9kdysrXSA9IGR1bW15Ow0KPiArCWliLT5wdHJbaWItPmxlbmd0aF9kdysrXSA9IHVwcGVyXzMy
X2JpdHMoYWRkcik7DQo+ICsJaWItPnB0cltpYi0+bGVuZ3RoX2R3KytdID0gYWRkcjsNCj4gICAJ
aWItPnB0cltpYi0+bGVuZ3RoX2R3KytdID0gMHgwMDAwMDAwMTsNCj4gICANCj4gICAJZm9yIChp
ID0gaWItPmxlbmd0aF9kdzsgaSA8IGliX3NpemVfZHc7ICsraSkNCj4gQEAgLTExMTAsMTMgKzEx
MTEsMjAgQEAgaW50IGFtZGdwdV92Y2VfcmluZ190ZXN0X3Jpbmcoc3RydWN0IGFtZGdwdV9yaW5n
ICpyaW5nKQ0KPiAgIGludCBhbWRncHVfdmNlX3JpbmdfdGVzdF9pYihzdHJ1Y3QgYW1kZ3B1X3Jp
bmcgKnJpbmcsIGxvbmcgdGltZW91dCkNCj4gICB7DQo+ICAgCXN0cnVjdCBkbWFfZmVuY2UgKmZl
bmNlID0gTlVMTDsNCj4gKwlzdHJ1Y3QgYW1kZ3B1X2JvICpibyA9IE5VTEw7DQo+ICAgCWxvbmcg
cjsNCj4gICANCj4gICAJLyogc2tpcCB2Y2UgcmluZzEvMiBpYiB0ZXN0IGZvciBub3csIHNpbmNl
IGl0J3Mgbm90IHJlbGlhYmxlICovDQo+ICAgCWlmIChyaW5nICE9ICZyaW5nLT5hZGV2LT52Y2Uu
cmluZ1swXSkNCj4gICAJCXJldHVybiAwOw0KPiAgIA0KPiAtCXIgPSBhbWRncHVfdmNlX2dldF9j
cmVhdGVfbXNnKHJpbmcsIDEsIE5VTEwpOw0KPiArCXIgPSBhbWRncHVfYm9fY3JlYXRlX3Jlc2Vy
dmVkKHJpbmctPmFkZXYsIDUxMiwgUEFHRV9TSVpFLA0KPiArCQkJCSAgICAgIEFNREdQVV9HRU1f
RE9NQUlOX1ZSQU0sDQo+ICsJCQkJICAgICAgJmJvLCBOVUxMLCBOVUxMKTsNCj4gKwlpZiAocikN
Cj4gKwkJcmV0dXJuIHI7DQo+ICsNCj4gKwlyID0gYW1kZ3B1X3ZjZV9nZXRfY3JlYXRlX21zZyhy
aW5nLCAxLCBibywgTlVMTCk7DQo+ICAgCWlmIChyKQ0KPiAgIAkJZ290byBlcnJvcjsNCj4gICAN
Cj4gQEAgLTExMzIsNSArMTE0MCw3IEBAIGludCBhbWRncHVfdmNlX3JpbmdfdGVzdF9pYihzdHJ1
Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIGxvbmcgdGltZW91dCkNCj4gICANCj4gICBlcnJvcjoNCj4g
ICAJZG1hX2ZlbmNlX3B1dChmZW5jZSk7DQo+ICsJYW1kZ3B1X2JvX3VucmVzZXJ2ZShibyk7DQo+
ICsJYW1kZ3B1X2JvX3VucmVmKCZibyk7DQo+ICAgCXJldHVybiByOw0KPiAgIH0NCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuaCBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuaA0KPiBpbmRleCAzMGVhNTRkZDkxMTcuLmU4
MDJmN2Q5ZGIwYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZjZS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2Uu
aA0KPiBAQCAtNTksNiArNTksNyBAQCBpbnQgYW1kZ3B1X3ZjZV9lbnRpdHlfaW5pdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldik7DQo+ICAgaW50IGFtZGdwdV92Y2Vfc3VzcGVuZChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldik7DQo+ICAgaW50IGFtZGdwdV92Y2VfcmVzdW1lKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KTsNCj4gICBpbnQgYW1kZ3B1X3ZjZV9nZXRfY3JlYXRlX21zZyhz
dHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IGhhbmRsZSwNCj4gKwkJCSAgICAgIHN0
cnVjdCBhbWRncHVfYm8gKmJvLA0KPiAgIAkJCSAgICAgIHN0cnVjdCBkbWFfZmVuY2UgKipmZW5j
ZSk7DQo+ICAgaW50IGFtZGdwdV92Y2VfZ2V0X2Rlc3Ryb3lfbXNnKHN0cnVjdCBhbWRncHVfcmlu
ZyAqcmluZywgdWludDMyX3QgaGFuZGxlLA0KPiAgIAkJCSAgICAgICBib29sIGRpcmVjdCwgc3Ry
dWN0IGRtYV9mZW5jZSAqKmZlbmNlKTsNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
