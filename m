Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271F9BE4A7
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 20:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AFE6EDF0;
	Wed, 25 Sep 2019 18:34:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780049.outbound.protection.outlook.com [40.107.78.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2DA6EE13
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 18:34:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfT6olqycVQvQ8B9UlpkyTcG2oAz6JGNOUeEm6OUuQHWSQeY7Bn+N4ZXm8bG3FQWzYPh3G8YlDquJVuJEt2pVzD0yAQeKPtzpQuxtfUP3b8+s5cua+05bg3fiyEmMTULX63Qr4suIORVdjoZEEbAM6PHLWAmv9Ree/zK7lgH8XXpQBPqfGjiu5+71hMqNJBY1XpWbc1qNR2RN1B4TONtvbt+BrOGQ3vV4vjbmiWPti6drLtktmZz2084wULmd3F4HZr5PEOf5LLfR0N5ynBBPkfV0Xg3sV64zETUu2dPK4E145aEusyUstvwTb2ONQl3TSlzSzqh+8Rsvf3U2eHWFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vfzmLxHeTfJWeVByBvCezXWo5jAJ+3y8xRADhASDxw=;
 b=ixIt2RvF20Z1qnJ0xLkEQhBz7rYB5hU9Q9h8jL0k8UBhg30c7d12V5pRpaydwG5hTn4MLA365aACr86uIJc5WN9j6kusxY71PxYXu5XCplonL68etYGcBGwghEZppsvZc71HBRWHsmlEEaU7Ye4Nwh3b/JL9SinOaNX2fp0VCBF5RhTXIkqO5RVeZpRBlIB/SdFvGPLk7D2DQzf0eQGHUYIld+lQhcQMIcLtlfTqgPdBLTG0HXj5j4WCqLG0oxSY4WQLWZgF9AbteJBqk/ypvNWTlxD5waiuP8wtSpyFXf0I6h01XntYzWKQMLaoX7HHic6XYYZPo/+BGzAmMPUfUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB2763.namprd12.prod.outlook.com (20.176.118.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Wed, 25 Sep 2019 18:34:35 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 18:34:35 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/amdkfd: Remove the control stack workaround for
 GFX10
Thread-Topic: [PATCH 3/3] drm/amdkfd: Remove the control stack workaround for
 GFX10
Thread-Index: AQHVc80/rILqZ5+AA0KhlrYPxnfn6qc8ta2AgAACeIA=
Date: Wed, 25 Sep 2019 18:34:35 +0000
Message-ID: <09afdf34-0c72-5306-103a-1290734fa1a2@amd.com>
References: <20190925181527.17091-1-Yong.Zhao@amd.com>
 <20190925181527.17091-3-Yong.Zhao@amd.com>
 <3d63ddfd-2773-b89d-c0dc-75ac1397b1fc@amd.com>
In-Reply-To: <3d63ddfd-2773-b89d-c0dc-75ac1397b1fc@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::18) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6cf795ae-31e4-4877-8812-08d741e70397
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2763; 
x-ms-traffictypediagnostic: DM6PR12MB2763:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2763E53A5AABF5DAAC693367F0870@DM6PR12MB2763.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(199004)(189003)(99286004)(6506007)(386003)(31696002)(71200400001)(11346002)(446003)(8676002)(81166006)(2616005)(476003)(71190400001)(66556008)(66066001)(6512007)(81156014)(53546011)(8936002)(3846002)(7736002)(6486002)(229853002)(36756003)(2906002)(64756008)(66446008)(486006)(6436002)(31686004)(6116002)(305945005)(66946007)(186003)(86362001)(256004)(316002)(478600001)(2501003)(26005)(14444005)(110136005)(14454004)(6246003)(76176011)(25786009)(52116002)(5660300002)(66476007)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2763;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: i0wTZKkXC6E2fvOBPQlqAhH4/KakCWyvmVN3/rZOsrPgpujXxUSTAfva8KIAUh61PZn4pd4JLKZ8EpWMX3Jo0+woSCVcW5OuSTwEMq/IyUoY7duo0gwfPJvXjF6QPgnbY1NAfAPzTaBCZOC7FjbgdQUcKhMQI080rqmdzc8uTHJ2RPbpcHeIm3JnEMPfzcE6/dx9O78dkj+TrnUt1bvxEFgqBvqjlDNBeCstt7TewuLsYc331ZT9KY8XSf+jYLsiEjE/EUNW4sWi+J7SXDOeLVX/NvRBUYNY0CPxOYiHKUXyzx+fMZFZwNTlRkKSrtljpxzwWRzsd4EaA12RHsOlicNBqY81Uijj/oQ82NAVBWtwmYL11rCMQ9tmOEWaPT7yRiP9ZxCPXrhtJJN8nYj24eCy7Si4sG1hn3mr+ff3siI=
Content-ID: <C94D3FF974D6FE45AE63C3C35A382D51@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf795ae-31e4-4877-8812-08d741e70397
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 18:34:35.2066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D/WsPOzWAfJiCLOJPQ4nodDfxLLFDPhY0RDmMhMqYaA5cizksH4ip8uGoLKjReOg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2763
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vfzmLxHeTfJWeVByBvCezXWo5jAJ+3y8xRADhASDxw=;
 b=OY027ga1PW6efEa9EZdlm+H/9avHKdDD4knfsDmnU4Ap1n73whzLBf5jJe3aBbOPKst1cwYsEjCXxRIRESgtkhKYXYjeQRiMqMrY9xqqOQ8ygC0UA7O2S3qGe3p1vAmIta8nrL4Lp2q1Fxh7KHkdW9+76AadIdaIwmAaEb50Dyc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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

WWVzLiBJIGNvbmZpcm1lZCB3aXRoIENQIGd1eXMgYW5kIHRoZXkgc2FpZCB0aGUgYmVoYXZpb3Ig
b24gR0ZYMTAgaXMgdGhlIA0Kc2FtZSBhcyBHRlg4IG5vdy4gSSByZW1lbWJlciB0aGF0IHRoZSB3
b3JrYXJvdW5kIG9uIEdGWDkgd2FzIHRvIGhlbHAgDQp3aXRoIGEgSFcgYnVnLCBidXQgbm90IHRv
byBzdXJlLg0KDQpSZWdhcmRzLA0KDQpZb25nDQoNCk9uIDIwMTktMDktMjUgMjoyNSBwLm0uLCBL
dWVobGluZywgRmVsaXggd3JvdGU6DQo+IE9uIDIwMTktMDktMjUgMjoxNSBwLm0uLCBaaGFvLCBZ
b25nIHdyb3RlOg0KPj4gVGhlIEdGWDEwIGRvZXMgbm90IGhhdmUgdGhpcyBoYXJkd2FyZSBidWcg
YW55IG1vcmUsIHNvIHJlbW92ZSBpdC4NCj4gSSB3b3VsZG4ndCBjYWxsIHRoaXMgYSBidWcgYW5k
IGEgd29ya2Fyb3VuZC4gTW9yZSBsaWtlIGEgY2hhbmdlIGluIHRoZQ0KPiBIVyBvciBGVyBiZWhh
dmlvdXIgYW5kIGEgY29ycmVzcG9uZGluZyBkcml2ZXIgY2hhbmdlLiBJLmUuIGluIEdGWHY4IHRo
ZQ0KPiBjb250cm9sIHN0YWNrIHdhcyBpbiB0aGUgdXNlciBtb2RlIENXU1IgYWxsb2NhdGlvbi4g
SW4gR0ZYdjkgaXQgbW92ZWQNCj4gaW50byBhIGtlcm5lbCBtb2RlIGJ1ZmZlciBuZXh0IHRvIHRo
ZSBNUUQuIFNvIGluIEdGWHYxMCB0aGUgY29udHJvbA0KPiBzdGFjayBtb3ZlZCBiYWNrIGludG8g
dGhlIHVzZXIgbW9kZSBDV1NSIGJ1ZmZlcj8NCj4NCj4gUmVnYXJkcywNCj4gICDCoCBGZWxpeA0K
Pg0KPj4gQ2hhbmdlLUlkOiBJNDQ2Yzk2ODU1NDlhMDlhYzg4NDZhNDJlZTIyZDg2Y2ZiOTNmZDk4
Yw0KPj4gU2lnbmVkLW9mZi1ieTogWW9uZyBaaGFvIDxZb25nLlpoYW9AYW1kLmNvbT4NCj4+IC0t
LQ0KPj4gICAgLi4uL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMgIHwg
MzcgKystLS0tLS0tLS0tLS0tLS0tLQ0KPj4gICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgMzMgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92MTAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92MTAuYw0KPj4gaW5kZXggOWNkM2ViMmQ5MGJkLi40YTIz
NmIyYzIzNTQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
bXFkX21hbmFnZXJfdjEwLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9tcWRfbWFuYWdlcl92MTAuYw0KPj4gQEAgLTY5LDM1ICs2OSwxMyBAQCBzdGF0aWMgdm9pZCB1
cGRhdGVfY3VfbWFzayhzdHJ1Y3QgbXFkX21hbmFnZXIgKm1tLCB2b2lkICptcWQsDQo+PiAgICBz
dGF0aWMgc3RydWN0IGtmZF9tZW1fb2JqICphbGxvY2F0ZV9tcWQoc3RydWN0IGtmZF9kZXYgKmtm
ZCwNCj4+ICAgIAkJc3RydWN0IHF1ZXVlX3Byb3BlcnRpZXMgKnEpDQo+PiAgICB7DQo+PiAtCWlu
dCByZXR2YWw7DQo+PiAtCXN0cnVjdCBrZmRfbWVtX29iaiAqbXFkX21lbV9vYmogPSBOVUxMOw0K
Pj4gKwlzdHJ1Y3Qga2ZkX21lbV9vYmogKm1xZF9tZW1fb2JqOw0KPj4gICAgDQo+PiAtCS8qIEZy
b20gVjksICBmb3IgQ1dTUiwgdGhlIGNvbnRyb2wgc3RhY2sgaXMgbG9jYXRlZCBvbiB0aGUgbmV4
dCBwYWdlDQo+PiAtCSAqIGJvdW5kYXJ5IGFmdGVyIHRoZSBtcWQsIHdlIHdpbGwgdXNlIHRoZSBn
dHQgYWxsb2NhdGlvbiBmdW5jdGlvbg0KPj4gLQkgKiBpbnN0ZWFkIG9mIHN1Yi1hbGxvY2F0aW9u
IGZ1bmN0aW9uLg0KPj4gLQkgKi8NCj4+IC0JaWYgKGtmZC0+Y3dzcl9lbmFibGVkICYmIChxLT50
eXBlID09IEtGRF9RVUVVRV9UWVBFX0NPTVBVVEUpKSB7DQo+PiAtCQltcWRfbWVtX29iaiA9IGt6
YWxsb2Moc2l6ZW9mKHN0cnVjdCBrZmRfbWVtX29iaiksIEdGUF9OT0lPKTsNCj4+IC0JCWlmICgh
bXFkX21lbV9vYmopDQo+PiAtCQkJcmV0dXJuIE5VTEw7DQo+PiAtCQlyZXR2YWwgPSBhbWRncHVf
YW1ka2ZkX2FsbG9jX2d0dF9tZW0oa2ZkLT5rZ2QsDQo+PiAtCQkJQUxJR04ocS0+Y3RsX3N0YWNr
X3NpemUsIFBBR0VfU0laRSkgKw0KPj4gLQkJCQlBTElHTihzaXplb2Yoc3RydWN0IHYxMF9jb21w
dXRlX21xZCksIFBBR0VfU0laRSksDQo+PiAtCQkJJihtcWRfbWVtX29iai0+Z3R0X21lbSksDQo+
PiAtCQkJJihtcWRfbWVtX29iai0+Z3B1X2FkZHIpLA0KPj4gLQkJCSh2b2lkICopJihtcWRfbWVt
X29iai0+Y3B1X3B0ciksIHRydWUpOw0KPj4gLQl9IGVsc2Ugew0KPj4gLQkJcmV0dmFsID0ga2Zk
X2d0dF9zYV9hbGxvY2F0ZShrZmQsIHNpemVvZihzdHJ1Y3QgdjEwX2NvbXB1dGVfbXFkKSwNCj4+
IC0JCQkJJm1xZF9tZW1fb2JqKTsNCj4+IC0JfQ0KPj4gLQ0KPj4gLQlpZiAocmV0dmFsKSB7DQo+
PiAtCQlrZnJlZShtcWRfbWVtX29iaik7DQo+PiArCWlmIChrZmRfZ3R0X3NhX2FsbG9jYXRlKGtm
ZCwgc2l6ZW9mKHN0cnVjdCB2MTBfY29tcHV0ZV9tcWQpLA0KPj4gKwkJCSZtcWRfbWVtX29iaikp
DQo+PiAgICAJCXJldHVybiBOVUxMOw0KPj4gLQl9DQo+PiAgICANCj4+ICAgIAlyZXR1cm4gbXFk
X21lbV9vYmo7DQo+PiAtDQo+PiAgICB9DQo+PiAgICANCj4+ICAgIHN0YXRpYyB2b2lkIGluaXRf
bXFkKHN0cnVjdCBtcWRfbWFuYWdlciAqbW0sIHZvaWQgKiptcWQsDQo+PiBAQCAtMjUwLDE0ICsy
MjgsNyBAQCBzdGF0aWMgaW50IGRlc3Ryb3lfbXFkKHN0cnVjdCBtcWRfbWFuYWdlciAqbW0sIHZv
aWQgKm1xZCwNCj4+ICAgIHN0YXRpYyB2b2lkIGZyZWVfbXFkKHN0cnVjdCBtcWRfbWFuYWdlciAq
bW0sIHZvaWQgKm1xZCwNCj4+ICAgIAkJCXN0cnVjdCBrZmRfbWVtX29iaiAqbXFkX21lbV9vYmop
DQo+PiAgICB7DQo+PiAtCXN0cnVjdCBrZmRfZGV2ICprZmQgPSBtbS0+ZGV2Ow0KPj4gLQ0KPj4g
LQlpZiAobXFkX21lbV9vYmotPmd0dF9tZW0pIHsNCj4+IC0JCWFtZGdwdV9hbWRrZmRfZnJlZV9n
dHRfbWVtKGtmZC0+a2dkLCBtcWRfbWVtX29iai0+Z3R0X21lbSk7DQo+PiAtCQlrZnJlZShtcWRf
bWVtX29iaik7DQo+PiAtCX0gZWxzZSB7DQo+PiAtCQlrZmRfZ3R0X3NhX2ZyZWUobW0tPmRldiwg
bXFkX21lbV9vYmopOw0KPj4gLQl9DQo+PiArCWtmZF9ndHRfc2FfZnJlZShtbS0+ZGV2LCBtcWRf
bWVtX29iaik7DQo+PiAgICB9DQo+PiAgICANCj4+ICAgIHN0YXRpYyBib29sIGlzX29jY3VwaWVk
KHN0cnVjdCBtcWRfbWFuYWdlciAqbW0sIHZvaWQgKm1xZCwNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
