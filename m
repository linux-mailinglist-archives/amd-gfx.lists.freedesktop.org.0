Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFAB6A14C
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 06:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B60F6E08A;
	Tue, 16 Jul 2019 04:21:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810085.outbound.protection.outlook.com [40.107.81.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313216E08A
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 04:21:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mbxRTJjmwW8S0ssGwc3c133qLjvg2/nROLEL+kQyU2C2Tf9k2wjvey4bh8RXpZDpzZoWEG6ChtQDUr/nDoiOmPrJHhCJc3oAxFa/FtkUM+owudxBBUg00RrEE7CVtNnKu+T94JhBcNgLz9S//tUIo+OPXYHcodwS4BLuBgTfIrrXgORjHv2HeLaxooe7uZ0+4ML9mCEXnJ/0gZXt3IqBMot5MT/ZEvN0x5IiV4p0GJyz96fd02XEFer0JcksBx1mdL5J+Ag+mGYoGfS0fVPuNldtle8+ySBMSNXTNO7Z9hKIwmStitc1yuIYr6ARHLxckTuEQBTub6Q4/lfxdOdZpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6eyDVox2ybf2dzXJAM/HNDnPNBbnkL6L/j5hNXoTcg=;
 b=VUDYm0G4sJbCwT1oOk4cVcf26FH0LJokmTFrxDfeK7/4tps8JV6bGJ/Ib22HNkbxbhDQHq9MtSBVsBfljIWy7D2TMnAo41s16RvCu9YU3TUVe5lRmvbJWLmQLYwsT8s2ZGA1ukAsALd0pPOpK2lIR8OmzPdbdjzDVoMaw8oKcvvNx2xA/8mp1d2J2C3uq7mChiF0QSKrCEVDdDklHXNSlJTms3jXYltF39NClERAa+G3xVCRHgB8sXkEmui9FfboTTdhrlSYys69iu6Kw6fA3BULxmA+Iz4cbEPZrlC+AmAmd6LXhh0/zl8cf+TleMWXp8UaEufZLvB/UEj7yZAbkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3053.namprd12.prod.outlook.com (20.178.241.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 04:21:48 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e%3]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 04:21:48 +0000
From: Kevin Wang <kevwa@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: fix deadlock around smu_handle_task V2
Thread-Topic: [PATCH] drm/amd/powerplay: fix deadlock around smu_handle_task V2
Thread-Index: AQHVOHXSS3c4xx6rQ0GsCmZZtw+wuabMlKyAgAAWVgA=
Date: Tue, 16 Jul 2019 04:21:48 +0000
Message-ID: <cf956f58-d7ea-c242-f31d-9f176d693148@amd.com>
References: <20190712055054.22119-1-evan.quan@amd.com>
 <MN2PR12MB3344074D151A9DF09836BFEDE4CE0@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3344074D151A9DF09836BFEDE4CE0@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::20) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ca4bf6b-da1c-40e4-8877-08d709a51e78
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3053; 
x-ms-traffictypediagnostic: MN2PR12MB3053:
x-microsoft-antispam-prvs: <MN2PR12MB3053059F518A690ADF6A29AAA2CE0@MN2PR12MB3053.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(199004)(189003)(13464003)(6116002)(3846002)(4326008)(186003)(26005)(64756008)(66556008)(14454004)(305945005)(66476007)(2906002)(99286004)(81156014)(6512007)(66946007)(8676002)(66446008)(2501003)(81166006)(7736002)(8936002)(76176011)(316002)(256004)(6246003)(25786009)(14444005)(478600001)(6486002)(6436002)(71190400001)(71200400001)(5660300002)(36756003)(486006)(446003)(110136005)(68736007)(386003)(6506007)(229853002)(53546011)(102836004)(476003)(2616005)(53936002)(31686004)(11346002)(31696002)(66066001)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3053;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hZ8m19BeMn4d/Y7x53O8wNBJ7BDSiObnb+WmwyLsClMCMpPAH+qFwZjpRDie2bRrq6ButpUyIH51evPRYPlN0GdMilSmtN+oauYIISn38h1stC+m9eiJYe6SpMXXivHfrCESDJ1Nken+5ssARVk5v7H3OBiCzkJSajUCneUdcJm3t3mA4WQxlM78Kk2wLoBvBhc7Mbud8JRGOWW2Q5QjD9o6BGcsS78Ka/fOI0Gs71HjB0LlCMfgsN7uqtwdncH9LAARUjxHk9TtJGywqSVuRhPOViTM2FvnVfvJq+kZ+fM3bhS/bNptvqL+qN+xtjoix+OwLW0pc12qbePY4yIMMluxngSHsFQJ7fd2kR3raOF257CLOyBhDuexZa62e32QsQmugD4udWKSFgZS0xK76ord5q32pJUh85JLDpAh66I=
Content-ID: <FB8F533BC38D3D4FA5AD48A2D053C8C0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca4bf6b-da1c-40e4-8877-08d709a51e78
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 04:21:48.3862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3053
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6eyDVox2ybf2dzXJAM/HNDnPNBbnkL6L/j5hNXoTcg=;
 b=LIYeIF08GCIv4GaJLkyabjiqkpTq1sB0NgSBcrqRWf7B6S25VMhR2Bd7wmkoskAq+N8w4QAEVPtS5ilUCVYf/+0SrhCsmNmeup3IrsEuuHluca+yb4owtf8li/Y3wYVh4pY6/rJOckJ3qTV1b1bic5+pNBOKoryZFCmFpl9uziw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+DQoNCkJlc3QgUmVn
YXJkcywNCktldmluDQoNCk9uIDcvMTYvMTkgMTE6MDEgQU0sIFF1YW4sIEV2YW4gd3JvdGU6DQo+
IFBpbmcuLg0KPg0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IEV2YW4g
UXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQo+PiBTZW50OiBGcmlkYXksIEp1bHkgMTIsIDIwMTkg
MTo1MSBQTQ0KPj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBDYzogV2Fu
ZywgS2V2aW4oWWFuZykgPEtldmluMS5XYW5nQGFtZC5jb20+OyBRdWFuLCBFdmFuDQo+PiA8RXZh
bi5RdWFuQGFtZC5jb20+DQo+PiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWQvcG93ZXJwbGF5OiBm
aXggZGVhZGxvY2sgYXJvdW5kDQo+PiBzbXVfaGFuZGxlX3Rhc2sgVjINCj4+DQo+PiBBcyB0aGUg
bG9jayB3YXMgYWxyZWFkeSBoZWxkIG9uIHRoZSBlbnRyYW5jZSB0byBzbXVfaGFuZGxlX3Rhc2su
DQo+Pg0KPj4gLSBWMjogbG9jayBpbiBzbWFsbCBncmFudWxhcml0eQ0KPj4NCj4+IENoYW5nZS1J
ZDogSTUzODhhYTkxN2VmMGUzMzA5NzRlMjZjNTlkYjQyZDEzNTRiNmE4NjUNCj4+IFNpZ25lZC1v
ZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQo+PiAtLS0NCj4+ICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMgfCAyIC0tDQo+PiAgIDEgZmlsZSBjaGFu
Z2VkLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcG0uYw0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcG0uYw0KPj4gaW5kZXggOTYxZjRlNTRlZDE4Li5lYjI1NWE2YmQzYTkgMTAwNjQ0DQo+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYw0KPj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMNCj4+IEBAIC0zMDQ5LDExICsz
MDQ5LDkgQEAgdm9pZCBhbWRncHVfcG1fY29tcHV0ZV9jbG9ja3Moc3RydWN0DQo+PiBhbWRncHVf
ZGV2aWNlICphZGV2KQ0KPj4gICAJaWYgKGlzX3N1cHBvcnRfc3dfc211KGFkZXYpKSB7DQo+PiAg
IAkJc3RydWN0IHNtdV9jb250ZXh0ICpzbXUgPSAmYWRldi0+c211Ow0KPj4gICAJCXN0cnVjdCBz
bXVfZHBtX2NvbnRleHQgKnNtdV9kcG0gPSAmYWRldi0NCj4+PiBzbXUuc211X2RwbTsNCj4+IC0J
CW11dGV4X2xvY2soJihzbXUtPm11dGV4KSk7DQo+PiAgIAkJc211X2hhbmRsZV90YXNrKCZhZGV2
LT5zbXUsDQo+PiAgIAkJCQlzbXVfZHBtLT5kcG1fbGV2ZWwsDQo+PiAgIAkJCQlBTURfUFBfVEFT
S19ESVNQTEFZX0NPTkZJR19DSEFOR0UpOw0KPj4gLQkJbXV0ZXhfdW5sb2NrKCYoc211LT5tdXRl
eCkpOw0KPj4gICAJfSBlbHNlIHsNCj4+ICAgCQlpZiAoYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNz
LT5kaXNwYXRjaF90YXNrcykgew0KPj4gICAJCQlpZiAoIWFtZGdwdV9kZXZpY2VfaGFzX2RjX3N1
cHBvcnQoYWRldikpIHsNCj4+IC0tDQo+PiAyLjIxLjANCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
