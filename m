Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1C990035
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 12:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154DA6E2E8;
	Fri, 16 Aug 2019 10:46:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810081.outbound.protection.outlook.com [40.107.81.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409426E2E8
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 10:46:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TeHvK4n9xcbIihy3BwLUZ4sKYTHrJSNSidf/X0eMMTfMWzjDW+K1bwnGvbixsd3ClYQuBGa2HiInQcK5Srlb5I6hVH5KdRoRn5unWtHK7p68pn6i7VPWWkSGkWB3Jj25H1bEbhf6CWTIyTUjfzxpTyybIYWqvtdf0SG8nhoDZjnhyhTiIIdF27HNR+EwYegEXuYF72rYmZ3cQ0fd/fZIa5edhV6qlLwbx05Mq/yRCwdBFW5CRl+SQjbLOfxaNTPUdlzDMt52KTJC6w050PyDqIkhh1aMEi8kP3PY/bBLLTyIrl8cGgGuzC6AjEtGcnq1+5rmx/bhAd8rSEUvZtV2Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLXVQxZqyITvO1T0cyi5RVGGjPylSRWh2FXAv4dY9cg=;
 b=iH4fLmIdKpv2buWc31ZoU1zVg4v/TMmHdqia7EMipPCZx/Ju+zJiZqQeRfBY9f3E0QRkCq8FVZc69Mv/VeHHe/zT62BtMbiBEZLxROadp+omS0X/kvMPyYRl1wiwg45la9yqnGmkfPOk743rGQWb3NtFOoy6K5M/sulvOWsOnGkxgk6RYFl9AdVkD0UbkxKIedlz5oMeEzKJDDco+lmmp1XbtC/yFDFLFjrNVJ1kq7xNJSqXjM39nyFGftKWfTzVdBWAp3QiHRKbVDalC5zAus4gomQkNqbzmNi5DWPLs4ykzjbG7JgogGBRC4ydV5mDJK8JSH3j3FdMXzVhBELhVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0066.namprd12.prod.outlook.com (2603:10b6:0:56::34) by
 DM6PR12MB2716.namprd12.prod.outlook.com (2603:10b6:5:49::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 16 Aug 2019 10:46:30 +0000
Received: from CO1NAM03FT036.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by DM3PR12CA0066.outlook.office365.com
 (2603:10b6:0:56::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Fri, 16 Aug 2019 10:46:30 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT036.mail.protection.outlook.com (10.152.80.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Fri, 16 Aug 2019 10:46:29 +0000
Received: from guchchen-System-Product-Name.amd.com (10.34.1.3) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server (TLS) id
 14.3.389.1; Fri, 16 Aug 2019 05:46:27 -0500
From: Guchun Chen <guchun.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Hawking.Zhang@amd.com>,
 <Dennis.Li@amd.com>, <flora.cui@amd.com>, <Tao.Zhou1@amd.com>
Subject: [PATCH libdrm] tests: bypass amdgpu test build without lib-jsonc
Date: Fri, 16 Aug 2019 18:46:16 +0800
Message-ID: <20190816104616.4719-1-guchun.chen@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(346002)(2980300002)(428003)(199004)(189003)(2616005)(16586007)(356004)(6666004)(110136005)(48376002)(53936002)(4326008)(51416003)(7696005)(478600001)(316002)(50226002)(50466002)(53416004)(81166006)(8676002)(8936002)(47776003)(2201001)(305945005)(81156014)(36756003)(5660300002)(70206006)(426003)(70586007)(336012)(126002)(476003)(26005)(186003)(486006)(44832011)(4744005)(1076003)(6636002)(2906002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2716; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a638ab6-f867-44b8-89ac-08d72236ff05
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2716; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2716:
X-Microsoft-Antispam-PRVS: <DM6PR12MB27166C2AA14026304006D7F8F1AF0@DM6PR12MB2716.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 0131D22242
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: pntiOT5XqzTpVweBxYVbAOL/LakEM/utKsRSE7qMxuGn/3kMru7LFLLRcnwvQJjyt84k0/ndYalcIBzQbnizNDWyKjpY+k344lzwJAsGkQWJZX2jALClsDhIoR1aBrt31D8zg5GNGZVwAoGml/gfocWAFmInNRcGrRXB4Mmz5T/pUjX0xARMB0G7A3inq/8xhboO39JbsUoFk4m/pGPuAPgqY/8m8xjzUrg2n1d9SmHvj9kzoCkS717vXCznIjdShPlYK8WXGiim2UGhTLvHgoA2M8XDU/1qCT0uQ5F+hkkNDIeiWsuG1ixX8D8SRwBf2xdg2i29uxkTg4zO/BLWE1FlPVZrfIZtodWILMmF3sGVZE9Q8/At5/HC6eTsH6RIOwR/lXD+sPftIm9azyGfDEZc7LmP4HbMJcTXkY4w518=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2019 10:46:29.6324 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a638ab6-f867-44b8-89ac-08d72236ff05
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLXVQxZqyITvO1T0cyi5RVGGjPylSRWh2FXAv4dY9cg=;
 b=nacvSgBtNN+a19QakJcxT5kvkTgawTBKgC2cPD0V6IMpIS+nkjmYIkYxV6m+nbFMj3X23xwidwhYqlyxwQqkjSG5ObJv7TyPgcEiYHTD6koC6pwk0Xhxj8gDq+BKAqxFTuBQ/yTgbcNXQWX05CgEj6TbmX2VGemx+2C28jcvsi8=
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
Cc: Guchun Chen <guchun.chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2l0aG91dCBsaWItanNvbmMsIG9uZSBidWlsZCBlcnJvciBoYXBwZW5zLiBTbyB0aGlzIHBhdGNo
CmlzIHRvIGZpeCB0aGlzLgoKcmFzX3Rlc3RzLmM6MzM6MTA6IGZhdGFsIGVycm9yOiBqc29uLmg6
IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKICNpbmNsdWRlICJqc29uLmgiCiAgICAgICAgICBe
fn5+fn5+fgpjb21waWxhdGlvbiB0ZXJtaW5hdGVkLgpNYWtlZmlsZTo2MzY6IHJlY2lwZSBmb3Ig
dGFyZ2V0ICdhbWRncHVfdGVzdC1yYXNfdGVzdHMubycgZmFpbGVkCgpDaGFuZ2UtSWQ6IEkyY2E1
ZjgxM2E2ZDNlMTE4YTU3OTNjZTgwNzc2ZWUyYjI3NDkwMjM5ClNpZ25lZC1vZmYtYnk6IEd1Y2h1
biBDaGVuIDxndWNodW4uY2hlbkBhbWQuY29tPgotLS0KIHRlc3RzL01ha2VmaWxlLmFtIHwgMiAr
KwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL01h
a2VmaWxlLmFtIGIvdGVzdHMvTWFrZWZpbGUuYW0KaW5kZXggZDI3NGEzZTkuLmFmY2ZkNDg5IDEw
MDY0NAotLS0gYS90ZXN0cy9NYWtlZmlsZS5hbQorKysgYi90ZXN0cy9NYWtlZmlsZS5hbQpAQCAt
MTAsOSArMTAsMTEgQEAgZW5kaWYKIAogaWYgSEFWRV9BTURHUFUKIGlmIEhBVkVfQ1VOSVQKK2lm
IEhBVkVfSlNPTkMKIFNVQkRJUlMgKz0gYW1kZ3B1CiBlbmRpZgogZW5kaWYKK2VuZGlmCiAKIGlm
IEhBVkVfRVhZTk9TCiBTVUJESVJTICs9IGV4eW5vcwotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
