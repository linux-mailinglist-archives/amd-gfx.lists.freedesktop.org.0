Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2771CC9F8F
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 15:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4E86E9D9;
	Thu,  3 Oct 2019 13:36:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790051.outbound.protection.outlook.com [40.107.79.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C85A6E9D8
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 13:36:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1MhSkNcduM2Q1+ln7w6bHX0RuCAPBWY78L2QPyVFBU/qmUiZszHNUZTYnjsomSCqxVk/obT6ee/bU3+06KaT/nh7yNkZ6eLrVDf/gD/wl/CLNfEZi5ZWWZan6B+i1a0tXRnEgdcF/R9xRbtqk2OnUOd/VCWiK4iir6rc4HjtdBe/Cn47l42e5354HdQ6z6V3XS4EbUvlmmgCCHS+6p/PnUCG6+NUVb3WM26B1pz0KF4GEFumItcgbxn+cBxbrHJTYkYwB+ekM7oXJ/7PRt1nx2W1WWaiTrIiBAg/hep+GcCb5vxNUJHaD+jsntp922t9Xz7izGN8+tyXJ8txpebcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mp5megvbDykabDef8LPOmN4flldzVJLbfj/YheevjKo=;
 b=hWpWd6IYMGo+76de3PBKS06gOrcewxOMDJC4/CCfjfei8ma6K7Om9OGBnn3Qca3c+tctV0fydpLiX36onVyMUlnIdDZbjZzDjdgOvoBak2lACvUroj3Eu/eEtIEjTNC6Ydnxhh17uAbeBOtwzuGmfGvt9fYhte3W14C84dXjsu6Q2cjeKgKjyENVFTozZEdzQgPJ3HlMUzot1EMozqrPdOZCD3bLb07sztn0ELbqCnNZV6T3touTCc6pjmazclCtTR33ERNF7jhdjRa2NkLaPQkb0CmogQjhrM5wKYtkzv5BsKdzjxzZQBINkGOk29HuXt955Ob+HgvZfLCMnMbe4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com (10.174.109.137) by
 DM5PR1201MB0154.namprd12.prod.outlook.com (10.174.108.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 13:36:27 +0000
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::6186:7adb:ceda:20d]) by DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::6186:7adb:ceda:20d%3]) with mapi id 15.20.2305.023; Thu, 3 Oct 2019
 13:36:27 +0000
From: "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: do not execute 0-sized IBs
Thread-Topic: [PATCH] drm/amdgpu: do not execute 0-sized IBs
Thread-Index: AQHVecESlri34d569kWl8OF1vO+U7KdIkEmAgAAEZACAAFAAFIAABuIA
Date: Thu, 3 Oct 2019 13:36:27 +0000
Message-ID: <e0ca7cb6-139a-9016-a7d8-3da9d9ec48b5@amd.com>
References: <20191003080306.3514-1-pierre-eric.pelloux-prayer@amd.com>
 <12e0b546-faaf-38c3-c0fc-1e713348b62e@gmail.com>
 <a8d4871c-4b00-3a72-1cff-50878e1d8818@amd.com>
 <BN6PR12MB1809256856DE153A35FD7EF6F79F0@BN6PR12MB1809.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB1809256856DE153A35FD7EF6F79F0@BN6PR12MB1809.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0110.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::26) To DM5PR1201MB0187.namprd12.prod.outlook.com
 (2603:10b6:4:5b::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [109.190.135.109]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da8ec8e1-995a-437a-6d49-08d74806b0b7
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR1201MB0154:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1201MB01542A9C34A7FAFDA91DC3818D9F0@DM5PR1201MB0154.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(199004)(189003)(102836004)(55236004)(6506007)(446003)(11346002)(2616005)(316002)(386003)(53546011)(256004)(486006)(6306002)(8676002)(5660300002)(31696002)(2501003)(81156014)(81166006)(2906002)(6512007)(6116002)(3846002)(8936002)(31686004)(86362001)(966005)(305945005)(6486002)(71190400001)(66066001)(478600001)(7736002)(25786009)(476003)(6436002)(186003)(26005)(14454004)(6246003)(71200400001)(66446008)(66556008)(64756008)(66946007)(99286004)(66476007)(76176011)(36756003)(110136005)(52116002)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0154;
 H:DM5PR1201MB0187.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9VSANuu/2C+A8Hy/Tgs6HMKYyKzlspmDuBqizacWT0wN/Ime/BoZ8DpOLTBVfwFZ24BvNJJabBUQ2CIP/jz9mcSqtSDx8Q/uymghYzOeUo2yUR1AkkESRodJDQuylTKebJ7DQCO1kPOqJdRdUI0+FmWKpo418u2EQaE5k9IYTSX7y20vjw3bPrhO1tvjinWDyAoByScabQBLQN7KfhQKAgX5fCctc57hNz5UFwnWz/eA1logDy17l3A/RD0k60MkQwKIEyY5GnVfcX7Yz8A4biw0TiQyLxEZTGMD7r5qsoUzlCdC5xPHWCQyqevKBXUIKNvEJsx8BzHnDGQWExkkAwHT0lbVh8ke/wZJk6ZfJMI12IlIyIQwT+gsF0dqFwJsAs6b9PEHftwAMVp7pCyb0J3QPm/xgY7vVerKdWpaIplobTvqR/cAc9A20V9bA9N1g+g9YiQwmN6hXJNq9UcfHw==
Content-ID: <EC30972D52CC7B4D9F8C90CB30ED6A1C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da8ec8e1-995a-437a-6d49-08d74806b0b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 13:36:27.1687 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hOBDW0oLAU/F+0zhXfg4FbjambM1pFy33JlVlXgdTP0vv0L2lPHSRq+Cse6ROcYyQQVmjp+RiwBfj0CXGjuo8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0154
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mp5megvbDykabDef8LPOmN4flldzVJLbfj/YheevjKo=;
 b=rkAcq0pYLhsYnfBsRQ8YTy7RWHpV3BrPQF2pjZXnb7Shmik0ez0nxdSLFNC84IrNlpadgU4ENoIfDl2JH5f/S71qlhTk0pp6FdRnT76RgisOZwrQc3T4P20B7Ak0iVI9vX2jlDHRC/vyO4q1SNNdbuIw+r4fcygpRIzL0XX4qV8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Pierre-eric.Pelloux-prayer@amd.com; 
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

T24gMDMvMTAvMjAxOSAxNToxMiwgRGV1Y2hlciwgQWxleGFuZGVyIHdyb3RlOg0KPiBEb2VzIHNv
bWUgdmFyaWFudCBvZiB0aGUgcGF0Y2ggb24gdGhpcyB0aHJlYWQgaGVscD8NCj4gaHR0cHM6Ly9w
YXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMzMzA2OC8NCg0KSGkgQWxleCwNCg0KVGhl
IGFkZGVkIGNvbmRpdGlvbiBpbiB0aGlzIHBhdGNoIGlzOg0KDQogICAhKGFkZXYtPmFzaWNfdHlw
ZSA+PSBDSElQX05BVkkxMCAmJiBhZGV2LT5hc2ljX3R5cGUgPD0gQ0hJUF9OQVZJMTIpIHx8DQoN
CndoaWNoIHdpbGwgZXZhbHVhdGUgdG8gImZhbHNlIHx8IiBvbiBOYXZpMTAgc28gSSBkb24ndCB0
aGluayBpdCdsbCBoZWxwLg0KDQpJJ2xsIHNlbmQgYW4gdXBkYXRlZCB2ZXJzaW9uIG9mIG15IHBh
dGNoIHRoYXQgd2lsbCBvbmx5IG1vZGlmeSBnbWNfdjEwXzBfZmx1c2hfZ3B1X3RsYg0KdG8gbm90
IHNlbmQgYSAwLXNpemVkIElCLg0KDQpUaGFua3MsDQpQaWVycmUtRXJpYw0KDQoNCj4gDQo+IEFs
ZXgNCj4gDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAqRnJvbToqIGFtZC1nZnggPGFtZC1n
ZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IG9uIGJlaGFsZiBvZiBQZWxsb3V4LXBy
YXllciwgUGllcnJlLWVyaWMgPFBpZXJyZS1lcmljLlBlbGxvdXgtcHJheWVyQGFtZC5jb20+DQo+
ICpTZW50OiogVGh1cnNkYXksIE9jdG9iZXIgMywgMjAxOSA0OjI1IEFNDQo+ICpUbzoqIEtvZW5p
ZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZyA8YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+DQo+ICpTdWJqZWN0
OiogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogZG8gbm90IGV4ZWN1dGUgMC1zaXplZCBJQnMNCj4g
wqANCj4gDQo+IE9uIDAzLzEwLzIwMTkgMTA6MDksIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+
PiBBbSAwMy4xMC4xOSB1bSAxMDowMyBzY2hyaWViIFBlbGxvdXgtcHJheWVyLCBQaWVycmUtZXJp
YzoNCj4+PiBUaGlzIGNhbiBiZSBzYWZlbHkgc2tpcHBlZCBlbnRpcmVseS4NCj4+PiBUaGlzIHNl
ZW1zIHRvIGhlbHAgd2l0aCBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNn
aT9pZD0xMTE0ODEuDQo+PiANCj4+IE5BSywgcGxlYXNlIGluc3RlYWQgZml4IGdtY192MTBfMF9m
bHVzaF9ncHVfdGxiIHRvIGluY2x1ZGUgYXQgbGVhc3Qgc29tZSBOT1AgaW4gdGhlIHN1Ym1pdHRl
ZCBJQnMuDQo+IA0KPiBJcyB0aGVyZSBhbnkgaW50ZXJlc3QgaW4gZXhlY3V0aW5nIGFuIGVtcHR5
IChvciBvbmx5IGZpbGxlZCB3aXRoIE5PUHMpIElCPw0KPiANCj4gQW55d2F5IEkgY2FuIG1vZGlm
eSB0aGUgcGF0Y2ggdG8gZG8gdGhpcy4NCj4gDQo+IFRoYW5rcywNCj4gUGllcnJlLUVyaWMNCj4g
DQo+PiANCj4+IENocmlzdGlhbi4NCj4+IA0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogUGllcnJl
LUVyaWMgUGVsbG91eC1QcmF5ZXIgPHBpZXJyZS1lcmljLnBlbGxvdXgtcHJheWVyQGFtZC5jb20+
DQo+Pj4gLS0tDQo+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMg
fCA1ICsrKysrDQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPj4+DQo+
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMNCj4+PiBpbmRleCA2MDY1NTgz
NGQ2NDkuLmFhMTYzZTY3OWYxZiAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfaWIuYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9pYi5jDQo+Pj4gQEAgLTIyNyw2ICsyMjcsMTEgQEAgaW50IGFtZGdwdV9pYl9zY2hl
ZHVsZShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVuc2lnbmVkIG51bV9pYnMsDQo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIWFtZGdwdV9zcmlvdl92ZihhZGV2KSkgLyogZm9yIFNS
SU9WIHByZWVtcHRpb24sIFByZWFtYmxlIENFIGliIG11c3QgYmUgaW5zZXJ0ZWQgYW55d2F5ICov
DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7DQo+Pj4gwqAgK8KgwqDC
oMKgwqDCoMKgIGlmIChpYi0+bGVuZ3RoX2R3ID09IDApIHsNCj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAvKiBPbiBOYXZpIGdtY192MTBfMF9mbHVzaF9ncHVfdGxiIGVtaXRzIDAgc2l6ZWQg
SUIgKi8NCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsNCj4+PiArwqDCoMKg
wqDCoMKgwqAgfQ0KPj4+ICsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYW1kZ3B1X3JpbmdfZW1p
dF9pYihyaW5nLCBqb2IsIGliLCBzdGF0dXMpOw0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0
dXMgJj0gfkFNREdQVV9IQVZFX0NUWF9TV0lUQ0g7DQo+Pj4gwqDCoMKgwqDCoCB9DQo+PiANCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdm
eCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
