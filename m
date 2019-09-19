Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0D8B7498
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 10:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03F36F875;
	Thu, 19 Sep 2019 08:00:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710057.outbound.protection.outlook.com [40.107.71.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF826F875
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 08:00:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLwVWPCI3GUo2rLFTfmWcD8UHWcFMJSOZas5zwVJCFQUmBsWyFkAefNIs5mTG1dfJecoI9T9OAV/xEBqd8YQeXb6IBnKvTDs1rU6pwk2sZbDULg+C70QP9GfaX+Q9zd7/1lXGVCjAo6J6YvUSESluusy9hsb3Qlk0xIIijaADKw5Hq1UjeQoFVT9Xbnh50Xnxq/71XPe9L0a/QPASIbup6kAO/NBNSbnqSKcjPsH410Kb+nZvpWsbz1wZy5vA7mR7VRc/lyYF1GdQxKr6Amx7EZpgNN/Ak6Ix1mnCQwiyzHGeB7QhyCob4FOozdkcbZk2bFTsdMGtmjvzutNxzWrHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSOkaAsS75cHSUtMtng+sEDM3B/dTJftUUVgyVWsyBk=;
 b=Wv+fUpmvUEmJUX4qy4P0nPWr8SQouxh0UfKh/9uYaqXV7tvbZek8HRUi+bi2+3tQVnLITicO4Iz1JQqTXuWphVqTOJwQaSjocKfIYVcFrBICQ8wwHNPp0mQiPSiLe/kvZul0YhHBlFKER8wCglTDFhyBj32wTxrXB2L1rC2s+MOqOjddbNbcY9egUt8DgKL1F8RsL81qLysCgixyVWhK/AwTc/4Yv32B5JTGpno97syYg/osvhdkty1cf+2Vjhh8wbkPl5lskDo3enwqFpWgHuU8L731Cqh9wPzlr2j49nz8e2RF7IITLIghyz4N/G/PB+MYW0enmrvMJ/efD+CV+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0032.namprd12.prod.outlook.com (2603:10b6:208:a8::45)
 by MWHPR1201MB0160.namprd12.prod.outlook.com (2603:10b6:301:50::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.23; Thu, 19 Sep
 2019 08:00:52 +0000
Received: from CO1NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by MN2PR12CA0032.outlook.office365.com
 (2603:10b6:208:a8::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.18 via Frontend
 Transport; Thu, 19 Sep 2019 08:00:52 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT025.mail.protection.outlook.com (10.152.80.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.20 via Frontend Transport; Thu, 19 Sep 2019 08:00:51 +0000
Received: from Build-machine.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 19 Sep 2019 03:00:50 -0500
From: Jesse Zhang <zhexi.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4] drm/amd/amdgpu:Fix compute ring unable to detect hang.
Date: Thu, 19 Sep 2019 16:00:41 +0800
Message-ID: <1568880041-19830-1-git-send-email-zhexi.zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568876935-18731-2-git-send-email-zhexi.zhang@amd.com>
References: <1568876935-18731-2-git-send-email-zhexi.zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(428003)(199004)(189003)(26005)(70206006)(2351001)(186003)(76176011)(7696005)(51416003)(53416004)(70586007)(8936002)(316002)(2906002)(2616005)(81166006)(126002)(446003)(16586007)(336012)(81156014)(86362001)(5660300002)(6666004)(356004)(476003)(11346002)(426003)(50226002)(14444005)(486006)(4326008)(48376002)(8676002)(36756003)(47776003)(305945005)(478600001)(6916009)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0160; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c70635df-6bc4-4a8f-b631-08d73cd77db1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MWHPR1201MB0160; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0160:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB016055B7FD499790BADA5205EF890@MWHPR1201MB0160.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 016572D96D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: YGH/J9lWd9QFgH0t8T0BY+yoTvxIei0Oc4rHDCCtstSoNhn4oG+aVy/GIFxOBoCw+OeLOU6i9DS7vcrnh/5w1R9WlAPMRcb4DeasJfnV8BBixzZz5FpddNDZd8EeIR3DwRl+pQoivRqUgdhdARkpFVzEuBcu8pgLACAWLzRGnH6f6flk3haDItScEfhjbhcx9vAEBtw0JxDW4jOLALLUcyiU2vJRAg5G0GjSy+17sv4F+81vvLLmOYPHoOwty2nVGUoC7RHdzjJVgLP4qIEVwddThrTyD14w/8eD1MVsZ1Fl6c7aaSAWwIzfyjt/APpQdZYKMAwMZHsvuZRy3oppZb81XdjTt4FJCo3Nh9AluMZ3KA6MFQBS5fdq/P+vdL0vuPbEW/GPJsf9AnT5K7KgPpe3zg13KXqbnpPFsNRTDlw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2019 08:00:51.8496 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c70635df-6bc4-4a8f-b631-08d73cd77db1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0160
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSOkaAsS75cHSUtMtng+sEDM3B/dTJftUUVgyVWsyBk=;
 b=RJNrnhEkPzCClEW7EYyoCM+izHu48pPus7lE7dovX3TSJ7mUNXUdld+4hiTtkuKeiLRyVE8W1/NKeOFAhIxj+UEE0USYk6WfRARUrhNX/R7gzIgOb40UR+wMt6qhm8BCxN1UmxUyljmc0+/VJFwZxX/FjFfvA9F1CttpDULD1d0=
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
Cc: Jesse Zhang <zhexi.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2hlbiBjb21wdXRlIGZlbmNlIGRpZCBub3Qgc2lnbmFsLCBjb21wdXRlIHJpbmcgY2Fubm90IGRl
dGVjdCBoYXJkd2FyZQpoYW5nIGJlY2F1c2UgaXRzIHRpbWVvdXQgdmFsdWUgaXMgc2V0IHRvIGJl
IGluZmluaXRlIGJ5IGRlZmF1bHQuCgpJbiBTUi1JT1YgYW5kIHBhc3N0aHJvdWdoIG1vZGUsIGlm
IHVzZXIgZG9lcyBub3QgZGVjbGFyZSBjdXN0b21lIHRpbWVvdXQKdmFsdWUgZm9yIGNvbXB1dGUg
cmluZywgdGhlbiB1c2UgZ2Z4IHJpbmcgdGltZW91dCB2YWx1ZSBhcyBkZWZhdWx0LiBTbwp0aGF0
IHdoZW4gdGhlcmUgaXMgYSB0dXJlIGhhcmR3YXJlIGhhbmcsIGNvbXB1dGUgcmluZyBjYW4gZGV0
ZWN0IGl0LgoKQ2hhbmdlLUlkOiBJNzk0ZWMwODY4YzZjMGFhZDQwNzc0OTQ1NzI2MGVjZmVlMDYx
N2MxMApTaWduZWQtb2ZmLWJ5OiBKZXNzZSBaaGFuZyA8emhleGkuemhhbmdAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVuY2UuYyB8ICA1ICstLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jICAgICAgICB8IDEwICsrKysrKysrKysK
IDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVuY2UuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jCmluZGV4IGNiY2FhN2MuLjk2M2I2
ZDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jCkBAIC00Njgs
MTAgKzQ2OCw3IEBAIGludCBhbWRncHVfZmVuY2VfZHJpdmVyX2luaXRfcmluZyhzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcsCiAJCQkgKiBGb3Igc3Jpb3YgY2FzZSwgYWx3YXlzIHVzZSB0aGUgdGlt
ZW91dAogCQkJICogYXMgZ2Z4IHJpbmcKIAkJCSAqLwotCQkJaWYgKCFhbWRncHVfc3Jpb3ZfdmYo
cmluZy0+YWRldikpCi0JCQkJdGltZW91dCA9IGFkZXYtPmNvbXB1dGVfdGltZW91dDsKLQkJCWVs
c2UKLQkJCQl0aW1lb3V0ID0gYWRldi0+Z2Z4X3RpbWVvdXQ7CisJCQl0aW1lb3V0ID0gYWRldi0+
Y29tcHV0ZV90aW1lb3V0OwogCQkJYnJlYWs7CiAJCWNhc2UgQU1ER1BVX1JJTkdfVFlQRV9TRE1B
OgogCQkJdGltZW91dCA9IGFkZXYtPnNkbWFfdGltZW91dDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9z
b2MxNS5jCmluZGV4IDdjN2U5ZjUuLjZjZDU1NDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NvYzE1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29j
MTUuYwpAQCAtNjg3LDYgKzY4NywxNiBAQCBpbnQgc29jMTVfc2V0X2lwX2Jsb2NrcyhzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKIAlhZGV2LT5yZXZfaWQgPSBzb2MxNV9nZXRfcmV2X2lkKGFk
ZXYpOwogCWFkZXYtPm5iaW8uZnVuY3MtPmRldGVjdF9od192aXJ0KGFkZXYpOwogCisJLyoKKwkg
KiBJZiBydW5uaW5nIHVuZGVyIFNSLUlPViBvciBwYXNzdGhyb3VnaCBtb2RlIGFuZCB1c2VyIGRp
ZCBub3Qgc2V0CisJICogY3VzdG9tIHZhbHVlIGZvciBjb21wdXRlIHJpbmcgdGltZW91dCwgc2V0
IHRpbWVvdXQgdG8gYmUgdGhlIHNhbWUKKwkgKiBhcyBnZnggcmluZyB0aW1lb3V0IHRvIGF2b2lk
IGNvbXB1dGUgcmluZyBjYW5ub3QgZGV0ZWN0IGFuIHRydWUKKwkgKiBoYW5nLgorCSAqLworCWlm
ICgoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpIHx8IGFtZGdwdV9wYXNzdGhyb3VnaChhZGV2KSkgJiYK
KwkJKGFkZXYtPmNvbXB1dGVfdGltZW91dCA9PSBNQVhfU0NIRURVTEVfVElNRU9VVCkpCisJCWFk
ZXYtPmNvbXB1dGVfdGltZW91dCA9IGFkZXYtPmdmeF90aW1lb3V0OworCiAJaWYgKGFtZGdwdV9z
cmlvdl92ZihhZGV2KSkKIAkJYWRldi0+dmlydC5vcHMgPSAmeGdwdV9haV92aXJ0X29wczsKIAot
LSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
