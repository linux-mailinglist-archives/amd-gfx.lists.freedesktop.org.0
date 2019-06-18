Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CAF49F61
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jun 2019 13:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C183E6E144;
	Tue, 18 Jun 2019 11:41:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770049.outbound.protection.outlook.com [40.107.77.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2AD6E140
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 11:41:16 +0000 (UTC)
Received: from SN1PR12CA0060.namprd12.prod.outlook.com (2603:10b6:802:20::31)
 by CY4PR1201MB0053.namprd12.prod.outlook.com (2603:10b6:910:23::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.13; Tue, 18 Jun
 2019 11:41:15 +0000
Received: from DM3NAM03FT011.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by SN1PR12CA0060.outlook.office365.com
 (2603:10b6:802:20::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.14 via Frontend
 Transport; Tue, 18 Jun 2019 11:41:14 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT011.mail.protection.outlook.com (10.152.82.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1987.11 via Frontend Transport; Tue, 18 Jun 2019 11:41:14 +0000
Received: from hawzhang-Navi-Product-U1604.amd.com (10.34.1.3) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Tue, 18 Jun 2019 06:41:13 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH libdrm 3/4] libdrm/amdgpu: add new vram type (GDDR6) for navi10
Date: Tue, 18 Jun 2019 19:40:32 +0800
Message-ID: <1560858033-1499-3-git-send-email-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560858033-1499-1-git-send-email-Hawking.Zhang@amd.com>
References: <1560858033-1499-1-git-send-email-Hawking.Zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(136003)(396003)(376002)(2980300002)(428003)(189003)(199004)(4744005)(76176011)(50466002)(48376002)(2906002)(77096007)(446003)(7696005)(51416003)(26005)(486006)(126002)(36756003)(50226002)(476003)(2616005)(72206003)(70206006)(70586007)(305945005)(186003)(16586007)(8936002)(426003)(86362001)(68736007)(2351001)(356004)(336012)(81156014)(54906003)(47776003)(316002)(478600001)(53936002)(11346002)(6666004)(4326008)(6916009)(5660300002)(81166006)(53416004)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0053; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f6e7ef5-97d6-49e1-6c31-08d6f3e1de98
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:CY4PR1201MB0053; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0053:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0053E441D367472E3D5B473CFCEA0@CY4PR1201MB0053.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-Forefront-PRVS: 007271867D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: wbzyQmdu3/4c5pyuQ4BNva0ZaNgOLgaGmfRuyy+1oKTERPZex7Kuur2ttGtXepwILR96OsIKUundo26rnJV3nK98uYjmG3KTXKCQ7qjVpBs9XrEu7Pi+aICHVeXtz70jljyYjWRkxG3zLQjM3cD5MsYCS1LyEQfMn4EWQ2dZKuudXyj6hdUgFUdz6s4CKqG+2Y8geqrrA9D2KumEKakn8WwwVQDaEM9sFeXcl1n/41G3H9G2fbYG4r5B27y1r6WNFIUpntnmitXD0KS1OtgRYnuWwaHtyGStuYHsqadck4p7+6I6dq++/q8iKJA0i4Y27HnqkEScz+D43hTPsOtjiMtRKHP1SuJMiBc5ZHNpbN4RrmJdf3Z4MYbiXRGb/5ISdiHuLAAShKdzHcZMVRHNUQOFcwNZ8PCGNHe6qQIMp04=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2019 11:41:14.6135 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f6e7ef5-97d6-49e1-6c31-08d6f3e1de98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0053
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSW23GW19vSx34PQ2eKcmCd8DCqes2tc/H2+/UUVio8=;
 b=yWiHcqIRPr0+uzLt55cKlXKTkCO0EGrphUSRfTJV/skYnNcpn2mwyu0PbAI2uPwppE10HJbeg8bqNSsSXJJZZYx7N5Saj+wzFZkRfOavKoztE/FESE5ad2D+lJRuPzRMQyg0Zw0Q2yo1k5PMjTtYcQtxzaDpPtzC1SjsT5VrhEk=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgoKQU1ER1BVX1ZSQU1fVFlQRV9HRERS
NiBpcyBhIG5ldyB2cmFtIHR5cGUgZm9yIG5hdmkxMAoKQ2hhbmdlLUlkOiBJNjc4OTIzMGY4Zjdm
NWJkY2IwYWVjODJjYzc2NGQxMGQ3MmM0Y2JhOApTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFv
Lnpob3UxQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5n
QGFtZC5jb20+Ci0tLQogaW5jbHVkZS9kcm0vYW1kZ3B1X2RybS5oIHwgMSArCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9hbWRncHVfZHJt
LmggYi9pbmNsdWRlL2RybS9hbWRncHVfZHJtLmgKaW5kZXggYjBjNzU1NS4uMDE1YmQ5ZiAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9kcm0vYW1kZ3B1X2RybS5oCisrKyBiL2luY2x1ZGUvZHJtL2FtZGdw
dV9kcm0uaApAQCAtOTEzLDYgKzkxMyw3IEBAIHN0cnVjdCBkcm1fYW1kZ3B1X2luZm9fZmlybXdh
cmUgewogI2RlZmluZSBBTURHUFVfVlJBTV9UWVBFX0hCTSAgIDYKICNkZWZpbmUgQU1ER1BVX1ZS
QU1fVFlQRV9ERFIzICA3CiAjZGVmaW5lIEFNREdQVV9WUkFNX1RZUEVfRERSNCAgOAorI2RlZmlu
ZSBBTURHUFVfVlJBTV9UWVBFX0dERFI2IDkKIAogc3RydWN0IGRybV9hbWRncHVfaW5mb19kZXZp
Y2UgewogCS8qKiBQQ0kgRGV2aWNlIElEICovCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
