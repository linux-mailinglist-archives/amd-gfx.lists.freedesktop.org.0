Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA2E3CBF7
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Jun 2019 14:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF251890AA;
	Tue, 11 Jun 2019 12:44:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780042.outbound.protection.outlook.com [40.107.78.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583FA890AA
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jun 2019 12:44:13 +0000 (UTC)
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1124.namprd12.prod.outlook.com (10.168.225.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Tue, 11 Jun 2019 12:44:10 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::deb:c3c0:13cb:e332]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::deb:c3c0:13cb:e332%7]) with mapi id 15.20.1987.010; Tue, 11 Jun 2019
 12:44:10 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Add CHIP_VEGAM to amdgpu_amdkfd_device_probe
Thread-Topic: [PATCH] drm/amdgpu: Add CHIP_VEGAM to amdgpu_amdkfd_device_probe
Thread-Index: AQHVIFNdsGzQn5hl9EmhDQJdDRcv2Q==
Date: Tue, 11 Jun 2019 12:44:10 +0000
Message-ID: <20190611124400.13823-1-kent.russell@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTXPR0101CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::15) To BN6PR12MB1618.namprd12.prod.outlook.com
 (2603:10b6:405:b::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17017dd3-916d-43ef-4efe-08d6ee6a8049
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1124; 
x-ms-traffictypediagnostic: BN6PR12MB1124:
x-microsoft-antispam-prvs: <BN6PR12MB112465E07F556107EBDB454685ED0@BN6PR12MB1124.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(136003)(366004)(39860400002)(199004)(189003)(72206003)(7736002)(26005)(6486002)(6436002)(2616005)(2351001)(316002)(14454004)(86362001)(71200400001)(305945005)(186003)(53936002)(71190400001)(68736007)(476003)(50226002)(66476007)(66446008)(66946007)(64756008)(486006)(66556008)(66066001)(8676002)(5640700003)(8936002)(81156014)(81166006)(73956011)(99286004)(1076003)(2906002)(52116002)(256004)(3846002)(478600001)(6512007)(6116002)(36756003)(25786009)(102836004)(6916009)(5660300002)(4326008)(2501003)(6506007)(386003)(4744005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1124;
 H:BN6PR12MB1618.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Equ/hayRmg7rxXbHDb+kZwVjaPyS2UVo7XdnhzSsT0hY2pX0v09yr5BXQ3svHrBvDgdm0A4EPV5bBGX+l2sEC4nTkOkS1PF+kEAeFWh6/MJEKuz/M2lq1MVQpj9ySfDXaa9CkMUig7T23MbxJXDIxpOYXh3F1l4T4QV+r6vYRHiSE/afyOF5XAXm/424hc9NXTOp+DS+LhiWNBP0SCdb4iKr5e8CKLVjjfsLVh4KDcZhERZvwfgCsWOBeoxtovqrFwbg+Cqo0uUJaFk/1s5ZArEXMy5pOzYR/QLEOi0zBvr+S//V9cJcyzS5PAT9AWgnSyR/mbl/P3uMpuDYrvpXn3jy/TBfUgs1UGbl2kP2bDFonQR+7uZKldLwe6wrqSmqxzsmau53TmjEENNMODVVHFT5gMx7BNGtcB4kUggaS7c=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17017dd3-916d-43ef-4efe-08d6ee6a8049
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 12:44:10.9008 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krussell@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1124
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aa2fg1rjTNO5suJrI6j9H7+jRjX6such2C+MiOx1dhI=;
 b=cx3xWJ0NW/eX+glk28cRO9HUgBfITiCEtLpylXyDajKj9dtevHaHzaTuXfhYiFMzyG9SO3J/C7ncKnj5TH/YncoDroEEA3eMasnjzZSEvBtu0ZWPrIHGL0SqtdETaIjBvPsCz2srrB8n6/HrSW7RDyUFzS06A+JhjUESW+xWGHM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kent.Russell@amd.com; 
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
Cc: "Russell, Kent" <Kent.Russell@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2UgaGF2ZSB0aGUgcmVzdCBvZiB0aGUgc3VwcG9ydCBpbiB0aGUga2VybmUsIGJ1dCB3ZSBkb24n
dCBhY3R1YWxseSBib290IEtGRA0Kb24gdGhlIGRldmljZSB3aXRob3V0IHRoaXMgY2hhbmdlDQoN
CkNoYW5nZS1JZDogSWZjYzVjNWUwNThkNzJlMzNhMmYzZjk0NWYyNjliYTZkMjYxM2I3YjANClNp
Z25lZC1vZmYtYnk6IEtlbnQgUnVzc2VsbCA8a2VudC5ydXNzZWxsQGFtZC5jb20+DQotLS0NCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMgfCAxICsNCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9hbWRrZmQuYw0KaW5kZXggNGFmMzk4OWU0YTc1Li5iNzU4MmI5YWExY2QgMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMNCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYw0KQEAgLTc4LDYgKzc4LDcg
QEAgdm9pZCBhbWRncHVfYW1ka2ZkX2RldmljZV9wcm9iZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikNCiAJY2FzZSBDSElQX1BPTEFSSVMxMDoNCiAJY2FzZSBDSElQX1BPTEFSSVMxMToNCiAJ
Y2FzZSBDSElQX1BPTEFSSVMxMjoNCisJY2FzZSBDSElQX1ZFR0FNOg0KIAkJa2ZkMmtnZCA9IGFt
ZGdwdV9hbWRrZmRfZ2Z4XzhfMF9nZXRfZnVuY3Rpb25zKCk7DQogCQlicmVhazsNCiAJY2FzZSBD
SElQX1ZFR0ExMDoNCi0tIA0KMi4xNy4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
