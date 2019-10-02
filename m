Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 645D3C9080
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFD36E19A;
	Wed,  2 Oct 2019 18:16:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680073.outbound.protection.outlook.com [40.107.68.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B6A6E15C
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ff/n6Fm/W7sj52fzCbuXfR0qKCjrKf71oRnPxkIIKSdtY9sqSUYOJipW7EfDjgxP6dkUiDI5qGTy01xpJLlFj1iB9Ydbo+ap07NP5XBrGy9U5lcFJecK/p+bROizBoHlMo+QGgps89Xdgjlpmg9ir8zjUV8Ga2b+AJ1Itsf53ysUlkGrwzyzuRNBwqSh5isvJNiO+bPvOXy0qmI5abVpcbiOA0EVCEBERGUug3qeWYomzDQvYL8g0UVdoFC4BPDKGP9MnWVXdJkMWNUli1k28HkN3vqw4swmwc5U7p9OhCixUnMi3I8Ak8zIvjYiJWchThf4ulZBmH9lzDAE4aq6aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NhKKZkpDYGLy/X5+TaOz9eJ6PgSq/FYGzlTUS+LRNA=;
 b=UxgTZtkzFBGrnY2YyE8vxU6Yxg82Ul2TcyXduNAhVjynVPcZeHAQWXspgBZDJJxmQHduw3hyRQOwcqy4k3OVLCN3rc2VXPJ8VPbP9Tb4NqwNzdFezAZxTEU2mtUs+XknR3L+7c0gfpR+ZL89DhL9uCNHSg+CNrLUXHRHT3ePG1vFG0mYslunGikycSt/ZneGC0FYd8DUtt8YQcWnsTGs9Rzc/vikXdhxFWihLs5VRPMYPuTs0UgllFLD9m+VzJnBMaGnzNqfPD8uUSwQdMu6hF/0ccXFPhnhI3S3B6zW9a77/8tOmraZbP4QU95prKAAN7wKZzeitbHcLsHHuHQsBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0125.namprd12.prod.outlook.com (2603:10b6:0:51::21) by
 BY5PR12MB4065.namprd12.prod.outlook.com (2603:10b6:a03:202::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Wed, 2 Oct
 2019 18:16:39 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by DM3PR12CA0125.outlook.office365.com
 (2603:10b6:0:51::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:39 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:39 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:37 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 07/38] drm/amd/display: fix pipe re-assignment when odm present
Date: Wed, 2 Oct 2019 14:16:02 -0400
Message-ID: <20191002181633.22805-8-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(346002)(136003)(428003)(199004)(189003)(2616005)(486006)(1076003)(70586007)(426003)(446003)(336012)(53416004)(305945005)(50466002)(8676002)(70206006)(81166006)(81156014)(11346002)(5660300002)(36756003)(126002)(476003)(6916009)(6666004)(356004)(14444005)(478600001)(186003)(26005)(2351001)(316002)(7696005)(51416003)(48376002)(2906002)(50226002)(86362001)(8936002)(16586007)(47776003)(4326008)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4065; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ec5ac3e-f029-4a3c-7e52-08d74764ab5c
X-MS-TrafficTypeDiagnostic: BY5PR12MB4065:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4065342F0ED1AF853DC16960F99C0@BY5PR12MB4065.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h9xE7aDjdClSBbhHk10U3swLgSFTVebTC3i3jDRxTDyLXopVF6DPPCSHTXnH84RPcCEsECQU8UL2WggnGddwwd8ti+RrkZwj0qEezG8JDNszaYTdxhZzVWVwMg/mWo9Lw06o/+1RwOX0Y50d7l4o5T5ZrAgEbZtNDuPN9c2CYqAkF9hv9GQu+GFMRkJ1q1niC9QBE2q1jxpYUS5sVEetUwvwXQDzF2nhNdU7C5Xw5DsE3FzOT9SMJFO4puqe09q39rPkQdA1HyrycQXQXLuoKqKbO2LEgU20O+AtwCQhM9Nu6p68ihV4EyKQgdrWjw0jjdPtkufIo+QVwmj3qUC2/H5s+gkZsxpzZG+VmjgeoF6CyIh6ZX4ISjFGQv2wNx2JbkBNzZ6gsBsaY91br/NuwmHzpE7ewkPPMBzUxE1KQyU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:39.2420 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec5ac3e-f029-4a3c-7e52-08d74764ab5c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4065
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NhKKZkpDYGLy/X5+TaOz9eJ6PgSq/FYGzlTUS+LRNA=;
 b=ETs6hjS+uHeJyU9ATjvZrUOYTpoA2uN5ywRmlMjPAhuRmXMAUrMPkPB9whdJuWR27FOjPCE7axgc2GJQvKpVBPAb9lkloEMHo55EUxP3zYW5quHGSWVKHHPphCCWbgpqju9CGMKBfNH4SrcVmmMw0dTkQO47F6VLxe0zEIIWUc8=
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
Cc: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCkN1
cnJlbnRseSBwaXBlIHNwbGl0IG1heSBzdGVhbCBhbiBleGlzdGluZyBPRE0gcGlwZSBkZXBlbmRp
bmcgb24gc3RyZWFtCnNlcXVlbmNlLiBUaGlzIGNoYW5nZSBwcmV2ZW50cyB0aGF0IGZyb20gaGFw
cGVuaW5nIGFzIGVhc2lseS4KCkNoYW5nZS1JZDogSTJlNjA0ODk0YWFlZjJjNzgyMjg0ZmNjMTJk
NGU5YTczODFjZjZlYWIKU2lnbmVkLW9mZi1ieTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8u
TGFrdHl1c2hraW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEdhcnkgS2F0dGFuIDxHYXJ5LkthdHRh
bkBhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hh
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X3Jlc291cmNlLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24yMC9kY24yMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX3Jlc291cmNlLmMKaW5kZXggZjU3YzY4NjM5OGZlLi5hZjBlMGQxYmUxNDcgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNv
dXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9y
ZXNvdXJjZS5jCkBAIC0yMjAxLDcgKzIyMDEsOCBAQCBzdGF0aWMgc3RydWN0IHBpcGVfY3R4ICpk
Y24yMF9maW5kX3NlY29uZGFyeV9waXBlKHN0cnVjdCBkYyAqZGMsCiAJCSAqLwogCQlpZiAoc2Vj
b25kYXJ5X3BpcGUgPT0gTlVMTCkgewogCQkJZm9yIChqID0gZGMtPnJlc19wb29sLT5waXBlX2Nv
dW50IC0gMTsgaiA+PSAwOyBqLS0pIHsKLQkJCQlpZiAoZGMtPmN1cnJlbnRfc3RhdGUtPnJlc19j
dHgucGlwZV9jdHhbal0udG9wX3BpcGUgPT0gTlVMTCkgeworCQkJCWlmIChkYy0+Y3VycmVudF9z
dGF0ZS0+cmVzX2N0eC5waXBlX2N0eFtqXS50b3BfcGlwZSA9PSBOVUxMCisJCQkJCQkmJiBkYy0+
Y3VycmVudF9zdGF0ZS0+cmVzX2N0eC5waXBlX2N0eFtqXS5wcmV2X29kbV9waXBlID09IE5VTEwp
IHsKIAkJCQkJcHJlZmVycmVkX3BpcGVfaWR4ID0gajsKIAogCQkJCQlpZiAocmVzX2N0eC0+cGlw
ZV9jdHhbcHJlZmVycmVkX3BpcGVfaWR4XS5zdHJlYW0gPT0gTlVMTCkgewotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
