Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FC7A96C2
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 00:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7FC8930C;
	Wed,  4 Sep 2019 22:55:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800059.outbound.protection.outlook.com [40.107.80.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD208930C
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 22:55:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLuCJMwOG7vABqDSmtjUWrreMGOFcGI7KTRlT84bzTC8JR/KzpxaZ4Zaorsk+rIyyLPYh3Kg7+RcuQA3SFGyhpN/auQ73Tp51sihJhpyauV8lLJ8w5rMgd1e7xyUcW7LUuQs4RSMTUVQS3sypBzibdqMwFwEdu3kjh81a5TQrtvU+v61F/CcacLzL3BzhrSqHCG8FgOtsyTdRf708SOOYEiMHQAEWrc3WOm6bIk+Tnws7OBzqR5V1PZ2XPECQJpkuqDkNN8VGeF7wICpE8W5pK5eR0fTGVSvMIX5WqFjljzpftCGDfxMPmrAjY59NzAFYOvzpqqFjOZccT3dzohr3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Sp/gszesxKaEFzhQqNNvDhbLv95eXWXh+UpF456d60=;
 b=jSPrHgAnxF8A2yXLuyUhfM3CnF71hUm0UvONqsmgHc8kYLiP5wFB9xM8/9ehuLfderPVvzv+5BXrf9i2WvPoxcxaj+v5zorAHWtbFEmwY8YK10uL9ayu9o68dZ2oYDsBXsjpUKXP9LaXKocjpOTvjGGEHz87PKIbX7F2cQPsw023L616DQO8CiIIqZBX9LtbusggpjCLrr0FBrLxxtsnH/m9+7+fR3wM3TiNYMD87qcaG3t81wiYTfV8cBXLJisCqewiVgzxwrkuURUEanSX15uY08xyKxxJ1FFkDkC94P1GCCe2z1hpZzmHv9oSd6GS+2/+svIwqNEQHtf0s/voZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3407.namprd12.prod.outlook.com (20.178.241.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Wed, 4 Sep 2019 22:55:46 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 22:55:46 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: [PATCH 01/10] drm/amdkfd: add renoir cache info for CRAT
Thread-Topic: [PATCH 01/10] drm/amdkfd: add renoir cache info for CRAT
Thread-Index: AQHVYzgwKEGRYqK5+EqSSTE49RvUKacb6VMAgAC+CIA=
Date: Wed, 4 Sep 2019 22:55:45 +0000
Message-ID: <MN2PR12MB330973DB9029699E67439A2FECB80@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190904154803.5102-1-ray.huang@amd.com>
 <20190904154803.5102-2-ray.huang@amd.com>
 <6fe2ad6f-24fb-db4b-7b75-3149f0c0257a@amd.com>
In-Reply-To: <6fe2ad6f-24fb-db4b-7b75-3149f0c0257a@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: MN2PR12MB3309.namprd12.prod.outlook.com
 (15.20.2220.007)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9dd7a75-9623-4982-39df-08d7318b05ad
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3407; 
x-ms-traffictypediagnostic: MN2PR12MB3407:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3407EC402CF9FE54690FAA8BECB80@MN2PR12MB3407.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(199004)(189003)(71200400001)(71190400001)(316002)(6246003)(99286004)(7696005)(54906003)(25786009)(4326008)(14444005)(256004)(53546011)(6862004)(26005)(76176011)(6506007)(66066001)(102836004)(186003)(53936002)(11346002)(33656002)(486006)(476003)(446003)(55016002)(6436002)(7736002)(66476007)(9686003)(66556008)(64756008)(66446008)(74316002)(14454004)(52536014)(66946007)(3846002)(6116002)(76116006)(478600001)(81166006)(81156014)(8936002)(6636002)(2906002)(86362001)(229853002)(8676002)(305945005)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3407;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 56TgL9PKdmi3kU2YVbLZoEApgJgXkRjlBDFS6WKLA2QiJK5J9DJhnQB6hRhKza3eiWRRWbNpj5S4kOCqXHc1w85jzEztd0vqHxHlMe94zdCxe1IPVuHsfH2OixcOPkkXEW8uImXFO9Cj67faVm1I+9xPym4uujw7dSI1/BOEQvIYg/fKRDrXrKtMJcrsfdKsw7DPGhKBOAE+tVJpJH2Bw21gmQXp80GI9I9QMs+++pl/V3rBf/jQRFBQAD65lJ/Yz9PCTby06HM4pvbZo44JbMq1tbmPDH+fdI36J+2dveLfLjMML2DjenQH2VkIvlkoKP4590ijX4jCHy+OKEikH3Q5Raj7KcpJ6vZJmd5WR41pTf608f6MnSbqutAHnfPpCSJ8TR5YhThP3+NAoHarEQZy9qryePpfl7CFcJiQUsA=
Content-ID: <5A52E060804B2143AE580FAE3A386990@amdcloud.onmicrosoft.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9dd7a75-9623-4982-39df-08d7318b05ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 22:55:45.9649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lsEs0udRJWWKPsT2QgPkJvH+ri+1zyEi4h+CaPSY6VsFx9PFZd9FGYdPmE3cBlN6OoEZ3bW9PRgFHqVxaG2Y4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3407
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Sp/gszesxKaEFzhQqNNvDhbLv95eXWXh+UpF456d60=;
 b=mwSWt0uxs0zx5PJDGZL3d1DaS53kZLwCscKxCA4//KAwTQHIRGWxlixNtt0KEjQljf44yLj6GiVe3DHc/y0HOTtc1rVB26+L1JIYOs/e7jRNLzRME9LqlqQ0P7sQbxO/ir4CewQANMjcAzKuy6AvpyZIzox1SvjZcNqGaCWg3Wk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMDM6MzU6MjBBTSArMDgwMCwgS3VlaGxpbmcsIEZlbGl4
IHdyb3RlOgo+IE9uIDIwMTktMDktMDQgMTE6NDggYS5tLiwgSHVhbmcsIFJheSB3cm90ZToKPiA+
IFJlbm9pcidzIGNhY2hlIGluZm8gc2hvdWxkIGJlIHRoZSBzYW1lIHdpdGggcmF2ZW4gYW5kIGNh
cnJpem8ncy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQu
Y29tPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMg
fCA0ICsrKysKPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY3JhdC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NyYXQuYwo+ID4gaW5kZXggYTg0YzgxMC4uMmE0Mjhj
OSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMK
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMKPiA+IEBAIC0x
MzgsNiArMTM4LDcgQEAgc3RhdGljIHN0cnVjdCBrZmRfZ3B1X2NhY2hlX2luZm8gY2Fycml6b19j
YWNoZV9pbmZvW10gPSB7Cj4gPiAgIC8qIFRPRE8gLSBjaGVjayAmIHVwZGF0ZSBWZWdhMTAgY2Fj
aGUgZGV0YWlscyAqLwo+ID4gICAjZGVmaW5lIHZlZ2ExMF9jYWNoZV9pbmZvIGNhcnJpem9fY2Fj
aGVfaW5mbwo+ID4gICAjZGVmaW5lIHJhdmVuX2NhY2hlX2luZm8gY2Fycml6b19jYWNoZV9pbmZv
Cj4gPiArI2RlZmluZSByZW5vaXJfY2FjaGVfaW5mbyBjYXJyaXpvX2NhY2hlX2luZm8KPiA+ICAg
LyogVE9ETyAtIGNoZWNrICYgdXBkYXRlIE5hdmkxMCBjYWNoZSBkZXRhaWxzICovCj4gPiAgICNk
ZWZpbmUgbmF2aTEwX2NhY2hlX2luZm8gY2Fycml6b19jYWNoZV9pbmZvCj4gPiAgIAo+ID4gQEAg
LTY2OCw2ICs2NjksOSBAQCBzdGF0aWMgaW50IGtmZF9maWxsX2dwdV9jYWNoZV9pbmZvKHN0cnVj
dCBrZmRfZGV2ICprZGV2LAo+ID4gICAJY2FzZSBDSElQX1JBVkVOOgo+ID4gICAJCXBjYWNoZV9p
bmZvID0gcmF2ZW5fY2FjaGVfaW5mbzsKPiA+ICAgCQludW1fb2ZfY2FjaGVfdHlwZXMgPSBBUlJB
WV9TSVpFKHJhdmVuX2NhY2hlX2luZm8pOwo+ID4gKwljYXNlIENISVBfUkVOT0lSOgo+ID4gKwkJ
cGNhY2hlX2luZm8gPSByZW5vaXJfY2FjaGVfaW5mbzsKPiA+ICsJCW51bV9vZl9jYWNoZV90eXBl
cyA9IEFSUkFZX1NJWkUocmVub2lyX2NhY2hlX2luZm8pOwo+IAo+IEkganVzdCBub3RpY2VkLCB0
aGVyZSBhcmUgYnJlYWs7IHN0YXRlbWVudHMgbWlzc2luZyBoZXJlLiBXaGljaCBicmFuY2ggCj4g
YXJlIHlvdXIgY2hhbmdlcyBiYXNlZCBvbj8gQXQgbGVhc3QgdGhlIHN1cnJvdW5kaW5nIGNvZGUg
bG9va3MgT0sgb24gCj4gYW1kLXN0YWdpbmctZHJtLW5leHQsIGJ1dCBzZWVtcyB0byBiZSBtaXNz
aW5nIGEgYnJlYWsgc3RhdGVtZW50IGF0IGxlYXN0IAo+IGluIHRoZSBSYXZlbiBjYXNlIGhlcmUu
Cj4gCgpUaGFua3MgdG8gY2F0Y2ggdGhpcy4gSSB3aWxsIHJlLXNlbmQgdjIgcGF0Y2ggbGF0ZXIu
CgpUaGFua3MsClJheQoKPiBSZWdhcmRzLAo+ICDCoCBGZWxpeAo+IAo+IAo+ID4gICAJY2FzZSBD
SElQX05BVkkxMDoKPiA+ICAgCQlwY2FjaGVfaW5mbyA9IG5hdmkxMF9jYWNoZV9pbmZvOwo+ID4g
ICAJCW51bV9vZl9jYWNoZV90eXBlcyA9IEFSUkFZX1NJWkUobmF2aTEwX2NhY2hlX2luZm8pOwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
