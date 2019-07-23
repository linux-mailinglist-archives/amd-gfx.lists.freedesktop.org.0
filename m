Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C23172049
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 22:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3646E3AC;
	Tue, 23 Jul 2019 20:00:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720040.outbound.protection.outlook.com [40.107.72.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A356E3AC
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 20:00:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMrW9gAtNJc6ySO2+9hlnmbO6WuBM5U5SyMrwXAX6HLAMM623l//dHn7/1Q+jrU8b4IRbiYsJpAMXHsS+qGvmut9FstczK8bnXAC7Wqj6BTl0hccwvfQ6CHAl6ILZV4QzdmSmi8jC3diVyNMpVZHEGK4xn7eMyC36+LgC3XAc5DaR7Z3uUewMA2d3fGAXkdumMWibvbNWs4ZHL+75t08xAh/oT50lGFN0AS+COtjH/UOJLRngNtLxmdSLy2BuYEIodYTOQwWXct1YeI/z/9c0x4baoElaqPmZcP2lgxwtvwdL2CfARAJfj1d+LNJkdrq9LF9GgxITLvSVBtAY/XMgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CALiMJqpEIzdR9B6JXbRNGcLKGFSumP1bOSba7JTu0Y=;
 b=PoEwR0YEFAIkihYW/8b3fQsIjciPiM3q6eUxZXDQWVovXcau4VvmtKSD7WDCbr19gv/vP6M1yYVPAp+C9lL6Czx0kQt6YCpH6aIt10zRB74QWLxNOkf8rQIfkWX83BtHP0VdCmWnjP0nXR0RhdPTZ13l10zpLGNO/nqgzJbhQF4RsSiwP7oXArS/TPfBWwNlyykbspJZvZ/64OxVk1sUQ471o0YC64U7WGyVtXMr/Ul35ytBiXXrocNeXc2F9GG8OvzqQ62rr8vQ0jW1txgZayaRjOeDTqpbKSE5BjhK1mF54hZwkhs6e04Xwn9doKm7JxdZ8wefzhIeKF1rZeK9ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1613.namprd12.prod.outlook.com (10.172.56.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Tue, 23 Jul 2019 20:00:55 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::59df:2c5b:b1e2:8845]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::59df:2c5b:b1e2:8845%3]) with mapi id 15.20.2094.017; Tue, 23 Jul 2019
 20:00:55 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/amdgpu/powerplay/vega12: call PrepareMp1ForUnload
 in power_off_asic
Thread-Topic: [PATCH 3/3] drm/amdgpu/powerplay/vega12: call
 PrepareMp1ForUnload in power_off_asic
Thread-Index: AQHVQXg4Blu55Ae6xUGTOuwkpifG4qbYn7mA
Date: Tue, 23 Jul 2019 20:00:55 +0000
Message-ID: <bda866af-42f0-d40d-baf3-ffbfcb2867e2@amd.com>
References: <20190723170049.9143-1-alexander.deucher@amd.com>
 <20190723170049.9143-3-alexander.deucher@amd.com>
In-Reply-To: <20190723170049.9143-3-alexander.deucher@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::18) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: baee8391-d484-4dae-52f6-08d70fa878c1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR12MB1613; 
x-ms-traffictypediagnostic: MWHPR12MB1613:
x-microsoft-antispam-prvs: <MWHPR12MB1613B737B76033134A392716EAC70@MWHPR12MB1613.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(189003)(199004)(66556008)(6436002)(6512007)(66476007)(102836004)(66446008)(66946007)(64756008)(31686004)(5660300002)(6506007)(186003)(2906002)(99286004)(6486002)(25786009)(229853002)(76176011)(14454004)(486006)(4326008)(386003)(53936002)(52116002)(478600001)(6246003)(11346002)(6116002)(8936002)(3846002)(305945005)(31696002)(256004)(36756003)(8676002)(71200400001)(4744005)(2501003)(316002)(66066001)(71190400001)(7736002)(476003)(446003)(81166006)(81156014)(86362001)(2616005)(53546011)(68736007)(110136005)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1613;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 50404Mhg6hgn2az+Z4L09JhN8KLLG7aSoG45b3RZbdwWkz2dlPtzfVpTm8RyGFDc178JPb94QhVAmrgHpvWNl872J/UU8Ev79alYwYnP7saCeQ65P5efq896LkpmcKx+fsQgJLZQ/nGQ4dE0vqK0Nhxo8zxYck5WX5i/ewqR2rhjSYc+gIQIb2AcG/r81/6Ccn6Qguv+Y1bPPtyi7aLEMQXS0pftrOuNM+2xjChPc96DY84EY4VUdSdTyBxOYYO/gyFQoxgW58iyaEeScqVDYqRBSfTavGvndw6eHvVPcKN9F2tvW7arNHoWkJ1wsILvfPKxQhmn/CsFv6SET/6cq1byai/OFYW5kQKfqSmRKZvDQ+eLt7kHnLz/ksbjydWg5ZlgkdARirubi1wQ4fxprtet0epIoNJeNHUyKb5B6gM=
Content-ID: <0B24ECD02447374BB162BF00500A30E9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baee8391-d484-4dae-52f6-08d70fa878c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 20:00:55.4875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agrodzov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1613
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CALiMJqpEIzdR9B6JXbRNGcLKGFSumP1bOSba7JTu0Y=;
 b=w8iWYqA8a/Y1exZYWoyZACA7WPCvyJF3mZGmuCy7d257G81q2xM27KNCKw5xxhxnz9nAt2Da48zjhJDaeFaWMVxmp8OZ1uOwmlRUzZxqI8H9ySQc3nNdM/RyNScZcEH6wk+2yrbGp9qojzQTi3/GffrJwYS9qgOR/Vl+7zg65xM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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

U2VyaWVzIGlzIEFja2VkLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lA
YW1kLmNvbT4NCg0KQW5kcmV5DQoNCk9uIDcvMjMvMTkgMTowMCBQTSwgQWxleCBEZXVjaGVyIHdy
b3RlOg0KPiBOZWVkZWQgdG8gbWFrZSBzdXJlIHRoZSBzbXUgaXMgaWRsZSB3aGVuIHJlc2V0dGlu
Zy4gVGhpcyBtYXkgZml4DQo+IHNwb3JhdGljIGZhaWx1cmVzIHdpdGggR1BVIHJlc2V0Lg0KPg0K
PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMl9o
d21nci5jIHwgNSArKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4N
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2Ex
Ml9od21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEyX2h3
bWdyLmMNCj4gaW5kZXggZWZiNmQzNzYyZmViLi4zZDM1MDQ0MTFiNjMgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMl9od21nci5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMl9od21nci5jDQo+
IEBAIC0yNDY4LDYgKzI0NjgsMTEgQEAgc3RhdGljIGludCB2ZWdhMTJfcG93ZXJfb2ZmX2FzaWMo
c3RydWN0IHBwX2h3bWdyICpod21ncikNCj4gICAJCQkpOw0KPiAgIAlkYXRhLT53YXRlcl9tYXJr
c19iaXRtYXAgJj0gfihXYXRlck1hcmtzTG9hZGVkKTsNCj4gICANCj4gKwlQUF9BU1NFUlRfV0lU
SF9DT0RFKChyZXN1bHQgPSBzbXVtX3NlbmRfbXNnX3RvX3NtYyhod21nciwNCj4gKwkJCVBQU01D
X01TR19QcmVwYXJlTXAxRm9yVW5sb2FkKSkgPT0gMCwNCj4gKwkJCSJbUHJlcGFyZU1wMUZvclVu
bG9hZF0gRmFpbGVkISIsDQo+ICsJCQlyZXR1cm4gcmVzdWx0KTsNCj4gKw0KPiAgIAlyZXR1cm4g
cmVzdWx0Ow0KPiAgIH0NCj4gICANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
