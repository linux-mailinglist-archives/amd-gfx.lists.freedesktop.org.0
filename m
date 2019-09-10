Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0DBAE910
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 13:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DAF6E02F;
	Tue, 10 Sep 2019 11:26:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780050.outbound.protection.outlook.com [40.107.78.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5600D89BF5
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 11:26:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJk67bGrIShWXp6sQwJZEPzXQS8B1GQ/2ucjtwFId1vItvWgNJy8Twr32qEKifJbduGPLEG6ii6K8lXkm5J0sWujn8+BbG11EiVWK1tPZ6n6O1abAy9kFwjfhmeAWhMejBQKvpCleRZrZ2q0K7/fOnVzX5soD+ISiDnydpSCerMTEYPakS/+KWZuyHsfhMJeWRo84rJE2KyvAS5KDYXfnzzoPRH6CwBQh6FEjCqa8JVZv8Q2V4f0HKthRzNaMicBVGidM2+YZ8VuMQlavywpi7IwMZdLNn6Ta92WuVTPx+NjWBmAbwMHUNwczl5vIhD2/2kECSbn0CnLOlb9fHbBog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWDMt+g/1/VhkwH8DlWs1xl+XhtlnAc+nBkCCwkFy7M=;
 b=N5YtNvG5d850Ib9FlVf1JUkUdiI+qhDlsUA3e6SRnUVldAWTRfchmZpgV7oEdcO4MXdERCo4zGOmkwVNaBJJVFu8XOJygIRp/8O70WT1itAyVJw9SYU2Bjcpy4zS+pYGHMtz+omIdUSk4itIxI2jfLE7W0WRoGYe9bHOfe0eN7AwEPOzzyzdGuFRvGsQRMGZMoTAXTY6oNRqWlmjVmAIdOPlWR/ywsxlYySG2rK+dUe0ImC7Nv2Up/0CCa9eUEY+aTZcqW03swxFhViz2i53eTG1KBm4AXl06FQPY613/3NidT+xqBCelRocZ8YT7Hj9BwdsE5kacMmvBMny5hRtkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3838.namprd12.prod.outlook.com (10.255.237.95) by
 MN2PR12MB3024.namprd12.prod.outlook.com (20.178.242.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Tue, 10 Sep 2019 11:26:26 +0000
Received: from MN2PR12MB3838.namprd12.prod.outlook.com
 ([fe80::a056:2e67:6f45:31a]) by MN2PR12MB3838.namprd12.prod.outlook.com
 ([fe80::a056:2e67:6f45:31a%5]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 11:26:26 +0000
From: "Liu, Aaron" <Aaron.Liu@amd.com>
To: "Huang, Ray" <Ray.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdkfd: fix the missed asic name while inited
 renoir_device_info
Thread-Topic: [PATCH] drm/amdkfd: fix the missed asic name while inited
 renoir_device_info
Thread-Index: AQHVZ8lTscDW+F8N50axIOWVwQVoAqckxSzQ
Date: Tue, 10 Sep 2019 11:26:26 +0000
Message-ID: <MN2PR12MB38388E5217E51884B887F784F0B60@MN2PR12MB3838.namprd12.prod.outlook.com>
References: <1568114232-28889-1-git-send-email-ray.huang@amd.com>
In-Reply-To: <1568114232-28889-1-git-send-email-ray.huang@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25b00468-7e48-44dd-819c-08d735e1b80a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3024; 
x-ms-traffictypediagnostic: MN2PR12MB3024:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB30242F95D1D433E792302E9DF0B60@MN2PR12MB3024.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(13464003)(199004)(189003)(14444005)(229853002)(305945005)(7736002)(6506007)(53546011)(478600001)(55016002)(186003)(4326008)(256004)(6246003)(99286004)(3846002)(110136005)(316002)(76176011)(33656002)(8676002)(2906002)(76116006)(9686003)(81156014)(7696005)(81166006)(53936002)(8936002)(66446008)(64756008)(66556008)(66476007)(66946007)(446003)(71190400001)(74316002)(5660300002)(14454004)(6116002)(86362001)(476003)(102836004)(26005)(25786009)(66066001)(52536014)(11346002)(2501003)(6436002)(486006)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3024;
 H:MN2PR12MB3838.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2zLNVkQoM9I81zqqkPJhiTs041tcD1SWkrQBfK/9JIwdYb1imo4J2htLNAPUzHbv6aRuW9tkEnXjrMThtf5e/voWdABnKpzfQ9W1A6/0OgH2IGNd/txd8je9jWYF9W/Zc44QsQjDFQWokftTcnkafIANjFVcxwku8N8izWH8glFR49dPdA0ZzO5tFYPxUVMcKWm/vmq+hxfFrZHdNrIApvnX9TU/0AO/9DjjXGysXz+NOMxltYiSnxGzh0Nes2azDbSaqiXmUCWjEMXK+sG0CaumclvTvowlx4Np4rfayAsO2oAfvT5GM+dmBBI/dcrJsG/uQOIpNQo3ZfzBgoynwjVNOFo4HPhaQHpQdiAKys3458N//2inl9GCJhdpgDjYVL0jh4b3ITlsEtmzgk7V9fYWDDain/I2urAKN8rlF+4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b00468-7e48-44dd-819c-08d735e1b80a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 11:26:26.6715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OEq3WqzUYs8ojdY+4ENkBdnKehy4G8ZGmJ0NPl/ftCLNFtXgkCticcTUJpF0SOLz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3024
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWDMt+g/1/VhkwH8DlWs1xl+XhtlnAc+nBkCCwkFy7M=;
 b=E5jjzW9aVLgXeuZJBbU6Ty+m8RhK3Ayzm2928RuoI9bnL5FkEoUw1B5OcfrXeM//V4WKUHjc7/9Zsom5+7qM0xk29ZiJLzCJt/LYtvikb8l/UUlAR6EmmvGnf407KpK1V5EXY3iHcX5M71zyo2PC8r2Y6SdEvLG9e8jaSTGlt94=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Aaron.Liu@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQgJiBUZXN0ZWQtYnk6IEFhcm9uIExpdSA8YWFyb24ubGl1QGFtZC5jb20+CgpCUiwK
QWFyb24gTGl1Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogSHVhbmcsIFJh
eSA8UmF5Lkh1YW5nQGFtZC5jb20+Cj4gU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDEwLCAyMDE5
IDc6MTcgUE0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogS3VlaGxp
bmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPjsgTGl1LCBBYXJvbgo+IDxBYXJvbi5M
aXVAYW1kLmNvbT47IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPgo+IFN1YmplY3Q6IFtQ
QVRDSF0gZHJtL2FtZGtmZDogZml4IHRoZSBtaXNzZWQgYXNpYyBuYW1lIHdoaWxlIGluaXRlZAo+
IHJlbm9pcl9kZXZpY2VfaW5mbwo+IAo+IFRoaXMgcGF0Y2ggZml4ZXMgbnVsbCBwb2ludGVyIGlz
c3VlIGJlbG93LCBJIG1pc3NlZCB0byBpbml0IHRoZSBhc2ljIHJlbmlvciBuYW1lCj4gd2hpbGUg
SSByZWJhc2UgdGhlIHBhdGNoZXMuCj4gCj4gWyAgMTA2LjAwNDI1MF0gQlVHOiBrZXJuZWwgTlVM
TCBwb2ludGVyIGRlcmVmZXJlbmNlLCBhZGRyZXNzOgo+IDAwMDAwMDAwMDAwMDAwMDAgWyAgMTA2
LjAwNDI1NF0gI1BGOiBzdXBlcnZpc29yIHJlYWQgYWNjZXNzIGluIGtlcm5lbAo+IG1vZGUgWyAg
MTA2LjAwNDI1Nl0gI1BGOiBlcnJvcl9jb2RlKDB4MDAwMCkgLSBub3QtcHJlc2VudCBwYWdlCj4g
WyAgMTA2LjAwNDI1N10gUEdEIDAgUDREIDAgWyAgMTA2LjAwNDI2MV0gT29wczogMDAwMCBbIzFd
IFNNUCBOT1BUSQo+IFsgIDEwNi4wMDQyNjRdIENQVTogMyBQSUQ6IDE0MjIgQ29tbTogbW9kcHJv
YmUgTm90IHRhaW50ZWQgNS4yLjAtcmMxLQo+IGN1c3RvbSAjMSBbICAxMDYuMDA0MjY2XSBIYXJk
d2FyZSBuYW1lOiBBTUQgQ2VsYWRvbi1STi9DZWxhZG9uLVJOLAo+IEJJT1MKPiBXQ0Q5ODE0Tl9X
ZWVrbHlfMTlfMDhfMSAwOC8xNC8yMDE5Cj4gWyAgMTA2LjAwNDI3Ml0gUklQOiAwMDEwOnN0cm5j
cHkrMHgxMi8weDMwIFsgIDEwNi4wMDQyNzRdIENvZGU6IGMxIGMwIDExCj4gNDggYzEgYzYgMTUg
NDggMzEgZDAgNDggYzEgYzIgMjAgMzEgYzIgODkgZDAgMzEgZjAKPiA0MSA1YyA1ZCBjMyA1NSA0
OCA4NSBkMiA0OCA4OSBmOCA0OCA4OSBlNSA3NCAxZSA0OCAwMSBmYSA0OCA4OSBmOSA8NDQ+IDBm
IGI2Cj4gMDYKPiA0MSA4MCBmOCAwMSA0NCA4OCAwMSA0OCA4MyBkZSBmZiA0OCA4MyBjMSAwMSA0
OCAzOSBkMSBbICAxMDYuMDA0Mjc4XSBSU1A6Cj4gMDAxODpmZmZmYzA5MmMxZmQzN2E4IEVGTEFH
UzogMDAwMTAyODYgWyAgMTA2LjAwNDI4MV0gUkFYOgo+IGZmZmY5ZTk0MzQ2NmEyOGMgUkJYOiAw
MDAwMDAwMDAwMDAzNmVkIFJDWDogZmZmZjllOTQzNDY2YTI4Ywo+IFsgIDEwNi4wMDQyODNdIFJE
WDogZmZmZjllOTQzNDY2YTJhYyBSU0k6IDAwMDAwMDAwMDAwMDAwMDAgUkRJOgo+IGZmZmY5ZTk0
MzQ2NmEyOGMgWyAgMTA2LjAwNDI4NV0gUkJQOiBmZmZmYzA5MmMxZmQzN2E4IFIwODoKPiBmZmZm
OWU5NDNkMTAwMDAwIFIwOTogMDAwMDAwMDAwMDAwMDIyOCBbICAxMDYuMDA0Mjg3XSBSMTA6Cj4g
ZmZmZjllOTQ0MThkYzVhOCBSMTE6IGZmZmY5ZTk0NDc0NmMwZDAgUjEyOiAwMDAwMDAwMDAwMDAw
MDAwCj4gWyAgMTA2LjAwNDI4OV0gUjEzOiBmZmZmOWU5NDNmYTFlYzAwIFIxNDogZmZmZjllOTQz
NDY2YTIwMCBSMTU6Cj4gZmZmZjllOTQzNDY2YTIwMCBbICAxMDYuMDA0MjkxXSBGUzogIDAwMDA3
ZjdhMDIyYzU1NDAoMDAwMCkKPiBHUzpmZmZmOWU5NDQ3YWMwMDAwKDAwMDApCj4ga25sR1M6MDAw
MDAwMDAwMDAwMDAwMAo+IFsgIDEwNi4wMDQyOTRdIENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAw
MCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKPiBbICAxMDYuMDA0Mjk2XSBDUjI6IDAwMDAwMDAwMDAw
MDAwMDAgQ1IzOiAwMDAwMDAwMWZmMGIwMDAwIENSNDoKPiAwMDAwMDAwMDAwMzQwZWUwIFsgIDEw
Ni4wMDQyOThdIENhbGwgVHJhY2U6Cj4gWyAgMTA2LjAwNDM4Ml0gIGtmZF90b3BvbG9neV9hZGRf
ZGV2aWNlKzB4MTUwLzB4NjEwIFthbWRncHVdCj4gWyAgMTA2LjAwNDQ0NV0gIGtnZDJrZmRfZGV2
aWNlX2luaXQrMHgyZTAvMHg0ZjAgW2FtZGdwdV0gWyAgMTA2LjAwNDUwOV0KPiBhbWRncHVfYW1k
a2ZkX2RldmljZV9pbml0KzB4MTRjLzB4MWIwIFthbWRncHVdCj4gCj4gU2lnbmVkLW9mZi1ieTog
SHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2RldmljZS5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2
aWNlLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYwo+IGluZGV4
IGEyZmUwY2IuLmYzMjliODIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX2RldmljZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rl
dmljZS5jCj4gQEAgLTM1Myw2ICszNTMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZp
Y2VfaW5mbwo+IGFyY3R1cnVzX2RldmljZV9pbmZvID0gewo+IAo+ICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGtmZF9kZXZpY2VfaW5mbyByZW5vaXJfZGV2aWNlX2luZm8gPSB7Cj4gIAkuYXNpY19mYW1p
bHkgPSBDSElQX1JFTk9JUiwKPiArCS5hc2ljX25hbWUgPSAicmVub2lyIiwKPiAgCS5tYXhfcGFz
aWRfYml0cyA9IDE2LAo+ICAJLm1heF9ub19vZl9ocWQgID0gMjQsCj4gIAkuZG9vcmJlbGxfc2l6
ZSAgPSA4LAo+IC0tCj4gMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
