Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 171858DC99
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 20:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4975989DD2;
	Wed, 14 Aug 2019 18:02:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810055.outbound.protection.outlook.com [40.107.81.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AB989DD2
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 18:02:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mymdx7TDB1og40Ql/K0K1mt9gml/1wmL81QfnY/NBIenNhq0l1IeJEAX6pAFgRJsk/+sU7Won9nyOrKaJqyI/WDZFPr6yoacaMAptK9P7Te1fBSLM/uDxY8k5SNJPI5XMv80xrxZ38KhBVWp8KPBIXYjn8/TYMusdQYNlwLMrR5dj1SLpBXIuqTY4DNrpKXWwoBCXxACqzIf6a2clh7j+f0TEo6qBKoQaacRPm6wIHWqAszMknJ68wsG7zJuhSyXLFQUi7u37rP/JBvnaQ85kagTsdSABzI1B/VuJYzq2EzjLXhqEzF/t1cMGyeC3tXUKje1T3mrfyRaluB7JAvQUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNIwPmmLX1xeaKiyX6eFGjMsGq1U/KHzqk9u9acU6Vs=;
 b=dyuVDEEKpo/s+U8eKcvPJDSe21ijC+zPmNBMjHoH3sejZ1FIpTBpleAsvX6weKGeKriVNbvCer+S97eYwLwaD93WnGegeycDzko7bCjVswVp7o58CfAJbvLSmE46mUajbTc/vPrQmDAUk4txRPbDbqqM5JRaMu1Ha4dG1VLUlwNAFwHg6juULYcmj5a950KTSHDQzY6CLfvU+MW2Be4CDXsY4GBNkAvVk9VQ5O54P4JVLhAwvjIW8lQ3d7M8jZOuWlC4of/7fGK4p662MBocArB21rkF2vr4Tt1Es7JKbXRE2FpBIPguvIxvsM/zfV4YbdUg2qgkwK66uN/jdkR+Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1204.namprd12.prod.outlook.com (10.168.226.144) by
 BN6PR12MB1891.namprd12.prod.outlook.com (10.175.101.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Wed, 14 Aug 2019 18:02:14 +0000
Received: from BN6PR12MB1204.namprd12.prod.outlook.com
 ([fe80::cd59:2af9:942:9481]) by BN6PR12MB1204.namprd12.prod.outlook.com
 ([fe80::cd59:2af9:942:9481%10]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 18:02:14 +0000
From: Gang Ba <gaba@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/amdgpu: Update VM function pointer
Thread-Topic: [PATCH] drm/amd/amdgpu: Update VM function pointer
Thread-Index: AQHVUspnghU2AeyuYEGKYE8bK/26bg==
Date: Wed, 14 Aug 2019 18:02:14 +0000
Message-ID: <1565805720-21500-1-git-send-email-gaba@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0030.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::43) To BN6PR12MB1204.namprd12.prod.outlook.com
 (2603:10b6:404:1b::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a45004c-fd4e-4e78-7a4b-08d720e18944
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1891; 
x-ms-traffictypediagnostic: BN6PR12MB1891:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1891E3D21E70425F6D7E65FFFFAD0@BN6PR12MB1891.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(199004)(189003)(64756008)(66446008)(81166006)(81156014)(5660300002)(476003)(36756003)(15650500001)(2351001)(14444005)(256004)(7736002)(8676002)(66066001)(71200400001)(6436002)(66476007)(4326008)(71190400001)(8936002)(50226002)(25786009)(66556008)(26005)(386003)(486006)(2616005)(6506007)(186003)(5640700003)(102836004)(2501003)(53936002)(305945005)(316002)(6512007)(4744005)(6116002)(6486002)(3846002)(6916009)(14454004)(99286004)(52116002)(2906002)(66946007)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1891;
 H:BN6PR12MB1204.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: I+6p5GyvcVojDfeyuujuNFdiL0D7MyYUuUhMkiYqAnwC5hPjg14CbUISjtkAdv93iNxnZkrc5eKk5thjWLYB+oR/nt5YSt5GrSwKPGa1g9AA7BkNOQ1VPuNDmE0QbLe+dWyjhEYmgjx++De9Vy2TwRR0UlqLdeGdbgX9/uj8BLiMdA+FbOlQDbn8Tj5Th5aWV0oZ6MzDcLKfCqn8zwIise3dvYBRzB97VUX5AnSiDx39MkNoQs6ZtSCAKg19aWtVz422pfz/tiWPXDN6dNoryh4Jbx3lCz92n2EmaTkvMiU+ltnoAm21m9+q5sUmDI92rg2VgaO4NKEd8vlk2byd/467jZtE/a7rdgM+Esx5buzVhRHniN5hWRRNuJvuuHcrM+Z/bNvx4B8VESt6wC6gwES+bnkJiTuZWJ7KoA3sLM8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a45004c-fd4e-4e78-7a4b-08d720e18944
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 18:02:14.3339 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lFyYGcWh17I6ZXQb0/7UiGPLaGd/mJ3eVvIfN974gHL2iAVbnoxeMR2gRrzCUzEG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1891
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNIwPmmLX1xeaKiyX6eFGjMsGq1U/KHzqk9u9acU6Vs=;
 b=EWfO5UhcGI8PxoM6i6hiDiW/36WX6dpciPk74PYaTD7PUnrdrsHdgwtP8xd5pN6u0SospY/j5gAiVaDf/B9VF6aT9LzbTDILJhcz6x387Cpk1Opety/7ODxDWkUdhIVyDnGYdGKgO6Z//tLM+DN4NmUQ0nco4Rvff+oFKohx1Yo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Gang.Ba@amd.com; 
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
Cc: "Ba, Gang" <Gang.Ba@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2hlbiBWTSBzdGF0ZSBjaGFuZ2VkIGFuZCBzeXN0ZW0gaW4gbGFyZ2UgYmFyIG1vZGUsCm1ha2Ug
c3VyZSB0byB1c2UgQ1BVIHVwZGF0ZSBmdW5jdGlvbiwgb3RoZXJ3aXNlIHVzZQpTRE1BIGZ1bmN0
aW9uLgoKQ2hhbmdlLUlkOiBJYmNmYWRhNTYwYTAwYzlhZWViZmQ5MjJhZTQ4ZGU5MjBlNDRhNTg2
NgpTaWduZWQtb2ZmLWJ5OiBHYW5nIEJhIDxnYWJhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCmluZGV4
IGMxYmFmM2QuLjdkZGNhM2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5j
CkBAIC0yODYyLDYgKzI4NjIsMTMgQEAgaW50IGFtZGdwdV92bV9tYWtlX2NvbXB1dGUoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtLCB1bnMKIAlXQVJOX09O
Q0UoKHZtLT51c2VfY3B1X2Zvcl91cGRhdGUgJiYgIWFtZGdwdV9nbWNfdnJhbV9mdWxsX3Zpc2li
bGUoJmFkZXYtPmdtYykpLAogCQkgICJDUFUgdXBkYXRlIG9mIFZNIHJlY29tbWVuZGVkIG9ubHkg
Zm9yIGxhcmdlIEJBUiBzeXN0ZW1cbiIpOwogCisJaWYgKHZtLT51c2VfY3B1X2Zvcl91cGRhdGUp
CisJCXZtLT51cGRhdGVfZnVuY3MgPSAmYW1kZ3B1X3ZtX2NwdV9mdW5jczsKKwllbHNlCisJCXZt
LT51cGRhdGVfZnVuY3MgPSAmYW1kZ3B1X3ZtX3NkbWFfZnVuY3M7CisJZG1hX2ZlbmNlX3B1dCh2
bS0+bGFzdF91cGRhdGUpOworCXZtLT5sYXN0X3VwZGF0ZSA9IE5VTEw7CisKIAlpZiAodm0tPnBh
c2lkKSB7CiAJCXVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
