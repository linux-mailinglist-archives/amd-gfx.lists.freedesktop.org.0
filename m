Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A0BDBA5F
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 01:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03E86E0D4;
	Thu, 17 Oct 2019 23:59:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790058.outbound.protection.outlook.com [40.107.79.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B806E0D4
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 23:59:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBKZiDviKKqyM0g6UHL6yNymn4gfH+kANGZ+Tuvi94dEX4RXik7jMJd85cvdTa/g9WAp+a0IdxzUwzUR5ZXfnHA8Yc+KWW1BsvOKKOxDQJjWlHXg2pFQFfpAGk27ZiIVHj/giSBz5UbSI+uigpqXS8o46i1uH+eTBzX43RPLB8uxoQcxwHxS8jkgv2UuhndUe1THKcH6NM1WIiLW8OiId0c4yo1qJgRnpW7Idxnc1A3X1ZK9p/bJ6CJUGdGrrne+tXd/DA3kDjZQJMro127E10GYSyjZuESKEpLtGtSnNTX7o9AiFxFAWVg+vDwUsSDdEy+H0V6kQrQL/OwM264BkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuEedvS2Fwn9Z0cJ6AP8bZ5zOj+Jp8egT/fSibiPYyQ=;
 b=KibOwFEqQt1pYu7fN9xDb+eIENZUBS89jol1TqeYV6eS/r1dMICQ7UYSha/qRUiaUFegXXEjlXx378YB2BTeBdqXO5h3LdGTSCVQ7qn+2kKfaMyswOobdlj6PbggY5KvE94hbtdwle2yCT2wCUd9kBCpEjHFa0Brk/0KuLyOq8qkLIknt5HylEg9T4rVeDKUWMxaM4djJUTMPiHQDTu65NR3MOaUEfyVPqoh3G4a333ahxRKbCOJ8UW7gk+URBnOIkAbQSwAlQz8QWp6KQWWIfM5XTvo6z4Sl51nIDIu3f/IuNQNai1ih9jrn8j8+z6odpYhxlx8vCKS7ZX8uZ6q6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3454.namprd12.prod.outlook.com (20.178.242.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Thu, 17 Oct 2019 23:59:32 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::9d94:f2eb:23ce:2ec3]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::9d94:f2eb:23ce:2ec3%5]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 23:59:32 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/powerplay: use local renoir array sizes for
 clock fetching
Thread-Topic: [PATCH] drm/amdgpu/powerplay: use local renoir array sizes for
 clock fetching
Thread-Index: AQHVhQQInsio34z+lEqIrSjBhf99Iadfg77g
Date: Thu, 17 Oct 2019 23:59:32 +0000
Message-ID: <MN2PR12MB3536B2B3042A74C1DEC61C62FB6D0@MN2PR12MB3536.namprd12.prod.outlook.com>
References: <20191017160027.355095-1-alexander.deucher@amd.com>
In-Reply-To: <20191017160027.355095-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [183.193.122.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d466601-07ca-4020-21bb-08d7535e0e4e
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3454:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB34540568CDA3F79A57698D6FFB6D0@MN2PR12MB3454.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1013;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(199004)(189003)(13464003)(74316002)(66476007)(4326008)(305945005)(6246003)(66556008)(6116002)(476003)(486006)(256004)(6436002)(2906002)(7736002)(11346002)(9686003)(55016002)(64756008)(66446008)(229853002)(3846002)(66946007)(6306002)(8936002)(81166006)(8676002)(81156014)(446003)(52536014)(2501003)(478600001)(76116006)(316002)(99286004)(14454004)(186003)(86362001)(25786009)(53546011)(6506007)(7696005)(66066001)(5660300002)(76176011)(71200400001)(33656002)(71190400001)(110136005)(102836004)(26005)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3454;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EU8NDCZ6brTZELS6DXqp5ivtB0zxYThv+oMBiuhFBpxDW7QUfgZeYfpKQ2av8XrT9rvNosKozPkU6HbltrP3HzfOQa8VhIHkReaEtyZj0rKws5YRwn9CEsa47p7+fgh2vtUgCR7Stqs+gTfIc/qmW3a4vqi3/OzueqoCzqVFuk54qDaGbwslD/gksxQlExkGJ+UQ76mEbs9Q0Ok81As1SxPwiFyjmtIYq8VCNod763SVyepkIpxt1QxNm3DRUI/QE4k7GQV8FU1gocMpXatXz43asAu1mkMHMq6kD6cZUp+iUxFnQ9Na4D9+0xGpVwVRV72cROpehy9DKYYv0ImWDBlrEwxtqcfLaAwdd+75xjTJkX3KLCeJum/+W2L64FbWUQqx71Rk5R47IEjqnupatrcz+d7C0sv8lyBy+cRO1XQXWYZWeO4/JMUxBm1RfKJDShIVx0tQYr/7paJzp2tgTA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d466601-07ca-4020-21bb-08d7535e0e4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 23:59:32.6718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YP1lWUCHIkVnaxmO2OOvwkl/3mvBMPN+JSuN0sVH1LjyyL6cpyq63PUqdbPlC03r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3454
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuEedvS2Fwn9Z0cJ6AP8bZ5zOj+Jp8egT/fSibiPYyQ=;
 b=zVWYhfx4na/+Gh4vMptDWRntk12CQPD/5HEZzKSixBuAWe3rlt7U1oJGieLJ5/B4J0Y7EAK1W+oYCJsrI+KtnoNlFQhguURAG8X6+xdecUMom4R80aqWasV3J+L+GQ4GwQQQzplXZfKuLxjE1OggV0swTkd4f7+l9sMaOSuZhPA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPg0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0Bs
aXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBBbGV4DQo+IERldWNoZXINCj4gU2Vu
dDogRnJpZGF5LCBPY3RvYmVyIDE4LCAyMDE5IDEyOjAwIEFNDQo+IFRvOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1
Y2hlckBhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHUvcG93ZXJwbGF5OiB1
c2UgbG9jYWwgcmVub2lyIGFycmF5IHNpemVzIGZvcg0KPiBjbG9jayBmZXRjaGluZw0KPiANCj4g
VG8gYXZvaWQgd2Fsa2luZyBwYXN0IHRoZSBlbmQgb2YgdGhlIGFycmF5cyBzaW5jZSB0aGUgUFBf
U01VIGRlZmluZXMgZG9uJ3QNCj4gbWF0Y2ggdGhlIHJlbm9pciBkZWZpbmVzLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiAt
LS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYyB8IDggKysr
Ky0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2ly
X3BwdC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jDQo+
IGluZGV4IGZhMzE0YzI3NWE4Mi4uZjBjOGQxYWQyYTgwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jDQo+IEBAIC00MjcsMjIgKzQyNywyMiBAQCBz
dGF0aWMgaW50IHJlbm9pcl9nZXRfZHBtX2Nsb2NrX3RhYmxlKHN0cnVjdA0KPiBzbXVfY29udGV4
dCAqc211LCBzdHJ1Y3QgZHBtX2Nsb2Nrcw0KPiAgCWlmICghY2xvY2tfdGFibGUgfHwgIXRhYmxl
KQ0KPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gDQo+IC0JZm9yIChpID0gMDsgaSA8IFBQX1NNVV9O
VU1fRENGQ0xLX0RQTV9MRVZFTFM7IGkrKykgew0KPiArCWZvciAoaSA9IDA7IGkgPCBOVU1fRENG
Q0xLX0RQTV9MRVZFTFM7IGkrKykgew0KPiAgCQljbG9ja190YWJsZS0+RGNmQ2xvY2tzW2ldLkZy
ZXEgPSB0YWJsZS0+RGNmQ2xvY2tzW2ldLkZyZXE7DQo+ICAJCWNsb2NrX3RhYmxlLT5EY2ZDbG9j
a3NbaV0uVm9sID0gdGFibGUtPkRjZkNsb2Nrc1tpXS5Wb2w7DQo+ICAJfQ0KPiANCj4gLQlmb3Ig
KGkgPSAwOyBpIDwgUFBfU01VX05VTV9TT0NDTEtfRFBNX0xFVkVMUzsgaSsrKSB7DQo+ICsJZm9y
IChpID0gMDsgaSA8IE5VTV9TT0NDTEtfRFBNX0xFVkVMUzsgaSsrKSB7DQo+ICAJCWNsb2NrX3Rh
YmxlLT5Tb2NDbG9ja3NbaV0uRnJlcSA9IHRhYmxlLT5Tb2NDbG9ja3NbaV0uRnJlcTsNCj4gIAkJ
Y2xvY2tfdGFibGUtPlNvY0Nsb2Nrc1tpXS5Wb2wgPSB0YWJsZS0+U29jQ2xvY2tzW2ldLlZvbDsN
Cj4gIAl9DQo+IA0KPiAtCWZvciAoaSA9IDA7IGkgPCBQUF9TTVVfTlVNX0ZDTEtfRFBNX0xFVkVM
UzsgaSsrKSB7DQo+ICsJZm9yIChpID0gMDsgaSA8IE5VTV9GQ0xLX0RQTV9MRVZFTFM7IGkrKykg
ew0KPiAgCQljbG9ja190YWJsZS0+RkNsb2Nrc1tpXS5GcmVxID0gdGFibGUtPkZDbG9ja3NbaV0u
RnJlcTsNCj4gIAkJY2xvY2tfdGFibGUtPkZDbG9ja3NbaV0uVm9sID0gdGFibGUtPkZDbG9ja3Nb
aV0uVm9sOw0KPiAgCX0NCj4gDQo+IC0JZm9yIChpID0gMDsgaTwgIFBQX1NNVV9OVU1fTUVNQ0xL
X0RQTV9MRVZFTFM7IGkrKykgew0KPiArCWZvciAoaSA9IDA7IGk8ICBOVU1fTUVNQ0xLX0RQTV9M
RVZFTFM7IGkrKykgew0KPiAgCQljbG9ja190YWJsZS0+TWVtQ2xvY2tzW2ldLkZyZXEgPSB0YWJs
ZS0+TWVtQ2xvY2tzW2ldLkZyZXE7DQo+ICAJCWNsb2NrX3RhYmxlLT5NZW1DbG9ja3NbaV0uVm9s
ID0gdGFibGUtPk1lbUNsb2Nrc1tpXS5Wb2w7DQo+ICAJfQ0KPiAtLQ0KPiAyLjIzLjANCj4gDQo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1n
ZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
