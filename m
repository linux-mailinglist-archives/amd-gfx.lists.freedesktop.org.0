Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C7D9909A
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 12:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1A56EAF1;
	Thu, 22 Aug 2019 10:21:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710061.outbound.protection.outlook.com [40.107.71.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467726EAF1
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 10:21:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BH6bY/QNqy0d8Yr6MJAas63BwzYCmRq37RhpoBTfrDTuOZJf9VFPaEKVUl10mWFKqYAhb7joaHR2ndusWPWLvnS6Dm3vgNmx4btZisQs0N9qLmLwJY40LlLWxv4WI3Jzh8nY6VnhDezAQgqOojl66qqCBpKd15+X+2UL1rgcruOXqfb4KjLv7ZY0KsN8Ej5DP8MXSOzktZl4Mz+D0MN/FuTydk6QU2Ia0JDQuhpnogRntzpxMKn+ExLEH6oPCbyOtPSSU3WMjNkLkxrPtOHmKUzkvw34TM5mt3yMIhJyHw0IrdwclAaKk3ZmdyvNs5rv6zpvPVedxP6yRrBYDd4TxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdLLUeztPezprdirVfw5h0NUaYF+ch8wQttZiSg730c=;
 b=auAo3NNcjYpZ8qH0Tt74mWC72mocsWLLY1NSG8gzPsheUvP89UtyVZcGgKWaEaqV0c9I4WbmURUpuyCO+Uqs1bsfXEaZLrL9j6Xx9R1Fo4HEy4TntVt0plyYZUb+AUu6F6f8NsJ/KVODSW7XckDVw3YQjWmigLpVexxGZm45hur7nF+BaeWJd+WlQ5pjPC0DZJ5pOglQcK6vVp58U3cE85zXPvpoaDF7AHnzMs3pRbam6JQvAYsuHmdYIVpSSt/HaSRAYTUVFY+B7huN/91yt+J6oGSNQAG7m3qXZ4e9mtbWit1u8AG5sAcfOosu+MJRlOWfZ/tNlvvjHh2QkTk1sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3229.namprd12.prod.outlook.com (20.179.82.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 22 Aug 2019 10:21:11 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077%6]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 10:21:11 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/amd/powerplay: correct Vega20 dpm level related
 settings
Thread-Topic: [PATCH 1/2] drm/amd/powerplay: correct Vega20 dpm level related
 settings
Thread-Index: AQHVV/xKXaYimrUKLkOZdC6tlRiUiqcG9p1A
Date: Thu, 22 Aug 2019 10:21:11 +0000
Message-ID: <MN2PR12MB3344CC59152485D92985287BE4A50@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190821084143.25713-1-evan.quan@amd.com>
In-Reply-To: <20190821084143.25713-1-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f1f8602-c8a9-45cd-b2a4-08d726ea74c7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3229; 
x-ms-traffictypediagnostic: MN2PR12MB3229:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB322920A6703382B9060D5E33E4A50@MN2PR12MB3229.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(13464003)(189003)(199004)(7696005)(110136005)(476003)(229853002)(66446008)(71200400001)(486006)(6506007)(305945005)(14454004)(11346002)(7736002)(81166006)(446003)(4326008)(86362001)(76176011)(478600001)(71190400001)(6116002)(3846002)(2906002)(33656002)(256004)(2501003)(5660300002)(66066001)(66556008)(6246003)(74316002)(25786009)(64756008)(102836004)(66476007)(81156014)(26005)(53546011)(53936002)(316002)(6436002)(55016002)(99286004)(186003)(66946007)(52536014)(8676002)(8936002)(76116006)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3229;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iUaZ6oT7E+/eD9KVW79O3xZpGx9DvK3eCuIhZoa+Ao16wrRsYxy5yvwqCj/DQ2Z1K+CrrefO+EGkzKWB9ufdqh0kx74iDnFA9zdRtus0jZtHbUdQXkXKOYZ+nwJotWEtRKs5WyQgz+B1hqJe/71C8eJfNbEerHZYl1jV2jXGFyVwow1bwOw2PJw6nYuQDYwfvs7CcSi2cBtVcfbtMNbvmhS4PGYsSiddjPGD5mzM7UfLP+Pq5/RhqcLHSOaPPFelmVDLA/4/TOB+WMyMSuYc0jFzoXi5ya7XQsXMKn4pDjBQ5Yovv55IvxaBIRni1wjrB5oSumEP1WW8g1+BgeyFuHQ50x7CLpzSAtthMdJfkdjm26iIYmzOGVqQymg4UWbP3nr70FXPyJlC/pHCR/P1rzV3Fjr8KF12fmx9LADi2Y4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f1f8602-c8a9-45cd-b2a4-08d726ea74c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 10:21:11.7542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NJ3K7Y22rP7EVtfd6HZGlUEQ2GAjHbFWnXr6aDewyeYx9ql3UxKDYzg/rYiLHPol
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3229
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdLLUeztPezprdirVfw5h0NUaYF+ch8wQttZiSg730c=;
 b=C2XEVEBs43Bs1gtOSZJPGmDOVfA5IMrfC5Kf7wLgNfK8EGCSV3b4dy6ABfhWpev+CZnXL3UyTCETuoSVYdvnMKMzw9CEF0M5w9BVDR2KB+9kXuZHo2987ljx/bmeeoQeZukKV3UeRVosnBkfEmjgGW87iAnFIvLYxTwTzXkUK7o=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGluZy4uCgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogRXZhbiBRdWFuIDxl
dmFuLnF1YW5AYW1kLmNvbT4KPiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAyMSwgMjAxOSA0OjQy
IFBNCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IFF1YW4sIEV2YW4g
PEV2YW4uUXVhbkBhbWQuY29tPgo+IFN1YmplY3Q6IFtQQVRDSCAxLzJdIGRybS9hbWQvcG93ZXJw
bGF5OiBjb3JyZWN0IFZlZ2EyMCBkcG0gbGV2ZWwgcmVsYXRlZAo+IHNldHRpbmdzCj4gCj4gQ29y
cmVjdCB0aGUgc2V0dGluZ3MgZm9yIGF1dG8gbW9kZSBhbmQgc2tpcCB0aGUgdW5uZWNlc3Nhcnkg
c2V0dGluZ3MgZm9yCj4gZGNlZmNsayBhbmQgZmNsay4KPiAKPiBDaGFuZ2UtSWQ6IEk3ZTZjYTc1
Y2U4NmI0ZDVjZDQ0OTIwYTlmYmM3MWI2ZjM2ZWEzYzQ5Cj4gU2lnbmVkLW9mZi1ieTogRXZhbiBR
dWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KPiAtLS0KPiAgLi4uL2RybS9hbWQvcG93ZXJwbGF5L2h3
bWdyL3ZlZ2EyMF9od21nci5jICAgIHwgNjAKPiArKysrKysrKysrKysrKysrKy0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMjBfaHdtZ3IuYwo+
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMKPiBp
bmRleCAwNTE2YzI5NGIzNzcuLmNjNTJkNWM4Y2NmOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMjBfaHdtZ3IuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2EyMF9od21nci5jCj4gQEAgLTIzNDksMTIg
KzIzNDksMTYgQEAgc3RhdGljIGludCB2ZWdhMjBfZm9yY2VfZHBtX2hpZ2hlc3Qoc3RydWN0Cj4g
cHBfaHdtZ3IgKmh3bWdyKQo+ICAJCWRhdGEtPmRwbV90YWJsZS5zb2NfdGFibGUuZHBtX3N0YXRl
LnNvZnRfbWF4X2xldmVsID0KPiAgCQlkYXRhLT5kcG1fdGFibGUuc29jX3RhYmxlLmRwbV9sZXZl
bHNbc29mdF9sZXZlbF0udmFsdWU7Cj4gCj4gLQlyZXQgPSB2ZWdhMjBfdXBsb2FkX2RwbV9taW5f
bGV2ZWwoaHdtZ3IsIDB4RkZGRkZGRkYpOwo+ICsJcmV0ID0gdmVnYTIwX3VwbG9hZF9kcG1fbWlu
X2xldmVsKGh3bWdyLAo+IEZFQVRVUkVfRFBNX0dGWENMS19NQVNLIHwKPiArCQkJCQkJIEZFQVRV
UkVfRFBNX1VDTEtfTUFTSwo+IHwKPiArCj4gRkVBVFVSRV9EUE1fU09DQ0xLX01BU0spOwo+ICAJ
UFBfQVNTRVJUX1dJVEhfQ09ERSghcmV0LAo+ICAJCQkiRmFpbGVkIHRvIHVwbG9hZCBib290IGxl
dmVsIHRvIGhpZ2hlc3QhIiwKPiAgCQkJcmV0dXJuIHJldCk7Cj4gCj4gLQlyZXQgPSB2ZWdhMjBf
dXBsb2FkX2RwbV9tYXhfbGV2ZWwoaHdtZ3IsIDB4RkZGRkZGRkYpOwo+ICsJcmV0ID0gdmVnYTIw
X3VwbG9hZF9kcG1fbWF4X2xldmVsKGh3bWdyLAo+IEZFQVRVUkVfRFBNX0dGWENMS19NQVNLIHwK
PiArCQkJCQkJIEZFQVRVUkVfRFBNX1VDTEtfTUFTSwo+IHwKPiArCj4gRkVBVFVSRV9EUE1fU09D
Q0xLX01BU0spOwo+ICAJUFBfQVNTRVJUX1dJVEhfQ09ERSghcmV0LAo+ICAJCQkiRmFpbGVkIHRv
IHVwbG9hZCBkcG0gbWF4IGxldmVsIHRvIGhpZ2hlc3QhIiwKPiAgCQkJcmV0dXJuIHJldCk7Cj4g
QEAgLTIzODcsMTIgKzIzOTEsMTYgQEAgc3RhdGljIGludCB2ZWdhMjBfZm9yY2VfZHBtX2xvd2Vz
dChzdHJ1Y3QKPiBwcF9od21nciAqaHdtZ3IpCj4gIAkJZGF0YS0+ZHBtX3RhYmxlLnNvY190YWJs
ZS5kcG1fc3RhdGUuc29mdF9tYXhfbGV2ZWwgPQo+ICAJCWRhdGEtPmRwbV90YWJsZS5zb2NfdGFi
bGUuZHBtX2xldmVsc1tzb2Z0X2xldmVsXS52YWx1ZTsKPiAKPiAtCXJldCA9IHZlZ2EyMF91cGxv
YWRfZHBtX21pbl9sZXZlbChod21nciwgMHhGRkZGRkZGRik7Cj4gKwlyZXQgPSB2ZWdhMjBfdXBs
b2FkX2RwbV9taW5fbGV2ZWwoaHdtZ3IsCj4gRkVBVFVSRV9EUE1fR0ZYQ0xLX01BU0sgfAo+ICsJ
CQkJCQkgRkVBVFVSRV9EUE1fVUNMS19NQVNLCj4gfAo+ICsKPiBGRUFUVVJFX0RQTV9TT0NDTEtf
TUFTSyk7Cj4gIAlQUF9BU1NFUlRfV0lUSF9DT0RFKCFyZXQsCj4gIAkJCSJGYWlsZWQgdG8gdXBs
b2FkIGJvb3QgbGV2ZWwgdG8gaGlnaGVzdCEiLAo+ICAJCQlyZXR1cm4gcmV0KTsKPiAKPiAtCXJl
dCA9IHZlZ2EyMF91cGxvYWRfZHBtX21heF9sZXZlbChod21nciwgMHhGRkZGRkZGRik7Cj4gKwly
ZXQgPSB2ZWdhMjBfdXBsb2FkX2RwbV9tYXhfbGV2ZWwoaHdtZ3IsCj4gRkVBVFVSRV9EUE1fR0ZY
Q0xLX01BU0sgfAo+ICsJCQkJCQkgRkVBVFVSRV9EUE1fVUNMS19NQVNLCj4gfAo+ICsKPiBGRUFU
VVJFX0RQTV9TT0NDTEtfTUFTSyk7Cj4gIAlQUF9BU1NFUlRfV0lUSF9DT0RFKCFyZXQsCj4gIAkJ
CSJGYWlsZWQgdG8gdXBsb2FkIGRwbSBtYXggbGV2ZWwgdG8gaGlnaGVzdCEiLAo+ICAJCQlyZXR1
cm4gcmV0KTsKPiBAQCAtMjQwMywxNCArMjQxMSw1NCBAQCBzdGF0aWMgaW50IHZlZ2EyMF9mb3Jj
ZV9kcG1fbG93ZXN0KHN0cnVjdAo+IHBwX2h3bWdyICpod21ncikKPiAKPiAgc3RhdGljIGludCB2
ZWdhMjBfdW5mb3JjZV9kcG1fbGV2ZWxzKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpICB7Cj4gKwlz
dHJ1Y3QgdmVnYTIwX2h3bWdyICpkYXRhID0KPiArCQkJKHN0cnVjdCB2ZWdhMjBfaHdtZ3IgKiko
aHdtZ3ItPmJhY2tlbmQpOwo+ICsJdWludDMyX3Qgc29mdF9taW5fbGV2ZWwsIHNvZnRfbWF4X2xl
dmVsOwo+ICAJaW50IHJldCA9IDA7Cj4gCj4gLQlyZXQgPSB2ZWdhMjBfdXBsb2FkX2RwbV9taW5f
bGV2ZWwoaHdtZ3IsIDB4RkZGRkZGRkYpOwo+ICsJLyogZ2Z4Y2xrIHNvZnQgbWluL21heCBzZXR0
aW5ncyAqLwo+ICsJc29mdF9taW5fbGV2ZWwgPQo+ICsJCXZlZ2EyMF9maW5kX2xvd2VzdF9kcG1f
bGV2ZWwoJihkYXRhLQo+ID5kcG1fdGFibGUuZ2Z4X3RhYmxlKSk7Cj4gKwlzb2Z0X21heF9sZXZl
bCA9Cj4gKwkJdmVnYTIwX2ZpbmRfaGlnaGVzdF9kcG1fbGV2ZWwoJihkYXRhLQo+ID5kcG1fdGFi
bGUuZ2Z4X3RhYmxlKSk7Cj4gKwo+ICsJZGF0YS0+ZHBtX3RhYmxlLmdmeF90YWJsZS5kcG1fc3Rh
dGUuc29mdF9taW5fbGV2ZWwgPQo+ICsJCWRhdGEtCj4gPmRwbV90YWJsZS5nZnhfdGFibGUuZHBt
X2xldmVsc1tzb2Z0X21pbl9sZXZlbF0udmFsdWU7Cj4gKwlkYXRhLT5kcG1fdGFibGUuZ2Z4X3Rh
YmxlLmRwbV9zdGF0ZS5zb2Z0X21heF9sZXZlbCA9Cj4gKwkJZGF0YS0KPiA+ZHBtX3RhYmxlLmdm
eF90YWJsZS5kcG1fbGV2ZWxzW3NvZnRfbWF4X2xldmVsXS52YWx1ZTsKPiArCj4gKwkvKiB1Y2xr
IHNvZnQgbWluL21heCBzZXR0aW5ncyAqLwo+ICsJc29mdF9taW5fbGV2ZWwgPQo+ICsJCXZlZ2Ey
MF9maW5kX2xvd2VzdF9kcG1fbGV2ZWwoJihkYXRhLQo+ID5kcG1fdGFibGUubWVtX3RhYmxlKSk7
Cj4gKwlzb2Z0X21heF9sZXZlbCA9Cj4gKwkJdmVnYTIwX2ZpbmRfaGlnaGVzdF9kcG1fbGV2ZWwo
JihkYXRhLQo+ID5kcG1fdGFibGUubWVtX3RhYmxlKSk7Cj4gKwo+ICsJZGF0YS0+ZHBtX3RhYmxl
Lm1lbV90YWJsZS5kcG1fc3RhdGUuc29mdF9taW5fbGV2ZWwgPQo+ICsJCWRhdGEtCj4gPmRwbV90
YWJsZS5tZW1fdGFibGUuZHBtX2xldmVsc1tzb2Z0X21pbl9sZXZlbF0udmFsdWU7Cj4gKwlkYXRh
LT5kcG1fdGFibGUubWVtX3RhYmxlLmRwbV9zdGF0ZS5zb2Z0X21heF9sZXZlbCA9Cj4gKwkJZGF0
YS0KPiA+ZHBtX3RhYmxlLm1lbV90YWJsZS5kcG1fbGV2ZWxzW3NvZnRfbWF4X2xldmVsXS52YWx1
ZTsKPiArCj4gKwkvKiBzb2NjbGsgc29mdCBtaW4vbWF4IHNldHRpbmdzICovCj4gKwlzb2Z0X21p
bl9sZXZlbCA9Cj4gKwkJdmVnYTIwX2ZpbmRfbG93ZXN0X2RwbV9sZXZlbCgmKGRhdGEtCj4gPmRw
bV90YWJsZS5zb2NfdGFibGUpKTsKPiArCXNvZnRfbWF4X2xldmVsID0KPiArCQl2ZWdhMjBfZmlu
ZF9oaWdoZXN0X2RwbV9sZXZlbCgmKGRhdGEtCj4gPmRwbV90YWJsZS5zb2NfdGFibGUpKTsKPiAr
Cj4gKwlkYXRhLT5kcG1fdGFibGUuc29jX3RhYmxlLmRwbV9zdGF0ZS5zb2Z0X21pbl9sZXZlbCA9
Cj4gKwkJZGF0YS0KPiA+ZHBtX3RhYmxlLnNvY190YWJsZS5kcG1fbGV2ZWxzW3NvZnRfbWluX2xl
dmVsXS52YWx1ZTsKPiArCWRhdGEtPmRwbV90YWJsZS5zb2NfdGFibGUuZHBtX3N0YXRlLnNvZnRf
bWF4X2xldmVsID0KPiArCQlkYXRhLQo+ID5kcG1fdGFibGUuc29jX3RhYmxlLmRwbV9sZXZlbHNb
c29mdF9tYXhfbGV2ZWxdLnZhbHVlOwo+ICsKPiArCXJldCA9IHZlZ2EyMF91cGxvYWRfZHBtX21p
bl9sZXZlbChod21nciwKPiBGRUFUVVJFX0RQTV9HRlhDTEtfTUFTSyB8Cj4gKwkJCQkJCSBGRUFU
VVJFX0RQTV9VQ0xLX01BU0sKPiB8Cj4gKwo+IEZFQVRVUkVfRFBNX1NPQ0NMS19NQVNLKTsKPiAg
CVBQX0FTU0VSVF9XSVRIX0NPREUoIXJldCwKPiAgCQkJIkZhaWxlZCB0byB1cGxvYWQgRFBNIEJv
b3R1cCBMZXZlbHMhIiwKPiAgCQkJcmV0dXJuIHJldCk7Cj4gCj4gLQlyZXQgPSB2ZWdhMjBfdXBs
b2FkX2RwbV9tYXhfbGV2ZWwoaHdtZ3IsIDB4RkZGRkZGRkYpOwo+ICsJcmV0ID0gdmVnYTIwX3Vw
bG9hZF9kcG1fbWF4X2xldmVsKGh3bWdyLAo+IEZFQVRVUkVfRFBNX0dGWENMS19NQVNLIHwKPiAr
CQkJCQkJIEZFQVRVUkVfRFBNX1VDTEtfTUFTSwo+IHwKPiArCj4gRkVBVFVSRV9EUE1fU09DQ0xL
X01BU0spOwo+ICAJUFBfQVNTRVJUX1dJVEhfQ09ERSghcmV0LAo+ICAJCQkiRmFpbGVkIHRvIHVw
bG9hZCBEUE0gTWF4IExldmVscyEiLAo+ICAJCQlyZXR1cm4gcmV0KTsKPiAtLQo+IDIuMjMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
