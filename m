Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94815E4209
	for <lists+amd-gfx@lfdr.de>; Fri, 25 Oct 2019 05:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54876E888;
	Fri, 25 Oct 2019 03:20:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710088.outbound.protection.outlook.com [40.107.71.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6EB6E888
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Oct 2019 03:20:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwmZmV5AWNbgAElHvF1o4mdbFtZabEkAtJZPY+DxzEee+30jB1JIi/MMyScG22Pw2/yZNofz/z9n7vJWWd815j8VMg/gMJmrwtsus6+ZhC0VtCUSqiWp2gTHGcDzY9rJY2TM3+pbnPHtuIux5vbEL0/4gjLcSXquAu2r60ObwqXkNZTUINbxh1q8+B10TuHeqtwbm6IskpmIISJUAlbK8Fd3RHXF5Be51uletD7IaaY/wxAI2t8N81qS8YzvQb3FJ+R2e17/VG84/vRwalV7z8qK3F07Q9alOuInmnkIq7NggWM5OigwOBq/ZNhVYMZN8vX5PV+phs7WhfDU+Ti1wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Um22yUWLDeuTptIBjdUm80TRTi07JGZHImgC1cCKUn0=;
 b=KT8Okf4NnMvvaWtsyBYVkbg6tX5Ue/wR6yB/9LXcyFuvVpfU3PX+3zuf44eDHq1m5wQsYERUTAZeV3+CV5MFXqBrA4Kt8YreIguHWc8nOKZJkX3coEIlGhWIap0Wif8X/NhMtezoettbJHLzPVSoNKPbYPn711VO5RN7tUEVn8AA7iigUCSkalQqq8xstJD89z94CrS85JfIjlqb1WVv2ZLH4HGyauKAkGoq29AcPAzFTnqRCwS/sUg1V2TG4k+xHz0pW6JSIW+d5EpU7nE2WePT75xy63LCaeLPDw6XSTxXRIUXNDObj8EuAyz553/22RH7yF0m8fxGijSAo4pJrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2896.namprd12.prod.outlook.com (20.179.80.214) by
 MN2PR12MB3759.namprd12.prod.outlook.com (10.255.236.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Fri, 25 Oct 2019 03:20:21 +0000
Received: from MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::9973:de2e:58b4:282a]) by MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::9973:de2e:58b4:282a%7]) with mapi id 15.20.2387.023; Fri, 25 Oct 2019
 03:20:21 +0000
From: "Zhu, Changfeng" <Changfeng.Zhu@amd.com>
To: "Tuikov, Luben" <Luben.Tuikov@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: GFX9, GFX10: GRBM requires 1-cycle delay
Thread-Topic: [PATCH] drm/amdgpu: GFX9, GFX10: GRBM requires 1-cycle delay
Thread-Index: AQHVirBdkQ0XOg6j30Ko4PUIPpXYhqdqrVww
Date: Fri, 25 Oct 2019 03:20:21 +0000
Message-ID: <MN2PR12MB2896868B3B299F4757AABD4FFD650@MN2PR12MB2896.namprd12.prod.outlook.com>
References: <20191024211430.25399-1-luben.tuikov@amd.com>
In-Reply-To: <20191024211430.25399-1-luben.tuikov@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c8dc0cb5-f207-4da7-771c-08d758fa44cd
x-ms-traffictypediagnostic: MN2PR12MB3759:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB375926AA16036747799F1684FD650@MN2PR12MB3759.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:510;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(13464003)(189003)(199004)(11346002)(54906003)(53546011)(14444005)(71190400001)(110136005)(71200400001)(186003)(305945005)(74316002)(316002)(966005)(476003)(2906002)(76176011)(102836004)(446003)(2501003)(478600001)(7736002)(486006)(14454004)(66946007)(66476007)(64756008)(66556008)(33656002)(76116006)(26005)(66446008)(7696005)(99286004)(256004)(229853002)(3846002)(6116002)(52536014)(81166006)(5660300002)(6436002)(6306002)(81156014)(9686003)(6246003)(4326008)(86362001)(55016002)(25786009)(8936002)(8676002)(6506007)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3759;
 H:MN2PR12MB2896.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2ruq0N42SmUAjCpQ4tEy1VPtKfefSnXXWpov7G08QMH99VAB/WYuVzPCsHqR5zW+cqZ7F1IgkwAffgmEYiSQIwNjzlD1yYC2ZQwDvRYj5nN87QAl84KWuJf/uCEDZy5CTJHc0tve4mGtFKLi2i8WtDt/P1uxX85ijP3KXuWPdqCweddYNpF3Y+BsSpuy9ABxueZSb8kNZHc70KQSbKtd5D+nxzW71pcHpaBhzmsFOpgyFvQ7gjWYNtyI/hLErr5mK13vLIoeEdYJEWypZQyJgXPXEgeM+S6DB/G1U2xneZDh1e38kkBv8MPvWiF33+41kKdJl8bJL7huG0SHGxKg+Z4z1GHbSLCGetj4F34C09BNyWkk8zKs35TdOn2/djdXYPSCCptD/agDos+bKHVK3wj6BRiefdSelTSucYccvvCVqltnw9Rf/qpb9EOst02Mw3GpTbIjkUWbKjdv0bC2+FvQsVer1F/aM5fwlD7smsw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8dc0cb5-f207-4da7-771c-08d758fa44cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 03:20:21.4339 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K1lmMbAa23YeLVGZam3rBB4OF4MNdxuS9nnKAyZxSiueapt/QGFfV4XDnQIrNFYCmZVSFNPes/ZtkPahvp5KQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3759
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Um22yUWLDeuTptIBjdUm80TRTi07JGZHImgC1cCKUn0=;
 b=j7H33osGTAqdjCUWSfCs+JiD8TQLO07sr71LTozEgWb9tImhjdycX9omkZ3n9tklEv6smV49FrpbMn7yimxGB2Ckm580bDcGKSjkl2DPhVHwjnKh5hy0qIQbx+0KHEoM53mphRbr+2I+5Y2QdMnE/35vQPq8VqKRMaRZ/P4WSJc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Changfeng.Zhu@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Pelloux-prayer,
 Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW5saW5lLg0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxh
bWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVHVpa292
LCBMdWJlbg0KU2VudDogRnJpZGF5LCBPY3RvYmVyIDI1LCAyMDE5IDU6MTcgQU0NClRvOiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFu
ZGVyLkRldWNoZXJAYW1kLmNvbT47IFBlbGxvdXgtcHJheWVyLCBQaWVycmUtZXJpYyA8UGllcnJl
LWVyaWMuUGVsbG91eC1wcmF5ZXJAYW1kLmNvbT47IFR1aWtvdiwgTHViZW4gPEx1YmVuLlR1aWtv
dkBhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4N
ClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdTogR0ZYOSwgR0ZYMTA6IEdSQk0gcmVxdWlyZXMg
MS1jeWNsZSBkZWxheQ0KDQpUaGUgR1JCTSBpbnRlcmZhY2UgaXMgbm93IGNhcGFibGUgb2YgYnVy
c3RpbmcgMS1jeWNsZSBvcCBwZXIgcmVnaXN0ZXIsIGEgV1JJVEUgZm9sbG93ZWQgYnkgYW5vdGhl
ciBXUklURSwgb3IgYSBXUklURSBmb2xsb3dlZCBieSBhIFJFQUQtLW11Y2ggZmFzdGVyIHRoYW4g
cHJldmlvdXMgbXV0aS1jeWNsZSBwZXIgY29tcGxldGVkLXRyYW5zYWN0aW9uIGludGVyZmFjZS4g
VGhpcyBjYXVzZXMgYSBwcm9ibGVtLCB3aGVyZWJ5IHN0YXR1cyByZWdpc3RlcnMgcmVxdWlyaW5n
IGEgcmVhZC93cml0ZSBieSBoYXJkd2FyZSwgaGF2ZSBhIDEtY3ljbGUgZGVsYXksIGR1ZSB0byB0
aGUgcmVnaXN0ZXIgdXBkYXRlIGhhdmluZyB0byBnbyB0aHJvdWdoIEdSQk0gaW50ZXJmYWNlLg0K
DQpUaGlzIHBhdGNoIGFkZHMgdGhpcyBkZWxheS4NCg0KQSBvbmUgY3ljbGUgcmVhZCBvcCBpcyBh
ZGRlZCBhZnRlciB1cGRhdGluZyB0aGUgaW52YWxpZGF0ZSByZXF1ZXN0IGFuZCBiZWZvcmUgcmVh
ZGluZyB0aGUgaW52YWxpZGF0ZS1BQ0sgc3RhdHVzLg0KDQpTZWUgYWxzbyBjb21taXQNCjUzNDk5
MTczMWNiNWZhOTRiNTUxOTk1NzY0NmNmODQ5Y2ExMGQxN2QuDQoNClNpZ25lZC1vZmYtYnk6IEx1
YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjEwXzAuYyB8IDQgKystLSAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y5XzAuYyAgfCA0ICsrLS0gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192
MTBfMC5jIHwgOSArKysrKysrKysgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMgIHwgOCArKysrKysrKyAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMg
fCAyICstDQogNSBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYw0KaW5kZXggYWM0M2IxYWY2
OWUzLi4wMDQyODY4ZGJkNTMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjEwXzAuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8w
LmMNCkBAIC01MTI5LDcgKzUxMjksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9yaW5n
X2Z1bmNzIGdmeF92MTBfMF9yaW5nX2Z1bmNzX2dmeCA9IHsNCiAJCTUgKyAvKiBDT05EX0VYRUMg
Ki8NCiAJCTcgKyAvKiBQSVBFTElORV9TWU5DICovDQogCQlTT0MxNV9GTFVTSF9HUFVfVExCX05V
TV9XUkVHICogNSArDQotCQlTT0MxNV9GTFVTSF9HUFVfVExCX05VTV9SRUdfV0FJVCAqIDcgKw0K
KwkJU09DMTVfRkxVU0hfR1BVX1RMQl9OVU1fUkVHX1dBSVQgKiA3ICogMiArDQogCQkyICsgLyog
Vk1fRkxVU0ggKi8NCiAJCTggKyAvKiBGRU5DRSBmb3IgVk1fRkxVU0ggKi8NCiAJCTIwICsgLyog
R0RTIHN3aXRjaCAqLw0KQEAgLTUxODIsNyArNTE4Miw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
YW1kZ3B1X3JpbmdfZnVuY3MgZ2Z4X3YxMF8wX3JpbmdfZnVuY3NfY29tcHV0ZSA9IHsNCiAJCTUg
KyAvKiBoZHAgaW52YWxpZGF0ZSAqLw0KIAkJNyArIC8qIGdmeF92MTBfMF9yaW5nX2VtaXRfcGlw
ZWxpbmVfc3luYyAqLw0KIAkJU09DMTVfRkxVU0hfR1BVX1RMQl9OVU1fV1JFRyAqIDUgKw0KLQkJ
U09DMTVfRkxVU0hfR1BVX1RMQl9OVU1fUkVHX1dBSVQgKiA3ICsNCisJCVNPQzE1X0ZMVVNIX0dQ
VV9UTEJfTlVNX1JFR19XQUlUICogNyAqIDIgKw0KIAkJMiArIC8qIGdmeF92MTBfMF9yaW5nX2Vt
aXRfdm1fZmx1c2ggKi8NCiAJCTggKyA4ICsgOCwgLyogZ2Z4X3YxMF8wX3JpbmdfZW1pdF9mZW5j
ZSB4MyBmb3IgdXNlciBmZW5jZSwgdm0gZmVuY2UgKi8NCiAJLmVtaXRfaWJfc2l6ZSA9CTcsIC8q
IGdmeF92MTBfMF9yaW5nX2VtaXRfaWJfY29tcHV0ZSAqLw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjlfMC5jDQppbmRleCA5ZmU5NWU3NjkzZDUuLjlhN2E3MTcyMDhkZSAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCkBAIC02MjE4LDcgKzYyMTgsNyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9yaW5nX2Z1bmNzIGdmeF92OV8wX3JpbmdfZnVuY3NfZ2Z4
ID0gew0KIAkJNSArICAvKiBDT05EX0VYRUMgKi8NCiAJCTcgKyAgLyogUElQRUxJTkVfU1lOQyAq
Lw0KIAkJU09DMTVfRkxVU0hfR1BVX1RMQl9OVU1fV1JFRyAqIDUgKw0KLQkJU09DMTVfRkxVU0hf
R1BVX1RMQl9OVU1fUkVHX1dBSVQgKiA3ICsNCisJCVNPQzE1X0ZMVVNIX0dQVV9UTEJfTlVNX1JF
R19XQUlUICogNyAqIDIgKw0KIAkJMiArIC8qIFZNX0ZMVVNIICovDQogCQk4ICsgIC8qIEZFTkNF
IGZvciBWTV9GTFVTSCAqLw0KIAkJMjAgKyAvKiBHRFMgc3dpdGNoICovDQpAQCAtNjI3MSw3ICs2
MjcxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfcmluZ19mdW5jcyBnZnhfdjlfMF9y
aW5nX2Z1bmNzX2NvbXB1dGUgPSB7DQogCQk1ICsgLyogaGRwIGludmFsaWRhdGUgKi8NCiAJCTcg
KyAvKiBnZnhfdjlfMF9yaW5nX2VtaXRfcGlwZWxpbmVfc3luYyAqLw0KIAkJU09DMTVfRkxVU0hf
R1BVX1RMQl9OVU1fV1JFRyAqIDUgKw0KLQkJU09DMTVfRkxVU0hfR1BVX1RMQl9OVU1fUkVHX1dB
SVQgKiA3ICsNCisJCVNPQzE1X0ZMVVNIX0dQVV9UTEJfTlVNX1JFR19XQUlUICogNyAqIDIgKw0K
IAkJMiArIC8qIGdmeF92OV8wX3JpbmdfZW1pdF92bV9mbHVzaCAqLw0KIAkJOCArIDggKyA4LCAv
KiBnZnhfdjlfMF9yaW5nX2VtaXRfZmVuY2UgeDMgZm9yIHVzZXIgZmVuY2UsIHZtIGZlbmNlICov
DQogCS5lbWl0X2liX3NpemUgPQk3LCAvKiBnZnhfdjlfMF9yaW5nX2VtaXRfaWJfY29tcHV0ZSAq
Lw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMNCmluZGV4IDZlMWIyNWJkMWZl
Ny4uMTAwZDUyNmU5YTQyIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z21jX3YxMF8wLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5j
DQpAQCAtMzQ2LDYgKzM0NiwxNSBAQCBzdGF0aWMgdWludDY0X3QgZ21jX3YxMF8wX2VtaXRfZmx1
c2hfZ3B1X3RsYihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsDQogDQogCWFtZGdwdV9yaW5nX2Vt
aXRfd3JlZyhyaW5nLCBodWItPnZtX2ludl9lbmcwX3JlcSArIGVuZywgcmVxKTsNCiANCisJLyog
SW5zZXJ0IGEgZHVtbXkgcmVhZCB0byBkZWxheSBvbmUgY3ljbGUgYmVmb3JlIHRoZSBBQ0sNCisJ
ICogaW5xdWlyeS4NCisJICovDQorCWlmIChyaW5nLT5mdW5jcy0+dHlwZSA9PSBBTURHUFVfUklO
R19UWVBFX1NETUEgfHwNCisJICAgIHJpbmctPmZ1bmNzLT50eXBlID09IEFNREdQVV9SSU5HX1RZ
UEVfR0ZYICB8fA0KKwkgICAgcmluZy0+ZnVuY3MtPnR5cGUgPT0gQU1ER1BVX1JJTkdfVFlQRV9D
T01QVVRFKQ0KKwkJYW1kZ3B1X3JpbmdfZW1pdF9yZWdfd2FpdChyaW5nLA0KKwkJCQkJICBodWIt
PnZtX2ludl9lbmcwX3JlcSArIGVuZywgMCwgMCk7DQorDQogCS8qIHdhaXQgZm9yIHRoZSBpbnZh
bGlkYXRlIHRvIGNvbXBsZXRlICovDQogCWFtZGdwdV9yaW5nX2VtaXRfcmVnX3dhaXQocmluZywg
aHViLT52bV9pbnZfZW5nMF9hY2sgKyBlbmcsDQogCQkJCSAgMSA8PCB2bWlkLCAxIDw8IHZtaWQp
Ow0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jDQppbmRleCA5ZjJhODkzODcxZWMu
LjhmMzA5N2U0NTI5OSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dt
Y192OV8wLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCkBA
IC00OTUsNiArNDk1LDE0IEBAIHN0YXRpYyB1aW50NjRfdCBnbWNfdjlfMF9lbWl0X2ZsdXNoX2dw
dV90bGIoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLA0KIAlhbWRncHVfcmluZ19lbWl0X3dyZWco
cmluZywgaHViLT5jdHgwX3B0Yl9hZGRyX2hpMzIgKyAoMiAqIHZtaWQpLA0KIAkJCSAgICAgIHVw
cGVyXzMyX2JpdHMocGRfYWRkcikpOw0KIA0KKwkvKiBJbnNlcnQgYSBkdW1teSByZWFkIHRvIGRl
bGF5IG9uZSBjeWNsZSBiZWZvcmUgdGhlIEFDSw0KKwkgKiBpbnF1aXJ5Lg0KKwkgKi8NCisJaWYg
KHJpbmctPmZ1bmNzLT50eXBlID09IEFNREdQVV9SSU5HX1RZUEVfR0ZYICB8fA0KKwkgICAgcmlu
Zy0+ZnVuY3MtPnR5cGUgPT0gQU1ER1BVX1JJTkdfVFlQRV9DT01QVVRFKQ0KKwkJYW1kZ3B1X3Jp
bmdfZW1pdF9yZWdfd2FpdChyaW5nLA0KKwkJCQkJICBodWItPnZtX2ludl9lbmcwX3JlcSArIGVu
ZywgMCwgMCk7DQorDQoNCg0KCVdoeSBkbyB3ZSBhZGQgYW1kZ3B1X3JpbmdfZW1pdF9yZWdfd2Fp
dCBoZXJlPyBUaGVyZSBpcyBubyBhbWRncHVfcmluZ19lbWl0X3dyZWcocmluZywgaHViLT52bV9p
bnZfZW5nMF9yZXEgKyBlbmcsIHJlcSk7IGJlZm9yZSBpdCBsaWtlIGdtYzEwLg0KCUluIGdtYzks
YW1kZ3B1X3JpbmdfZW1pdF93cmVnICBhbmQgYW1kZ3B1X3JpbmdfZW1pdF9yZWdfd2FpdCAgYXJl
IGNhbGxlZCBpbiBhbWRncHVfcmluZ19lbWl0X3JlZ193cml0ZV9yZWdfd2FpdC4NCglJIHRoaW5r
IGl0IG1heSBiZSBtb3JlIHJlYXNvbmFibGUgdG8gYWRkIGR1bW15IGFtZGdwdV9yaW5nX2VtaXRf
cmVnX3dhaXQgaW4gYW1kZ3B1X3JpbmdfZW1pdF9yZWdfd3JpdGVfcmVnX3dhaXQuDQoJQmVzaWRl
cywgd2Ugc2hvdWxkIGFsc28gdGhpbmsgYWJvdXQgdGhlIGluZmx1ZW5jZSBvZiBTUk9WJ3MgcGF0
Y2g6DQoJZHJtL2FtZGdwdTogUmVtb3ZlIHRoZSBzcmlvdiBjaGVja2luZyBhbmQgYWRkIGZpcm13
YXJlIGNoZWNraW5nDQoNCg0KDQogCWFtZGdwdV9yaW5nX2VtaXRfcmVnX3dyaXRlX3JlZ193YWl0
KHJpbmcsIGh1Yi0+dm1faW52X2VuZzBfcmVxICsgZW5nLA0KIAkJCQkJICAgIGh1Yi0+dm1faW52
X2VuZzBfYWNrICsgZW5nLA0KIAkJCQkJICAgIHJlcSwgMSA8PCB2bWlkKTsNCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jDQppbmRleCBiOGZkYjE5MmY2ZDYuLjBjNDFiNGZkYzU4
YiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jDQor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYw0KQEAgLTE1ODgsNyAr
MTU4OCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3JpbmdfZnVuY3Mgc2RtYV92NV8w
X3JpbmdfZnVuY3MgPSB7DQogCQk2ICsgLyogc2RtYV92NV8wX3JpbmdfZW1pdF9waXBlbGluZV9z
eW5jICovDQogCQkvKiBzZG1hX3Y1XzBfcmluZ19lbWl0X3ZtX2ZsdXNoICovDQogCQlTT0MxNV9G
TFVTSF9HUFVfVExCX05VTV9XUkVHICogMyArDQotCQlTT0MxNV9GTFVTSF9HUFVfVExCX05VTV9S
RUdfV0FJVCAqIDYgKw0KKwkJU09DMTVfRkxVU0hfR1BVX1RMQl9OVU1fUkVHX1dBSVQgKiA2ICog
MiArDQogCQkxMCArIDEwICsgMTAsIC8qIHNkbWFfdjVfMF9yaW5nX2VtaXRfZmVuY2UgeDMgZm9y
IHVzZXIgZmVuY2UsIHZtIGZlbmNlICovDQogCS5lbWl0X2liX3NpemUgPSA3ICsgNiwgLyogc2Rt
YV92NV8wX3JpbmdfZW1pdF9pYiAqLw0KIAkuZW1pdF9pYiA9IHNkbWFfdjVfMF9yaW5nX2VtaXRf
aWIsDQotLQ0KMi4yMy4wLjM4NS5nYmMxMjk3NGE4OQ0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
