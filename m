Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC6D92703
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7606E175;
	Mon, 19 Aug 2019 14:36:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820051.outbound.protection.outlook.com [40.107.82.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B5F6E15A
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:36:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMTqCy+azUKUR5Z4KYzysAl51d4VGPH4UTKtt2FLq8gO4YnjpHsf+JvhDyg9ZlIv4rwQZ1rMc3Qgf1APWgktwhLV8D7IFWJIDSlSU636q/RHWqFVU33o39G7atbWE+h8rdB2hLTLDuRoYSm/QJeh7cJo3U1ZFaVPrk/57Msy3OhQlv94DEWvv9i/4F/m5BTw06QpylkkIo2VJDi3/Jh2lgySzemnF5zXeXiMyCsyGSoFYZgD/qQ0BxdgTT8Tx9mNGp43ZalOfRDZykqACJyGnuvB1dwoXtjnJQe53++GmziUEcs+7WQaI0+O0Ek1+EeFGhO64y9jzoEFTJnBVHJSRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4jp+YaG4kPVY/dZs6orZSFReORMsm59s1GjqCDvVm4=;
 b=V5CmelukfvURyazIcTY92Zd9BFuFSIo2AKa7e2KBksBYxjWBTo3YUflf5+5hTaGO4wj2Ux4XpFeCWUpFKFuCJOLhy94gQV0IIB8HWr1Ht0lm5BqRPMggOw0lU5EodSZlkXHP24A3ge4P2YjNz+FgLvWO2aCqapxQVKqpVFEJ8WR1dyCWKEb2GbEwHHK18+5gBHEhvyoMBRh9pPzTRWbXvzjNDvwu39xb3W8aoKIL6c965VwkV4apPde1IrOqcbAcV8HgOzPbZAotWpcKo+vzxOffm8C/C/zKy8YgtldjG8UCo4k7dxJE30u6G4CoQc2MdIADi7lv2ry9d1HW3XVRoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0029.namprd12.prod.outlook.com (2603:10b6:405:70::15)
 by CY4PR12MB1272.namprd12.prod.outlook.com (2603:10b6:903:3e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Mon, 19 Aug
 2019 14:36:02 +0000
Received: from BY2NAM03FT016.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by BN6PR12CA0029.outlook.office365.com
 (2603:10b6:405:70::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:36:01 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT016.mail.protection.outlook.com (10.152.84.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:36:01 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:48 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 28/36] drm/amd/display: set av_mute in hw_init for HDMI
Date: Mon, 19 Aug 2019 10:35:07 -0400
Message-ID: <20190819143515.21653-29-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(2980300002)(428003)(199004)(189003)(53416004)(5660300002)(48376002)(305945005)(478600001)(186003)(7696005)(76176011)(51416003)(8936002)(81166006)(1076003)(2351001)(26005)(476003)(2616005)(11346002)(86362001)(126002)(446003)(486006)(4326008)(50466002)(6916009)(47776003)(336012)(426003)(70206006)(70586007)(6666004)(356004)(53936002)(316002)(36756003)(16586007)(8676002)(81156014)(2906002)(50226002)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1272; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c3a279b-8cd2-4368-d81f-08d724b28eb9
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1272; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1272:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1272FE270C900CE12ED41D70F9A80@CY4PR12MB1272.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: QII5s0sRu2SR+6WWaq+zwPk8w6cYXAGxHmL/nD83XxRdZFIB2zwghoJJaDfrknYfutokl3uVL6lRUYoChFZxwCPzW5fg5XN3yS/75m6TTqMH8KUG9sX8tqzIoqy06AUMluXyhwkp5afAVsTYpamaF45uxey0CbMu3rOrCH+u5f4YRaLHBA4UJR31HB9zvWOSVP24cEiKWZ3AyIO+SHy3zfpOTXCnMrjC7v4uGYhAjsTuQ1SZmp9EyI/xXiZZfvSADP7RDTDOVjZ68UvQ84VnxWsjtHEtvlu0k4BndEBf5BbvTuy9Nsru3dqTVl43gq6rrhz4iFgmq8CPYUA0Xw6qbr9uldWFva86OuBTkaJH6DN0xxNF8p2sCiABcLJex/YYoq0eCdHnA2TkVJZrHgso/oqjNwBRuIHdl0t0TdKFbvU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:36:01.1915 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3a279b-8cd2-4368-d81f-08d724b28eb9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1272
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4jp+YaG4kPVY/dZs6orZSFReORMsm59s1GjqCDvVm4=;
 b=W9TzzZ4afNe0BaYi8gj8+yTRXkbOS95QstLg2HdQhUl498WSrwa3R4EvFFrdKy/SWKJK3yn/gy2bbqCNp74eSX8LG934Nb2fASW1dSiib1HsAcWY2z9/JnZIQluLqSH4pF57KCoKGM2creEQEE58QZOo5DU4pB6pd/efduVNb3s=
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
Cc: Charlene Liu <charlene.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hhcmxlbmUgTGl1IDxjaGFybGVuZS5saXVAYW1kLmNvbT4KCltEZXNjcmlwdGlvbl0K
T1Mgd2lsbCByZXNlcnZlIEhXIHN0YXRlIGluIFVFRkkgbW9kZS4KRHJpdmVyIGluaXRfaHcgcmVz
ZXQgdG8gUkdCIHdoaWNoIGNhdXNlZCBIRE1JIGdyZWVuIGluIFlDYkNyIG1vZGUuCnJlYWQgSFcg
YmxhbmtfY29sb3IgYmFzZWQgb24gYWNjX21vZGUuCgpTaWduZWQtb2ZmLWJ5OiBDaGFybGVuZSBM
aXUgPGNoYXJsZW5lLmxpdUBhbWQuY29tPgpSZXZpZXdlZC1ieTogRG15dHJvIExha3R5dXNoa2lu
IDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hh
IDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIC4uLi9hbWQvZGlzcGxheS9kYy9kY24x
MC9kY24xMF9saW5rX2VuY29kZXIuYyB8IDIzICsrKysrKysrKysrKysrKysrKysKIC4uLi9hbWQv
ZGlzcGxheS9kYy9kY24xMC9kY24xMF9saW5rX2VuY29kZXIuaCB8ICAyICsrCiAuLi4vYW1kL2Rp
c3BsYXkvZGMvZGNuMjAvZGNuMjBfbGlua19lbmNvZGVyLmMgfCAgMSArCiAuLi4vZHJtL2FtZC9k
aXNwbGF5L2RjL2luYy9ody9saW5rX2VuY29kZXIuaCAgfCAgMiArKwogNCBmaWxlcyBjaGFuZ2Vk
LCAyOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjEwL2RjbjEwX2xpbmtfZW5jb2Rlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjEwL2RjbjEwX2xpbmtfZW5jb2Rlci5jCmluZGV4IGU0YzdlY2Q4N2RlNy4u
NDAzNGY3Nzg3YTM1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMTAvZGNuMTBfbGlua19lbmNvZGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjEwL2RjbjEwX2xpbmtfZW5jb2Rlci5jCkBAIC04Niw2ICs4Niw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgbGlua19lbmNvZGVyX2Z1bmNzIGRjbjEwX2xua19lbmNfZnVuY3MgPSB7
CiAJLmRpc2FibGVfaHBkID0gZGNuMTBfbGlua19lbmNvZGVyX2Rpc2FibGVfaHBkLAogCS5pc19k
aWdfZW5hYmxlZCA9IGRjbjEwX2lzX2RpZ19lbmFibGVkLAogCS5nZXRfZGlnX2Zyb250ZW5kID0g
ZGNuMTBfZ2V0X2RpZ19mcm9udGVuZCwKKwkuZ2V0X2RpZ19tb2RlID0gZGNuMTBfZ2V0X2RpZ19t
b2RlLAogCS5kZXN0cm95ID0gZGNuMTBfbGlua19lbmNvZGVyX2Rlc3Ryb3kKIH07CiAKQEAgLTEz
OTQsMyArMTM5NSwyNSBAQCB2b2lkIGRjbjEwX2F1eF9pbml0aWFsaXplKHN0cnVjdCBkY24xMF9s
aW5rX2VuY29kZXIgKmVuYzEwKQogCUFVWF9SRUdfVVBEQVRFKEFVWF9EUEhZX1JYX0NPTlRST0ww
LAogCQkJQVVYX1JYX1JFQ0VJVkVfV0lORE9XLCAwKTsKIH0KKworZW51bSBzaWduYWxfdHlwZSBk
Y24xMF9nZXRfZGlnX21vZGUoCisJc3RydWN0IGxpbmtfZW5jb2RlciAqZW5jKQoreworCXN0cnVj
dCBkY24xMF9saW5rX2VuY29kZXIgKmVuYzEwID0gVE9fRENOMTBfTElOS19FTkMoZW5jKTsKKwl1
aW50MzJfdCB2YWx1ZTsKKwlSRUdfR0VUKERJR19CRV9DTlRMLCBESUdfTU9ERSwgJnZhbHVlKTsK
Kwlzd2l0Y2ggKHZhbHVlKSB7CisJY2FzZSAxOgorCQlyZXR1cm4gU0lHTkFMX1RZUEVfRElTUExB
WV9QT1JUOworCWNhc2UgMjoKKwkJcmV0dXJuIFNJR05BTF9UWVBFX0RWSV9TSU5HTEVfTElOSzsK
KwljYXNlIDM6CisJCXJldHVybiBTSUdOQUxfVFlQRV9IRE1JX1RZUEVfQTsKKwljYXNlIDU6CisJ
CXJldHVybiBTSUdOQUxfVFlQRV9ESVNQTEFZX1BPUlRfTVNUOworCWRlZmF1bHQ6CisJCXJldHVy
biBTSUdOQUxfVFlQRV9OT05FOworCX0KKwlyZXR1cm4gU0lHTkFMX1RZUEVfTk9ORTsKK30KKwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2xp
bmtfZW5jb2Rlci5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEw
X2xpbmtfZW5jb2Rlci5oCmluZGV4IGYzZTU3MzQzNDE3Yy4uOGJmNWYwZjIzMDFkIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfbGlua19lbmNv
ZGVyLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2xp
bmtfZW5jb2Rlci5oCkBAIC01MTUsNCArNTE1LDYgQEAgdW5zaWduZWQgaW50IGRjbjEwX2dldF9k
aWdfZnJvbnRlbmQoc3RydWN0IGxpbmtfZW5jb2RlciAqZW5jKTsKIAogdm9pZCBkY24xMF9hdXhf
aW5pdGlhbGl6ZShzdHJ1Y3QgZGNuMTBfbGlua19lbmNvZGVyICplbmMxMCk7CiAKK2VudW0gc2ln
bmFsX3R5cGUgZGNuMTBfZ2V0X2RpZ19tb2RlKAorCXN0cnVjdCBsaW5rX2VuY29kZXIgKmVuYyk7
CiAjZW5kaWYgLyogX19EQ19MSU5LX0VOQ09ERVJfX0RDTjEwX0hfXyAqLwpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2xpbmtfZW5jb2Rlci5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2xpbmtfZW5jb2Rl
ci5jCmluZGV4IGY0OTU1ODJlOWU4Ny4uZTQ3NmYyN2FhM2E5IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfbGlua19lbmNvZGVyLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2xpbmtfZW5jb2Rlci5j
CkBAIC0zNDEsNiArMzQxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBsaW5rX2VuY29kZXJfZnVu
Y3MgZGNuMjBfbGlua19lbmNfZnVuY3MgPSB7CiAJLmZlY19zZXRfZW5hYmxlID0gZW5jMl9mZWNf
c2V0X2VuYWJsZSwKIAkuZmVjX3NldF9yZWFkeSA9IGVuYzJfZmVjX3NldF9yZWFkeSwKIAkuZmVj
X2lzX2FjdGl2ZSA9IGVuYzJfZmVjX2lzX2FjdGl2ZSwKKwkuZ2V0X2RpZ19tb2RlID0gZGNuMTBf
Z2V0X2RpZ19tb2RlLAogCS5nZXRfZGlnX2Zyb250ZW5kID0gZGNuMTBfZ2V0X2RpZ19mcm9udGVu
ZCwKIH07CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMv
aHcvbGlua19lbmNvZGVyLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3
L2xpbmtfZW5jb2Rlci5oCmluZGV4IDcwMDFiZmJkNjY4MS4uYWJiNGU0MjM3ZmI2IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2xpbmtfZW5jb2Rlci5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvbGlua19lbmNvZGVy
LmgKQEAgLTE4NCw2ICsxODQsOCBAQCBzdHJ1Y3QgbGlua19lbmNvZGVyX2Z1bmNzIHsKIAlib29s
ICgqZmVjX2lzX2FjdGl2ZSkoc3RydWN0IGxpbmtfZW5jb2RlciAqZW5jKTsKICNlbmRpZgogCWJv
b2wgKCppc19pbl9hbHRfbW9kZSkgKHN0cnVjdCBsaW5rX2VuY29kZXIgKmVuYyk7CisJZW51bSBz
aWduYWxfdHlwZSAoKmdldF9kaWdfbW9kZSkoCisJCXN0cnVjdCBsaW5rX2VuY29kZXIgKmVuYyk7
CiB9OwogCiAjZW5kaWYgLyogTElOS19FTkNPREVSX0hfICovCi0tIAoyLjE3LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
