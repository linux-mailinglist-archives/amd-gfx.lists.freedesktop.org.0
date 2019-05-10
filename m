Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9826A1A23A
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 19:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076C289C9D;
	Fri, 10 May 2019 17:20:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790079.outbound.protection.outlook.com [40.107.79.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193A489C9D
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 May 2019 17:20:31 +0000 (UTC)
Received: from DM3PR12CA0061.namprd12.prod.outlook.com (2603:10b6:0:56::29) by
 DM5PR12MB1274.namprd12.prod.outlook.com (2603:10b6:3:78::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Fri, 10 May 2019 17:20:29 +0000
Received: from CO1NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by DM3PR12CA0061.outlook.office365.com
 (2603:10b6:0:56::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Fri, 10 May 2019 17:20:29 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT005.mail.protection.outlook.com (10.152.80.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Fri, 10 May 2019 17:20:29 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 10 May 2019
 12:20:17 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 15/16] drm/amd/display: Disable ABM before destroy ABM struct
Date: Fri, 10 May 2019 13:19:34 -0400
Message-ID: <20190510171935.19792-16-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510171935.19792-1-Bhawanpreet.Lakha@amd.com>
References: <20190510171935.19792-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(346002)(136003)(39860400002)(376002)(2980300002)(428003)(199004)(189003)(8676002)(81156014)(81166006)(316002)(2351001)(14444005)(53416004)(6916009)(47776003)(4326008)(478600001)(76176011)(77096007)(356004)(26005)(6666004)(51416003)(72206003)(7696005)(8936002)(4744005)(53936002)(305945005)(336012)(426003)(48376002)(186003)(446003)(36756003)(50226002)(486006)(5660300002)(11346002)(50466002)(16586007)(126002)(476003)(2616005)(68736007)(2906002)(1076003)(70206006)(70586007)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1274; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a75f0b8d-2726-45c7-8b9a-08d6d56bcccb
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM5PR12MB1274; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1274:
X-Microsoft-Antispam-PRVS: <DM5PR12MB12744417E3157E4FAD889327F90C0@DM5PR12MB1274.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:150;
X-Forefront-PRVS: 0033AAD26D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: VtsgOhLjEWVD3kUDlndEwOIx+dKRFmMUbH86QWRPQ7gOO5AGVxz+K136CkXvsT4O7pUXVukha1Tn7EEPEA3429EoVNQoRYzifyQDuhTWs2MSQrYOo8/EsvcaeAA5mfJ07Zrcbcp7M0bhSRsEEjJMnEWBZ//kXkUxZmLEhcj93pZLAm8M6QaYjEUJYg84dCpKArMDaZKw614v90u1Qkg7zyhvZd9ers9et24YB6hvWOpb6VFbPA/Bjvx8uefPbAaiCTNAsaB4l7NZ7p7NYM6V55OcYMjCBS5gasL9xc2ZWOc/8//H3f7Nu3xufex+TFxAX9yRWVtzIwqhqNeLH/Z3DHDwt+O00kFnCFSZslOBafQ+bG1no5FoR0iWPYEL4a8gPO+pTxLEgtiWbdX4xCvqOE2mQbu5vzat+egEyAde7tw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2019 17:20:29.1450 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a75f0b8d-2726-45c7-8b9a-08d6d56bcccb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1274
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kcNoeDAs3VLogOD7ZDn6pDaT2PBcdp6Ft66BtSQFkE=;
 b=CU19I7jbBL0L86XdCl71gZJFXaiQ6JcL1ifqpw7j7cDz5sjUrOzwgZTV5zAHNrJ1Yu3a9K0UJjptwQkrgf+/1HqBEOd78JyjnCgszvgfYssCMkfLM3E+k2T9pE0IavvEkKtf6yDYApzTMBgqeMkv7QBsIwoLM4G5ru8cRHe3rqA=
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
Cc: Paul Hsieh <paul.hsieh@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUGF1bCBIc2llaCA8cGF1bC5oc2llaEBhbWQuY29tPgoKW1doeV0KV2hlbiBkaXNhYmxl
IGRyaXZlciwgT1Mgd2lsbCBzZXQgYmFja2xpZ2h0IG9wdGltaXphdGlvbgp0aGVuIGRvIHN0b3Ag
ZGV2aWNlLiAgQnV0IHRoaXMgZmxhZyB3aWxsIGNhdXNlIGRyaXZlciB0bwplbmFibGUgQUJNIHdo
ZW4gZHJpdmVyIGRpc2FibGVkLgoKW0hvd10KU2VuZCBBQk0gZGlzYWJsZSBjb21tYW5kIGJlZm9y
ZSBkZXN0cm95IEFCTSBjb25zdHJ1Y3QKClNpZ25lZC1vZmYtYnk6IFBhdWwgSHNpZWggPHBhdWwu
aHNpZWhAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFudGhvbnkgS29vIDxBbnRob255Lktvb0BhbWQu
Y29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYWJtLmMgfCAy
ICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYWJtLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hYm0uYwppbmRleCBkYTk2MjI5ZGI1M2EuLjI5NTljM2M5
MzkwYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vf
YWJtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYWJtLmMK
QEAgLTQ3Myw2ICs0NzMsOCBAQCB2b2lkIGRjZV9hYm1fZGVzdHJveShzdHJ1Y3QgYWJtICoqYWJt
KQogewogCXN0cnVjdCBkY2VfYWJtICphYm1fZGNlID0gVE9fRENFX0FCTSgqYWJtKTsKIAorCWFi
bV9kY2UtPmJhc2UuZnVuY3MtPnNldF9hYm1faW1tZWRpYXRlX2Rpc2FibGUoKmFibSk7CisKIAlr
ZnJlZShhYm1fZGNlKTsKIAkqYWJtID0gTlVMTDsKIH0KLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
