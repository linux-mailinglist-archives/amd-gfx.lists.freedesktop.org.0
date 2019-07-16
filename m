Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A85F6A458
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 10:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B3088F61;
	Tue, 16 Jul 2019 08:56:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720074.outbound.protection.outlook.com [40.107.72.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D13C88F61
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 08:56:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fb0DQmH0FWyOxBMRBIutAWw4J4hqm1mXd/grn+lGnWN6uQo/GCwRyky1IxxGqtGOtH25A9LbSZU7Rk1qaGfxo8Sn3GLxYQ8gb19FmZ5YH3yqUyRKtkojD7znFBmBHA2LcE0QCJS0yk4W9DHqO1U+AmFQXevnT16fyZo9T5uiFcjRULvfM0o+M1p6Lk1MZ4wYWOpCoqB7L7okBv4M2gTH9/pGN8y/7t8MzSXb+MRpBFkddFAXLmE8n90hbqAXAF9T2TrsY6kHNIMS+eeDXwT0JvoLoyDL6QbEmE1T2QFMkuwk8m0rLM/91/2Se8EDa4T3gnVdnJVGe3l15liBQpA7+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqSvMi75DQsYzmUnQvSHGeiANeBvFG1+RUvRkXYZdIs=;
 b=UelgaHDIvfOf6cJ+QSK3PjdNzRvdPkW503fbM0m4c0VgTuzM+VXLVPgKNG9q2g3CxFHK5obKJE4RjeEeHVJyovhmk4eAXzXwMxvbfgyIgNaKzxAX/F/Cnw7H5gMC5KNbPfkLRi26elmeUTHme0HINiE5az7k4WWoX5Yzrh2m3rj+5DozmFrms8HlLcqNPaH3DIDh8Ya3F1AclPcMu8+W6brTF0jZKgkULar3lkKDhWXf/xYeafXatj8CTPE8awEd4ENdUM08fgppELD2SjPZ3FbQg+39DTTkeqGViQWa6o3xJrdC4d1c99YHl7RK5sPYYUpm58bLuMdq5s64gXkRrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB3101.namprd12.prod.outlook.com (20.178.241.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 16 Jul 2019 08:56:15 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 08:56:15 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amd/powerplay: update vega20 driver if to fit
 latest SMU firmware
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: update vega20 driver if to fit
 latest SMU firmware
Thread-Index: AQHVO7Ojsh+A8wcjzEKRXZgKVKZLpqbM8TBg
Date: Tue, 16 Jul 2019 08:56:15 +0000
Message-ID: <MN2PR12MB3598BA3B4A658ABEE2EFF1368ECE0@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <20190716085049.4613-1-evan.quan@amd.com>
 <20190716085049.4613-2-evan.quan@amd.com>
In-Reply-To: <20190716085049.4613-2-evan.quan@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dac1be6c-2484-4c05-01e2-08d709cb75f2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3101; 
x-ms-traffictypediagnostic: MN2PR12MB3101:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3101340146D53D4CFFE866898ECE0@MN2PR12MB3101.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(13464003)(199004)(189003)(76176011)(6506007)(53546011)(4326008)(66066001)(52536014)(15650500001)(6436002)(86362001)(7696005)(2501003)(486006)(102836004)(71200400001)(99286004)(25786009)(55016002)(7736002)(5660300002)(76116006)(2906002)(6306002)(68736007)(66946007)(476003)(71190400001)(66446008)(64756008)(478600001)(66476007)(66556008)(229853002)(305945005)(14454004)(11346002)(446003)(53936002)(110136005)(33656002)(26005)(6116002)(54906003)(74316002)(966005)(3846002)(316002)(81156014)(6246003)(9686003)(81166006)(14444005)(256004)(8936002)(186003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3101;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1ACcfPtdzKPf1tpHamYSzFlaevshVLzcWB5eIMTaWL6iIE6s2IKP8PbgZDceQo9DoWzi24LYl2PnJOGS1KSdoile24SLtk6JN2f0mMdDdFHJ6ViemwYuqSW/+ZLcXZizOpg3NbZ2UbGFDuMlV0UBm4P4mkUbHLouMkjP4tjOjzSXs5V65a1VSyji78S9p7UM28A/ZzJumzsW9pGH04hJiDOM35g7P7ulJTWZTwlZqAdyctR7j/+5/aMtzGWF5QatLGCJGwWfKIBaVpNyDV0W4Lc+T6RbkcOoSthl2uogk0U1pxR/px3kBMnc4NMYEpIflb0ubi/x+WJv3k8cWiYZiOCoKfttc3gbxPrrFOlQST0lu5rNd5qIBZ9/EWqqBWbp1XVFqaZ478mHR+sE//ICtIDi0/TTmmzj0rvoFc9e+qk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dac1be6c-2484-4c05-01e2-08d709cb75f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 08:56:15.5811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyfeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3101
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqSvMi75DQsYzmUnQvSHGeiANeBvFG1+RUvRkXYZdIs=;
 b=tew/4tQ6miLxWMjCtAHnO8F8brzMNPq7jc9RqPF6+3CiehxHo/xxNBJuBlOw5Px3uwx30avLYNzLGsUaec02OEDxhmh506OtWeuIiDNthEWfQCqgslmWbqWRQmRzXgPCD7en4FIKxm5xvv3I7xV9knfFuagv13cmic4rG2xfTPo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kenneth.Feng@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+DQoNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggW21haWx0bzphbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbiBCZWhhbGYgT2YgRXZhbiBRdWFuDQpTZW50
OiBUdWVzZGF5LCBKdWx5IDE2LCAyMDE5IDQ6NTEgUE0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1k
LmNvbT47IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIDIv
Ml0gZHJtL2FtZC9wb3dlcnBsYXk6IHVwZGF0ZSB2ZWdhMjAgZHJpdmVyIGlmIHRvIGZpdCBsYXRl
c3QgU01VIGZpcm13YXJlDQoNCltDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCg0KT3B0aW1pemF0
aW9uIGZvciB0aGUgc29ja2V0IHBvd2VyIGNhbGN1bGF0aW9uIGlzIGludHJvZHVjZWQuDQoNCkNo
YW5nZS1JZDogSWNjOGE2ODczNTdiYTQ2YWUxZDE5OWQ4OWNiMjAwMGM2MWI0ZGU3MDMNClNpZ25l
ZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJpdmVyX2lmLmggfCA2ICsrKystLQ0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJpdmVyX2lmLmgg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJpdmVyX2lmLmgNCmlu
ZGV4IDE5NWM0YWU2NzA1OC4uNzU1ZDUxZjljNmE5IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdTExX2RyaXZlcl9pZi5oDQorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211MTFfZHJpdmVyX2lmLmgNCkBAIC0yNyw3ICsyNyw3
IEBADQogLy8gKioqIElNUE9SVEFOVCAqKioNCiAvLyBTTVUgVEVBTTogQWx3YXlzIGluY3JlbWVu
dCB0aGUgaW50ZXJmYWNlIHZlcnNpb24gaWYgIC8vIGFueSBzdHJ1Y3R1cmUgaXMgY2hhbmdlZCBp
biB0aGlzIGZpbGUgLSNkZWZpbmUgU01VMTFfRFJJVkVSX0lGX1ZFUlNJT04gMHgxMg0KKyNkZWZp
bmUgU01VMTFfRFJJVkVSX0lGX1ZFUlNJT04gMHgxMw0KDQogI2RlZmluZSBQUFRBQkxFX1YyMF9T
TVVfVkVSU0lPTiAzDQoNCkBAIC02MTUsNiArNjE1LDcgQEAgdHlwZWRlZiBzdHJ1Y3Qgew0KICAg
dWludDE2X3QgICAgIFVjbGtBdmVyYWdlTHBmVGF1Ow0KICAgdWludDE2X3QgICAgIEdmeEFjdGl2
aXR5THBmVGF1Ow0KICAgdWludDE2X3QgICAgIFVjbGtBY3Rpdml0eUxwZlRhdTsNCisgIHVpbnQx
Nl90ICAgICBTb2NrZXRQb3dlckxwZlRhdTsNCg0KDQogICB1aW50MzJfdCAgICAgTW1IdWJQYWRk
aW5nWzhdOw0KQEAgLTY2NSw3ICs2NjYsOCBAQCB0eXBlZGVmIHN0cnVjdCB7DQogICB1aW50MzJf
dCBUaHJvdHRsZXJTdGF0dXMgICAgICAgOw0KDQogICB1aW50OF90ICBMaW5rRHBtTGV2ZWw7DQot
ICB1aW50OF90ICBQYWRkaW5nWzNdOw0KKyAgdWludDE2X3QgQXZlcmFnZVNvY2tldFBvd2VyOw0K
KyAgdWludDhfdCAgUGFkZGluZzsNCg0KDQogICB1aW50MzJfdCAgICAgTW1IdWJQYWRkaW5nWzdd
Ow0KLS0NCjIuMjEuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
