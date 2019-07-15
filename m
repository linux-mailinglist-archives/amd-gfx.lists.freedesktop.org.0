Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6952569DEA
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C263589D84;
	Mon, 15 Jul 2019 21:22:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690086.outbound.protection.outlook.com [40.107.69.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA85B89D5C
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:22:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVPbUlb/EAcQ4KTUacEBuO1bRJ73cXkD38SBjdeQZnQuvNDTJZcgJsDWA4Vn/h1/YaMoBGo5XekoX+ftsHsXynPxH+2jcg8DZqnk2tYflrLFYwmP2P3rwR7Pblwz6a6a2Zl0A0ewOYJFPCgi0sVJOJ5sOHfl3/kJTmBm59+X87gnMrVGQ0uBK5DvfB8ZQkTOTGcZKONhAZwUv67lfjCXgLUCSsV3vjPKE2++PVex15UbAcOMjutojZOAj+617o1PGNFgoZHMa1Le2EV7Gpb2KgWDXf/tu8M0fIXoAhfvTOPqEjwrdUKKLNt7cV6WoHmrid4iNYLl1duREfIznKK9Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JctDpUwxW9WdctUiHyPQGcwcXJZmzjyDZPLXupWoipo=;
 b=i5+rH4Ypp1Cl/RzHZy8coFkL2jhZ4uf6YYMxlzc2BD2eQ0tPLriV+SQ2vd/dGxQy/ANA/HEDmF5eEFUxkwCpTj8T+Exo+OQNsjfbfny+DE2qvJ0dUgVv5he7wIk8zY6mTtWO/SdyXIpvmZyEVOKfsSK13KFenpszq4pGc9r1Zkrq8EOcq4C1jCSNgUdzwUB02bmqrdSbwZxRaGVJD45zvTBmWCxesF4ka8W0e3P3Caa286dU8K6dUEwxRTlLm/KZ6clTgPxNX8rAJCPlqM+XUyRCK1BfOdFsN7W8+VAsx7lw83ugXpHjAwIhEXmxjBZmkZowIQwIHf5Bsb8hy8iY1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM6PR12CA0008.namprd12.prod.outlook.com (2603:10b6:5:1c0::21)
 by CY4PR12MB1928.namprd12.prod.outlook.com (2603:10b6:903:128::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:22:05 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by DM6PR12CA0008.outlook.office365.com
 (2603:10b6:5:1c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:22:05 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:22:04 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:43 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 84/87] drm/amd/display: Add debug entry to destroy
 disconnected edp link
Date: Mon, 15 Jul 2019 17:20:46 -0400
Message-ID: <20190715212049.4584-85-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(136003)(376002)(2980300002)(428003)(199004)(189003)(47776003)(2906002)(186003)(54906003)(356004)(2876002)(26005)(4326008)(2870700001)(305945005)(486006)(6916009)(50466002)(51416003)(76176011)(48376002)(49486002)(68736007)(1076003)(2351001)(8676002)(8936002)(86362001)(50226002)(336012)(81156014)(81166006)(446003)(14444005)(53936002)(426003)(11346002)(476003)(36756003)(316002)(126002)(70586007)(2616005)(70206006)(478600001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1928; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d57b0f0-9cd0-40f0-09cb-08d7096a7c25
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1928; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1928:
X-Microsoft-Antispam-PRVS: <CY4PR12MB19281A612924500BDD1D742D82CF0@CY4PR12MB1928.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:483;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: wSnoC/mHvRahUgaYKSX0yjaytNSWpHJ52ed0+zg3znywxgstRj/rqwhYxobEoVPTI6P2l0t/J9WfAiQ1rUhLLbrImVoUzFhQ52E1KZsjgETm2k9D7SQuvrMECyAp1psUAGzRpPZGCx6dLDGZkTlM3PSRrJ/rr38WE37WxNm5w+YNkHL8MTLdtq10c4j8aNZEoqbNMTbbOAUkG90LXHdbvUFFXa3viDVe6HWosehlijYW0ha/A6hg0WJFULuxwhi99WFq/msH6wHVhydnXCu8wKz5ut8jCoqj3AWdaJ3zBkUwrJD3tP6QKJU9zFuXFvvbIU2KPw16SMIJ5DNK/PiAE7PwlaWwUrYpNS/36REAlFrOkXSx41x5buqpoRomq3W2uQ8q5OOadU4VuIAX9+u7wToPjku1zNsWhUsfCsS0wRU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:22:04.8228 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d57b0f0-9cd0-40f0-09cb-08d7096a7c25
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1928
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JctDpUwxW9WdctUiHyPQGcwcXJZmzjyDZPLXupWoipo=;
 b=ziBQa2wIjjLZ9dEUMTmWFqajpkRrvo6wR9mwO64/gpS1RdENj2RW4lxULDUWJtmFNFdQ5hjZyyLm6CMc7nM3t38UK3DSinFAWVoJjaLy7RBANWevC2ptJeRCbYB0h+a+ygy+wyXoS9KjWUIUEweCgT7FiLYi+Q/HjrV5Mk17Cr8=
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
Cc: Leo Li <sunpeng.li@amd.com>, Lewis Huang <Lewis.Huang@amd.com>,
 Yongqiang Sun <yongqiang.sun@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGV3aXMgSHVhbmcgPExld2lzLkh1YW5nQGFtZC5jb20+CgpBZGQgYSBmbGFnIHRvIGRj
X2RlYnVnX29wdGlvbnMgdG8gZGV0ZXJtaW5lIGlmIGEgZGlzY29ubmVjdGVkIGVkcCBsaW5rCnNo
b3VsZCBiZSBkZXN0cm95ZWQuCgpDaGFuZ2UtSWQ6IEk0OWNjYWJlMmNlZGMwMmQ0OWZlM2NkMDg1
NzEwZWE3NDU5YmNhMjA1ClNpZ25lZC1vZmYtYnk6IExld2lzIEh1YW5nIDxMZXdpcy5IdWFuZ0Bh
bWQuY29tPgpSZXZpZXdlZC1ieTogWW9uZ3FpYW5nIFN1biA8eW9uZ3FpYW5nLnN1bkBhbWQuY29t
PgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyB8IDIwICsrKysrKysrKysrKysrKystLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaCAgICAgIHwgIDEgKwogMiBmaWxlcyBj
aGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCmluZGV4IGM0NDVkZTRkMjcyZS4uZGJmYzUzMGJjZjY4
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKQEAgLTE3OCwxMyAr
MTc4LDI1IEBAIHN0YXRpYyBib29sIGNyZWF0ZV9saW5rcygKIAkJbGluayA9IGxpbmtfY3JlYXRl
KCZsaW5rX2luaXRfcGFyYW1zKTsKIAogCQlpZiAobGluaykgewotCQkJaWYgKGRjLT5jb25maWcu
ZWRwX25vdF9jb25uZWN0ZWQgJiYKLQkJCQkJbGluay0+Y29ubmVjdG9yX3NpZ25hbCA9PSBTSUdO
QUxfVFlQRV9FRFApIHsKLQkJCQlsaW5rX2Rlc3Ryb3koJmxpbmspOwotCQkJfSBlbHNlIHsKKwkJ
CWJvb2wgc2hvdWxkX2Rlc3RvcnlfbGluayA9IGZhbHNlOworCisJCQlpZiAobGluay0+Y29ubmVj
dG9yX3NpZ25hbCA9PSBTSUdOQUxfVFlQRV9FRFApIHsKKwkJCQlpZiAoZGMtPmNvbmZpZy5lZHBf
bm90X2Nvbm5lY3RlZCkKKwkJCQkJc2hvdWxkX2Rlc3RvcnlfbGluayA9IHRydWU7CisJCQkJZWxz
ZSBpZiAoZGMtPmRlYnVnLnJlbW92ZV9kaXNjb25uZWN0X2VkcCkgeworCQkJCQllbnVtIGRjX2Nv
bm5lY3Rpb25fdHlwZSB0eXBlOworCQkJCQlkY19saW5rX2RldGVjdF9zaW5rKGxpbmssICZ0eXBl
KTsKKwkJCQkJaWYgKHR5cGUgPT0gZGNfY29ubmVjdGlvbl9ub25lKQorCQkJCQkJc2hvdWxkX2Rl
c3RvcnlfbGluayA9IHRydWU7CisJCQkJfQorCQkJfQorCisJCQlpZiAoIXNob3VsZF9kZXN0b3J5
X2xpbmspIHsKIAkJCQlkYy0+bGlua3NbZGMtPmxpbmtfY291bnRdID0gbGluazsKIAkJCQlsaW5r
LT5kYyA9IGRjOwogCQkJCSsrZGMtPmxpbmtfY291bnQ7CisJCQl9IGVsc2UgeworCQkJCWxpbmtf
ZGVzdHJveSgmbGluayk7CiAJCQl9CiAJCX0KIAl9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Yy5oCmluZGV4IDZkYTBhNmZlMjk3My4uYzU4NWUxNmJjOWYxIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGMuaApAQCAtMzc4LDYgKzM3OCw3IEBAIHN0cnVjdCBkY19kZWJ1Z19vcHRpb25z
IHsKIAlib29sIHNjbF9yZXNldF9sZW5ndGgxMDsKIAlib29sIGhkbWkyMF9kaXNhYmxlOwogCWJv
b2wgc2tpcF9kZXRlY3Rpb25fbGlua190cmFpbmluZzsKKwlib29sIHJlbW92ZV9kaXNjb25uZWN0
X2VkcDsKIAl1bnNpZ25lZCBpbnQgZm9yY2Vfb2RtX2NvbWJpbmU7IC8vYml0IHZlY3RvciBiYXNl
ZCBvbiBvdGcgaW5zdAogCXVuc2lnbmVkIGludCBmb3JjZV9mY2xrX2toejsKIAlib29sIGRpc2Fi
bGVfdHJpX2J1ZjsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
