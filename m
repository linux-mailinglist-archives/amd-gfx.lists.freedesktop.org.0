Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3489682CE4
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 09:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A081F6E311;
	Tue,  6 Aug 2019 07:37:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820055.outbound.protection.outlook.com [40.107.82.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878D46E311
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 07:37:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZF4Euozm+vVt3NKg7Yl562LTv9biOJe5YUrPHKVIFVVweil2daxe9iXE36GyBfxhqVaWtmrzBV61AdYDfNMefVrH3ql6T374M0N0dabQ79nrWjvFUxGVCMnwaylYRCpoyKrKAfK2chOLrQUv6r3l97qyj9CFr+BRLxIcxl1uu/n/0EkkbK7DFOBNqmyKG4q2NArJvuyqvPB+bdydlIaBfYTbOmUgVhWgqaiv8H3YFBmMuxIR6rlcleLygmdCK+hagzzY0eYyw3s5aGIghAfl/3xa3z13THS5GO4pvpaIK5xvAgzoC45RRrWYMfJHUgdkp4LqnpCBWy3YgIalmpSu8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVoYVM6kuJ/EBfqHuG2RpLHt1iupCQuaVf36uJFXsRg=;
 b=TeUFIFNFRkMDko5fSLra5ubH9qXq01m+j8+h50Niin2QsVGa2k+nR7sTpdLxw+hP29rBGw9nRPLnpOOvbGTzKGh5W0Hcj47n11HAV3gaq2QgI7oz0/zr/jzoPGwbF8ryKWDy6Mj4PdvV88SS+oK8glWDKoUcQRR1rQyJWq+4FofsRMltvAdXp9ElR824mmSeyqBZaWpomqHo3WiWKmJFTEubMiVgZmpcHpSj9WV63prybAcaWlELtX6qL+t7gBdSBcUWui8qwk/Yc1xekpAxBarTc91SE8S6aPkBSMBIEbGqCCFK69+ySzd26sF3iG8i350b1PGrlO0owLdsBuJ2tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN8PR12CA0002.namprd12.prod.outlook.com (2603:10b6:408:60::15)
 by DM5PR1201MB0155.namprd12.prod.outlook.com (2603:10b6:4:55::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.17; Tue, 6 Aug
 2019 07:37:13 +0000
Received: from DM3NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by BN8PR12CA0002.outlook.office365.com
 (2603:10b6:408:60::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.14 via Frontend
 Transport; Tue, 6 Aug 2019 07:37:13 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT041.mail.protection.outlook.com (10.152.83.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Tue, 6 Aug 2019 07:37:13 +0000
Received: from guchchen-System-Product-Name.amd.com (10.34.1.3) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server (TLS) id
 14.3.389.1; Tue, 6 Aug 2019 02:36:55 -0500
From: Guchun Chen <guchun.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Hawking.Zhang@amd.com>,
 <Dennis.Li@amd.com>, <Xinhui.Pan@amd.com>, <Tao.Zhou1@amd.com>
Subject: [PATCH libdrm 0/3] add ras eject test for gfx and umc module
Date: Tue, 6 Aug 2019 15:36:26 +0800
Message-ID: <20190806073629.10976-1-guchun.chen@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(39860400002)(376002)(2980300002)(428003)(189003)(199004)(4744005)(53936002)(4326008)(336012)(51416003)(7696005)(26005)(36756003)(2201001)(68736007)(186003)(478600001)(47776003)(5660300002)(1076003)(53416004)(305945005)(110136005)(2906002)(486006)(50226002)(2616005)(356004)(6666004)(6636002)(316002)(8676002)(8936002)(70206006)(70586007)(44832011)(16586007)(81156014)(48376002)(86362001)(81166006)(476003)(50466002)(426003)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0155; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b84d171-ee53-4d58-f2cb-08d71a40e5d7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR1201MB0155; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0155:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB015549F3D0C119AC46B9BF98F1D50@DM5PR1201MB0155.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-Forefront-PRVS: 0121F24F22
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Lr/4bTxWbl7KEJs/yCWo2HBH5+Yr9FyM783K256S4KCzBNhSeBXDp1inmJZp2UeIwSzsLXVu1ht3pLyjikD1lGvoLB4tRFIrjW2kgC4dCTsSgKXp4LkSG7DqWywmDDheGmC1KjKE+Qb77sNNdlAJwiK36n9YcZGU5SP13hBQl1rTyNMw9HLH8pX1AC+vO3pdeZnDoqSKQnUYtlOZjoNkJkpQMa2I6Jy0wWhFR+3MXOTGiUl0QE08p3wVg2M1hXfgequ0tP5nrU4W0nWtSZVnEvp/ZwXAgoJYi+/77eoZkrbOicdG4R5IbCUdxC1PwAiI5gPFwVm1+objZjON/PRUg4kttzvFqzYdSjt98HgoZMDwdwVSMEvzT+xvov/HRW6398i0Vh9NHp4QRag+spxM1LKrnoSx11+o88kYFGuI63s=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2019 07:37:13.0867 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b84d171-ee53-4d58-f2cb-08d71a40e5d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0155
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVoYVM6kuJ/EBfqHuG2RpLHt1iupCQuaVf36uJFXsRg=;
 b=PuIz5SB7DcAyfxlvvKoiX+Cs0dE8nvqEX9QjyBoMAMfmSkGQKsRweIjSty01x/FUgdqpv+TXSrXkGBbfYr8czwtyWHR/f/eb8Ds55WunAZjKM5TZ3LYVTLy09nFjFOku7nYWAahWldP0p+ymGNHG+C6yGGXaZg9/WiwTBId1ICU=
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
Cc: Guchun Chen <guchun.chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlc2UgcGF0Y2hlcyBhcmUgdG8gc3VwcG9ydCByYXMgZWplY3QgdGVzdCBmb3IgZ2Z4IGFuZCB1
bWMKbW9kdWxlcy4KCkd1Y2h1biBDaGVuICgzKToKICBhbWRncHU6IGFkZCBnZnggcmFzIGVqZWN0
IGNvbmZpZ3VyYXRpb24gZmlsZQogIHRlc3RzL2FtZGdwdS9yYXM6IHJlZmluZSByYXMgZWplY3Qg
dGVzdAogIGFtZGdwdTogYWRkIHVtYyByYXMgZWplY3QgdGVzdCBjb25maWd1cmF0aW9uCgogY29u
ZmlndXJlLmFjICAgICAgICAgICAgIHwgIDE4ICsrCiBkYXRhL2FtZGdwdV9yYXMuanNvbiAgICAg
fCAyNjAgKysrKysrKysrKysrKysrKysrKysKIG1lc29uLmJ1aWxkICAgICAgICAgICAgICB8ICAg
MSArCiB0ZXN0cy9hbWRncHUvTWFrZWZpbGUuYW0gfCAgIDUgKy0KIHRlc3RzL2FtZGdwdS9tZXNv
bi5idWlsZCB8ICAxNiArLQogdGVzdHMvYW1kZ3B1L3Jhc190ZXN0cy5jIHwgNTIwICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQogNiBmaWxlcyBjaGFuZ2VkLCA3NjkgaW5z
ZXJ0aW9ucygrKSwgNTEgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZGF0YS9hbWRn
cHVfcmFzLmpzb24KCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
