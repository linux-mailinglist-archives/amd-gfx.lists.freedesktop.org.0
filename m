Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C17ED812CF
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 09:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EF26E11E;
	Mon,  5 Aug 2019 07:13:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760043.outbound.protection.outlook.com [40.107.76.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579196E11E
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 07:13:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHVsxGDuyp8PexdBUwyM4nfGcBhqhLEMFexpCGpJqnuwm+Ps2LUUa5z+EViMDwVfmO1MTWdfS9JP41vEWIuczX8uQbdNWW5UAi5UosqMoeA1acokIjyTdfh8DttQpBzI5ZmO/bNla3PgkemBi/Mo5lrjR+gTK+ttEnWIw+DYFzQhvBTNQYuHqMLcH/RmyFkEK3Mw8pV8n3ZzP6UibFbapgILJerN/KdvK3+7XyKTVBEq6IXbH6SnrfEiXu11/VotSKZC/T0+/jSVyuGfMJMfNziRN0HiXb46IzDCmoUb8FcYOVzEQkrpgY4gDyc5MKpmeZwHgAwL9itorDgnJULRXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dHzcoX+3P5xZ/MAlByoW0xCGN4tXNnuG8ZTLtb68zo=;
 b=ZhGrgyMxu+H6nlaIezOepVCk2Uh/KwyVTN7ApDjBGtxAg9tK2P6PxYUvrsNn48I4fszXBaPjDwVUeVeF6kRZq+zeVhpgbzmxeTX+nVUt7ATU/tzTiqitKdw9LmaWhCuNshSFR9LSjVsWs0tfsan896LFjQ2nhXljltUf6KgBbZ7nzj7aoBDLN5750ku4sAJbtqt3v671jysvhVzHuCaUpVGxMz3E7h1k4nWa5kjvfBs5WTtSku00y3+jTJ3gPmOhLEQRGegCZkubheFmRyQUN+/d+Ts78HFZoj2MNVL9CFKAiSSgh0kX82t5Jqekyhrav0/2L7eYjxfjLVKQo23+fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN8PR12CA0003.namprd12.prod.outlook.com (2603:10b6:408:60::16)
 by BN6PR12MB1362.namprd12.prod.outlook.com (2603:10b6:404:1a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.20; Mon, 5 Aug
 2019 07:13:10 +0000
Received: from CO1NAM03FT011.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by BN8PR12CA0003.outlook.office365.com
 (2603:10b6:408:60::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.13 via Frontend
 Transport; Mon, 5 Aug 2019 07:13:10 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT011.mail.protection.outlook.com (10.152.80.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Mon, 5 Aug 2019 07:13:09 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 5 Aug 2019
 02:13:08 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: skip pcie params override on Arcturus
Date: Mon, 5 Aug 2019 15:12:51 +0800
Message-ID: <20190805071251.11093-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(2980300002)(428003)(189003)(199004)(70586007)(2906002)(356004)(478600001)(6666004)(2870700001)(81166006)(8676002)(81156014)(50226002)(8936002)(50466002)(48376002)(47776003)(305945005)(5660300002)(4326008)(70206006)(53936002)(86362001)(4744005)(1076003)(2351001)(426003)(336012)(36756003)(26005)(6916009)(186003)(126002)(44832011)(476003)(486006)(7696005)(51416003)(316002)(53416004)(68736007)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1362; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af18cd2e-6ee4-4f23-114e-08d719745f51
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1362; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1362:
X-Microsoft-Antispam-PRVS: <BN6PR12MB136230C950EE3EC1CA4A725AE4DA0@BN6PR12MB1362.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-Forefront-PRVS: 01208B1E18
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Foe8rUtPYbVt20VT3WfRd6PpeCvp2yilCCMOkdzZ7JYwAY/O2VLNavCpob8gMAwsQhqSYiVXPswGs6vGFwknqE0XByATjSp+MFuR1ZWpvtYnTQBgDMdMNALNCqXdKd0T6eTTsVrDlHtpMbdM0dtTFTU3Hjv82qCnpkTPKUNDOTUWfdQtoJEljLCOdJvrQk8M/P/UG8eJYL8ihKXrqpknEsosTqTKPSQVcqZoWkd4pxjj1BT4zhmM9glOTZwNumKFqqDNJrDHy5FR1XG7xr8XX4z/DrjMDpBWaZAevEghHiH0qdOig5ETEDdz7me/Ayo6wNhGJyTV9l1G378fJWilZMeZF+i6bYZtxezfT5T87g9Th/PfW4Gn3YzfVQ9bkg3xrGzP1zGTV6H1wOdHmCuxHP3+S1710EaPjvI2weU19fA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2019 07:13:09.9421 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af18cd2e-6ee4-4f23-114e-08d719745f51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1362
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dHzcoX+3P5xZ/MAlByoW0xCGN4tXNnuG8ZTLtb68zo=;
 b=UfGuhvnG+QrYfErktCSw1+RL8g5bTWMTMjdzPCjSr4C1vC6JrRqlWBMk4BV5ns9GRg78mgD6Xh4S2EMBMWbvr6JficXV+PAtRyXHUuezuUjt/N2pMny9YETievYFojbVmtWttX8MrjPYTrYsljinl1lVy/ZI870d1wBrPliUjus=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBpcyBub3Qgc3VwcG9ydGVkIG9uIEFyY3R1cnVzLgoKQWZmZWN0ZWQgQVNJQzogQXJjdHVy
dXMKCkNoYW5nZS1JZDogSTYyYThiY2UxN2EwNzBjZTRlZGE1ZmEyMmY0YjEyYTdmZmExMjAxY2QK
U2lnbmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgfCA4ICsrKysrLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwppbmRleCA1YmEwMzgyNjAwOTEuLjdjMmMyNGEy
OTFiMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3Nt
dS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwpAQCAt
MTEwOSw5ICsxMTA5LDExIEBAIHN0YXRpYyBpbnQgc211X3NtY190YWJsZV9od19pbml0KHN0cnVj
dCBzbXVfY29udGV4dCAqc211LAogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKLQlyZXQgPSBz
bXVfb3ZlcnJpZGVfcGNpZV9wYXJhbWV0ZXJzKHNtdSk7Ci0JaWYgKHJldCkKLQkJcmV0dXJuIHJl
dDsKKwlpZiAoYWRldi0+YXNpY190eXBlICE9IENISVBfQVJDVFVSVVMpIHsKKwkJcmV0ID0gc211
X292ZXJyaWRlX3BjaWVfcGFyYW1ldGVycyhzbXUpOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJl
dDsKKwl9CiAKIAlpZiAoYWRldi0+YXNpY190eXBlICE9IENISVBfQVJDVFVSVVMpIHsKIAkJcmV0
ID0gc211X25vdGlmeV9kaXNwbGF5X2NoYW5nZShzbXUpOwotLSAKMi4yMi4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
