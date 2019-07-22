Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BDD6F9DA
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 08:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401D089ABA;
	Mon, 22 Jul 2019 06:59:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A8689ABA
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 06:59:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfuWsvp74wGkBu0Q80T8qB7VpXnqL+iCUe1b1OqVanykwcSgBNxkimw9OP3n6IMYWshV1SfBSWuwMbPdWwfBhT5OHQ4yQ+ACb84vopc8NntT39xC2Gx2FhPi9sORAnKzzU9HBn0bjt6L2tfQYXDsLyZnRlycg/x4Tgh1B9VfitjCiLDTTu7RNPrrMQc5nCCJidaicwAS9oPMBLNhunoV7iduXn6Yn/0TJni1vM/5HVaGhXg+xVu4cHj6S0GNrt02+Pkk/D2ktQsKrdlRSbnD85V8eCVfL3qr1RXFJu+z4Ww3uPCLDUINPQHQkY6CFtkbdKtCkSrQfXdUfHjaGfvZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1XW/S65aTvBC5uFQDndnAxd9pna73hPttDAHqV+unU=;
 b=Bk/kMVhUo0A3m8WCdvawP8MNQX6m/IdXe42TTHWviwZmKEUFLdaMwDbzCmG/JYaIryh1OKA3V+c2IRWxCW007iDUQYcEax9Q5zSffmNlROcRxzJsJjLiwp+o8rur5qwzCLy0XXh4CWtv4pXruJyMpQ8tnyCjhPrl0I/ZULsnqhigPEsju1trQRWF02pymTrxiieNBmb6APVFbr5IORhABenSwLj0I5lA5KzmCc9u2bAhfCm/NzKVNXJ6KJHkI0Fxy8msouJMt+YYQcE8i7SGYpx4OLSfSL++IhdVRkj4EANLfZ6cpFwlTUC2xs0cBiQ65hUwNl75Z+wB1+l+U0zHmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0021.namprd12.prod.outlook.com
 (2603:10b6:910:16::31) by BN6PR12MB1300.namprd12.prod.outlook.com
 (2603:10b6:404:1a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Mon, 22 Jul
 2019 06:59:49 +0000
Received: from DM3NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by CY4PR1201CA0021.outlook.office365.com
 (2603:10b6:910:16::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.12 via Frontend
 Transport; Mon, 22 Jul 2019 06:59:49 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT032.mail.protection.outlook.com (10.152.82.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 22 Jul 2019 06:59:48 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Mon, 22 Jul 2019
 01:59:46 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: add new sensor type for VCN powergate
 status V2
Date: Mon, 22 Jul 2019 14:59:34 +0800
Message-ID: <20190722065934.21608-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(70586007)(1076003)(2870700001)(426003)(70206006)(126002)(2906002)(48376002)(305945005)(5660300002)(336012)(356004)(6666004)(4744005)(86362001)(186003)(81166006)(81156014)(2351001)(6916009)(53416004)(47776003)(8936002)(486006)(26005)(8676002)(44832011)(316002)(36756003)(50466002)(2616005)(478600001)(476003)(68736007)(53936002)(54906003)(51416003)(50226002)(4326008)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1300; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0be0b466-69a9-4d75-fe81-08d70e722fb7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1300; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1300:
X-Microsoft-Antispam-PRVS: <BN6PR12MB13000FE41EE0254B08D3C787E4C40@BN6PR12MB1300.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-Forefront-PRVS: 01068D0A20
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: TQIAzBP9Ma2zKpjSCU5iy2sw2sc5AwwEzqDGqDrTH9o7xkVIkt6tbduyrfej8zrevQd3eVgC2wCPOi8Y61x2wK+5Uc4slOe6GNKBE1d1wodpDTO9CwOGYR/+V5jgV85TS0KtY0n4iI0aaxShtgx3LUiA6pfroGTTQ9DzToHfcC21bBLH+1SqvN78gQokrxuYLPtcAIDiAFeh0ZyMR0KMY5fWa17okK01eJIdzkK7WB431VrZHaFW6EEKPt6cmUdW0kTQ8G0pEkb3PtL9fYN+om8yqmPiiYX2Ja4afk7CVBxDdIEPpHR9+KidjIO5GCxvRCd1Fz8lMMUJMXcXx64FOcYffQl7pvmODMXX68u+sLw0BzHtPtsGuL7xX/mPxAAKxcxKh0BOE6UKv/5zJSv18BaYyUj5byzjtJ9yuCriisw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2019 06:59:48.1775 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be0b466-69a9-4d75-fe81-08d70e722fb7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1300
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1XW/S65aTvBC5uFQDndnAxd9pna73hPttDAHqV+unU=;
 b=qSEbTfS/QdEgyECpvrX6Q4a9Z090go//9wYHCKAEuwyU/fUHwxl+4LE9EoDYZICMCPil75UORZA9WHEdiAwldt2Mxhx9RVwLKtAmffO/4JBxa79qrnvsQFw7/g5ZtXrGMyV6t+oRW2xuyhG6WPRbjksh+dYD8dkB75mNvUmuyX8=
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
Cc: Evan Quan <evan.quan@amd.com>, kenneth.feng@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VkNOIGlzIHdpZGVseSB1c2VkIGluIG5ldyBBU0lDcyBhbmQgZGlmZmVyZW50IGZyb20gdHJhbmRp
dGlvbmFsClVWRCBhbmQgVkNFLgoKVjI6IGEgYmV0dGVyIG5hbWluZwoKQ2hhbmdlLUlkOiBJMzVj
OWRiNDIwNzM0MDI5ZThmODQ3ZGNkY2UyM2RmZjEyMDRkNzBiYwpTaWduZWQtb2ZmLWJ5OiBFdmFu
IFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVk
ZS9rZ2RfcHBfaW50ZXJmYWNlLmggfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9rZ2RfcHBfaW50ZXJm
YWNlLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUva2dkX3BwX2ludGVyZmFjZS5oCmlu
ZGV4IDk3MzNiYmY5YmM3Mi4uYTAyZmRlZTg4MWQzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2luY2x1ZGUva2dkX3BwX2ludGVyZmFjZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvaW5jbHVkZS9rZ2RfcHBfaW50ZXJmYWNlLmgKQEAgLTEyMyw2ICsxMjMsNyBAQCBlbnVtIGFt
ZF9wcF9zZW5zb3JzIHsKIAlBTURHUFVfUFBfU0VOU09SX0VOQUJMRURfU01DX0ZFQVRVUkVTX01B
U0ssCiAJQU1ER1BVX1BQX1NFTlNPUl9NSU5fRkFOX1JQTSwKIAlBTURHUFVfUFBfU0VOU09SX01B
WF9GQU5fUlBNLAorCUFNREdQVV9QUF9TRU5TT1JfVkNOX1BPV0VSX1NUQVRFLAogfTsKIAogZW51
bSBhbWRfcHBfdGFzayB7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
