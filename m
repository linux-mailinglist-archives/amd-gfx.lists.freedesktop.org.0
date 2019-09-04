Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2861A862F
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 17:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7FC89C09;
	Wed,  4 Sep 2019 15:48:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810042.outbound.protection.outlook.com [40.107.81.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E1B89BFF
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 15:48:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OaceGK6MsZn5NpU6YwQvNBYrvUNwGsxBjsmzO/DkwRWzEHphC8ctIBtJCmDJ3QC868N0eU7RzJicFkpnG49ChAfSf0PHigL4+qxoggiQmBi6/oPUze5g3aLfSBN6UaRdnJ2PdFZnv28WFdLXjCe3njX51tdRCc7e/AUF4v1OCHrB622W5yGO4wQMI45e68Ve7XCFT/6Y43vtkwaLuQw+ytx4eBmXQUGIQ46VwfHVQytMSK3i5xWLWiXYLU6P1hZGXx2/UYcKMP75bCkOfgeRao+/RGN9Ttg9XaFl8VXTuDT4lwOwzUzzYn70DXKdqjS0kKn4yIknHtsT4j6bYMP55A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxCfvQXhJYNGk9iDqLa4gnctxh1abW5xF0tDdhgN83g=;
 b=ImLaQmWaNseJ8YAu3b40AaBJ4iAod7AadrV//BQsd9V/apSN1wCcqpIUSz0RiFc20izsbRvTg28CDxhOPZayQC9RMwV1Ydw73miNSTOad3J82fpOAkg6xGKUTQnO6tNcbnAImywviPGD6co3dRC+yHji6Cqw9f85CLJ3N+r3hDKZxjn0111mG6VB4jhWDQ1Azs8sRgzKVFDnTASZaNtiDtF/q6Hl1xp2r30tG/eShlPJHjH5F4oxGZ5SC2MiEWg0fv2D0KanlRM4f7CnnppwyB2cT0Bp7Arm4N4YtYQB3fSK8TOxGF3+fdsdO3BXpR7uWUCGe9rRkUZi4/NTdMFp7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB2863.namprd12.prod.outlook.com (20.179.82.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Wed, 4 Sep 2019 15:48:32 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 15:48:32 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 09/10] drm/amdgpu: disable gfxoff while use no H/W scheduling
 policy
Thread-Topic: [PATCH 09/10] drm/amdgpu: disable gfxoff while use no H/W
 scheduling policy
Thread-Index: AQHVYzg0dnVdE8DOaEiPepsELj7GlQ==
Date: Wed, 4 Sep 2019 15:48:32 +0000
Message-ID: <20190904154803.5102-10-ray.huang@amd.com>
References: <20190904154803.5102-1-ray.huang@amd.com>
In-Reply-To: <20190904154803.5102-1-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::34) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40c55aa0-bb3e-4910-1371-08d7314f5686
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2863; 
x-ms-traffictypediagnostic: MN2PR12MB2863:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2863D77DD4FB1407931319F9ECB80@MN2PR12MB2863.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(189003)(199004)(66446008)(14444005)(99286004)(64756008)(305945005)(66556008)(66476007)(66946007)(6436002)(5640700003)(86362001)(7736002)(3846002)(6116002)(486006)(256004)(6916009)(5660300002)(8676002)(2351001)(4326008)(6506007)(386003)(14454004)(316002)(54906003)(6486002)(11346002)(76176011)(478600001)(446003)(53936002)(52116002)(26005)(71190400001)(71200400001)(102836004)(66066001)(1076003)(186003)(36756003)(8936002)(25786009)(50226002)(81156014)(2501003)(81166006)(6512007)(2616005)(476003)(2906002)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2863;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /SdotsHBqM988YoOcApcme40S5otf3sJvfQpTWXLltWcLsEEk/n+qjG+6Zb6vk2jlWZ8hLi0qGmKWTomU4CEUpjH7N0Ob3wuMFlr9MjSCs7DuNNbbuPLmA33gty01NdWbY6DPsm27AaieaXuctuDwACtgsK2NtxgdNlHogjNkFK3246BlTnl1AfyezDn6pON1SYB2OFVM3sskM2MC2W9yuGQQBRKCnlKBHOFkBt5a7GV3LgVYQahVFLSApBUWFpYr5bzyppO/T2K5EVmXB/EMciCRLooG/8hCmJeQsZ/aMTYKMyVF7UjV/MLRMkxYhxIEASphRzYRaKvftk7AhKtfiTcQDRmv/V36loxgYObLUnMCFE+H9yUmy9vo8hR4ijqs8VOPtHQFfx1EYLwxsVcl6UDx2Qa9E+/V8YaNsHBCBo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c55aa0-bb3e-4910-1371-08d7314f5686
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 15:48:32.2347 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RnKxTpyNDfcQKX+qjLkB8en4LUHrs7NiU793+3OOLo5pEPeXUqwvIZhw1izcrLpyW94ixW98IxRg4KqvlmCGbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2863
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxCfvQXhJYNGk9iDqLa4gnctxh1abW5xF0tDdhgN83g=;
 b=cwMNczHh5yoUCVxhgLcATAqer+cyaoKPU5rGRSYg8VIDMhyUABcYJJKvsSzhhqT6Q4Di76eemlkB9LmOVwQ6zfJW37ZJmMkrPA52pVqR4PUThxF6LH9Q/1qU/hI/7cVgCpAfQlUxcrl8dV8m3OMpmTF0D49iCoSd2Tcdkbwak/4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2hpbGUgZ2Z4b2ZmIGlzIGVuYWJsZWQsIHRoZSBtbVZNX1hYWCByZWdpc3RlcnMgd2lsbCBiZSAw
eGZmZmZmZmYgd2hpbGUgdGhlIEdGWAppcyBpbiAib2ZmIiBzdGF0ZS4gS0ZEIHF1ZXVlIGNyZWF0
dGlvbiBkb2Vzbid0IHVzZSByaW5nIGJhc2VkIG1ldGhvZCwgc28gaXQgd2lsbAp0cmlnZ2VyIGEg
Vk0gZmF1bHQuCgpTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oICAgICAgICB8IDEgKwogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgMiArLQogMiBmaWxlcyBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdS5oCmluZGV4IDNlODYyMDcuLmI2NzIxYTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdS5oCkBAIC0xNjcsNiArMTY3LDcgQEAgZXh0ZXJuIGludCBhbWRncHVfYXN5bmNf
Z2Z4X3Jpbmc7CiBleHRlcm4gaW50IGFtZGdwdV9tY2JwOwogZXh0ZXJuIGludCBhbWRncHVfZGlz
Y292ZXJ5OwogZXh0ZXJuIGludCBhbWRncHVfbWVzOworZXh0ZXJuIGludCBzY2hlZF9wb2xpY3k7
CiAKICNpZmRlZiBDT05GSUdfRFJNX0FNREdQVV9TSQogZXh0ZXJuIGludCBhbWRncHVfc2lfc3Vw
cG9ydDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZp
Y2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCBk
ZDIxOWE1Li4zNGYzNzFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jCkBAIC0xNTc2LDcgKzE1NzYsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZXZpY2VfaXBf
ZWFybHlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAl9CiAKIAlhZGV2LT5wbS5w
cF9mZWF0dXJlID0gYW1kZ3B1X3BwX2ZlYXR1cmVfbWFzazsKLQlpZiAoYW1kZ3B1X3NyaW92X3Zm
KGFkZXYpKQorCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikgfHwgc2NoZWRfcG9saWN5ID09IEtG
RF9TQ0hFRF9QT0xJQ1lfTk9fSFdTKQogCQlhZGV2LT5wbS5wcF9mZWF0dXJlICY9IH5QUF9HRlhP
RkZfTUFTSzsKIAogCWZvciAoaSA9IDA7IGkgPCBhZGV2LT5udW1faXBfYmxvY2tzOyBpKyspIHsK
LS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
