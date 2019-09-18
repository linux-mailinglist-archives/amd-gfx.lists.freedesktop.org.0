Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA03BB59FE
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 05:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFA96EDD5;
	Wed, 18 Sep 2019 03:08:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730063.outbound.protection.outlook.com [40.107.73.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A416EDD5
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 03:08:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTi4R3gV3RTPRlI422Fy0nH//8sPZ5yo9mWSkYtT950/atVk/0F8tyPRi1nN2FgkWxDhJOp/ZMhG1v3K/3KDRGdvoTnVrjmlAZveuB+lQeR3OSR7Zti7qChlVJ91VFxD3XPRbLBcp3xGtP0bKgofvNnT0MR651AsiQDw0zU6cdkmk7GCu8VJPfEJ9o15C+kBX4rEtuenllydvBFBa/bXkUrTuootGMfZF/qQK+RWwny4f28NiwWimIuNImLymzYrWidmXC7EABg3KiCAXbdDNO0y0LDr1ImjpyjJUUOdJkpICVY2GRWfVC6hbnFxa0eFS/CjN3wvzuybGcVPD8QQuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dF6aVNZNQq212M4j0jDdfl7R3UYfat+FQpelneiQd9Y=;
 b=E9D2NWmyoKOADZ3y6ml6NmqzRqcvHmtdycqXIS74R2YkyeQ+aW8Gzm+V9S2GgbrAitQlDtjI4pDK4vatCTiMd9oLp58It0MB92SB8ar1O4DACH6kjvpZYc/I7le44qmib+92BImmjkua+mEbYOJEJTYUHS39ZRPu0C+SrXffLU/5+wtReoMCMQNuTeJjjjPU1WK0kdmCtc+STfg9GaDoIAczluAkPVwtln9h2NboXm3akzJgpXwcz6T+9+lseY3vuxGx5YaABwn3CzMQzkA3x9ULosEIi5F6ERwRjP0pHJ2YjYc/lOJuyCK7Wtm86eFbr08/xBc+jCn9JnCs0RblYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3122.namprd12.prod.outlook.com (20.178.211.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.24; Wed, 18 Sep 2019 03:08:55 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3%7]) with mapi id 15.20.2263.023; Wed, 18 Sep 2019
 03:08:55 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: flag navi12 and 14 as experimental for 5.4
Thread-Topic: [PATCH] drm/amdgpu: flag navi12 and 14 as experimental for 5.4
Thread-Index: AQHVbZFsVBP+MKLFWkmM5eHy+c9fnqcwwawB
Date: Wed, 18 Sep 2019 03:08:55 +0000
Message-ID: <E1F8515E-628E-40F2-AD03-93E268039083@amd.com>
References: <20190917195205.20219-1-alexander.deucher@amd.com>
In-Reply-To: <20190917195205.20219-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [114.87.109.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21f2007f-9994-4fff-6c9f-08d73be58a79
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN8PR12MB3122; 
x-ms-traffictypediagnostic: BN8PR12MB3122:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB31229D5194988826523E3846898E0@BN8PR12MB3122.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:826;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(199004)(189003)(6246003)(1411001)(81156014)(99286004)(6116002)(316002)(25786009)(486006)(3846002)(6506007)(102836004)(26005)(76176011)(36756003)(5660300002)(53546011)(6916009)(2906002)(54906003)(7736002)(4326008)(66946007)(2616005)(76116006)(256004)(6306002)(33656002)(476003)(71200400001)(71190400001)(6436002)(6486002)(11346002)(186003)(305945005)(66446008)(66556008)(64756008)(6512007)(66476007)(8936002)(91956017)(966005)(81166006)(229853002)(446003)(478600001)(14454004)(8676002)(66066001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3122;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bHseCZEPGaW6AbSx+js3T3vU2cStYTXARSZj8t4EQ5KmeNWq6isYw9BacGNMVpPAmYdwqcy62CvhV18Qe4vweK/dbWcuF+Os3DlcDkbnJpzB/9APVR8ILIcPN3WZ9sXmeNq2E8uf0+FI2R01kRSsQIL9KTJ+qHJFg+n1QTwbx84UzwWEubUPmlApQBYdjgrZz+orkjvP8PD/B0/JJJP+vPQbRG4eHrIXsN//I9Ldutf4EJrwDpE/8DiRIqvtwLvWxDEMwLII6ETvPSoPRRRAM85gprO8kQB98hUdcv39NzV202u+37gWsyhDSHsyooSzbZeGqvrM77NhZJkgl1Lo/fnGbJMqkVEouzQFr+Dv5kabyjYOY8GmUpvB53EZ73kPWTsfOr5lsxspZf35VIqZG6V6zj7+AIiDhP9AiVU5pE4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f2007f-9994-4fff-6c9f-08d73be58a79
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 03:08:55.2227 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UxlHk4OL0Gx7WnvwkJjppTrqyNPMpcKz2+ckYMOvqZx9EWK7CDqj3YwTOErsn+uw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3122
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dF6aVNZNQq212M4j0jDdfl7R3UYfat+FQpelneiQd9Y=;
 b=Ahc/M9aNDrmFR4Aq1wKeE6K5twnrY5tSsJ7fh4WGc8q4+xEoAbbmFleF7/Pltq4fZyD4UAcP3Q6FvAj5mriiC12RTTDrvb5MqU1nlR4fMCDZUPVuLunpQf1vOVJehDpk9JfkOtQPeyPO0hQcSQLcDal5rJKBygDsxcrjdPOUdjU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+CgpCUiwKWGlh
b2ppZQoKPiBPbiBTZXAgMTgsIDIwMTksIGF0IDM6NTIgQU0sIEFsZXggRGV1Y2hlciA8YWxleGRl
dWNoZXJAZ21haWwuY29tPiB3cm90ZToKPiAKPiBXZSBjYW4gcmVtb3ZlIHRoaXMgbGF0ZXIgYXMg
dGhpbmdzIGdldCBjbG9zZXIgdG8gbGF1bmNoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiAtLS0KPiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCA4ICsrKystLS0tCj4gMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2Rydi5jCj4gaW5kZXggYzY4ZTU0YTI3YTJjLi41ZGE3MmNhNmYzZTEgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4gQEAgLTEwMTEsMTUgKzEw
MTEsMTUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIHBjaWlkbGlzdFtdID0g
ewo+ICAgIHsweDEwMDIsIDB4NzMxQiwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgQ0hJ
UF9OQVZJMTB9LAo+ICAgIHsweDEwMDIsIDB4NzMxRiwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwg
MCwgMCwgQ0hJUF9OQVZJMTB9LAo+ICAgIC8qIE5hdmkxNCAqLwo+IC0gICAgezB4MTAwMiwgMHg3
MzQwLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX05BVkkxNH0sCj4gLSAgICB7
MHgxMDAyLCAweDczNDEsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBfTkFWSTE0
fSwKPiAtICAgIHsweDEwMDIsIDB4NzM0NywgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwg
Q0hJUF9OQVZJMTR9LAo+ICsgICAgezB4MTAwMiwgMHg3MzQwLCBQQ0lfQU5ZX0lELCBQQ0lfQU5Z
X0lELCAwLCAwLCBDSElQX05BVkkxNHxBTURfRVhQX0hXX1NVUFBPUlR9LAo+ICsgICAgezB4MTAw
MiwgMHg3MzQxLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX05BVkkxNHxBTURf
RVhQX0hXX1NVUFBPUlR9LAo+ICsgICAgezB4MTAwMiwgMHg3MzQ3LCBQQ0lfQU5ZX0lELCBQQ0lf
QU5ZX0lELCAwLCAwLCBDSElQX05BVkkxNHxBTURfRVhQX0hXX1NVUFBPUlR9LAo+IAo+ICAgIC8q
IFJlbm9pciAqLwo+ICAgIHsweDEwMDIsIDB4MTYzNiwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwg
MCwgMCwgQ0hJUF9SRU5PSVJ8QU1EX0lTX0FQVXxBTURfRVhQX0hXX1NVUFBPUlR9LAo+IAo+ICAg
IC8qIE5hdmkxMiAqLwo+IC0gICAgezB4MTAwMiwgMHg3MzYwLCBQQ0lfQU5ZX0lELCBQQ0lfQU5Z
X0lELCAwLCAwLCBDSElQX05BVkkxMn0sCj4gKyAgICB7MHgxMDAyLCAweDczNjAsIFBDSV9BTllf
SUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBfTkFWSTEyfEFNRF9FWFBfSFdfU1VQUE9SVH0sCj4g
Cj4gICAgezAsIDAsIDB9Cj4gfTsKPiAtLSAKPiAyLjIwLjEKPiAKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4g
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
