Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 747DD7D5AB
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 08:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005476E38A;
	Thu,  1 Aug 2019 06:44:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680044.outbound.protection.outlook.com [40.107.68.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBFF6E38A
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 06:44:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6qBHxSJftgEDq6CS9jTNp5V2+aky+62JLS62SHYAIIs5VGtQMRhR8gSKFTy/2IztQFEQ4jh3jXmhNRJiga0vUBXLnniT5u7cJgxu0kcEooPgtixHZeT0sCtq5dLLuQC/HOocpELk/rIj6ibCO0BmWy4m4+u5B+507XacjGzafQiitV8IYBwf6rWoEti7PZvml9H15PKDxBIEgrnITdoZnhYibl7drSt9Jf+LtaOevewBrb1di+uaLIVhV28mIUtTyMtoQDjDRB302AkpiMRp1K8v9Y0M4qUN9+vg7SO3K+K9QMlIaD3/OHUuS4a5KiC6VKIpJOnuiRH+FknOxmWNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PhCLxC5vJZgMv0hl0bcVaXH0z8aJLh9lOTmZ96Pvm4=;
 b=HsLGJcdO9WHQiQmUdYlLNbSsfd1V5s0FTM8wM5TQDNFK2IM0bTeFzUgMeLa3VPppd85x9YUMzfSHiOnU1IPHVuDLvnD2P5mD8eHqRzTEruYF6En671ZmRWeJCa0vqbT0+kdiLdytzhjYFzspArPbanpn8bvIMNPpPZL1heIYzD6hBi5a8asiZbrVe2FGW1dBtdJElSs2YtvyapKsUx2k2z6Jz1+vL+zM8NhpRxhKEaKUIbYPULSrbOyczjpBtCUHO+AShu3dylrBbX7Lc/WpmQ9FGd0x+wzDDCIQyGSR20HYlinCQgiiOZZqh/Y94u7Yj/1+mdzsmN3e9TG6fLaHTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR1201CA0004.namprd12.prod.outlook.com
 (2603:10b6:301:4a::14) by DM5PR12MB2423.namprd12.prod.outlook.com
 (2603:10b6:4:b4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.16; Thu, 1 Aug
 2019 06:44:44 +0000
Received: from DM3NAM03FT011.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by MWHPR1201CA0004.outlook.office365.com
 (2603:10b6:301:4a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.12 via Frontend
 Transport; Thu, 1 Aug 2019 06:44:43 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT011.mail.protection.outlook.com (10.152.82.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Thu, 1 Aug 2019 06:44:43 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 1 Aug 2019
 01:44:41 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <hawking.zhang@amd.com>,
 <dennis.li@amd.com>, <guchun.chen@amd.com>, <xinhui.pan@amd.com>
Subject: [PATCH 6/6] drm/amdgpu: add error address query for umc ras
Date: Thu, 1 Aug 2019 14:43:11 +0800
Message-ID: <20190801064311.7307-7-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801064311.7307-1-tao.zhou1@amd.com>
References: <20190801064311.7307-1-tao.zhou1@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(2980300002)(428003)(199004)(189003)(305945005)(110136005)(16586007)(81156014)(316002)(8676002)(1076003)(53416004)(2201001)(6636002)(68736007)(2906002)(5660300002)(6666004)(48376002)(26005)(356004)(70586007)(70206006)(76176011)(8936002)(478600001)(50226002)(446003)(336012)(81166006)(36756003)(53936002)(86362001)(476003)(50466002)(486006)(47776003)(2616005)(126002)(426003)(186003)(51416003)(11346002)(7696005)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2423; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18c50389-ce5d-4261-0950-08d7164bbc3a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB2423; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB2423:
X-Microsoft-Antispam-PRVS: <DM5PR12MB24239182EBD4564A49D5AEE0B0DE0@DM5PR12MB2423.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-Forefront-PRVS: 01165471DB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: BlDUq3fDSf0wFEhlQ94yHYlu5y6jmJsXOo8sEzjTxIKxmJI3e0N/v3Si47ngp5KnHnEZrKpNqF2/J2G6+NCpMoLvt7JS9lMXDSNldOWyc9c7/2k+cyvf59tu2JP8bOMotKSuAzlrG8ld4CJsIdBs02BF64oABjs5cK8K+HgFrJmULAPeCWtD0S9nZqczNyiG0vWSe8w4OHEYu8ZcT64nB3rHaHMcKYyvohCl8lwrgxnqph/3pEU+qA0/01PseeaIMLmXsw4Y8WASeaev5lZkjKO3Q/fZJh/pEBFdbv4wAX2OxR44pzcTNaefQM01h5IAOxEp0p4am0iiGOYkvIpmox1OQyd0/2x+mHfnPRrxsS2XlChszBPEBn2hlJnG/hRw8IMwmS0pzUmbNBfZ16+trQqH4VdAUCGhRa0XugyHtbk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 06:44:43.1241 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c50389-ce5d-4261-0950-08d7164bbc3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2423
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PhCLxC5vJZgMv0hl0bcVaXH0z8aJLh9lOTmZ96Pvm4=;
 b=G2Rl4ogRfTyF1b4D8CMBW89weXIaCQirR4O5lk/AQnHFYdqiV7Mclu/r3caxQJZt6Xo+NyEIJdDe+/bFVJlbX7Fep0mJ1RnO7nTEUjLpPrMWzL4Eq7Xip/bEyjsRuuKdg9NI9wg+hYPzYryhmdwGivzcpbbCgzWBCwdwbFQ/3bs=
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
Cc: Tao Zhou <tao.zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dW1jIGVycm9yIGFkZHJlc3MgcXVlcnkgY2FuIGdldCBjZS91ZSBlcnJvciBhZGRyZXNzIGFuZCBj
bGVhciBlcnJvcgpzdGF0dXMKClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgfCA1ICsr
KysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jICAgfCA1ICsrKysrCiAy
IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmFzLmMKaW5kZXggYTk2YjBmMTdjNjE5Li4wOTRjMjcwMDBiODMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKQEAgLTU5OSw2ICs1OTksMTEgQEAgaW50
IGFtZGdwdV9yYXNfZXJyb3JfcXVlcnkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJY2Fz
ZSBBTURHUFVfUkFTX0JMT0NLX19VTUM6CiAJCWlmIChhZGV2LT51bWMuZnVuY3MtPnF1ZXJ5X3Jh
c19lcnJvcl9jb3VudCkKIAkJCWFkZXYtPnVtYy5mdW5jcy0+cXVlcnlfcmFzX2Vycm9yX2NvdW50
KGFkZXYsICZlcnJfZGF0YSk7CisJCS8qIHVtYyBxdWVyeV9yYXNfZXJyb3JfYWRkcmVzcyBpcyBh
bHNvIHJlc3BvbnNpYmxlIGZvciBjbGVhcmluZworCQkgKiBlcnJvciBzdGF0dXMKKwkJICovCisJ
CWlmIChhZGV2LT51bWMuZnVuY3MtPnF1ZXJ5X3Jhc19lcnJvcl9hZGRyZXNzKQorCQkJYWRldi0+
dW1jLmZ1bmNzLT5xdWVyeV9yYXNfZXJyb3JfYWRkcmVzcyhhZGV2LCAmZXJyX2RhdGEpOwogCQli
cmVhazsKIAljYXNlIEFNREdQVV9SQVNfQkxPQ0tfX0dGWDoKIAkJaWYgKGFkZXYtPmdmeC5mdW5j
cy0+cXVlcnlfcmFzX2Vycm9yX2NvdW50KQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ21jX3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8w
LmMKaW5kZXggMzQ4NmI0Y2U3NzcwLi4wNWNiZDkwZDliNmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYwpAQCAtMjQ1LDYgKzI0NSwxMSBAQCBzdGF0aWMgaW50IGdtY192OV8w
X3Byb2Nlc3NfcmFzX2RhdGFfY2Ioc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJa2dkMmtm
ZF9zZXRfc3JhbV9lY2NfZmxhZyhhZGV2LT5rZmQuZGV2KTsKIAlpZiAoYWRldi0+dW1jLmZ1bmNz
LT5xdWVyeV9yYXNfZXJyb3JfY291bnQpCiAJCWFkZXYtPnVtYy5mdW5jcy0+cXVlcnlfcmFzX2Vy
cm9yX2NvdW50KGFkZXYsIGVycl9kYXRhKTsKKwkvKiB1bWMgcXVlcnlfcmFzX2Vycm9yX2FkZHJl
c3MgaXMgYWxzbyByZXNwb25zaWJsZSBmb3IgY2xlYXJpbmcKKwkgKiBlcnJvciBzdGF0dXMKKwkg
Ki8KKwlpZiAoYWRldi0+dW1jLmZ1bmNzLT5xdWVyeV9yYXNfZXJyb3JfYWRkcmVzcykKKwkJYWRl
di0+dW1jLmZ1bmNzLT5xdWVyeV9yYXNfZXJyb3JfYWRkcmVzcyhhZGV2LCBlcnJfZGF0YSk7CiAJ
YW1kZ3B1X3Jhc19yZXNldF9ncHUoYWRldiwgMCk7CiAJcmV0dXJuIEFNREdQVV9SQVNfVUU7CiB9
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
