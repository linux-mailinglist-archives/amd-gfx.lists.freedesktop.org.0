Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DEC84618
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 09:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74516E654;
	Wed,  7 Aug 2019 07:40:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810044.outbound.protection.outlook.com [40.107.81.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D17A6E654
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 07:40:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9t9r/bzYaBdS8ivQEXVPTTVGPYJbORyNQ8mNQ1m/QLyvqH5bldQ9eBmC9J0IbAu1GREHVHrZRPWBXk1pmJ/OZ71wMZm5bvv3OyAaQjcejGdtPpjp3ROegAZPRTuAIjb/ZMRiwgQl8Lf66WNf0uz5+qyCf9GmNZpTUZRWN02nqP0NiiE37mUfCOL3TK5b24QsN4ZE9mAh/MgpThtfANykOsX6MhoiXFdThU7bcZFW8RkuxQBvjbKKher/ggP17tBpRXYyVzdNJsyP0KsEF6QjNQAuAHUOkZdM/nnQjfx3CBSSmmCZuR4P1vRbOYX+9qRXnXjubzAo7jAG/IG7Vtr4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0LpGt7n+kK32QExwHbWj3iTQC7cGxcsp+JLsKS0Vdg=;
 b=PmeU8gJIiSGL81j7VHrgBnBN8B6vP794eTGdZHJvYsDTcM5IbZ7WxJktJLq6Aaws/rqI4JVfXDyLjYJfy9alWx5pwuw7Y4TO6szXQO4GTCU/CzwTFlsFr+g84atlUDQwrpl9bPdYmySTl+K3Sf91Qhsc4KItWwEIgHBgQ2gXk+JwnOr0WV70ViDCll3L9kI1qmmuZJWPqVSSb0fnVD2t7lc2KbGuFHrvWMDpNq+jxOJvJaxkkNdb8oRrMLSegLDrtD8lcXUog2zrzQmrdy1zJZ1sD5oIjx8ouf3IfNOjRkue6QxO8t5bYu67n6EzrwmJ5hwi3oCoznIDHTRXIDXulg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com (10.174.109.137) by
 DM5PR1201MB0220.namprd12.prod.outlook.com (10.174.247.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Wed, 7 Aug 2019 07:40:27 +0000
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::f585:bab:f4b5:c09e]) by DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::f585:bab:f4b5:c09e%6]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 07:40:27 +0000
From: "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: fix gfx9 soft recovery
Thread-Topic: [PATCH] drm/amdgpu: fix gfx9 soft recovery
Thread-Index: AQHVTPNh/+kwE4Ku7EG1AROmvoA8sw==
Date: Wed, 7 Aug 2019 07:40:27 +0000
Message-ID: <20190807074023.31659-1-pierre-eric.pelloux-prayer@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR2P264CA0028.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::16) To DM5PR1201MB0187.namprd12.prod.outlook.com
 (2603:10b6:4:5b::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0.rc1
x-originating-ip: [109.190.135.109]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7f07ee1-7b94-4979-1045-08d71b0a83b6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR1201MB0220; 
x-ms-traffictypediagnostic: DM5PR1201MB0220:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1201MB02200BC86CB530AB81A4380F8DD40@DM5PR1201MB0220.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:935;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(189003)(199004)(55236004)(256004)(476003)(4744005)(1076003)(486006)(478600001)(26005)(14444005)(6512007)(186003)(66066001)(102836004)(53936002)(2616005)(8936002)(316002)(3846002)(25786009)(7736002)(71200400001)(305945005)(6916009)(6506007)(71190400001)(386003)(36756003)(86362001)(2906002)(68736007)(66946007)(6436002)(14454004)(54906003)(6486002)(50226002)(66556008)(66476007)(6116002)(2351001)(66446008)(64756008)(8676002)(5660300002)(2501003)(5640700003)(81166006)(99286004)(81156014)(52116002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0220;
 H:DM5PR1201MB0187.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kmk+YQARHUxNdGahQq1ZKvHq+ljp3LQwyChjl29/HyPovmPGdSXNokIgt7aBdAX1HSNumiLX6inadBfa2yYNVIwsMjKKIvWUIFmPnzNQ60Wm/2RrfWOAITYoBZh/lf1/mN0Fiskn9f3iLldvxn9DvKCCuGEVH8Nb3GRTOzmiTtBEpHUPuB5b2jeo5st+t4x6LYQY/hvMexU86YuRY4YHnG154PmN62GbdMCn3zny1GhlHnQsUPhGa89TR75kSvxDvCkFbsM6L18m/nct5amMdcLm9nmGkiru1q2YQKFEuOgKrkg+jJ5sXmVvlnSCkBc6WgiK5aieERZVCHlqAWxjo5Pssi6NmrQNsfrxcZF0YBmgKuoduo1wj68IVQldC2FQnqgj3lPQmEs1Mv/5W3KTZkmTdmTIOAQZXJab91Iq/tk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f07ee1-7b94-4979-1045-08d71b0a83b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 07:40:27.4192 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppelloux@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0220
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0LpGt7n+kK32QExwHbWj3iTQC7cGxcsp+JLsKS0Vdg=;
 b=ANvAS4tVCIB/LMPQU09V6SM2kkEvTxYnBFnDtAtiGa9mmvbRJKRQI/zpn4A48GgY7rfPXDutbwVSLYtiEh4MNG53rPbxZzulLvBTnsrdk5KcLwNIqUXnVE57Z9vZYUnpDdTHPqZ4Ga5GuvlI7JxINgHt6RsipekDwc3oWeSNg+U=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Pelloux-prayer,
 Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIFNPQzE1X1JFR19PRkZTRVQoKSBtYWNybyB3YXNuJ3QgdXNlZCwgbWFraW5nIHRoZSBzb2Z0
IHJlY292ZXJ5IGZhaWwuCgp2MjogdXNlIFdSRUczMl9TT0MxNSBpbnN0ZWFkIG9mIFdSRUczMiAr
IFNPQzE1X1JFR19PRkZTRVQKClNpZ25lZC1vZmYtYnk6IFBpZXJyZS1FcmljIFBlbGxvdXgtUHJh
eWVyIDxwaWVycmUtZXJpYy5wZWxsb3V4LXByYXllckBhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwpp
bmRleCBiY2QwMzAxZWVlMWUuLjFhMjk2M2U0YmM2OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nZnhfdjlfMC5jCkBAIC01Mzc1LDcgKzUzNzUsNyBAQCBzdGF0aWMgdm9pZCBnZnhfdjlfMF9y
aW5nX3NvZnRfcmVjb3Zlcnkoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1bnNpZ25lZCB2bWlk
KQogCXZhbHVlID0gUkVHX1NFVF9GSUVMRCh2YWx1ZSwgU1FfQ01ELCBNT0RFLCAweDAxKTsKIAl2
YWx1ZSA9IFJFR19TRVRfRklFTEQodmFsdWUsIFNRX0NNRCwgQ0hFQ0tfVk1JRCwgMSk7CiAJdmFs
dWUgPSBSRUdfU0VUX0ZJRUxEKHZhbHVlLCBTUV9DTUQsIFZNX0lELCB2bWlkKTsKLQlXUkVHMzIo
bW1TUV9DTUQsIHZhbHVlKTsKKwlXUkVHMzJfU09DMTUoR0MsIDAsIG1tU1FfQ01ELCB2YWx1ZSk7
CiB9CiAKIHN0YXRpYyB2b2lkIGdmeF92OV8wX3NldF9nZnhfZW9wX2ludGVycnVwdF9zdGF0ZShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKLS0gCjIuMjMuMC5yYzEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
