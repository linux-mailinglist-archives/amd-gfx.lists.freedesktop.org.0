Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4ABA749C
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 22:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38D7898A3;
	Tue,  3 Sep 2019 20:28:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3578987A
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 20:28:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxowz7HTpeS6KQnALCRLA901/CIdQ45CicIecirlJy9QLyJeZP7btQ3Q4YAfJSMe2dv65sH+EFBptq1eg6DYFioZjX4u3lOcCy37D7Net70lU0Y7RAvlhpH0bufWHsb+F32sYOrr5RgjR8XK22YcCRCi5ceO8TT28aTY8dm/T0UbJ5NVkdafULSVrJVAcSQXeGgM6dYFcXi25ayyDdw3C8CaC9JNDgfxrMXQKS2buQLRtRGlvDiS6bw5WBH6m3wuBXv89dREmb6E8E2RwQv5ixBnf1o7AEpcnSfsK20qNA447Q/bbMM+1nplDz5vT5Tkf90/cLcu7l87ukNAak8e+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZUaWensyyNFf7ORCMbFBqYa4Dc4mHl87Zn2UYZVac4=;
 b=WadMU+ii25nIpis0VJBYrY7xWGch/SH8rMpPIbNLPdHHZLF2hNg9JNagmoRS8d8WRkYc4Xl7TqYI3O4ggaR74h1FNQ7YSKLq25KhtzSHi/6DlTJY/D+fefRjI5UNKDrELH5OO9acI0hXYO38DQmsHRmo7vYY525FEvoVXpkSmPsVonmWwLrMAzv2JCStMpQMcL4rJrqt2uXP/hfDjbaxLAu2GWuB+Z1TDZrJO5RTDCiczYJa4YQPjhHktsOOKEFAhkIE+q9jCH3bfHUlb2QEQIa4URe5ybmxigbIMaz9zTX2P2nMix6+A8D0VPB1j1NzCptBSd/rpfxMZcp7hNL1Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2908.namprd12.prod.outlook.com (20.179.71.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 3 Sep 2019 20:28:48 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::3d2a:29d4:df8:4d5%2]) with mapi id 15.20.2220.022; Tue, 3 Sep 2019
 20:28:48 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdgpu: cleanup PTE flag generation
Thread-Topic: [PATCH 2/2] drm/amdgpu: cleanup PTE flag generation
Thread-Index: AQHVYZ7Fl1b2lgMKnUCaq4PlXrJ1G6caaSKA
Date: Tue, 3 Sep 2019 20:28:48 +0000
Message-ID: <bf6fbe9a-c568-0d5c-635c-d759924f72c1@amd.com>
References: <20190902145732.2567-1-christian.koenig@amd.com>
 <20190902145732.2567-2-christian.koenig@amd.com>
In-Reply-To: <20190902145732.2567-2-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTBPR01CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::36) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1428b0e6-1d5e-4c4a-31dc-08d730ad5378
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2908; 
x-ms-traffictypediagnostic: DM6PR12MB2908:
x-microsoft-antispam-prvs: <DM6PR12MB29087302F33862B84C6FCB5192B90@DM6PR12MB2908.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(189003)(199004)(25786009)(31696002)(6436002)(6486002)(478600001)(2501003)(66556008)(6512007)(486006)(36756003)(14454004)(110136005)(8936002)(53936002)(256004)(2616005)(71200400001)(52116002)(14444005)(65806001)(58126008)(81166006)(386003)(5660300002)(65956001)(66066001)(6506007)(186003)(53546011)(316002)(99286004)(6116002)(446003)(102836004)(64756008)(66446008)(76176011)(476003)(3846002)(6246003)(229853002)(66476007)(66574012)(66946007)(11346002)(8676002)(7736002)(31686004)(86362001)(305945005)(71190400001)(2906002)(81156014)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2908;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: glhrjJD1Pn4M6e0qH2BUqv6UygheV+4U2Czmr8Ii4z1dACOpge04fYdgOXk65kc1DeXHDY+rtDwcHu+4RJ++PpCzgDZre0UOPyLhQH3WEhSzmvXCBzdh/fnKMa5bhaES3bo00lAt0PlrWK0mVVFyoCWkoDgoUBaClGx7BhM+C2fiAlencPRUhC3YQfChjAZFc+ZeXeuCafiZ8G7yUYrmUso9hr+AUinT1J/nFMcCb6iaatUQsqNpI7TaWPSDIODbm0F90xB7RKNxCrTvYJFsyAob4yy6OJz0wiGxOqbW51zxEsW/kF1zUH5jwUeuHiWAiuPwORY06y72ocr7M3psCvv67Jlbx4Eh+4/atgSno3+vv94lVTvG6FZGAxgza6UEHrRR9+uYcJmaZwQ9HXdv/R3IoqlZ9H2DCCQNkIhRA2s=
x-ms-exchange-transport-forked: True
Content-ID: <2224CA857961AC4DA435A57F00F66D0B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1428b0e6-1d5e-4c4a-31dc-08d730ad5378
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 20:28:48.5435 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FeFyO/sVpJAnDq1C7Y3qY746/PV5Nho+z04N1/obU3Wgdu+7YJs5afkpD+0F2J88ansfBTTosVQf4DbuP6L5AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2908
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZUaWensyyNFf7ORCMbFBqYa4Dc4mHl87Zn2UYZVac4=;
 b=H03cB0M976ncN4x+JM7pI3yzwyjROwWBLKEGNc6iTEi0qMKOY72bqOzaI/TCLb5MTHxy3iU2NSU+KqdrUvePa/kqcFi/1SeiUxZiDULUCwsIa90bFXlJtLR3H6NKOmw2oo9bF5FE4CkmoEpM/oktELhFHcIAMFyXeOc7tU4rFCY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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

T24gMjAxOS0wOS0wMiAxMDo1NyBhLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPiBNb3Zl
IHRoZSBBU0lDIHNwZWNpZmljIGNvZGUgaW50byBhIG5ldyBjYWxsYmFjayBmdW5jdGlvbi4NCg0K
TkFLLiBJIGJlbGlldmUgdGhlIEJVR19PTnMgeW91J3JlIGFkZGluZyB3aWxsIHRyaWdnZXIgd2l0
aCBST0NtIG9uIA0KSGF3YWlpIGFuZCBLYXZlcmkuIFNlZSBpbmxpbmUgLi4uDQoNClJPQ20gdXNl
ciBtb2RlIGRvZXNuJ3QgY2FyZSB0aGF0IHRoZSBwYWdlIHRhYmxlIGRvZXNuJ3QgaGF2ZSBhbiAN
CmV4ZWN1dGFibGUgYml0IG9uIHRob3NlIGNoaXBzLiBJZiB0aGUgSFcgbWFrZXMgYWxsIG1lbW9y
eSBleGVjdXRhYmxlLCB3ZSANCnNob3VsZCBqdXN0IGlnbm9yZSB0aGUgZmxhZy4NCg0KDQo+DQo+
IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oIHwg
IDUgKysrKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyAgfCAy
OSArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ21jX3YxMF8wLmMgIHwgMjIgKysrKysrKysrKysrKysrKysrLQ0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192Nl8wLmMgICB8ICA5ICsrKysrKysrDQo+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y3XzAuYyAgIHwgMTEgKysrKysrKysrLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OF8wLmMgICB8IDEzICsrKysrKysrKystDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyAgIHwgMjQgKysrKysrKysrKysr
KysrKysrKy0NCj4gICA3IGZpbGVzIGNoYW5nZWQsIDgyIGluc2VydGlvbnMoKyksIDMxIGRlbGV0
aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2dtYy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oDQo+IGlu
ZGV4IGQ1ZTQ1NzRhZmJjMi4uZDNiZTUxYmE2MzQ5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2dtYy5oDQo+IEBAIC0xMDQsNiArMTA0LDEwIEBAIHN0cnVjdCBhbWRn
cHVfZ21jX2Z1bmNzIHsNCj4gICAJLyogZ2V0IHRoZSBwZGUgZm9yIGEgZ2l2ZW4gbWMgYWRkciAq
Lw0KPiAgIAl2b2lkICgqZ2V0X3ZtX3BkZSkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGlu
dCBsZXZlbCwNCj4gICAJCQkgICB1NjQgKmRzdCwgdTY0ICpmbGFncyk7DQo+ICsJLyogZ2V0IHRo
ZSBwdGUgZmxhZ3MgdG8gdXNlIGZvciBhIEJPIFZBIG1hcHBpbmcgKi8NCj4gKwl2b2lkICgqZ2V0
X3ZtX3B0ZSkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICsJCQkgICBzdHJ1Y3QgYW1k
Z3B1X2JvX3ZhX21hcHBpbmcgKm1hcHBpbmcsDQo+ICsJCQkgICB1aW50NjRfdCAqZmxhZ3MpOw0K
PiAgIH07DQo+ICAgDQo+ICAgc3RydWN0IGFtZGdwdV94Z21pIHsNCj4gQEAgLTE4NSw2ICsxODks
NyBAQCBzdHJ1Y3QgYW1kZ3B1X2dtYyB7DQo+ICAgI2RlZmluZSBhbWRncHVfZ21jX2VtaXRfcGFz
aWRfbWFwcGluZyhyLCB2bWlkLCBwYXNpZCkgKHIpLT5hZGV2LT5nbWMuZ21jX2Z1bmNzLT5lbWl0
X3Bhc2lkX21hcHBpbmcoKHIpLCAodm1pZCksIChwYXNpZCkpDQo+ICAgI2RlZmluZSBhbWRncHVf
Z21jX21hcF9tdHlwZShhZGV2LCBmbGFncykgKGFkZXYpLT5nbWMuZ21jX2Z1bmNzLT5tYXBfbXR5
cGUoKGFkZXYpLChmbGFncykpDQo+ICAgI2RlZmluZSBhbWRncHVfZ21jX2dldF92bV9wZGUoYWRl
diwgbGV2ZWwsIGRzdCwgZmxhZ3MpIChhZGV2KS0+Z21jLmdtY19mdW5jcy0+Z2V0X3ZtX3BkZSgo
YWRldiksIChsZXZlbCksIChkc3QpLCAoZmxhZ3MpKQ0KPiArI2RlZmluZSBhbWRncHVfZ21jX2dl
dF92bV9wdGUoYWRldiwgbWFwcGluZywgZmxhZ3MpIChhZGV2KS0+Z21jLmdtY19mdW5jcy0+Z2V0
X3ZtX3B0ZSgoYWRldiksIChtYXBwaW5nKSwgKGZsYWdzKSkNCj4gICANCj4gICAvKioNCj4gICAg
KiBhbWRncHVfZ21jX3ZyYW1fZnVsbF92aXNpYmxlIC0gQ2hlY2sgaWYgZnVsbCBWUkFNIGlzIHZp
c2libGUgdGhyb3VnaCB0aGUgQkFSDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
bS5jDQo+IGluZGV4IDJjYjgyYjIyOTgwMi4uYjI4NWFiMjUxNDZkIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYw0KPiBAQCAtMTU3MSwzMyArMTU3MSw4IEBAIHN0
YXRpYyBpbnQgYW1kZ3B1X3ZtX2JvX3NwbGl0X21hcHBpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsDQo+ICAgCWlmICghKG1hcHBpbmctPmZsYWdzICYgQU1ER1BVX1BURV9XUklURUFCTEUp
KQ0KPiAgIAkJZmxhZ3MgJj0gfkFNREdQVV9QVEVfV1JJVEVBQkxFOw0KPiAgIA0KPiAtCWlmIChh
ZGV2LT5hc2ljX3R5cGUgPj0gQ0hJUF9UT05HQSkgew0KPiAtCQlmbGFncyAmPSB+QU1ER1BVX1BU
RV9FWEVDVVRBQkxFOw0KPiAtCQlmbGFncyB8PSBtYXBwaW5nLT5mbGFncyAmIEFNREdQVV9QVEVf
RVhFQ1VUQUJMRTsNCj4gLQl9DQo+IC0NCj4gLQlpZiAoYWRldi0+YXNpY190eXBlID49IENISVBf
TkFWSTEwKSB7DQo+IC0JCWZsYWdzICY9IH5BTURHUFVfUFRFX01UWVBFX05WMTBfTUFTSzsNCj4g
LQkJZmxhZ3MgfD0gKG1hcHBpbmctPmZsYWdzICYgQU1ER1BVX1BURV9NVFlQRV9OVjEwX01BU0sp
Ow0KPiAtCX0gZWxzZSB7DQo+IC0JCWZsYWdzICY9IH5BTURHUFVfUFRFX01UWVBFX1ZHMTBfTUFT
SzsNCj4gLQkJZmxhZ3MgfD0gKG1hcHBpbmctPmZsYWdzICYgQU1ER1BVX1BURV9NVFlQRV9WRzEw
X01BU0spOw0KPiAtCX0NCj4gLQ0KPiAtCWlmICgobWFwcGluZy0+ZmxhZ3MgJiBBTURHUFVfUFRF
X1BSVCkgJiYNCj4gLQkgICAgKGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX1ZFR0ExMCkpIHsNCj4g
LQkJZmxhZ3MgfD0gQU1ER1BVX1BURV9QUlQ7DQo+IC0JCWlmIChhZGV2LT5hc2ljX3R5cGUgPj0g
Q0hJUF9OQVZJMTApIHsNCj4gLQkJCWZsYWdzIHw9IEFNREdQVV9QVEVfU05PT1BFRDsNCj4gLQkJ
CWZsYWdzIHw9IEFNREdQVV9QVEVfTE9HOw0KPiAtCQkJZmxhZ3MgfD0gQU1ER1BVX1BURV9TWVNU
RU07DQo+IC0JCX0NCj4gLQkJZmxhZ3MgJj0gfkFNREdQVV9QVEVfVkFMSUQ7DQo+IC0JfQ0KPiAt
CWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9BUkNUVVJVUyAmJg0KPiAtCSAgICAhKGZsYWdz
ICYgQU1ER1BVX1BURV9TWVNURU0pICYmDQo+IC0JICAgIG1hcHBpbmctPmJvX3ZhLT5pc194Z21p
KQ0KPiAtCQlmbGFncyB8PSBBTURHUFVfUFRFX1NOT09QRUQ7DQo+ICsJLyogQXBwbHkgQVNJQyBz
cGVjaWZpYyBtYXBwaW5nIGZsYWdzICovDQo+ICsJYW1kZ3B1X2dtY19nZXRfdm1fcHRlKGFkZXYs
IG1hcHBpbmcsICZmbGFncyk7DQo+ICAgDQo+ICAgCXRyYWNlX2FtZGdwdV92bV9ib191cGRhdGUo
bWFwcGluZyk7DQo+ICAgDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nbWNfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jDQo+
IGluZGV4IDdlYjBiYTg3ZmVmOS4uMWE4ZDhmNTI4YjAxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nbWNfdjEwXzAuYw0KPiBAQCAtNDQwLDEyICs0NDAsMzIgQEAgc3RhdGljIHZv
aWQgZ21jX3YxMF8wX2dldF92bV9wZGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBs
ZXZlbCwNCj4gICAJfQ0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyB2b2lkIGdtY192MTBfMF9nZXRf
dm1fcHRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiArCQkJCSBzdHJ1Y3QgYW1kZ3B1
X2JvX3ZhX21hcHBpbmcgKm1hcHBpbmcsDQo+ICsJCQkJIHVpbnQ2NF90ICpmbGFncykNCj4gK3sN
Cj4gKwkqZmxhZ3MgJj0gfkFNREdQVV9QVEVfRVhFQ1VUQUJMRTsNCj4gKwkqZmxhZ3MgfD0gbWFw
cGluZy0+ZmxhZ3MgJiBBTURHUFVfUFRFX0VYRUNVVEFCTEU7DQo+ICsNCj4gKwkqZmxhZ3MgJj0g
fkFNREdQVV9QVEVfTVRZUEVfTlYxMF9NQVNLOw0KPiArCSpmbGFncyB8PSAobWFwcGluZy0+Zmxh
Z3MgJiBBTURHUFVfUFRFX01UWVBFX05WMTBfTUFTSyk7DQo+ICsNCj4gKwlpZiAobWFwcGluZy0+
ZmxhZ3MgJiBBTURHUFVfUFRFX1BSVCkgew0KPiArCQkqZmxhZ3MgfD0gQU1ER1BVX1BURV9QUlQ7
DQo+ICsJCSpmbGFncyB8PSBBTURHUFVfUFRFX1NOT09QRUQ7DQo+ICsJCSpmbGFncyB8PSBBTURH
UFVfUFRFX0xPRzsNCj4gKwkJKmZsYWdzIHw9IEFNREdQVV9QVEVfU1lTVEVNOw0KPiArCQkqZmxh
Z3MgJj0gfkFNREdQVV9QVEVfVkFMSUQ7DQo+ICsJfQ0KPiArfQ0KPiArDQo+ICAgc3RhdGljIGNv
bnN0IHN0cnVjdCBhbWRncHVfZ21jX2Z1bmNzIGdtY192MTBfMF9nbWNfZnVuY3MgPSB7DQo+ICAg
CS5mbHVzaF9ncHVfdGxiID0gZ21jX3YxMF8wX2ZsdXNoX2dwdV90bGIsDQo+ICAgCS5lbWl0X2Zs
dXNoX2dwdV90bGIgPSBnbWNfdjEwXzBfZW1pdF9mbHVzaF9ncHVfdGxiLA0KPiAgIAkuZW1pdF9w
YXNpZF9tYXBwaW5nID0gZ21jX3YxMF8wX2VtaXRfcGFzaWRfbWFwcGluZywNCj4gICAJLm1hcF9t
dHlwZSA9IGdtY192MTBfMF9tYXBfbXR5cGUsDQo+IC0JLmdldF92bV9wZGUgPSBnbWNfdjEwXzBf
Z2V0X3ZtX3BkZQ0KPiArCS5nZXRfdm1fcGRlID0gZ21jX3YxMF8wX2dldF92bV9wZGUsDQo+ICsJ
LmdldF92bV9wdGUgPSBnbWNfdjEwXzBfZ2V0X3ZtX3B0ZQ0KPiAgIH07DQo+ICAgDQo+ICAgc3Rh
dGljIHZvaWQgZ21jX3YxMF8wX3NldF9nbWNfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjZfMC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y2XzAuYw0KPiBpbmRleCAyZTMwNWIy
MWRiNjkuLmNlNTkxYzk5NTY5MSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y2XzAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djZfMC5jDQo+IEBAIC0zODksNiArMzg5LDE0IEBAIHN0YXRpYyB2b2lkIGdtY192Nl8wX2dldF92
bV9wZGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBsZXZlbCwNCj4gICAJQlVHX09O
KCphZGRyICYgMHhGRkZGRkYwMDAwMDAwRkZGVUxMKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMg
dm9pZCBnbWNfdjZfMF9nZXRfdm1fcHRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiAr
CQkJCXN0cnVjdCBhbWRncHVfYm9fdmFfbWFwcGluZyAqbWFwcGluZywNCj4gKwkJCQl1aW50NjRf
dCAqZmxhZ3MpDQo+ICt7DQo+ICsJQlVHX09OKCpmbGFncyAmIEFNREdQVV9QVEVfRVhFQ1VUQUJM
RSk7DQo+ICsJQlVHX09OKCpmbGFncyAmIEFNREdQVV9QVEVfUFJUKTsNCj4gK30NCj4gKw0KPiAg
IHN0YXRpYyB2b2lkIGdtY192Nl8wX3NldF9mYXVsdF9lbmFibGVfZGVmYXVsdChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwNCj4gICAJCQkJCSAgICAgIGJvb2wgdmFsdWUpDQo+ICAgew0KPiBA
QCAtMTE0NCw2ICsxMTUyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfZ21jX2Z1bmNz
IGdtY192Nl8wX2dtY19mdW5jcyA9IHsNCj4gICAJLmVtaXRfZmx1c2hfZ3B1X3RsYiA9IGdtY192
Nl8wX2VtaXRfZmx1c2hfZ3B1X3RsYiwNCj4gICAJLnNldF9wcnQgPSBnbWNfdjZfMF9zZXRfcHJ0
LA0KPiAgIAkuZ2V0X3ZtX3BkZSA9IGdtY192Nl8wX2dldF92bV9wZGUsDQo+ICsJLmdldF92bV9w
dGUgPSBnbWNfdjZfMF9nZXRfdm1fcHRlLA0KPiAgIH07DQo+ICAgDQo+ICAgc3RhdGljIGNvbnN0
IHN0cnVjdCBhbWRncHVfaXJxX3NyY19mdW5jcyBnbWNfdjZfMF9pcnFfZnVuY3MgPSB7DQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjdfMC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y3XzAuYw0KPiBpbmRleCAzYjc3NDIxMjM0YTcuLmUz
ZjUzZmJmY2Q4ZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21j
X3Y3XzAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjdfMC5jDQo+
IEBAIC00NjYsNiArNDY2LDE0IEBAIHN0YXRpYyB2b2lkIGdtY192N18wX2dldF92bV9wZGUoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBsZXZlbCwNCj4gICAJQlVHX09OKCphZGRyICYg
MHhGRkZGRkYwMDAwMDAwRkZGVUxMKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgdm9pZCBnbWNf
djdfMF9nZXRfdm1fcHRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KPiArCQkJCXN0cnVj
dCBhbWRncHVfYm9fdmFfbWFwcGluZyAqbWFwcGluZywNCj4gKwkJCQl1aW50NjRfdCAqZmxhZ3Mp
DQo+ICt7DQo+ICsJQlVHX09OKCpmbGFncyAmIEFNREdQVV9QVEVfRVhFQ1VUQUJMRSk7DQoNCk5B
Sy4gVGhpcyBpcyBnb2luZyB0byBicmVhayBST0NtIG9uIEthdmVyaSBhbmQgSGF3YWlpLg0KDQpS
ZWdhcmRzLA0KIMKgIEZlbGl4DQoNCg0KPiArCUJVR19PTigqZmxhZ3MgJiBBTURHUFVfUFRFX1BS
VCk7DQo+ICt9DQo+ICsNCj4gICAvKioNCj4gICAgKiBnbWNfdjhfMF9zZXRfZmF1bHRfZW5hYmxl
X2RlZmF1bHQgLSB1cGRhdGUgVk0gZmF1bHQgaGFuZGxpbmcNCj4gICAgKg0KPiBAQCAtMTMzOSw3
ICsxMzQ3LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfZ21jX2Z1bmNzIGdtY192N18w
X2dtY19mdW5jcyA9IHsNCj4gICAJLmVtaXRfZmx1c2hfZ3B1X3RsYiA9IGdtY192N18wX2VtaXRf
Zmx1c2hfZ3B1X3RsYiwNCj4gICAJLmVtaXRfcGFzaWRfbWFwcGluZyA9IGdtY192N18wX2VtaXRf
cGFzaWRfbWFwcGluZywNCj4gICAJLnNldF9wcnQgPSBnbWNfdjdfMF9zZXRfcHJ0LA0KPiAtCS5n
ZXRfdm1fcGRlID0gZ21jX3Y3XzBfZ2V0X3ZtX3BkZQ0KPiArCS5nZXRfdm1fcGRlID0gZ21jX3Y3
XzBfZ2V0X3ZtX3BkZSwNCj4gKwkuZ2V0X3ZtX3B0ZSA9IGdtY192N18wX2dldF92bV9wdGUNCj4g
ICB9Ow0KPiAgIA0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2lycV9zcmNfZnVuY3Mg
Z21jX3Y3XzBfaXJxX2Z1bmNzID0gew0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ21jX3Y4XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OF8w
LmMNCj4gaW5kZXggNTg0NDRhYTBhZjA1Li4yNTZkMWZhYWNhZGEgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OF8wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3Y4XzAuYw0KPiBAQCAtNjg5LDYgKzY4OSwxNiBAQCBzdGF0aWMg
dm9pZCBnbWNfdjhfMF9nZXRfdm1fcGRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBpbnQg
bGV2ZWwsDQo+ICAgCUJVR19PTigqYWRkciAmIDB4RkZGRkZGMDAwMDAwMEZGRlVMTCk7DQo+ICAg
fQ0KPiAgIA0KPiArc3RhdGljIHZvaWQgZ21jX3Y4XzBfZ2V0X3ZtX3B0ZShzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwNCj4gKwkJCQlzdHJ1Y3QgYW1kZ3B1X2JvX3ZhX21hcHBpbmcgKm1hcHBp
bmcsDQo+ICsJCQkJdWludDY0X3QgKmZsYWdzKQ0KPiArew0KPiArCUJVR19PTigqZmxhZ3MgJiBB
TURHUFVfUFRFX1BSVCk7DQo+ICsNCj4gKwkqZmxhZ3MgJj0gfkFNREdQVV9QVEVfRVhFQ1VUQUJM
RTsNCj4gKwkqZmxhZ3MgfD0gbWFwcGluZy0+ZmxhZ3MgJiBBTURHUFVfUFRFX0VYRUNVVEFCTEU7
DQo+ICt9DQo+ICsNCj4gICAvKioNCj4gICAgKiBnbWNfdjhfMF9zZXRfZmF1bHRfZW5hYmxlX2Rl
ZmF1bHQgLSB1cGRhdGUgVk0gZmF1bHQgaGFuZGxpbmcNCj4gICAgKg0KPiBAQCAtMTcwNSw3ICsx
NzE1LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfZ21jX2Z1bmNzIGdtY192OF8wX2dt
Y19mdW5jcyA9IHsNCj4gICAJLmVtaXRfZmx1c2hfZ3B1X3RsYiA9IGdtY192OF8wX2VtaXRfZmx1
c2hfZ3B1X3RsYiwNCj4gICAJLmVtaXRfcGFzaWRfbWFwcGluZyA9IGdtY192OF8wX2VtaXRfcGFz
aWRfbWFwcGluZywNCj4gICAJLnNldF9wcnQgPSBnbWNfdjhfMF9zZXRfcHJ0LA0KPiAtCS5nZXRf
dm1fcGRlID0gZ21jX3Y4XzBfZ2V0X3ZtX3BkZQ0KPiArCS5nZXRfdm1fcGRlID0gZ21jX3Y4XzBf
Z2V0X3ZtX3BkZSwNCj4gKwkuZ2V0X3ZtX3B0ZSA9IGdtY192OF8wX2dldF92bV9wdGUNCj4gICB9
Ow0KPiAgIA0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2lycV9zcmNfZnVuY3MgZ21j
X3Y4XzBfaXJxX2Z1bmNzID0gew0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMN
Cj4gaW5kZXggMjI2NjBlMTAwNWRiLi5iM2QyZDcwZTg0YzkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0KPiBAQCAtNjI1LDEyICs2MjUsMzQgQEAgc3RhdGljIHZv
aWQgZ21jX3Y5XzBfZ2V0X3ZtX3BkZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGxl
dmVsLA0KPiAgIAl9DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGljIHZvaWQgZ21jX3Y5XzBfZ2V0X3Zt
X3B0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCj4gKwkJCQlzdHJ1Y3QgYW1kZ3B1X2Jv
X3ZhX21hcHBpbmcgKm1hcHBpbmcsDQo+ICsJCQkJdWludDY0X3QgKmZsYWdzKQ0KPiArew0KPiAr
CSpmbGFncyAmPSB+QU1ER1BVX1BURV9FWEVDVVRBQkxFOw0KPiArCSpmbGFncyB8PSBtYXBwaW5n
LT5mbGFncyAmIEFNREdQVV9QVEVfRVhFQ1VUQUJMRTsNCj4gKw0KPiArCSpmbGFncyAmPSB+QU1E
R1BVX1BURV9NVFlQRV9WRzEwX01BU0s7DQo+ICsJKmZsYWdzIHw9IG1hcHBpbmctPmZsYWdzICYg
QU1ER1BVX1BURV9NVFlQRV9WRzEwX01BU0s7DQo+ICsNCj4gKwlpZiAobWFwcGluZy0+ZmxhZ3Mg
JiBBTURHUFVfUFRFX1BSVCkgew0KPiArCQkqZmxhZ3MgfD0gQU1ER1BVX1BURV9QUlQ7DQo+ICsJ
CSpmbGFncyAmPSB+QU1ER1BVX1BURV9WQUxJRDsNCj4gKwl9DQo+ICsNCj4gKwlpZiAoYWRldi0+
YXNpY190eXBlID09IENISVBfQVJDVFVSVVMgJiYNCj4gKwkgICAgISgqZmxhZ3MgJiBBTURHUFVf
UFRFX1NZU1RFTSkgJiYNCj4gKwkgICAgbWFwcGluZy0+Ym9fdmEtPmlzX3hnbWkpDQo+ICsJCSpm
bGFncyB8PSBBTURHUFVfUFRFX1NOT09QRUQ7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgY29uc3Qg
c3RydWN0IGFtZGdwdV9nbWNfZnVuY3MgZ21jX3Y5XzBfZ21jX2Z1bmNzID0gew0KPiAgIAkuZmx1
c2hfZ3B1X3RsYiA9IGdtY192OV8wX2ZsdXNoX2dwdV90bGIsDQo+ICAgCS5lbWl0X2ZsdXNoX2dw
dV90bGIgPSBnbWNfdjlfMF9lbWl0X2ZsdXNoX2dwdV90bGIsDQo+ICAgCS5lbWl0X3Bhc2lkX21h
cHBpbmcgPSBnbWNfdjlfMF9lbWl0X3Bhc2lkX21hcHBpbmcsDQo+ICAgCS5tYXBfbXR5cGUgPSBn
bWNfdjlfMF9tYXBfbXR5cGUsDQo+IC0JLmdldF92bV9wZGUgPSBnbWNfdjlfMF9nZXRfdm1fcGRl
DQo+ICsJLmdldF92bV9wZGUgPSBnbWNfdjlfMF9nZXRfdm1fcGRlLA0KPiArCS5nZXRfdm1fcHRl
ID0gZ21jX3Y5XzBfZ2V0X3ZtX3B0ZQ0KPiAgIH07DQo+ICAgDQo+ICAgc3RhdGljIHZvaWQgZ21j
X3Y5XzBfc2V0X2dtY19mdW5jcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
