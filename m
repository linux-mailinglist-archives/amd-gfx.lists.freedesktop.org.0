Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA31DE58D
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Oct 2019 09:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE9F89ABA;
	Mon, 21 Oct 2019 07:53:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E02C89ABA
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Oct 2019 07:53:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eO25YxnJfXR2mQE3GN9zkwTbF9Pj6VxPPk7c/goBOwzwX8vhQ+BUVX1DyqCiq3AAoLN0KnwA37aDCVNg/peD8sWEVEhyMFn1Sc2kJ9DpKSH3pXvdL1YVaJEM0dxjZ5G5UUYuWOFCqdYTTgLCZjpu+7jzyPsnrNX3vnKCtj22D5NytA6hY3pHQ+tkLEA+EHjhq6+ndr0G+37vKzQvRZySiIdhjr3z3QMUty+XT4JQRY8gUGo0aiAEXdnicjIOALj4vLQkVmhRI3IH+cnZilkKoCVCfmrseBP+xvZzHxuWJPOkZl7C4NFWj3yDE4Qo4SZcC+8w6vn+1Yn337YnMIJ+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcd6VTgmJeRHcYZEBXZ33lkIRSu3BwyHHk5n+k/WkaI=;
 b=AfNCqJkKLEOC53tSTFMvz1cWto/zvvr3N2euL3wS0pKY7Wd9DRUjgUFXPhUdQyKW7VzGcEnWszIrOQ4JCA6JrVuy5YkRvlsR3CFuKXppSqrKIjddsBU88g5XhItEIm3/FArBtV7Y6wziC6jByAnFU9BSK9TNWyyExXsmMC4kvI4zyTKXoacofvkscWpzT25uFMgJFC4YtweBcgBz9VAZXyBz+OOTwg+JxcQUIy+3qR/hpecBMAwfY8Z3WuLtNWDQK0t6TpAMfCw+zPVQSrGMJ4uJC9bloKJ9IUxKUAQjta+00mI7bZ15vF7J3hbcgoLdmYpBWud1j2wbXBD/NeNGMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0065.namprd12.prod.outlook.com (2603:10b6:0:56::33) by
 DM6PR12MB4220.namprd12.prod.outlook.com (2603:10b6:5:21d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Mon, 21 Oct 2019 07:53:25 +0000
Received: from DM3NAM03FT021.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by DM3PR12CA0065.outlook.office365.com
 (2603:10b6:0:56::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2367.20 via Frontend
 Transport; Mon, 21 Oct 2019 07:53:25 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM3NAM03FT021.mail.protection.outlook.com (10.152.82.187) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2367.14 via Frontend Transport; Mon, 21 Oct 2019 07:53:25 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 21 Oct
 2019 02:53:24 -0500
Received: from swae-HP-ProBook-455R-G6.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 21 Oct 2019 02:53:23 -0500
From: Louis Li <Ching-shih.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] UPSTREAM: drm/amd/display: Fix Apple dongle cannot be
 successfully detected
Date: Mon, 21 Oct 2019 15:54:39 +0800
Message-ID: <20191021075439.1066-1-Ching-shih.Li@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(376002)(346002)(428003)(47660400002)(199004)(189003)(8936002)(81166006)(50466002)(81156014)(51416003)(6916009)(50226002)(6666004)(356004)(14444005)(478600001)(1076003)(486006)(8676002)(26005)(2616005)(53416004)(476003)(4326008)(305945005)(2351001)(54906003)(186003)(86362001)(126002)(36756003)(2870700001)(48376002)(70206006)(426003)(70586007)(5660300002)(7696005)(47776003)(316002)(2906002)(336012)(46800400005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4220; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0659c7cb-e173-4335-30d0-08d755fbc0c0
X-MS-TrafficTypeDiagnostic: DM6PR12MB4220:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4220B7DF5A05245D3637A93CAA690@DM6PR12MB4220.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0197AFBD92
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3448w0/sBbCriEZ3+ex9EV57s5fT/9MhTczae0TwUUhiz6XrGtmyngEzEZwZSWpkSfdea/xovgUAclGV6+eX8ZcEEHgGvueheCHCKgq6jf9N1Gm3r5r1elGxOxm5Umx1iRpk/BFE0+ESP+zrtWeTa2xuMK7jT1RXh0v6x+a+KV99crBw7cGCvegDuwMXHXC5KfBopBZeddPa4z0QquOXxcLyUzMH+X5+o6cowu/D2SjAK3hrvbptiFZsbaVZZcUtJ7N7r2s47BeVfkg0gXLby3wttp+l6qGvEo/DAhNzus+J8kpUvZC2YizV6CO6v0BBDhHlJn2XLLN0AX4gqoVJyO2rNx9XRtz/neRQfgez9jwcH8nGl4mpeBn+3B4hfG3C9njb37YyIPXo8/5nJ+HObCvDLFkRV8CJ2PMDB1W2xIB43Dj4KYRC8e1lwoqiNzji
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 07:53:25.4337 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0659c7cb-e173-4335-30d0-08d755fbc0c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4220
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcd6VTgmJeRHcYZEBXZ33lkIRSu3BwyHHk5n+k/WkaI=;
 b=OLbezN6yRKPXHL7mWJ61unCKdsklwssMCg0t8ugjAzuSryxCg9CojsJ+jz7lldSNMbhlW3f1jsatUoNqfYm1Scuci0qhXuXuv2MrTFCjUu8tdUttT2l+yiUOI/6bg0U5W7n1TwIV0IQlNUcNC/vTowEM+mrKdcHxXj0VEu5G3pY=
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
Cc: Harry.Wentland@amd.com, Nicholas.Kazlauskas@amd.com,
 Louis Li <Ching-shih.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KRXh0ZXJuYWwgbW9uaXRvciBjYW5ub3QgYmUgZGlzcGxheWVkIGNvbnNpc3RlbnRseSwg
aWYgY29ubmVjdGluZwp2aWEgdGhpcyBBcHBsZSBkb25nbGUgKEExNjIxLCBVU0IgVHlwZS1DIHRv
IEhETUkpLgpCeSBleHBlcmltZW50cywgaXQgaXMgY29uZmlybWVkIHRoYXQgdGhlIGRvbmdsZSBu
ZWVkcyAyMDBtcyBhdCBsZWFzdAp0byBiZSByZWFkeSBmb3IgY29tbXVuaWNhdGlvbiwgYWZ0ZXIg
aXQgc2V0cyBIUEQgc2lnbmFsIGhpZ2guCgpbSG93XQpXaGVuIHJlY2VpdmluZyBIUEQgSVJRLCBk
ZWxheSA1MDBtcyBhdCB0aGUgYmVnaW5uaW5nIG9mIGhhbmRsZV9ocGRfaXJxKCkuClRoZW4gcnVu
IHRoZSBvcmlnaW5hbCBwcm9jZWR1cmUuCldpdGggdGhpcyBwYXRjaCBhcHBsaWVkLCB0aGUgcHJv
YmxlbSBjYW5ub3QgYmUgcmVwcm9kdWNlZC4KV2l0aCBvdGhlciBkb25nbGVzLCB0ZXN0IHJlc3Vs
dHMgYXJlIFBBU1MuClRlc3QgcmVzdWx0IGlzIFBBU1MgYWZ0ZXIgc3lzdGVtIHJlc3VtZXMgZnJv
bSBzdXNwZW5kLgoKU2lnbmVkLW9mZi1ieTogTG91aXMgTGkgPENoaW5nLXNoaWguTGlAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
IHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IDBhZWY5
MmI3YzAzNy4uMDQzZGRhYzczODYyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTEwMjUsNiArMTAyNSwxMSBAQCBzdGF0aWMg
dm9pZCBoYW5kbGVfaHBkX2lycSh2b2lkICpwYXJhbSkKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
ID0gY29ubmVjdG9yLT5kZXY7CiAJZW51bSBkY19jb25uZWN0aW9uX3R5cGUgbmV3X2Nvbm5lY3Rp
b25fdHlwZSA9IGRjX2Nvbm5lY3Rpb25fbm9uZTsKIAorICAgIC8qIFNvbWUgbW9uaXRvcnMvZG9u
Z2xlcyBuZWVkIGFyb3VuZCAyMDBtcyB0byBiZSByZWFkeSBmb3IgY29tbXVuaWNhdGlvbgorICAg
ICAqIGFmdGVyIHRoZXkgZHJpdmUgSFBEIHNpZ25hbCBoaWdoLgorICAgICAqLworICAgIG1kZWxh
eSg1MDApOworCiAJLyogSW4gY2FzZSBvZiBmYWlsdXJlIG9yIE1TVCBubyBuZWVkIHRvIHVwZGF0
ZSBjb25uZWN0b3Igc3RhdHVzIG9yIG5vdGlmeSB0aGUgT1MKIAkgKiBzaW5jZSAoZm9yIE1TVCBj
YXNlKSBNU1QgZG9lcyB0aGlzIGluIGl0J3Mgb3duIGNvbnRleHQuCiAJICovCi0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
