Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4105531462
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 20:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2A48924A;
	Fri, 31 May 2019 18:05:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730057.outbound.protection.outlook.com [40.107.73.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852618924A
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 18:05:54 +0000 (UTC)
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0264.namprd12.prod.outlook.com (10.172.79.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Fri, 31 May 2019 18:05:51 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::7500:b13:ffcb:f9e3]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::7500:b13:ffcb:f9e3%10]) with mapi id 15.20.1922.021; Fri, 31 May 2019
 18:05:51 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/display: Drop some new
 CONFIG_DRM_AMD_DC_DCN1_01 guards
Thread-Topic: [PATCH] drm/amdgpu/display: Drop some new
 CONFIG_DRM_AMD_DC_DCN1_01 guards
Thread-Index: AQHVF88dv8YsjeN1vUKlDqIXyADMgqaFhywA
Date: Fri, 31 May 2019 18:05:51 +0000
Message-ID: <7cd3d1c3-b2a1-17f1-631f-b44e871f2cb0@amd.com>
References: <20190531163707.21363-1-alexander.deucher@amd.com>
In-Reply-To: <20190531163707.21363-1-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-clientproxiedby: YTXPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::29) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55aeea65-4921-4624-c48e-08d6e5f29def
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0264; 
x-ms-traffictypediagnostic: CY4PR1201MB0264:
x-microsoft-antispam-prvs: <CY4PR1201MB026430D8079D3CC9949C31438C190@CY4PR1201MB0264.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:127;
x-forefront-prvs: 00540983E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(376002)(136003)(346002)(39860400002)(199004)(189003)(81156014)(71190400001)(71200400001)(316002)(3846002)(476003)(110136005)(76176011)(66446008)(2501003)(65806001)(68736007)(73956011)(58126008)(4326008)(102836004)(256004)(6116002)(186003)(6512007)(65826007)(6506007)(53546011)(8676002)(81166006)(26005)(2906002)(446003)(99286004)(53936002)(31686004)(8936002)(386003)(2616005)(11346002)(65956001)(6246003)(64756008)(66946007)(66476007)(66556008)(31696002)(72206003)(52116002)(5660300002)(25786009)(486006)(66066001)(305945005)(6486002)(14454004)(6436002)(7736002)(64126003)(36756003)(229853002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0264;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GJUDLdeFUumKi/Mn1L8qpWxpFdryCXRR0JdDDevoTw4SVF2bTGBKFX50x/Gmo4bVBHMoZ7Ls48UvV7PwRVRIEeWMC23Bgom1gk4sW3BJDqk2PUniitNRwfFyoIbaxQ8V9r1jYdnWIfLJ9PVvFUR2tNzHJEwS4Dn3DCIZVYYDTHu68mdyu2p+PtpjiFwSStDjwBcwebD6hXO/dGuBEdaMsKTY4WMfAhraKnC5HWFRPufAwXoR5Q2TWPWJ/IPuOiZAKKgkLuDiYS5fe+bbH13CLTCgXdd3+14WMfO7+/3hVaLHbKtv0uKkHutxC1NfkFpjwoiMR7FtYmHjzKk1P7paUnhc4Tmc3RDxo/ceqSiYMaeSt7caBDLo/MBR9uOdh2oGfXbx11qnHUp0RhMaH4XbdPSvwJRkmxz6hV6Oe/uWbms=
Content-ID: <FD095F982CD7AA4096D43C749530AA34@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55aeea65-4921-4624-c48e-08d6e5f29def
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2019 18:05:51.7449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hwentlan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0264
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZKBW4Z30j+D2M5p8315sSx2PsGMWgLVS/+PzHzzLYg=;
 b=NVlg5e3d7xuWVXRc5Eww2FG08wySpTmZZtmZiBETUF+eW6k6duybhp4Fj0rAninU8T+YBF3kuWdBrqjmluqMHau3sIUOTKdONelvOmEh8J/3XcLsnEmssPisSAr2fd8mUFz7sUWMap8rH0LFfdRn5n72tntCxYeFvfLMzzSO9bw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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

T24gMjAxOS0wNS0zMSAxMjozNyBwLm0uLCBBbGV4IERldWNoZXIgd3JvdGU6DQo+IFRoZXNlIGdv
dCBhZGRlZCBiYWNrIGJ5IHN1YnNlcXVlbnQgbWVyZ2VzIGFjY2lkZW50bHkuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQoNClJl
dmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCg0KSGFy
cnkNCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMgfCAyIC0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21n
ci9jbGtfbWdyLmMgIHwgNCAtLS0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMNCj4gaW5kZXggMzNlMzk4ODgyMTFjLi5iNWE1Y2ZhZTdiYTEgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0K
PiBAQCAtNjY1LDEzICs2NjUsMTEgQEAgc3RhdGljIGludCBsb2FkX2RtY3VfZncoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAJY2FzZSBDSElQX1ZFR0EyMDoNCj4gIAkJcmV0dXJuIDA7
DQo+ICAJY2FzZSBDSElQX1JBVkVOOg0KPiAtI2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURfRENf
RENOMV8wMSkNCj4gIAkJaWYgKEFTSUNSRVZfSVNfUElDQVNTTyhhZGV2LT5leHRlcm5hbF9yZXZf
aWQpKQ0KPiAgCQkJZndfbmFtZV9kbWN1ID0gRklSTVdBUkVfUkFWRU5fRE1DVTsNCj4gIAkJZWxz
ZSBpZiAoQVNJQ1JFVl9JU19SQVZFTjIoYWRldi0+ZXh0ZXJuYWxfcmV2X2lkKSkNCj4gIAkJCWZ3
X25hbWVfZG1jdSA9IEZJUk1XQVJFX1JBVkVOX0RNQ1U7DQo+ICAJCWVsc2UNCj4gLSNlbmRpZg0K
PiAgCQkJcmV0dXJuIDA7DQo+ICAJCWJyZWFrOw0KPiAgCWRlZmF1bHQ6DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9jbGtfbWdyLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9jbGtfbWdyLmMNCj4gaW5kZXggMDhi
MjdjNzc1Y2Q0Li5lYjIyMDRkNDIzMzcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9jbGtfbWdyL2Nsa19tZ3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY2xrX21nci9jbGtfbWdyLmMNCj4gQEAgLTEwNSwxNCArMTA1LDEwIEBA
IHN0cnVjdCBjbGtfbWdyICpkY19jbGtfbWdyX2NyZWF0ZShzdHJ1Y3QgZGNfY29udGV4dCAqY3R4
LCBzdHJ1Y3QgcHBfc211X2Z1bmNzICpwDQo+ICANCj4gICNpZiBkZWZpbmVkKENPTkZJR19EUk1f
QU1EX0RDX0RDTjFfMCkNCj4gIAljYXNlIEZBTUlMWV9SVjoNCj4gLQ0KPiAtI2lmIGRlZmluZWQo
Q09ORklHX0RSTV9BTURfRENfRENOMV8wMSkNCj4gIAkJaWYgKEFTSUNSRVZfSVNfUkFWRU4yKGFz
aWNfaWQuaHdfaW50ZXJuYWxfcmV2KSkgew0KPiAgCQkJcnYyX2Nsa19tZ3JfY29uc3RydWN0KGN0
eCwgY2xrX21nciwgcHBfc211KTsNCj4gIAkJCWJyZWFrOw0KPiAgCQl9DQo+IC0jZW5kaWYJLyog
RENOMV8wMSAqLw0KPiAtDQo+ICAJCWlmIChBU0lDUkVWX0lTX1JBVkVOKGFzaWNfaWQuaHdfaW50
ZXJuYWxfcmV2KSB8fA0KPiAgCQkJCUFTSUNSRVZfSVNfUElDQVNTTyhhc2ljX2lkLmh3X2ludGVy
bmFsX3JldikpIHsNCj4gIAkJCXJ2MV9jbGtfbWdyX2NvbnN0cnVjdChjdHgsIGNsa19tZ3IsIHBw
X3NtdSk7DQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
