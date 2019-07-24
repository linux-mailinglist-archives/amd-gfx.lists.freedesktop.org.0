Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFB7732B8
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 17:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B546E5CF;
	Wed, 24 Jul 2019 15:28:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680082.outbound.protection.outlook.com [40.107.68.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4AA6E5CF
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 15:28:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWcUIXdudaN2Ke2u2VCLr2g9NCY+bn2velKALmYDk6Nf1eQQ5h0jEXzgKjT/MxmH3FR1X0ENWLRE8dcfV9oa3V/3MY4QiYrZyKssq8dVov3oYR8VAxJkbGSB71DrgQuRNhR/xdcy1P69ZeAtu3cBXjHJRlz2bKgmbjaDv5TkA/cnxeSK5We/HeKA5Di52qCq9U2tN3qt/sQyrqmuHVkpo48EcXdXtP1VF1LBlAE8ByGnY2PTR5D0k5q41YJ9cEgOeD8qTTWd04zRA5tYTQY1n4eE7zBE0PVb4a4sAIL3X//MvNHC/2W7MlaP15XB91X+CicZax0InBvV5qXvrrsfxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdnr6u+8yZN0uhOlw+W5toGoLgIJW+IJvM1vpeBF+kI=;
 b=VB/3tKYfWkmCO/g8Kx0yHpcDnazn082CXFKR9IF9nuB/DLTaYpnQR0Jw9XSKjEHLppqNGUov7JwtR8YfjnBYR0GMd58xEaZ0b8k5G07UwHd+Jp7+BiTtpIv91VGFsdqhp5+i09sKNKf2vj77qVptqznM8XYBr9YR23D1ewjkuIZRQAkklBTHtWRNq0tbwZIiIjgcDZwXETiIRD2viiLJjdzWY6Dnt7Si8NMaJEg20AzaULRMPRugQbp0ehiZTux2FscqkINWt65QM0x2RkepqKJ4gzaIzJw6WwvkQ4XGfU7dbuGLcWra/18UDCEgF7RPLOJpAUnEMXu93Zm3c1SUDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0118.namprd12.prod.outlook.com (2603:10b6:0:51::14) by
 BN6PR12MB1570.namprd12.prod.outlook.com (2603:10b6:405:5::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 24 Jul 2019 15:28:28 +0000
Received: from DM3NAM03FT035.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by DM3PR12CA0118.outlook.office365.com
 (2603:10b6:0:51::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.12 via Frontend
 Transport; Wed, 24 Jul 2019 15:28:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT035.mail.protection.outlook.com (10.152.82.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Wed, 24 Jul 2019 15:28:27 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Wed, 24 Jul 2019 10:28:26 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 3/4] drm/amdgpu: Add check for USWC support for
 amdgpu_display_supported_domains
Date: Wed, 24 Jul 2019 11:27:45 -0400
Message-ID: <1563982066-21793-4-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563982066-21793-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1563982066-21793-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(39860400002)(2980300002)(428003)(189003)(199004)(81166006)(47776003)(70586007)(81156014)(70206006)(316002)(8936002)(48376002)(36756003)(86362001)(54906003)(14444005)(4326008)(50466002)(44832011)(486006)(16586007)(478600001)(126002)(76176011)(476003)(2351001)(2906002)(7696005)(51416003)(186003)(6916009)(53936002)(5660300002)(68736007)(8676002)(305945005)(53416004)(50226002)(336012)(26005)(2616005)(356004)(6666004)(446003)(11346002)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1570; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba6c44b2-08b0-4bea-2f72-08d7104b936d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1570; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1570:
X-Microsoft-Antispam-PRVS: <BN6PR12MB15707847515BB04EDD061931EAC60@BN6PR12MB1570.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0108A997B2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 0ITXEsiAIibEElRqJHmOkdrL3E5ehYyXFsGy+MhUQQUNJHGDflHW5cEToNYDowZN74NZIe0FAJAaoVmB7Gn0KLIpnmdjF8NhuJONdak0z3tx20a2Vx3WUWEQoy0seIHgXePD9moZJJU0EwjiacxqBqceCCVHYxCsncPfVZVj06k4JLr6OJD3n6ENMrdOV3JlxgY1b/r8wN/3cgdJ/eUmp7oOtBERykBTY8kEPxrhmPKu5OAdRIykDD4EWZeYPzvO78V895FhWKQXXIxz+TFZaFhHotW1FFPMP17u54j48KCW3NEpB75C3Kaudv4pSAAq5eDs1cpcnqjQtwGn3lcSg9X/U0N/A+4ehQrl6syQjVdqsh+Hwf1HZc4TnDT7ioixEZscxhg2nm7KKNANN+MwMpS/uKl2Wvz2QRhXeAcKCLQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2019 15:28:27.7171 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6c44b2-08b0-4bea-2f72-08d7104b936d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1570
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdnr6u+8yZN0uhOlw+W5toGoLgIJW+IJvM1vpeBF+kI=;
 b=JQyyKLap0mqVbyGhjhT0p1G0zlE+Rbxz9ug7+6KGFFZMn/88JMXd0Mkg79T3CGzg9qNJVnqLCLqkxy332kOKKnkkUktJpEbkPqI7AiAO3NXVW1QJGKv3OrUNltneZMncKGXVu5DlFVKTbHe+zHjLsaxmki6o/4jywCthJE+/wow=
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
Cc: Alexander.Deucher@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 hersenxs.wu@amd.com, Christian.Koenig@amd.com, shirish.s@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyB2ZXJpZmllcyB3ZSBkb24ndCBhZGQgR1RUIGFzIGFsbG93ZWQgZG9tbmFpbiBmb3IgQVBV
cyB3aGVuIFVTV0MKaXMgZGlzYWJsZWQuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNr
eSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGlzcGxheS5jIHwgOSArKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rpc3BsYXkuYwppbmRleCA3NjdlZTY5OS4uY2FjOTk3NSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXkuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jCkBAIC00OTgsOCArNDk4LDE1IEBAIHVp
bnQzMl90IGFtZGdwdV9kaXNwbGF5X3N1cHBvcnRlZF9kb21haW5zKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQogCXVpbnQzMl90IGRvbWFpbiA9IEFNREdQVV9HRU1fRE9NQUlOX1ZSQU07CiAK
ICNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDKQorCS8qCisJICogaWYgYW1kZ3B1X2JvX3Zh
bGlkYXRlX3Vzd2MgcmV0dXJucyBmYWxzZSBpdCBtZWFucyB0aGF0IFVTV0MgbWFwcGluZ3MKKwkg
KiBpcyBub3Qgc3VwcG9ydGVkIGZvciB0aGlzIGJvYXJkLiBCdXQgdGhpcyBtYXBwaW5nIGlzIHJl
cXVpcmVkCisJICogdG8gYXZvaWQgaGFuZyBjYXVzZWQgYnkgcGxhY2VtZW50IG9mIHNjYW5vdXQg
Qk8gaW4gR1RUIG9uIGNlcnRhaW4KKwkgKiBBUFVzLiBTbyBmb3JjZSB0aGUgQk8gcGxhY2VtZW50
IHRvIFZSQU0gaW4gY2FzZSB0aGlzIGFyY2hpdGVjdHVyZQorCSAqIHdpbGwgbm90IGFsbG93IFVT
V0MgbWFwcGluZ3MuCisJICovCiAJaWYgKGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX0NBUlJJWk8g
JiYgYWRldi0+YXNpY190eXBlIDwgQ0hJUF9SQVZFTiAmJgotCSAgICBhZGV2LT5mbGFncyAmIEFN
RF9JU19BUFUgJiYKKwkgICAgYWRldi0+ZmxhZ3MgJiBBTURfSVNfQVBVICYmIGFtZGdwdV9ib19z
dXBwb3J0X3Vzd2MoMCkgJiYKIAkgICAgYW1kZ3B1X2RldmljZV9hc2ljX2hhc19kY19zdXBwb3J0
KGFkZXYtPmFzaWNfdHlwZSkpCiAJCWRvbWFpbiB8PSBBTURHUFVfR0VNX0RPTUFJTl9HVFQ7CiAj
ZW5kaWYKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
