Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD1B7DAB6
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 13:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8C16E546;
	Thu,  1 Aug 2019 11:55:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750044.outbound.protection.outlook.com [40.107.75.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39926E546
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 11:55:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTztQWohFNIZWR5yLwJyasq6ZR5B+XGVxDYVCAPlxl90+6W9+AK3IUu62gBxIJhqsDl7cMKDbPLzkmLPUIZd5zzUlhG7XJScGVU7pyPAvomV3scAjThw1uFUIUkYYjruI/5ahCzOW3+BDYP393/VdnL3PdVgN/jaUhBVsxAhsOpO+LmAlcLOJgfdO8AxQ5O2m2a8NuD2a2lBVwyV+MEQ9c36V+0N7JlqKE8XyzPdW4J8nVR/x053S75h5QOICBG57CX7ISVZFI89agk0cgTrhOb61qdU3XxYoDSCz1H4F4bwTCDy+UnucZX7INtC+4uPbpbJMIEcOza7x7kq9N0bRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRmdEHQ3RGWlusrOdiaNcDFtXuV3RVC91nWo/rP9u3k=;
 b=kTZZXd8pZFxHCwY5tc6zdvARA3SUMYDnBHbIBFd0h1D9aNPQYHxXbPu4Wea8eWvv1QLZ4iz82T6t25lNojcoGM81UN0gUcgiBo//0DMRqvQDMPTE4+sOzl8STj3mNWCWw7yfnX2FSRE8IYTYTBUPq2mcotA0cpvnMBIs9Qw+uY196GtXCjqFyNFol/UYlPKGm7GEdaxnCx9QBu5MHLoDXlFLjQwnfG/oaEH/bKZY9ZtA2rzFyaPmGKc+u+CW2EawnoHJ6Ts+ekGRa8NRgYtTRjg1FCOHUCkTUmJXUOoWZzKiJBlRRfQYKQQUGCMOLP1UrUsq75VUKyKRUQvuxwI/5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CH2PR12CA0004.namprd12.prod.outlook.com (2603:10b6:610:57::14)
 by MW2PR12MB2539.namprd12.prod.outlook.com (2603:10b6:907:9::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.15; Thu, 1 Aug
 2019 11:55:15 +0000
Received: from BY2NAM03FT042.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by CH2PR12CA0004.outlook.office365.com
 (2603:10b6:610:57::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.12 via Frontend
 Transport; Thu, 1 Aug 2019 11:55:15 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT042.mail.protection.outlook.com (10.152.85.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Thu, 1 Aug 2019 11:55:14 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 1 Aug 2019
 06:55:13 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <hawking.zhang@amd.com>,
 <dennis.li@amd.com>, <guchun.chen@amd.com>, <xinhui.pan@amd.com>
Subject: [PATCH 0/5] enable umc ras ce interrupt v2
Date: Thu, 1 Aug 2019 19:54:49 +0800
Message-ID: <20190801115454.21867-1-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(136003)(2980300002)(428003)(199004)(189003)(50466002)(48376002)(14444005)(47776003)(6666004)(478600001)(5660300002)(7696005)(486006)(53936002)(356004)(426003)(86362001)(4744005)(2906002)(476003)(126002)(51416003)(2616005)(50226002)(68736007)(336012)(53416004)(4326008)(6636002)(70586007)(305945005)(70206006)(8676002)(16586007)(1076003)(316002)(81156014)(2201001)(36756003)(110136005)(26005)(81166006)(8936002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2539; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab346aab-24c0-4161-d3b5-08d716771d92
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MW2PR12MB2539; 
X-MS-TrafficTypeDiagnostic: MW2PR12MB2539:
X-Microsoft-Antispam-PRVS: <MW2PR12MB2539A56350C0D091CCC95FA4B0DE0@MW2PR12MB2539.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:576;
X-Forefront-PRVS: 01165471DB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Yd3G5WjSxpOZ3ZEr134JRONpxubC/MBNF+LZ4PpScL4O1K3BzALCZchcbZdrhewaX3H0639uBXuIGm7zsnZwS+9NryLtVcH0V2xvdl+sLfcxzfnXsHdwLOOpEPu5a1h0Vh7uklH5NVNppA8Be+08oOl5xV2JxNa4WKkjoqukVWcgYLi36dOdY2eozs5NLayaTgQhEFtghwVMmTMXscjQaowtfvOb0HwXEazlaE9L7h95Ym27XkcRlQvrbRS0JJqWsOfZH2ZynhIMw0gMQ7D4lIABMdHswHAF3Q0/RraEXg+d08u8/5vWpZc2LSjseJEPzlUsLl7zNsknWJEJ3kwcwyhuRcrIRYYiIHhhOgUxTuYfx0YdWC32LfSnelQ6nQClj7mMvCJg/FnGzryJwIUW/EA7ZGtvZo1rmt+cTvKex1o=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 11:55:14.7724 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab346aab-24c0-4161-d3b5-08d716771d92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2539
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRmdEHQ3RGWlusrOdiaNcDFtXuV3RVC91nWo/rP9u3k=;
 b=E+IVZnZX+Dhvx/3kikdfudCF3zNEhavbBw5s66k2LD/4nc9EVsWuB2sYeiphvrlb6YI4HTWIVeAPjDK+CpnaYxjOAqioD7FZl5ZCJqzw4D7fpc5H69PBy0zEK+PN09ee7TIskF7aXkfW40W7MvRKxsZb2EU6H41HiXWiIHKu/sA=
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

VGhlc2UgcGF0Y2hlcyBhZGQgc3VwcG9ydCBmb3IgdW1jIGNlIGludGVycnVwdCwgdGhlIGludGVy
cnVwdCBpcyBjb250cm9sbGVkIGJ5IGEgZXJyb3IgY291bnQgdGhyZXNob2xkLgoKdjI6IGNvcnJl
Y3QgdHlwbyBpbiBjb21taXQgZGVzY3JpcHRpb24gYW5kIHVwZGF0ZSBjb21tZW50IG9mIHBhdGNo
ICMyCmFkZCBwYXRjaCAjNSB0byByZXBsYWNlIEFNREdQVV9SQVNfVUUgd2l0aCBBTURHUFVfUkFT
X1NVQ0NFU1MKClRhbyBaaG91ICg1KToKICBkcm0vYW1kZ3B1OiBzdXBwb3J0IGNlIGludGVycnVw
dCBpbiByYXMgbW9kdWxlCiAgZHJtL2FtZGdwdTogaW1wbGVtZW50IHVtYyByYXMgaW5pdCBmdW5j
dGlvbgogIGRybS9hbWRncHU6IHVwZGF0ZSB0aGUgY2FsYyBhbGdvcml0aG0gb2YgdW1jIGVjYyBl
cnJvciBjb3VudAogIGRybS9hbWRncHU6IG9ubHkgdW5jb3JyZWN0YWJsZSBlcnJvciBuZWVkcyBn
cHUgcmVzZXQKICBkcm0vYW1kZ3B1OiByZXBsYWNlIEFNREdQVV9SQVNfVUUgd2l0aCBBTURHUFVf
UkFTX1NVQ0NFU1MKCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgfCAx
NCArKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgICB8ICAy
ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jICAgfCAgOCArKystLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgIHwgIDIgKy0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMgICB8IDQyICsrKysrKysrKysrKysrKysrKysr
KystLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmggICB8ICA3ICsrKysr
CiA2IGZpbGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
