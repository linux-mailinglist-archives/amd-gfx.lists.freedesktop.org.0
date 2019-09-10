Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E442AEC71
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 15:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A306E8F6;
	Tue, 10 Sep 2019 13:55:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BF18958E
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 13:55:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZeAx/Zgh4/S24IM/F5afo8DxNhReekFj8XrOS2ap2O6J0k0CwbKcpTk0bE+1KXDip64s0sXVgtWIa7Xe+H9ATmQAgZHbIBeDKTVokdAe8i0beEqDj1SM8x7sZGRD48kmTqQ9No0HtGeDlPHwtnYE8txQwpwMIJ813uhAtHR3qPMrX3Z3FzwjjBGQQ9kgqBtwikSNqpzc99PK/BCjWn6M08qr2QSVKqKjoIQfcPaC83JHz4JYleGDUm74lDgsYz2p6lEcPnhsAUeSkvPwpllxcTVRYy8hHCS1s/Tbbo3j7a243dL4WUpIQsKMff2Sp0I7ywt0/1Dh9k1Rb6XB0qhWPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9W46lGynlIJF/cgWu+4cNSl3fygXMUhTwaZzfbTw1+U=;
 b=QtjHOSkVDUcQB3C39qiiSlhdYgKMFArBmWxvs7oh84YmOtIFwtjVULfsAp1T++6pnSht1ayDArP/mlvBF6HrUn6eFks/wjhU3MkbUA0KUwlfkm/WgpSZQCiTtBq1NDmDM0q0Y9HnDIwtOdNngnv8J7gO2SfKXjSuKmPJdg6BABJZM/Xvfir4ii7onqIo2bpazOKkySkaAnAqY8WWGvwrh9fPaRp7CMx8Vzr5RfMywm2Edv/NHbJhvPwDAgyQymJaWjRZwyVEEp+h8TYsaeG7sV3ktgbyI67FF8qpFZjyU5DneUGCITt2K8SymbxLjWd7UKq6cENkUp144AOH21AueQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0020.namprd12.prod.outlook.com (2603:10b6:5:1c0::33)
 by DM5PR12MB1436.namprd12.prod.outlook.com (2603:10b6:3:78::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Tue, 10 Sep 2019 13:55:05 +0000
Received: from CO1NAM03FT026.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM6PR12CA0020.outlook.office365.com
 (2603:10b6:5:1c0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.18 via Frontend
 Transport; Tue, 10 Sep 2019 13:55:05 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT026.mail.protection.outlook.com (10.152.80.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 13:55:04 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 10 Sep 2019 08:54:59 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 16/25] drm/amd/display: Set number of pipes to 1 if the second
 pipe was disabled
Date: Tue, 10 Sep 2019 09:54:36 -0400
Message-ID: <20190910135445.18300-17-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910135445.18300-1-sunpeng.li@amd.com>
References: <20190910135445.18300-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(2980300002)(428003)(199004)(189003)(53936002)(70206006)(70586007)(76176011)(26005)(51416003)(2906002)(48376002)(50466002)(8936002)(81156014)(356004)(81166006)(14444005)(305945005)(4326008)(2876002)(86362001)(50226002)(2870700001)(36756003)(6666004)(336012)(6916009)(11346002)(446003)(1076003)(5660300002)(49486002)(426003)(316002)(54906003)(478600001)(2351001)(186003)(47776003)(486006)(126002)(476003)(2616005)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1436; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e58f5e8-3e7a-4f5e-135e-08d735f67bd2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR12MB1436; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1436:
X-Microsoft-Antispam-PRVS: <DM5PR12MB14369CAB7F22DBD6653219B582B60@DM5PR12MB1436.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: GIssY5X8dHYLt8//Grxeb+Paa2GSfZqs+s1HQcHrPJbPNMOS8n4xYkjZ9HAhJN8rEf2TW1yJtHfqfe0lnS2oJtPbqrluGTwjvIdieimqMA1wYXZ5YxHB5dusXQOkcKbXl/qmwDxLSjHbIM9dfnKKh/FBcxrs4Z4mHX3aL9Wi92NwFDtHQaU7WLvBeUTaeqxugeMOWmWZ2M7MUmJ5vp8e6tzTMAQk4ANi1uajy0LcvRq5q2qPqhK8NLOzOqC3QR4E28dyGGZo50/oUcispEjRLEqZXReEoRnhFhdgwAx/N65ToVx5Dl/8H366F/JXmw2J16c9SoHjv1RxsX+j2O4iM15s7/c7lGAgh8kUgj0vxzvgp/pawNTr6g+DWO8MPqWmT5Co85LqOoik0JyJRc09C5YMD78fXXf27Cl4w11s8K8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 13:55:04.9956 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e58f5e8-3e7a-4f5e-135e-08d735f67bd2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1436
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9W46lGynlIJF/cgWu+4cNSl3fygXMUhTwaZzfbTw1+U=;
 b=CXGrv4pPkRXg8F9qcjaGrGYn6uvuUu4AcqGsQEvErwQRbb0ZVPCjBpfd8ohe7/SAAlR5+5dPHis3kAgOFv3A6k9P5NqiwuvOnm4hsY+ghNCcUeXBLMNl+kMM6hk/TLFove4JmwbuK789VKvIBmmBVoY9Xk5JmWiNmQDak9a9zDM=
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Nikola Cornij <nikola.cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKW3doeV0KU29tZSBP
RE0tcmVsYXRlZCByZWdpc3RlciBzZXR0aW5ncyBhcmUgaW5jb25zaXN0ZW50bHkgdXBkYXRlZCBi
eSBWQklPUywgY2F1c2luZwp0aGUgc3RhdGUgaW4gREMgdG8gYmUgaW52YWxpZCwgd2hpY2ggd291
bGQgdGhlbiBlbmQgdXAgY3Jhc2hpbmcgaW4gY2VydGFpbgp1c2UtY2FzZXMgKHN1Y2ggYXMgZGlz
YWJsZS9lbmFibGUgZGV2aWNlKS4KCltob3ddCkNoZWNrIHRoZSBlbmFibGVkIHN0YXR1cyBvZiB0
aGUgc2Vjb25kIHBpcGUgd2hlbiBkZXRlcm1pbmluZyB0aGUgbnVtYmVyIG9mCk9QVEMgc291cmNl
cy4gSWYgdGhlIHNlY29uZCBwaXBlIGlzIGRpc2FibGVkLCBzZXQgdGhlIG51bWJlciBvZiBzb3Vy
Y2VzIHRvIDEKcmVnYXJkbGVzcyBvZiBvdGhlciBzZXR0aW5ncyAodGhhdCBtYXkgbm90IGJlIHVw
ZGF0ZWQgY29ycmVjdGx5KS4KClNpZ25lZC1vZmYtYnk6IE5pa29sYSBDb3JuaWogPG5pa29sYS5j
b3JuaWpAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IERteXRybyBMYWt0eXVzaGtpbiA8RG15dHJvLkxh
a3R5dXNoa2luQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfb3B0Yy5jIHwg
NCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX29wdGMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9vcHRjLmMKaW5kZXggMjEzN2UyYmUy
MTQwLi5kZGE5MDk5NWJhOTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMC9kY24yMF9vcHRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjIwL2RjbjIwX29wdGMuYwpAQCAtMjg3LDYgKzI4NywxMCBAQCB2b2lkIG9wdGMyX2dl
dF9vcHRjX3NvdXJjZShzdHJ1Y3QgdGltaW5nX2dlbmVyYXRvciAqb3B0YywKIAkJKm51bV9vZl9z
cmNfb3BwID0gMjsKIAllbHNlCiAJCSpudW1fb2Zfc3JjX29wcCA9IDE7CisKKwkvKiBXb3JrIGFy
b3VuZCBWQklPUyBub3QgdXBkYXRpbmcgT1BUQ19OVU1fT0ZfSU5QVVRfU0VHTUVOVCAqLworCWlm
ICgqc3JjX29wcF9pZF8xID09IDB4ZikKKwkJKm51bV9vZl9zcmNfb3BwID0gMTsKIH0KIAogdm9p
ZCBvcHRjMl9zZXRfZHdiX3NvdXJjZShzdHJ1Y3QgdGltaW5nX2dlbmVyYXRvciAqb3B0YywKLS0g
CjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
