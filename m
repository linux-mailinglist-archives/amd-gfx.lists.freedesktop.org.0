Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AA6DB74B
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B376EAE0;
	Thu, 17 Oct 2019 19:16:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720064.outbound.protection.outlook.com [40.107.72.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5D86EAD0
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdnEOdz2BNKxPxJntooqYdzYF3E3WKIbt0rRFm6PaQobUyTxCP/5gwYDim2Ygld6Joz3UtC5qEZMAewnSvvssYQYB9pzAhZibJUBFFLybjIqlSsIGQA6lZ6X7/UQjLMkKpaGRweMBZy31H86R0ZFkxH5tbLuEeAmyKhGlHb0gS1uZxJMCTvhsJHs/OO9+3E152LC2MJZ0XJPvm5AUkrG8DFLlFUTl2ioH7WEI39NVyfM8uVEwsdpFWrbFBMi1VYKEP3law3GrI1HFVT3HjLvoIO1TiO5mcESXdDEuDN4LpvTZa2J0dUUmusuS81pNp83VvX2LK8NccbGXT7l9J0aiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vx4knGnxJxfhfnHDdtsKnGC5RJeLxt1gMLgy5iex494=;
 b=jDy1J4uCtvVdT14wYjJg8UQnywS+lSPCnBimjI1LaRx67ba7y9gUK4wu18KuSclki980X+YUQJdbzHuCaDNSUb4XOKAThlt7qL5+zrmsoE96PuYBMpA+Laj+H1htaCOcraSKZUh5XLPI43FSRObEBv6S2rZvUdqJpIqsMfRpB1pHdpkr10yYwu6JeoumCditbGPUmkC9M1oG8kMxMqbZDLKcRsh5Fxa+VyXQMmkVQ8ZKA1tc+yPh36Ey0dqHvg2OCDqTxiOHsyOHV0e8XpgHGp9aIyXNGA56m7XpBBFFJtV5viYGQ/58rSfVZteBUF3inpBXN65yGcR1lwvyQiXJbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0024.namprd12.prod.outlook.com (2603:10b6:408:60::37)
 by DM6PR12MB3994.namprd12.prod.outlook.com (2603:10b6:5:1cd::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19; Thu, 17 Oct
 2019 19:15:56 +0000
Received: from BY2NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by BN8PR12CA0024.outlook.office365.com
 (2603:10b6:408:60::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.23 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT041.mail.protection.outlook.com (10.152.85.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:55 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:54 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:53 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 35/37] drm/amd/display: fix avoid_split for dcn2+ validation
Date: Thu, 17 Oct 2019 15:13:27 -0400
Message-ID: <20191017191329.11857-36-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(428003)(199004)(189003)(6666004)(478600001)(2351001)(316002)(2870700001)(70206006)(5660300002)(4326008)(6916009)(48376002)(86362001)(54906003)(356004)(70586007)(446003)(14444005)(2876002)(8676002)(2906002)(26005)(81156014)(486006)(51416003)(336012)(426003)(50226002)(1076003)(11346002)(8936002)(36756003)(2616005)(47776003)(76176011)(81166006)(476003)(186003)(305945005)(50466002)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3994; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 804c8bf4-fdf5-4e40-8db7-08d753366f2a
X-MS-TrafficTypeDiagnostic: DM6PR12MB3994:
X-Microsoft-Antispam-PRVS: <DM6PR12MB399469A68A0FD11820A8E619826D0@DM6PR12MB3994.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DVsp9nr4iaoJ0ExX1MThb6nJ2X7LwcH3TK+Dqm4IrvINpn7DR8PFRfyMXvjEL+gH8KzNu+DTFx0xgjn9IdQQpDbREld5LXo1mQmuDcx9EiA5snzXIfvVcHRCmPuBHLrNUGkZ3af7a8FnOWZArp4tdVvBgffAFvpBUQ1OWqLIeB4+3QNn2EOQq/XUOsUjT0ynj2xzzjRWo3H/J7KHK4LVEix5XyuHCHLX8fuc1SGI+uuQaLt5uBeTV0q1ybDBKGjwbUTgaipZYhepQRWw+Mvbf9ewfsNcOY5GPqwNoCDPDJxoWEWVVuvsw+KVr8GMS6kYduRRX/1zez+EzkGW1w8VfvsJngIUmfpaRmcleiS3KHddEZpcoUfWaQe5vuiYPFsUm78CD/nTxog7khpj3Doe3gmN6kcJyzavo93XUkh8yaU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:55.3312 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 804c8bf4-fdf5-4e40-8db7-08d753366f2a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3994
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vx4knGnxJxfhfnHDdtsKnGC5RJeLxt1gMLgy5iex494=;
 b=Zx0+65VBpaXbJ5MBcbEws64Z1OEPs7cnH3vmnqqzeS95/t+E2+HeQJ4zmIoypIuA8WsxovnIeTUgsUddfzIN2cF61lC/qMcB7Seek28ZxXJYR6bE0yjgQ8nmk+rCRzjXGB2VdJ0Ba2IWrngdIl/zRZkqENL/oknxYGVDbl3A8q8=
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
 Eric Bernstein <Eric.Bernstein@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCldl
IGFyZSBjdXJyZW50bHkgaW5jb3JyZWN0bHkgcHJvY2Vzc2luZyBhdm9pZCBzcGxpdCBhdCBoaWdo
ZXN0CnZvbHRhZ2UgbGV2ZWwuCgpTaWduZWQtb2ZmLWJ5OiBEbXl0cm8gTGFrdHl1c2hraW4gPERt
eXRyby5MYWt0eXVzaGtpbkBhbWQuY29tPgpSZXZpZXdlZC1ieTogRXJpYyBCZXJuc3RlaW4gPEVy
aWMuQmVybnN0ZWluQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3Vy
Y2UuYyB8IDExICsrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKaW5kZXggYTFiMmRiOGY2ODdhLi4zY2RiNjE3NTA1NzAg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9y
ZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9yZXNvdXJjZS5jCkBAIC0yMzU3LDEwICsyMzU3LDExIEBAIGludCBkY24yMF92YWxpZGF0ZV9h
cHBseV9waXBlX3NwbGl0X2ZsYWdzKAogCQlpbnQgdmxldmVsLAogCQlib29sICpzcGxpdCkKIHsK
LQlpbnQgaSwgcGlwZV9pZHgsIHZsZXZlbF91bnNwbGl0OworCWludCBpLCBwaXBlX2lkeCwgdmxl
dmVsX3NwbGl0OwogCWJvb2wgZm9yY2Vfc3BsaXQgPSBmYWxzZTsKIAlib29sIGF2b2lkX3NwbGl0
ID0gZGMtPmRlYnVnLnBpcGVfc3BsaXRfcG9saWN5ICE9IE1QQ19TUExJVF9EWU5BTUlDOwogCisJ
LyogU2luZ2xlIGRpc3BsYXkgbG9vcCwgZXhpdHMgaWYgdGhlcmUgaXMgbW9yZSB0aGFuIG9uZSBk
aXNwbGF5ICovCiAJZm9yIChpID0gMDsgaSA8IGRjLT5yZXNfcG9vbC0+cGlwZV9jb3VudDsgaSsr
KSB7CiAJCXN0cnVjdCBwaXBlX2N0eCAqcGlwZSA9ICZjb250ZXh0LT5yZXNfY3R4LnBpcGVfY3R4
W2ldOwogCQlib29sIGV4aXRfbG9vcCA9IGZhbHNlOwpAQCAtMjM5MSwyMiArMjM5MiwyNCBAQCBp
bnQgZGNuMjBfdmFsaWRhdGVfYXBwbHlfcGlwZV9zcGxpdF9mbGFncygKIAlpZiAoY29udGV4dC0+
c3RyZWFtX2NvdW50ID4gZGMtPnJlc19wb29sLT5waXBlX2NvdW50IC8gMikKIAkJYXZvaWRfc3Bs
aXQgPSB0cnVlOwogCisJLyogQXZvaWQgc3BsaXQgbG9vcCBsb29rcyBmb3IgbG93ZXN0IHZvbHRh
Z2UgbGV2ZWwgdGhhdCBhbGxvd3MgbW9zdCB1bnNwbGl0IHBpcGVzIHBvc3NpYmxlICovCiAJaWYg
KGF2b2lkX3NwbGl0KSB7CiAJCWZvciAoaSA9IDAsIHBpcGVfaWR4ID0gMDsgaSA8IGRjLT5yZXNf
cG9vbC0+cGlwZV9jb3VudDsgaSsrKSB7CiAJCQlpZiAoIWNvbnRleHQtPnJlc19jdHgucGlwZV9j
dHhbaV0uc3RyZWFtKQogCQkJCWNvbnRpbnVlOwogCi0JCQlmb3IgKHZsZXZlbF91bnNwbGl0ID0g
dmxldmVsOyB2bGV2ZWwgPD0gY29udGV4dC0+YndfY3R4LmRtbC5zb2MubnVtX3N0YXRlczsgdmxl
dmVsKyspCisJCQlmb3IgKHZsZXZlbF9zcGxpdCA9IHZsZXZlbDsgdmxldmVsIDw9IGNvbnRleHQt
PmJ3X2N0eC5kbWwuc29jLm51bV9zdGF0ZXM7IHZsZXZlbCsrKQogCQkJCWlmIChjb250ZXh0LT5i
d19jdHguZG1sLnZiYS5Ob09mRFBQW3ZsZXZlbF1bMF1bcGlwZV9pZHhdID09IDEpCiAJCQkJCWJy
ZWFrOwogCQkJLyogSW1wb3NzaWJsZSB0byBub3Qgc3BsaXQgdGhpcyBwaXBlICovCi0JCQlpZiAo
dmxldmVsID09IGNvbnRleHQtPmJ3X2N0eC5kbWwuc29jLm51bV9zdGF0ZXMpCi0JCQkJdmxldmVs
ID0gdmxldmVsX3Vuc3BsaXQ7CisJCQlpZiAodmxldmVsID4gY29udGV4dC0+YndfY3R4LmRtbC5z
b2MubnVtX3N0YXRlcykKKwkJCQl2bGV2ZWwgPSB2bGV2ZWxfc3BsaXQ7CiAJCQlwaXBlX2lkeCsr
OwogCQl9CiAJCWNvbnRleHQtPmJ3X2N0eC5kbWwudmJhLm1heE1wY0NvbWIgPSAwOwogCX0KIAor
CS8qIFNwbGl0IGxvb3Agc2V0cyB3aGljaCBwaXBlIHNob3VsZCBiZSBzcGxpdCBiYXNlZCBvbiBk
bWwgb3V0cHV0cyBhbmQgZGMgZmxhZ3MgKi8KIAlmb3IgKGkgPSAwLCBwaXBlX2lkeCA9IDA7IGkg
PCBkYy0+cmVzX3Bvb2wtPnBpcGVfY291bnQ7IGkrKykgewogCQlzdHJ1Y3QgcGlwZV9jdHggKnBp
cGUgPSAmY29udGV4dC0+cmVzX2N0eC5waXBlX2N0eFtpXTsKIAotLSAKMi4yMy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
