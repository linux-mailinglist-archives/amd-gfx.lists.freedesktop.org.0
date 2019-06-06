Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B2F37F0F
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 22:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E747898D9;
	Thu,  6 Jun 2019 20:55:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700075.outbound.protection.outlook.com [40.107.70.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE96A898D9
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 20:55:24 +0000 (UTC)
Received: from CY4PR12CA0028.namprd12.prod.outlook.com (2603:10b6:903:129::14)
 by MWHPR1201MB0062.namprd12.prod.outlook.com (2603:10b6:301:54::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.14; Thu, 6 Jun
 2019 20:55:23 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by CY4PR12CA0028.outlook.office365.com
 (2603:10b6:903:129::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.12 via Frontend
 Transport; Thu, 6 Jun 2019 20:55:22 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 20:55:22 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 6 Jun 2019
 15:55:08 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 13/24] drm/amd/display: 3.2.34
Date: Thu, 6 Jun 2019 16:54:50 -0400
Message-ID: <20190606205501.16505-14-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(396003)(136003)(346002)(39860400002)(2980300002)(428003)(189003)(199004)(51416003)(7696005)(76176011)(48376002)(8936002)(316002)(2906002)(68736007)(50226002)(14444005)(356004)(70586007)(70206006)(6666004)(26005)(77096007)(186003)(336012)(486006)(126002)(11346002)(426003)(2351001)(446003)(2616005)(476003)(4326008)(53936002)(305945005)(72206003)(36756003)(8676002)(81156014)(81166006)(53416004)(50466002)(16586007)(47776003)(86362001)(6916009)(4744005)(5660300002)(1076003)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0062; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b88450d-e5e9-4a3b-489a-08d6eac14ae1
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR1201MB0062; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0062:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0062ACA5FDD353F7A0F216F0F9170@MWHPR1201MB0062.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: NBUMU+OZDdJ9elm7184/Bh+rWa7AgFtIixC2neFCJ28wLq8XBHDD0HmggVIbnhbFSpcENEmZwawALwWykLsKYJeGj8LiRR5ljuoAy04YprpMsnpDndYxSj7eXl9vyCs86Lj+stzniwpfLsif9VzcOOoc1nlgvHA9TOb3I0AmxZc2ltQz4eYFP44U/wz5o+wWUZSlr+uAMT6o1RU2VGROU1hAeG1ccg/WG7I2AuD2I8n0qVizEccV+1eCPqAehyhH0fMSHs/RLRE9jf0bpDte9r6XoReWbBxNpK3n57kbXrq08vQ3ya4yX1bM+SnCVtRRqgG+IpJB1p86x5nR4w07tSzzXnMmi0L2aEB3LoyO6JL7ZSv6Rf78bP22rrJNE0BSquPKKHxUg1ZR4yCubWTiwxrjRH7at2q62yy0pUJHVaE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 20:55:22.3997 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b88450d-e5e9-4a3b-489a-08d6eac14ae1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0062
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZ8sU2cemv4+4nFobMpDbm0s9AX7z2zt2eAH1alUJkQ=;
 b=hx/91btfSlMAmyjuzMSDIPgA0P0q5aX/E0t34EJJ+JSU4N2eckuB7/OJkYxwjdcCU2uFFVr5ibAsEsa7FiINRY0LbxT71bn8hq8coqOIQzZNVHFW0TuedN2/N7iVL/CswHCpbSigVhdUNu4EIzYG/lbQi6WvxI9Pfu+oS4Im9fs=
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
Cc: Aric Cyr <aric.cyr@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQXJpYyBDeXIgPGFyaWMuY3lyQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBBcmljIEN5
ciA8YXJpYy5jeXJAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFyaWMgQ3lyIDxBcmljLkN5ckBhbWQu
Y29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kYy5oCmluZGV4IDNmMjIyMTI0MzdjYS4uNTlhOWUxZWE4MDZkIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaAorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaApAQCAtMzksNyArMzksNyBAQAogI2luY2x1ZGUgImlu
Yy9ody9kbWN1LmgiCiAjaW5jbHVkZSAiZG1sL2Rpc3BsYXlfbW9kZV9saWIuaCIKIAotI2RlZmlu
ZSBEQ19WRVIgIjMuMi4zMyIKKyNkZWZpbmUgRENfVkVSICIzLjIuMzQiCiAKICNkZWZpbmUgTUFY
X1NVUkZBQ0VTIDMKICNkZWZpbmUgTUFYX1BMQU5FUyA2Ci0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
