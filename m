Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FE9AEC69
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 15:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE84689310;
	Tue, 10 Sep 2019 13:55:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700053.outbound.protection.outlook.com [40.107.70.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7076892E6
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 13:55:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFplYi6bR7Lha0AOIT5FMr3VxV7JJ07SpUTFFR2FVn/VVTEZQABY15BTFqJiCF+4PXHDcbgqaTBT5BIVsXHU/pLzhSJ4uzLFZTzEgisEndxK951hVK+TVxM/TWlMEEZDrmcdmiJm/lSsaSK8908W+U6HDbMK22/x4rug3wu+cR+T+GEhAfOErhT1TD9x17bUYnJSYTXNyeZTUGzuqR60pdcbAPx/BPD8ezSvcSIjOFBqvT9IfNf6nxKl3RWpjO+T1GB3Jnkoe48uv/eNcaQM7GL5twfVNubu5qL4q9eFx64PcsOnHajJJgsXyUnEnKsL8pko+UL1uuZbFL5VPUN4Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUQikno4v5EMoXUlp0qL7PIXGp2a2ezlyVDV/uLGhpg=;
 b=AE0zMLkEDeLGtx9GOd98fd8h6xt7gR6KE6+NjupjNG6hJAHBgyPwcbU5J859+oDXPW+xSB819xXxZktydAS2S+ehbA+Zjhwv+Xh3ty42yFhcpUnKtSh96fY785qGhKmd6eezxC7vV7KXr3ooBlk9pvFawJRuHhQswtEVHb+rlESEqRhjJOo9jZqrxdf51lKxHAP7c/l9aX9wH/EZYW1oj2mw1k8PZYpNnmVW4WZGty0a/V42PWAnNMv12+lct33PyrI6tpFTGVXpvWa6gLZhxRN5Ph6lnLMBPV4LoRCtrLpfgESyZV/CZvi4dSfN+UIaTqFnd8l3d8epzs8LT+G2yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0019.namprd12.prod.outlook.com (2603:10b6:610:57::29)
 by DM5PR1201MB2505.namprd12.prod.outlook.com (2603:10b6:3:ea::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.13; Tue, 10 Sep
 2019 13:55:02 +0000
Received: from CO1NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by CH2PR12CA0019.outlook.office365.com
 (2603:10b6:610:57::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.15 via Frontend
 Transport; Tue, 10 Sep 2019 13:55:01 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT025.mail.protection.outlook.com (10.152.80.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 13:55:01 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 10 Sep 2019 08:54:56 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 08/25] drm/amd/display: add vtg update after global sync update
Date: Tue, 10 Sep 2019 09:54:28 -0400
Message-ID: <20190910135445.18300-9-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910135445.18300-1-sunpeng.li@amd.com>
References: <20190910135445.18300-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(346002)(2980300002)(428003)(199004)(189003)(53936002)(81166006)(15650500001)(2876002)(305945005)(76176011)(26005)(51416003)(2906002)(6916009)(316002)(2351001)(54906003)(2870700001)(47776003)(50466002)(50226002)(14444005)(6666004)(356004)(8676002)(48376002)(86362001)(1076003)(49486002)(36756003)(11346002)(4326008)(8936002)(5660300002)(476003)(446003)(2616005)(126002)(336012)(478600001)(426003)(186003)(486006)(70586007)(70206006)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB2505; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 165ce562-d767-4bb1-9015-08d735f679c9
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM5PR1201MB2505; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2505:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB250506AF2132CFF1730D621082B60@DM5PR1201MB2505.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: GIz/RbTMWhFJOf0yrGkqKGhmqadvd43VJndiBBsMd+hMeO0AWvGkImpm10EGwbx2HUJNbQPRm8lGW3h9x8v5nFypDiIMdf+9GrGZBeP3v8GTDjtp1i0TOLTvy/RYTklk+ZVWV0uQiAT8lYEYfhDtLmoOAYHCzrMU60gh2dIXW7THPkk3Sm6Mn4AarN53X+l0qvsr31N1cm6V4Ptkon877xLKwbuOMgFVvljRqjDeLnh6xF1CIxh4O9uUWQyFW+jd1MUvTDdbVc9lipaAzmZ3OJ4S7MmaF3uj/2pOHAqDcOxTWI6Ol4AXTzN8lc4f5vtbgdskN7UZuwYFWaHrRwZogrKfk88as4Zl8RVqOSJCt07W/HRKg6cbSsEqHI/ArXQmeSJddOJcIdHnM9sqeehpKyg61j7bWe5Sz+X7gJ5JEnE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 13:55:01.5742 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 165ce562-d767-4bb1-9015-08d735f679c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2505
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUQikno4v5EMoXUlp0qL7PIXGp2a2ezlyVDV/uLGhpg=;
 b=CybBAid/+atmld7IsMCX4VhrOsa8Kr+GJisGY6VeJxhPTX5kqjTrTUxyrhGJfshUtZpkqvV8r+5TuDRUo0WbNSyr8lRbLVAbOr89EpyJHzbu7QYSuWT2PEyGW4vCq7IRuLx3zf9Sw6af4Fb3vER9YFi7o9+XK+YbbRWMnz9zMo8=
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
 Jaehyun Chung <Jaehyun.Chung@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCkds
b2JhbCBzeW5jIHVwZGF0ZSB3YXMgbWlzc2luZyB2dGcgdXBkYXRlIHJlc3VsdGluZyBpbiB1bmRl
cmZsb3cgaWYKdnN0YXJ0dXAgZGVjcmVhc2VkIGEgc2lnbmlmaWNhbnQgYW1vdW50LgoKU2lnbmVk
LW9mZi1ieTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IEphZWh5dW4gQ2h1bmcgPEphZWh5dW4uQ2h1bmdAYW1kLmNvbT4KQWNrZWQt
Ynk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jIHwgNiArKysrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jCmluZGV4IGZhYWY4ODQxYzYxZS4u
NGJiNWFkMTljNGNmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMjAvZGNuMjBfaHdzZXEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMjAvZGNuMjBfaHdzZXEuYwpAQCAtMTM2MSw3ICsxMzYxLDcgQEAgc3RhdGljIHZvaWQgZGNu
MjBfcHJvZ3JhbV9waXBlKAogCQkJJiYgIXBpcGVfY3R4LT50b3BfcGlwZSAmJiAhcGlwZV9jdHgt
PnByZXZfb2RtX3BpcGUpCiAJCWRjLT5od3NzLmJsYW5rX3BpeGVsX2RhdGEoZGMsIHBpcGVfY3R4
LCAhcGlwZV9jdHgtPnBsYW5lX3N0YXRlLT52aXNpYmxlKTsKIAotCWlmIChwaXBlX2N0eC0+dXBk
YXRlX2ZsYWdzLmJpdHMuZ2xvYmFsX3N5bmMpCisJaWYgKHBpcGVfY3R4LT51cGRhdGVfZmxhZ3Mu
Yml0cy5nbG9iYWxfc3luYykgewogCQlwaXBlX2N0eC0+c3RyZWFtX3Jlcy50Zy0+ZnVuY3MtPnBy
b2dyYW1fZ2xvYmFsX3N5bmMoCiAJCQkJcGlwZV9jdHgtPnN0cmVhbV9yZXMudGcsCiAJCQkJcGlw
ZV9jdHgtPnBpcGVfZGxnX3BhcmFtLnZyZWFkeV9vZmZzZXQsCkBAIC0xMzY5LDYgKzEzNjksMTAg
QEAgc3RhdGljIHZvaWQgZGNuMjBfcHJvZ3JhbV9waXBlKAogCQkJCXBpcGVfY3R4LT5waXBlX2Rs
Z19wYXJhbS52dXBkYXRlX29mZnNldCwKIAkJCQlwaXBlX2N0eC0+cGlwZV9kbGdfcGFyYW0udnVw
ZGF0ZV93aWR0aCk7CiAKKwkJcGlwZV9jdHgtPnN0cmVhbV9yZXMudGctPmZ1bmNzLT5zZXRfdnRn
X3BhcmFtcygKKwkJCQlwaXBlX2N0eC0+c3RyZWFtX3Jlcy50ZywgJnBpcGVfY3R4LT5zdHJlYW0t
PnRpbWluZyk7CisJfQorCiAJaWYgKHBpcGVfY3R4LT51cGRhdGVfZmxhZ3MuYml0cy5vZG0pCiAJ
CWRjLT5od3NzLnVwZGF0ZV9vZG0oZGMsIGNvbnRleHQsIHBpcGVfY3R4KTsKIAotLSAKMi4yMi4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
