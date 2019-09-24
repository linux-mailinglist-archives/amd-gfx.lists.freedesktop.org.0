Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D933EBBFE4
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 04:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6732689A91;
	Tue, 24 Sep 2019 02:10:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750050.outbound.protection.outlook.com [40.107.75.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32FB489A91
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 02:10:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MkzKQL5dwutKfa0uN+EvU7WA0jk+RZWew6ob+gNAtbJxD8VUiSXNJh9FAPJ5jF7IT+VOxD8lyc+EEUV5N6ML2qnWX0xvvjMSXsxlvUjXa490wfqnBMPT1ol9LbEPL8uaA4Kb0IJ0aWDHXm2e6bxcFU3vME5F3mSoiVP/DaxWJ5CllAOvSULGxhEBAQve3aGUtzyvYiPERqTdOImHsE+6THs+UZ48r4AsLF2gKUAbtbHyu/Wf1K5JFFQQ4DzRSm+ORB1DUy8DZT2+cCWPCbuQZyMg5d1qdceP5NK3TdxuV5M6PFYfnfJ6IBm16Rh+Z0ldOM9/dxEbMyvyaFTmKljYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBEcp5uDkoGFJwKF+G1FjnhOgUIHu2vdrFJwBN31FaU=;
 b=beB+xZLvNi0dWPoH28Ds7qHZLyFHMBYCGB3Iprk01PUCeCQeF8H9y62BiqXdIUkWL6ASug1zR8Tfmes7Ol7v0mj535ZyAfcWO0OAlCw1AS7JIhCZE5qdf04IVtssIzbSE4xhE5ZT6sNnAmT+P++vt5NsFdvIogJ6kpphvJ0zuqPVw6zIJWRT2peDEujlc69F6DkS0RWh84Y1EjJqYeXXyAm9HEgThhZdjxfb98uYGTwWMbZNIvueIt42Mw8IXuLjneATDHyV/h8IQ8rpAKFogbr9tRKQet/TD5dY3wRjEk7ueCayjrlWJBs41bFgU4KlsrLsyhh4zKxE2Y0A4dBTDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3712.namprd12.prod.outlook.com (10.255.236.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Tue, 24 Sep 2019 02:10:28 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::1882:4ddf:2b19:74ed%6]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 02:10:28 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu/gfx10: enable gfxoff for navi12
Thread-Topic: [PATCH 2/2] drm/amdgpu/gfx10: enable gfxoff for navi12
Thread-Index: AQHVchbxNOiSiisv2kOq5IfSSLrEVqc6FjXA
Date: Tue, 24 Sep 2019 02:10:28 +0000
Message-ID: <MN2PR12MB3344A889EA39CCD851388812E4840@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190923135746.8066-1-xiaojie.yuan@amd.com>
 <20190923135746.8066-2-xiaojie.yuan@amd.com>
In-Reply-To: <20190923135746.8066-2-xiaojie.yuan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96072d83-599d-45e6-bbce-08d740945eb0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3712; 
x-ms-traffictypediagnostic: MN2PR12MB3712:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3712882AA5FA2D7DB4436F47E4840@MN2PR12MB3712.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(13464003)(189003)(199004)(76176011)(7696005)(26005)(11346002)(66556008)(256004)(66066001)(316002)(14444005)(86362001)(478600001)(2906002)(305945005)(6506007)(2501003)(14454004)(53546011)(99286004)(25786009)(54906003)(102836004)(110136005)(76116006)(74316002)(7736002)(81156014)(81166006)(52536014)(8936002)(5660300002)(6246003)(486006)(66446008)(6116002)(186003)(66476007)(476003)(9686003)(3846002)(71190400001)(71200400001)(55016002)(4326008)(8676002)(446003)(6436002)(33656002)(229853002)(64756008)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3712;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sP+DRn+ictcJZ5/W6INZaHQtasBINosXAe4Ke7RYJycwitpzsNhpvucKR3hXKvHjztzlOic2rap6St9J6GpoTa4bq4gE3xryByyVBZFPGnkfbTQFq4T7O1nj+S+z5r57CSPUtfkcaq4TxxFfb/phogz7BN9IRxxn+cTgAxD+TyREl2DeKzRoHqreQNla6Hgu3/M1jd1+4DzgwXYvRlEAZ20tgdUcXTgYFam01X5DvZRVHPRtPiJor1ED5Sfg2G/XKloE5Zeq9jS5/i59UxU+Kb6QeG9VJPci10NrHSFXK58B4xvtY9YtLgKu+bFugmaSy7iVeFodiXKqf8dH0NGITXhjUiGedEC1I9Ng7N/F7XTkSl9AXcuBhVTgZTN6bSK+S7jI2jrANcoJR/lfpw89KF3u4mjM28OnaZznGGIDNMU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96072d83-599d-45e6-bbce-08d740945eb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 02:10:28.1714 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZMkYmo78/4waCbtw+bgR7wQ+K4m6GMZ2/h22V7fP7EPlgb76tcFhwkIwuGnUh3E7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3712
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBEcp5uDkoGFJwKF+G1FjnhOgUIHu2vdrFJwBN31FaU=;
 b=0NstHUvGyCA2rlwsyY5y37G23xBV3gVNiZyJnkiQrYa0GneasQfSa0PNU8IyFZjYGZBoTtQIesmjzITw/2M/EfwjiiioaZcdQFIFWoCRmu2ZMEk3EM09tfMgiaP7oFoWJ5zLZtqCAlUl/LcqxyYQa+yBEL7W059qACGYGmGEOxw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+CgotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQpGcm9tOiBZdWFuLCBYaWFvamllIDxYaWFvamllLll1YW5AYW1kLmNvbT4g
ClNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDIzLCAyMDE5IDk6NTggUE0KVG86IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQu
Y29tPjsgWGlhbywgSmFjayA8SmFjay5YaWFvQGFtZC5jb20+OyBGZW5nLCBLZW5uZXRoIDxLZW5u
ZXRoLkZlbmdAYW1kLmNvbT47IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPjsgV2FuZywg
S2V2aW4oWWFuZykgPEtldmluMS5XYW5nQGFtZC5jb20+OyBZdWFuLCBYaWFvamllIDxYaWFvamll
Lll1YW5AYW1kLmNvbT4KU3ViamVjdDogW1BBVENIIDIvMl0gZHJtL2FtZGdwdS9nZngxMDogZW5h
YmxlIGdmeG9mZiBmb3IgbmF2aTEyCgpTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9q
aWUueXVhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBf
MC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwppbmRleCAwODJhMGIzMjk4YTku
LjIyNDA2ZjU2YzgxOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4
X3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAg
LTU4MCw3ICs1ODAsNiBAQCBzdGF0aWMgdm9pZCBnZnhfdjEwXzBfY2hlY2tfZ2Z4b2ZmX2ZsYWco
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpICB7CiAJc3dpdGNoIChhZGV2LT5hc2ljX3R5cGUp
IHsKIAljYXNlIENISVBfTkFWSTEwOgotCWNhc2UgQ0hJUF9OQVZJMTI6CiAJCWFkZXYtPnBtLnBw
X2ZlYXR1cmUgJj0gflBQX0dGWE9GRl9NQVNLOwogCQlicmVhazsKIAlkZWZhdWx0OgpAQCAtNDE4
NCw2ICs0MTgzLDcgQEAgc3RhdGljIGludCBnZnhfdjEwXzBfc2V0X3Bvd2VyZ2F0aW5nX3N0YXRl
KHZvaWQgKmhhbmRsZSwKIAlib29sIGVuYWJsZSA9IChzdGF0ZSA9PSBBTURfUEdfU1RBVEVfR0FU
RSkgPyB0cnVlIDogZmFsc2U7CiAJc3dpdGNoIChhZGV2LT5hc2ljX3R5cGUpIHsKIAljYXNlIENI
SVBfTkFWSTEwOgorCWNhc2UgQ0hJUF9OQVZJMTI6CiAJY2FzZSBDSElQX05BVkkxNDoKIAkJaWYg
KCFlbmFibGUpIHsKIAkJCWFtZGdwdV9nZnhfb2ZmX2N0cmwoYWRldiwgZmFsc2UpOwotLQoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
