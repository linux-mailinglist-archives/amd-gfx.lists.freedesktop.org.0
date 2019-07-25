Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A371750F4
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 16:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F146E3E4;
	Thu, 25 Jul 2019 14:25:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680072.outbound.protection.outlook.com [40.107.68.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C88C6E65A
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 14:25:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mvu+nZno0J91o5anvpKxBt5LN0MBuOogU4x0/bqnEdKRonFTrpuLWr4oZJVvpuGSZsnITZKFRmAjEhdyvit7ivTBWTC1oPMhsjb2o6bNS4AewV+1DXSyV56sbW2/ZuoZozK6ThsqzhIeoNQaRF4rEot61DF6RwzkbDWuknP3ffrtCJCt6MLNrflhO/TjlxUyin54X1Vu6+2j+JIIlcXzTsog6SuOtqYLlGvP78BScBjn9x6UkrGsnR3E0No0vlOnyOAMmfgh9ZBm4JMqKtsJjsGPESvBDjMtM5wN+ARThUCluBTHtagwRmwV3IvP7Kteb3Wpc2cBCoDO74j7Cev5Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUOLvDRPAbVER9L7rQtH/CSIhIRpURt+h3JWB5XKFUs=;
 b=ROCVo3F3k/rzFhW+Xc/o934bpw6rQanqkBpiGPbD6RwTuCdeYXiA5N17iXEHzb9X6DUXzKm2jsnhpdjXmZzskFznlLuQUFG9qqbYdthhT2dDY6Nf1ehE6OrmohKq42AtspsSxljbfDtMkVQ2z7KpNXgMbRhBEIGAVskh0dcyzLWVRwZUh8hah+QEX4zHPNGbPJhh+qPFlOYgJKZgCs/9EOe23NIiBptnqd4Ysv1C3fHovVM1TvbLOXNZqvMKTzX1+NDwFlymoqSC+rNXlTEFJS92VoSABwdXJT5MqAWDKdapNOIKyocPCzvBPukXO09KQA9o2h27ir0N3WWpNul8Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=daenzer.net
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0057.namprd12.prod.outlook.com (2603:10b6:0:56::25) by
 CY4PR12MB1573.namprd12.prod.outlook.com (2603:10b6:910:d::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Thu, 25 Jul 2019 14:24:59 +0000
Received: from CO1NAM03FT014.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by DM3PR12CA0057.outlook.office365.com
 (2603:10b6:0:56::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.14 via Frontend
 Transport; Thu, 25 Jul 2019 14:24:59 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT014.mail.protection.outlook.com (10.152.80.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Thu, 25 Jul 2019 14:24:58 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Thu, 25 Jul 2019 09:24:56 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 0/4] Enable S/G for Picasso
Date: Thu, 25 Jul 2019 10:24:39 -0400
Message-ID: <1564064683-31796-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(2980300002)(428003)(199004)(189003)(4744005)(478600001)(53416004)(126002)(6916009)(70206006)(70586007)(5660300002)(86362001)(53936002)(6666004)(316002)(2616005)(8936002)(2906002)(305945005)(356004)(50226002)(36756003)(476003)(4326008)(8676002)(50466002)(48376002)(51416003)(47776003)(44832011)(81166006)(26005)(68736007)(486006)(426003)(336012)(54906003)(7696005)(81156014)(2351001)(186003)(16586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1573; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2b2dc9d-ddf1-480c-9b3f-08d7110bdf28
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1573; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1573:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1573AEA4F679C8C40F4E8DC3EAC10@CY4PR12MB1573.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0109D382B0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: EU9dOQBLl7kziltCaL/UIaBLTPTSj7lfHMa4aYr6jUpBoCewP+0emQ2Ho+WdXfYZb9I9Ree04g1sjpUFwVi4it54WxppE1f9JB9h1ghJCWCvIpXnEl2fue0TVPyDcBJhWGIDj8WLc4nanXHpqG/6vX3fskCStJqkv1bCpvZx60Kg6MeHGP3/INDBPp33ZV6xXYFQqSDekfeuvCBoib8C2d+1BNicqLKx8q0S6anG4EzJomhcIYVXlgC4RxqSPYfm3zUyCIZppxNl6YGUQzsYPxTERdpadbmy2D+E91zJutpBLkhC4sTufMveJSKVTQxd6X9FNoNEtqXW6yEUvDBcSTWu+dzZR/j9Ko3QZO+0VopwwygKIilxDpmObKneXO6QRyTGPJP9ecEZUJzLtu1AAEbkQP+yEmayX3UQNnDKYlk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2019 14:24:58.0535 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b2dc9d-ddf1-480c-9b3f-08d7110bdf28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1573
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUOLvDRPAbVER9L7rQtH/CSIhIRpURt+h3JWB5XKFUs=;
 b=F7ZxI0/1M/en7BP4oxCMZRprlf5mr3qs1TcldB5UwPu/0xsNC6C7w2YFiZllSifib9ijJHiYJcF0WuIoc02y2IuwdmTyJGhNt5XPxxet84hv9P6cRyaKr4DQxGtQT+6HNi8+UsoPaCh3lR+tQpeoqqsZxvN3EDwrHqUn/hDn+T8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; daenzer.net; dkim=none (message not signed)
 header.d=none;daenzer.net; dmarc=permerror action=none header.from=amd.com;
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, michel@daenzer.net,
 shirish.s@amd.com, hersenxs.wu@amd.com, Alexander.Deucher@amd.com,
 Christian.Koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rmlyc3QgcGF0Y2hlcyBmaXhlcyBhIGhhcmQgaGFuZyBpbnRyb2R1Y2VkIGJ5IHBsYWNpbmcgdGhl
IGRpc3BsYXkgQk8gaW4gCkdUVCBtZW1vcnkgYmVjYXVzZSBvZiBIVyBpc3N1ZXMgd2l0aCBjYWNo
ZWQgbWFwcGluZ3MuIFNlY29uZCBwYXRjaCBkb2VzCnNvbWUgbWlub3IgcmVhZmFjdG9yaW5nIHRv
IHJlc3VlIGNvZGUgaW4gdGhyaWQgcGF0Y2guIFRoaXJkIHBhdGNoIGFkZHMKY2hlY2sgZm9yIFVT
V0Mgc3VwcG9ydCBhcyBjb25kaXRpb24gdG8gcGxhY2luZyBBUFVzIHNjYW5vdXQgQk8gaW4gR1RU
LgpMYXN0IHBhdGNoIGVuYWJsZXMgUy9HLgoKQW5kcmV5IEdyb2R6b3Zza3kgKDMpOgogIGRybS9h
bWRncHU6IEZpeCBoYXJkIGhhbmcgZm9yIFMvRyBkaXNwbGF5IEJPcy4KICBkcm0vYW1kZ3B1OiBD
cmVhdGUgaGVscGVyIHRvIGNsZWFyIEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQwogIGRy
bS9hbWRncHU6IEFkZCBjaGVjayBmb3IgVVNXQyBzdXBwb3J0IGZvcgogICAgYW1kZ3B1X2Rpc3Bs
YXlfc3VwcG9ydGVkX2RvbWFpbnMKClNoaXJpc2ggUyAoMSk6CiAgZHJtL2FtZC9kaXNwbGF5OiBl
bmFibGUgUy9HIGZvciBSQVZFTiBjaGlwCgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2Rpc3BsYXkuYyAgICAgICB8IDExICsrKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9mYi5jICAgICAgICAgICAgfCAgNyArKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9nZW0uYyAgICAgICAgICAgfCAgMyArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X29iamVjdC5jICAgICAgICB8IDYxICsrKysrKysrKysrKystLS0tLS0tLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmggICAgICAgIHwgIDIg
KwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8ICAy
ICstCiA2IGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKyksIDM0IGRlbGV0aW9ucygtKQoK
LS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
