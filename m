Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6A990075
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 13:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC26689E14;
	Fri, 16 Aug 2019 11:04:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810048.outbound.protection.outlook.com [40.107.81.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11E889E14
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 11:04:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bX2oXyZDH5XUiM9Qtd9O3zq2+DMQW6v+Fh+WyjlOZHQttbJucAk2VK5YtCU9M18wdwmS+1TCNOc64QfKZyeutIJQOaESwfQ3nROr7ugi98RAIXoG9Hwpx3QVA2tizTOnTsK5QZtgE+Z/hxJFI4j3ju+gsPbFhv3nDI/7J0rLl4JxRPc6Y7fxyh4gv6rqmu9H4dzIgqaGoe0Rb8J2beskO0D+RMmQq3x8BMBol7wgKxE3COPNBIMpLDItx+cGrqUOkmHA0kNlLWbhaj1C9hVpExCpNSrzVQakwhPXyyai4mP4khoGbsLvTPZn2B24y2i6aYn7Ld9S5F03K6qZ6y8NTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8zXuPlmhaxu1aQMbDf+bwJy9vcGuhtdhqNYhoX/dJA=;
 b=IqcaHD0prcdaysL92iAn/WliElk7ZmsrvO3l3fBdAHVROdRjWktLXp9acdUqHefGkCvFdBYIalFizHZ2Rzz5u+0UcLyRKbeaRfF6zuY9lgFYJrCxUy7E/VVLjXXX2vSjDYxZLy82kpumBg4ScbOXZlqH4WTsQX/AcunADebTMsnR9rTkb5aaAqUkp+rKRLT3qwffKy4KTRA1yBt2xLuREimO2OH5Z4y/JhiXaHCjYfKvOcBl+v3QlPQF8rQD/v6yRWmsHyQq9QZaj4JwNpfO84c5ThF9VI3mYAnJA1ZJPOmXGlhyuSCIsNVuSh4U90lR17ppjoiWMlFOhy1XC91Ghw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0100.namprd12.prod.outlook.com (2603:10b6:0:55::20) by
 BN6PR12MB1522.namprd12.prod.outlook.com (2603:10b6:405:11::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 16 Aug 2019 11:04:35 +0000
Received: from BY2NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by DM3PR12CA0100.outlook.office365.com
 (2603:10b6:0:55::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Fri, 16 Aug 2019 11:04:34 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT032.mail.protection.outlook.com (10.152.84.228) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Fri, 16 Aug 2019 11:04:34 +0000
Received: from guchchen-System-Product-Name.amd.com (10.34.1.3) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server (TLS) id
 14.3.389.1; Fri, 16 Aug 2019 06:04:32 -0500
From: Guchun Chen <guchun.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Hawking.Zhang@amd.com>,
 <Dennis.Li@amd.com>, <flora.cui@amd.com>, <Tao.Zhou1@amd.com>
Subject: [PATCH libdrm] amdgpu: add mmhub ras inject unit test
Date: Fri, 16 Aug 2019 19:04:01 +0800
Message-ID: <20190816110401.11069-1-guchun.chen@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(396003)(39860400002)(136003)(346002)(376002)(2980300002)(428003)(189003)(199004)(47776003)(86362001)(53416004)(26005)(70586007)(70206006)(186003)(4326008)(36756003)(2201001)(53936002)(5660300002)(44832011)(486006)(336012)(1076003)(50466002)(2906002)(476003)(48376002)(126002)(2616005)(426003)(7696005)(51416003)(4744005)(316002)(50226002)(16586007)(54906003)(6636002)(110136005)(478600001)(8676002)(305945005)(81156014)(6666004)(81166006)(356004)(8936002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1522; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc6d1a61-1ef9-4892-40a4-08d722398573
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1522; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1522:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1522E9E346DDF0536A758417F1AF0@BN6PR12MB1522.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-Forefront-PRVS: 0131D22242
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 7WIfpbOlkVoVVLdpCHuk2JzA8YHTJMT4mOWhR14EL3qhsQQkOmJHqAvw9fblKM5Rumnne1o43ZLjoAPk8QKaI1QUzOIy7B6XMgg3FDV8cIF49V0VzidL4zjQYAL0fLdEoDALdvFX1oCMQtHw/T0RwqFBL1P71kHOxAPLItfpMrIKmPEbomI89rgjx5cCML6r7g96udLtLcentGpTmn4F8/lEf2CNGb3+q5AjhJGus3vZhhd/AMPBqa1YdZEJ8FC685zYuKFiLj+2lqVFLJIA57r3AhYczTJ9VCYksja4GiNSxdTZF78UHNfGnlpYmHhSGIk9vHd5SnjFw0ohn5fNWAFJbtD7Bdx1R4w4Tq6vLInyZfpNc7Th/0ZNwyb92NnVR+xs2vIxDBOO57OL7YOmYbhaYshVW/R/9HmHj0ldQdE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2019 11:04:34.2087 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6d1a61-1ef9-4892-40a4-08d722398573
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1522
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8zXuPlmhaxu1aQMbDf+bwJy9vcGuhtdhqNYhoX/dJA=;
 b=FrmmGyNRPZGBxLhjoAr3jgtr28AGNeoWaZ/PIXvVjt6wtzU1yjGYmSzxijOjNwj3//FyWF/mHFG+hf+8wsjL9MhhNtrAeNNtS0crX1cj+/Q2bg+9cRBulLHBGMs/1S7dpaSNLPR1IuRunnKjvIXMDQVzC2sgJ4xq/hCUB0QNHA8=
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
Cc: Candice.Li@amd.com, Guchun Chen <guchun.chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2hhbmdlLUlkOiBJYTc2Yjk1MTYyZjVmNmY0MTlmNzBiNTNlZjQ0M2JjZWFmMmUwOTJlMApTaWdu
ZWQtb2ZmLWJ5OiBHdWNodW4gQ2hlbiA8Z3VjaHVuLmNoZW5AYW1kLmNvbT4KLS0tCiBkYXRhL2Ft
ZGdwdV9yYXMuanNvbiB8IDEwICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZGF0YS9hbWRncHVfcmFzLmpzb24gYi9kYXRhL2FtZGdwdV9y
YXMuanNvbgppbmRleCAyNmZkOTQ2NS4uNDg0ZjEyZjIgMTAwNjQ0Ci0tLSBhL2RhdGEvYW1kZ3B1
X3Jhcy5qc29uCisrKyBiL2RhdGEvYW1kZ3B1X3Jhcy5qc29uCkBAIC0xMjEsNiArMTIxLDkgQEAK
ICAgICAgICAgICAgICAgICAidXRjX2F0Y2wyX2NhY2hlXzRrX2JhbmsiOiAxMTEKICAgICAgICAg
ICAgIH0KICAgICAgICAgfSwKKyAgICAgICAgIm1taHViIjogeworICAgICAgICAgICAgImluZGV4
IjogMworICAgICAgICB9LAogICAgIH0sCiAgICAgInR5cGUiOiB7CiAgICAgICAgICJwYXJpdHki
OiAxLApAQCAtMjYzLDUgKzI2NiwxMiBAQAogICAgICAgICAgICAgImFkZHJlc3MiOiAwLAogICAg
ICAgICAgICAgInZhbHVlIjogMAogICAgICAgICB9LAorICAgICAgICB7CisgICAgICAgICAgICAi
bmFtZSI6ICJyYXNfbW1odWIuMS4wIiwKKyAgICAgICAgICAgICJibG9jayI6ICJtbWh1YiIsCisg
ICAgICAgICAgICAidHlwZSI6ICJzaW5nbGVfY29ycmVjdGFibGUiLAorICAgICAgICAgICAgImFk
ZHJlc3MiOiAwLAorICAgICAgICAgICAgInZhbHVlIjogMAorICAgICAgICB9LAogICAgIF0KIH0K
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
