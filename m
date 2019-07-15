Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D95B869D97
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5788B89B9F;
	Mon, 15 Jul 2019 21:21:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740040.outbound.protection.outlook.com [40.107.74.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E179689BA3
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cugoyLnAu1FWCsmAoT5wfVsbbg9jx5UutnHnFUTqdGvDMzx7LyGWBbYVO7fC3V/lPhJr52BYP9lxuKPpwcxToOQP3HycdQL8eGnXvAbn4miT7AuljoYAotbfpeYN6IcJX6GIeE85qvnj81PBt9x4EBumzagUtNmnAeCwm1IU8Yoka04/q05ldt8TfZo6oUv3HL+pBOuvrca0DV+9LCKksgeKTknd1P+vOhrT68SFH1kdsSSBWTWOb2o8U3NdQ5rCxdyPsV05vKMlCgMFU9uVhvMOBCY8zixCHnQLKbKGoCh5RuCJO3u5PaUnE6YzOkEUJMbnJOfI2x4gItQ+oGbe9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcs2d7AYgHp1ucE5zO8KQBHeAFW7+Ik2cvJ+uAlHS0Y=;
 b=AJp+Pm5NKa8V4bKWsKgYbsuoD/uacpofZbyn+ShCNP7knANLndZ1MCOGgKZI7WFpMM1m0G7NtwhbmdKVCUegFIaV9+zR27A8QGsk9sJRDPZTQ4eOYPe3K7uDbkIuRf0J336U5mEBPp/Dyrpg9tB4QYdc/saFD1R766pNOfavmFxIJN/rB6StLq6Q4VgM0NUowy/N57gsjFUPRj+qcI5cVcRrEVLpTiQl9clmr/jPVPoDrP29niciAGaHzj7zJ5GQBdSQCSEJjwTl0o5mujnxInusX+DUGoAH0XrtLQpG1Ye4h7nHqPg67Pt3Ln1GEQZnXwAy5LDNs7iW7muEHjRIpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0042.namprd12.prod.outlook.com (2603:10b6:301:2::28)
 by MN2PR12MB3936.namprd12.prod.outlook.com (2603:10b6:208:16a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10; Mon, 15 Jul
 2019 21:21:12 +0000
Received: from CO1NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by MWHPR12CA0042.outlook.office365.com
 (2603:10b6:301:2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:11 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT009.mail.protection.outlook.com (10.152.80.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:11 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:04 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/87] drm/amd/display: fix dsc disable
Date: Mon, 15 Jul 2019 17:19:27 -0400
Message-ID: <20190715212049.4584-6-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(376002)(396003)(2980300002)(428003)(189003)(199004)(446003)(68736007)(356004)(6666004)(76176011)(6916009)(70586007)(70206006)(51416003)(26005)(486006)(336012)(36756003)(47776003)(126002)(86362001)(476003)(2616005)(11346002)(2906002)(49486002)(2870700001)(426003)(53936002)(305945005)(50226002)(4326008)(1076003)(2876002)(54906003)(478600001)(186003)(8676002)(2351001)(81166006)(316002)(50466002)(14444005)(48376002)(81156014)(8936002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3936; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56d59a3d-ea2b-4daf-0656-08d7096a5c37
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MN2PR12MB3936; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3936:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3936E41AF89084A7FA29E63682CF0@MN2PR12MB3936.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: npZ4MrIZK/PnV8D/HToiIssjT9jRT/7exSZXdrrMxSqaCVfGT8MzVgoprE+3E/9C8F/HfRTLz8we5SmL7csg6wHrc0GyltFFfrSXYRy3FoHlokUlbVsvJFT/1p7wMqO5E9ZeXugCCS9w92hHoMNVvMukX50/9v33NOrY+XnMlNx1g3TI+DdnHoXJeSiEfrxXWkL+ItHRmvDbiX7YY9JsIH0vjFDP9dSFZMFcJwM3pFZSsegZCLsK8p98lMILeZ7bJhAYgV2e/eoulgUrzLDtLK0B+N4FQyUv/wfXZNpO8ynFMOsvpHBMkxUBL07IzqCRaDS4L6AzTzsVXCyGzLDCHsscm2YUXABODaY/rhQaScXNxF+Ny7vPAL6Pdxb/1Jn2/pqErcF+16DDm0oHvfD81FWbWdM1p8poGWuAvKoLMLs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:11.2476 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d59a3d-ea2b-4daf-0656-08d7096a5c37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3936
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcs2d7AYgHp1ucE5zO8KQBHeAFW7+Ik2cvJ+uAlHS0Y=;
 b=dgRaISx+MIbNi5pyFFoURl/eeG3TnTXsgFX8cXeRMPjvGPa6k6GBVAoA7QwJzqVlQkzWYlGwlXI7KKhM+Ary6T9r4yZ8IcFaQfpc28KsQW4hhgZTEOlmodiELbKl0cKUp6GfZsZBnTK2ble08NTvlnZjvefox7JucXSiNeVnbjM=
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
 Nikola Cornij <Nikola.Cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCkEg
cmVncmVzc2lvbiBjYXVzZWQgZHNjIHRvIG5ldmVyIGdldCBkaXNhYmxlZCBpbiBjZXJ0YWluIHNp
dHVhdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBEbXl0cm8gTGFrdHl1c2hraW4gPERteXRyby5MYWt0
eXVzaGtpbkBhbWQuY29tPgpSZXZpZXdlZC1ieTogTmlrb2xhIENvcm5paiA8Tmlrb2xhLkNvcm5p
akBhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgfCA1ICsrKyst
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwppbmRl
eCA2OTI1ZDI1ZDI0NTcuLjQ1ZjlkYWQ5NTY0NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKQEAgLTE3MTUsOCArMTcxNSwxMSBA
QCBzdGF0aWMgdm9pZCBkY24yMF9yZXNldF9iYWNrX2VuZF9mb3JfcGlwZSgKIAkJZWxzZSBpZiAo
cGlwZV9jdHgtPnN0cmVhbV9yZXMuYXVkaW8pIHsKIAkJCWRjLT5od3NzLmRpc2FibGVfYXVkaW9f
c3RyZWFtKHBpcGVfY3R4LCBGUkVFX0FDUVVJUkVEX1JFU09VUkNFKTsKIAkJfQotCiAJfQorI2lm
ZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUCisJZWxzZSBpZiAocGlwZV9jdHgtPnN0
cmVhbV9yZXMuZHNjKQorCQlkcF9zZXRfZHNjX2VuYWJsZShwaXBlX2N0eCwgZmFsc2UpOworI2Vu
ZGlmCiAKIAkvKiBieSB1cHBlciBjYWxsZXIgbG9vcCwgcGFyZW50IHBpcGU6IHBpcGUwLCB3aWxs
IGJlIHJlc2V0IGxhc3QuCiAJICogYmFjayBlbmQgc2hhcmUgYnkgYWxsIHBpcGVzIGFuZCB3aWxs
IGJlIGRpc2FibGUgb25seSB3aGVuIGRpc2FibGUKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
