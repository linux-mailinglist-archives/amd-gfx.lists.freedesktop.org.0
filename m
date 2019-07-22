Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ACE6F7CF
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 05:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D7C899BE;
	Mon, 22 Jul 2019 03:15:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690059.outbound.protection.outlook.com [40.107.69.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F491899B5
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 03:15:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnpFpCGmvRjKL5c+vdBrtgbiJ35oqmYFu69Vxh3P1PulM32NoI7pwURedHremCpRMHR3nZX2IGsN1/cWQZYtPsUEvT3vK/cwWQZzxsLFDtAQSSVU8cg7DtwInjEA4I2JkuoyvmJuZcxxbAdgxaSjdUcX712tUeQm8zYQhKp50GEDBvnnUBauVhPj5rznu60RUUYVsFcRomS24xFDVr1jxm2yU8vsxWs7E1QGXMvY6DcvBsS8Rbrx/J3f+/llJo7RghYUoLSDUQXnW5dr6LRErTUJHDPozoOyGuYEAlwNVYFsiX1NjH0/bvT0j1s3nG9ls+kCZuGkkwCHDN9Dh7ckQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODHkmY4uerOuBWVjR6VoIGCHMgGIz2zhA+1MASIR4hM=;
 b=izr7Cdp+Jk7rd7Gexs7RRKATwRIaZico98s7WOcxCzVKR1BAcLUjipbDcdrFV2GoduK2yhgtbrP6zJ3NaFjVFhLOrTYwr14ELEzxkab0E0mdUzgzxaaxqrtScvgdllJPlDNtMcvuFMPKxVJAFSkuUyfXe5v0w3o/P8svyJDjDhP7r0q9ekfoTb88qp3nxQB3SlcH2hZJ5qU2z2PKQvp8+Ipi4QXbc2Xk03v5P7aHKWaIIR9jsk6qJS5u86J38UvtysMGP+1Rmg0kA7k8fTodOFiwpc6xEo6IckxoGJSJtfSUkdsxied2sCNNLQwctUby+a2/U8mhrKCo1Xj48ya+kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0056.namprd12.prod.outlook.com (2603:10b6:0:56::24) by
 DM5PR12MB1577.namprd12.prod.outlook.com (2603:10b6:4:f::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 03:15:54 +0000
Received: from DM3NAM03FT015.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by DM3PR12CA0056.outlook.office365.com
 (2603:10b6:0:56::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.14 via Frontend
 Transport; Mon, 22 Jul 2019 03:15:53 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT015.mail.protection.outlook.com (10.152.82.195) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 22 Jul 2019 03:15:52 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Sun, 21 Jul 2019
 22:15:51 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/5] drm/amd/powerplay: add new sensor type for VCN powergate
 status
Date: Mon, 22 Jul 2019 11:15:27 +0800
Message-ID: <20190722031531.23437-2-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190722031531.23437-1-evan.quan@amd.com>
References: <20190722031531.23437-1-evan.quan@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39850400004)(346002)(376002)(2980300002)(428003)(199004)(189003)(81166006)(305945005)(356004)(6666004)(4744005)(51416003)(7696005)(426003)(26005)(5660300002)(2616005)(53936002)(446003)(2870700001)(68736007)(36756003)(11346002)(2906002)(336012)(81156014)(86362001)(8936002)(76176011)(1076003)(126002)(70586007)(2351001)(47776003)(316002)(186003)(50226002)(4326008)(476003)(50466002)(48376002)(70206006)(54906003)(53416004)(478600001)(486006)(44832011)(6916009)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1577; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9762589-7bd1-4a79-0e41-08d70e52e7ae
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1577; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1577:
X-Microsoft-Antispam-PRVS: <DM5PR12MB15770B72922CC7EAC306A987E4C40@DM5PR12MB1577.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-Forefront-PRVS: 01068D0A20
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: M4UeJavVeMQX8rToPJp1eGuFde1QsNjNp5IPWvjMWWxEYquNoouZ3TaKsoRMaSJh8jFNjezMpQcArpwnqDsnmcxEexuV57Md2n4mCbPMOYFPmkFUh51mlks+fDK/MdyMcOdFqvLRHkgY6mpzHddcoCXAMA7ieHTuujVqhL6U4LNvfSA8peuc2gejSNiBON6xMD0pWlVtc1z8MImbHbsifzzu3uGUaZW60cKXpmiSkFxH+xYF68cjqCUK2GMo8ze2K9LLaGYgchKzza467MfOLxASX0T85CGAZpTwolksbuIE01ao0MG+tWNK/IqbVXUzGWmv+/FcoI3blTuTT+aOdVpMSvhoYvnFzpkwF4gkux+hN8sL8jsaTdpEBWDKxYJwByg2bb5JVkwa19GDtoeyIrjCfDwO+ynKleSuVkh5agw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2019 03:15:52.9258 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9762589-7bd1-4a79-0e41-08d70e52e7ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1577
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODHkmY4uerOuBWVjR6VoIGCHMgGIz2zhA+1MASIR4hM=;
 b=HiRXaBoXZBKrnVKnMmeiHKa2DUMgwf6taoFBa4U3mSi5tgOebNWCJ77oL+P0XhUCD7slwW5JUVsfGYYSS5rnAsO+fr41HVx1eNjwIBoIxHlsMcgWixWMAC1Cq280emdL3jxJ8ggpRd9MbxQHa1wOpyBMVQbqk0CKTlMbnWRHk1Q=
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
Cc: Alexander.Deucher@amd.com, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VkNOIGlzIHdpZGVseSB1c2VkIGluIG5ldyBBU0lDcyBhbmQgZGlmZmVyZW50IGZyb20gdHJhbmRp
dGlvbmFsClVWRCBhbmQgVkNFLgoKQ2hhbmdlLUlkOiBJMzVjOWRiNDIwNzM0MDI5ZThmODQ3ZGNk
Y2UyM2RmZjEyMDRkNzBiYwpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9rZ2RfcHBfaW50ZXJmYWNlLmgg
fCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9rZ2RfcHBfaW50ZXJmYWNlLmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2luY2x1ZGUva2dkX3BwX2ludGVyZmFjZS5oCmluZGV4IDk3MzNiYmY5YmM3Mi4uMTU3
ZTg1NDY4NTVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUva2dkX3Bw
X2ludGVyZmFjZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9rZ2RfcHBfaW50
ZXJmYWNlLmgKQEAgLTEyMyw2ICsxMjMsNyBAQCBlbnVtIGFtZF9wcF9zZW5zb3JzIHsKIAlBTURH
UFVfUFBfU0VOU09SX0VOQUJMRURfU01DX0ZFQVRVUkVTX01BU0ssCiAJQU1ER1BVX1BQX1NFTlNP
Ul9NSU5fRkFOX1JQTSwKIAlBTURHUFVfUFBfU0VOU09SX01BWF9GQU5fUlBNLAorCUFNREdQVV9Q
UF9TRU5TT1JfVkNOX1BPV0VSLAogfTsKIAogZW51bSBhbWRfcHBfdGFzayB7Ci0tIAoyLjIyLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
