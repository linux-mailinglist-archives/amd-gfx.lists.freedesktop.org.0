Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A843DB731
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5116EA7A;
	Thu, 17 Oct 2019 19:15:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820042.outbound.protection.outlook.com [40.107.82.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730756EA7A
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VR8FCGjhLekpKBlbMXnBPTEGAv/NCRgTsm0r7vYSOfo62n2EUI08w7sXkCwbVQW1mVDQhoYyRr+NzE0z5YynCPCTIp8L4ve8w4Syiy52kQ2LvRUTT8/F/fWAwvbP9/nAjp2cYOKukrRUfyOxiW6xzywZbWm/POYBYZkuZx64xV8rA1Os+mQgFAaHqNWHBrtgedTt5hyVzIGPqOuu40A7WbdtNviOZAokPh8e+7+2wH+ufMWlJUXRJ6Frc87d3X4lIOdnA8Azqe4tOKLOUaVow2YDk8AsfI2gqygxgNHLwJ73o++fw/fnMlGA2Tsds6+glj2ySATQWnrDGe+HRtycMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEFmsDpTq4SG+ocDFMBMzxq6WEzk+yy7itv4/3Fq9wA=;
 b=jAKraz+MtU+SJxOWHAsMbKU5MvQfPDoVBbld0ZH3rg7ruaPNfLeJsOaivO2IMq0o7dOJp4d7wVlS2rijHZip47hAbQj+WAFTCzHpwMWjNqkQ6ey2CX7kq1Laj/nUySfdnRn7+OC9pe0Jf11spkM1UtzDh9ovb04RxSL1Fk70v+bkKAYKpoyd7rVa0o13NqGW2tP9DwpH06PaH9FIy1UJkb2Bisd6xNBjwx2mGEai4H8kSE70IdBMZXvkKTXTdRVjmZopcG4DUyQBNbsfPkh3WSSrY81+NREj8tdb/7gxLLt6naIFlk+xyRJgHdZST6K9xx0vxX0zKOEc8yrc8x4/rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0059.namprd12.prod.outlook.com (2603:10b6:3:103::21)
 by DM6PR12MB3866.namprd12.prod.outlook.com (2603:10b6:5:1c8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17; Thu, 17 Oct
 2019 19:15:38 +0000
Received: from CO1NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::204) by DM5PR12CA0059.outlook.office365.com
 (2603:10b6:3:103::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT008.mail.protection.outlook.com (10.152.80.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:38 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:37 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:37 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 12/37] drm/amd/display: correctly initialize dml odm variables
Date: Thu, 17 Oct 2019 15:13:04 -0400
Message-ID: <20191017191329.11857-13-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(428003)(199004)(189003)(5660300002)(26005)(6916009)(305945005)(8676002)(14444005)(86362001)(36756003)(50226002)(81156014)(81166006)(54906003)(8936002)(356004)(50466002)(6666004)(316002)(186003)(51416003)(126002)(1076003)(2876002)(70586007)(76176011)(486006)(336012)(476003)(426003)(2906002)(70206006)(446003)(2616005)(2870700001)(48376002)(2351001)(47776003)(478600001)(11346002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3866; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 996fd6ac-61f7-4a2f-59b7-08d7533664f0
X-MS-TrafficTypeDiagnostic: DM6PR12MB3866:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3866C90A0E727CCEE0BECE3E826D0@DM6PR12MB3866.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lpK1ziH/1eOyp4g9zXSN3hqx09RMRBhw6sl2K7GmgytLpA7Hc5NjFuW7XP8nN6oFeApSFU79g35sWRCtAQo3NRfDEY3U3X16IqW9NOSbUxsXhfTAvvosOXFEh7JvpfF/lEu2FkP+9PP1WrPJmfAMZW22AmitGb31Hr+/i5zQQkg4w/imAKrvQpiNZFIiq3bP3XP/U7GSXSmX2IG2xPytlGKAriDbON2xjNu678EEgiocdILaxdYxbXKbYPK28jXWVrf/wyLrEY7VTT1SlmdaE4yUvVYCpudoVInzkjmUFtp6gTKEAJiyNQiBxeYzAlP6vJ22SFN8wMwPFWvM3MotTbkc+x0UemykRvn+Wr+/UcIO0rDeAwUKB8YjmU0uayKhod+wuOQ1DSVMCaBWBM9c7e7LZRUwrYoCSEczc4bX0M8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:38.1355 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 996fd6ac-61f7-4a2f-59b7-08d7533664f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3866
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEFmsDpTq4SG+ocDFMBMzxq6WEzk+yy7itv4/3Fq9wA=;
 b=BnGg9BmmMGOp2t80MZh9nadDN+TowaYyFlQG+4FcfFmZzOaHqiScjyn48+gOUfrOyb128LQp7ytjtYOHjU3frvUvdNAvLbogyNp28gtBng54Xy/evFTcpV0zgC6MRT+TWxtBGX3pYuNYt4EwTtSXavQaq1efXtlktqy0zx3hF7g=
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
Cc: Leo Li <sunpeng.li@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Chris Park <Chris.Park@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCk9u
ZSBvZiBvZG0gdmFyaWFibGVzIHdhcyBub3QgaW5pdGlhbGl6ZWQgaW4gZG1sLgoKU2lnbmVkLW9m
Zi1ieTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IENocmlzIFBhcmsgPENocmlzLlBhcmtAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBM
aSA8c3VucGVuZy5saUBhbWQuY29tPgpBY2tlZC1ieTogVG9ueSBDaGVuZyA8VG9ueS5DaGVuZ0Bh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9y
ZXNvdXJjZS5jIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2Rj
bjIwX3Jlc291cmNlLmggfCA2IC0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RtbC9kaXNwbGF5X21vZGVfdmJhLmMgfCAyICsrCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCmluZGV4IGFiMWZjOGM1ZWQxMC4uNGY5
YzM1MzhmYThjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvZGNuMjBfcmVzb3VyY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwpAQCAtMjUyNCw3ICsyNTI0LDcgQEAgYm9vbCBkY24yMF9m
YXN0X3ZhbGlkYXRlX2J3KAogCXJldHVybiBvdXQ7CiB9CiAKLXZvaWQgZGNuMjBfY2FsY3VsYXRl
X3dtKAorc3RhdGljIHZvaWQgZGNuMjBfY2FsY3VsYXRlX3dtKAogCQlzdHJ1Y3QgZGMgKmRjLCBz
dHJ1Y3QgZGNfc3RhdGUgKmNvbnRleHQsCiAJCWRpc3BsYXlfZTJlX3BpcGVfcGFyYW1zX3N0ICpw
aXBlcywKIAkJaW50ICpvdXRfcGlwZV9jbnQsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuaCBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5oCmluZGV4IGZlNjg2NjlhMWYwYy4u
ZGNjZmUwNzgzMmUzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMjAvZGNuMjBfcmVzb3VyY2UuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuaApAQCAtMTUwLDEyICsxNTAsNiBAQCB2b2lkIGRjbjIw
X2NhbGN1bGF0ZV9kbGdfcGFyYW1zKAogCQlkaXNwbGF5X2UyZV9waXBlX3BhcmFtc19zdCAqcGlw
ZXMsCiAJCWludCBwaXBlX2NudCwKIAkJaW50IHZsZXZlbCk7Ci12b2lkIGRjbjIwX2NhbGN1bGF0
ZV93bSgKLQkJc3RydWN0IGRjICpkYywgc3RydWN0IGRjX3N0YXRlICpjb250ZXh0LAotCQlkaXNw
bGF5X2UyZV9waXBlX3BhcmFtc19zdCAqcGlwZXMsCi0JCWludCAqb3V0X3BpcGVfY250LAotCQlp
bnQgKnBpcGVfc3BsaXRfZnJvbSwKLQkJaW50IHZsZXZlbCk7CiAKIGVudW0gZGNfc3RhdHVzIGRj
bjIwX2J1aWxkX21hcHBlZF9yZXNvdXJjZShjb25zdCBzdHJ1Y3QgZGMgKmRjLCBzdHJ1Y3QgZGNf
c3RhdGUgKmNvbnRleHQsIHN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKnN0cmVhbSk7CiBlbnVtIGRj
X3N0YXR1cyBkY24yMF9hZGRfc3RyZWFtX3RvX2N0eChzdHJ1Y3QgZGMgKmRjLCBzdHJ1Y3QgZGNf
c3RhdGUgKm5ld19jdHgsIHN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKmRjX3N0cmVhbSk7CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV92
YmEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGlzcGxheV9tb2RlX3Zi
YS5jCmluZGV4IDM2MmRjNmVhOThhZS4uMDM4NzAxZDczODNkIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV92YmEuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV92YmEuYwpAQCAtNDMy
LDYgKzQzMiw4IEBAIHN0YXRpYyB2b2lkIGZldGNoX3BpcGVfcGFyYW1zKHN0cnVjdCBkaXNwbGF5
X21vZGVfbGliICptb2RlX2xpYikKIAkJCQlkc3QtPnJlY291dF93aWR0aDsgLy8gVE9ETzogb3Ig
c2hvdWxkIHRoaXMgYmUgZnVsbF9yZWNvdXRfd2lkdGg/Pz8uLi5tYXliZSBvbmx5IHdoZW4gaW4g
aHNwbGl0IG1vZGU/CiAJCW1vZGVfbGliLT52YmEuT0RNQ29tYmluZUVuYWJsZWRbbW9kZV9saWIt
PnZiYS5OdW1iZXJPZkFjdGl2ZVBsYW5lc10gPQogCQkJCWRzdC0+b2RtX2NvbWJpbmU7CisJCW1v
ZGVfbGliLT52YmEuT0RNQ29tYmluZVR5cGVFbmFibGVkW21vZGVfbGliLT52YmEuTnVtYmVyT2ZB
Y3RpdmVQbGFuZXNdID0KKwkJCQlkc3QtPm9kbV9jb21iaW5lOwogCQltb2RlX2xpYi0+dmJhLk91
dHB1dEZvcm1hdFttb2RlX2xpYi0+dmJhLk51bWJlck9mQWN0aXZlUGxhbmVzXSA9CiAJCQkJKGVu
dW0gb3V0cHV0X2Zvcm1hdF9jbGFzcykgKGRvdXQtPm91dHB1dF9mb3JtYXQpOwogCQltb2RlX2xp
Yi0+dmJhLk91dHB1dEJwcFttb2RlX2xpYi0+dmJhLk51bWJlck9mQWN0aXZlUGxhbmVzXSA9Ci0t
IAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
