Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCDDD1A8C
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 23:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DA56EA6D;
	Wed,  9 Oct 2019 21:06:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770078.outbound.protection.outlook.com [40.107.77.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129206EA69
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 21:06:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEbjgssxmekTmJHTQsMzxo2mCqowN6Re174pXSyxPbANP056hcPOOebqai/RN/yZnIix6L5Xnv5FXN/bHccrGjYOdeMCC/k2Sn2WkqbihEUx1jbFllJ5gxG/QpcPxxgwPpBvajK8zdyWuQElttbDrxKDs7V7OVX3jKNOqKvxXq4qawJ3YH0neZq6Za9NbI6JcwA55A034cS4/lH5PDCJYNKVsGLgKHJCJaF41K3+Lgmy5DPfVw41lwoNvM/d8VxutPCnBghhIIuNjxPz5ERMTOMfzWJmnAWtsgi6QSDReTVVy7QI7iIgGtKqIVQDNbhtEYTeMRmPzJxY1xdXAkkUfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AJsBLAFCiO3DqUx8KIGpbKeyKildrPSEPWqqQYzAwI=;
 b=UHgw1T8agsw24COeCeovCAG0yeoYsjX5TjfTsEKDPGag5UuLKbFHsy6im662uXpA52BPJn8qCbiMdVKB5QGbWzwsmFJFPP+kWWL+aA1GW/Y354m4GxuZkq3jyueb7wAZIXmg5dh/ZlFRt5Keq++pJFbXKMoIVAM+mDPNErI+DszIDcJPP76Zwtq0KefdGNfOOICSbAf/mi/bM5HmqtNFvj+VjBa6FQtY+6HsFvYWYoGMhAb/wgVhAq8cZyLZ6k9Tmtv0bo3u4AESXs6cmFj0isMlHuYzgL26SfeE0CmL0mLxcFQo3fBdLzatOQORYv8y6FN+NgXrn0IxpAYrKaOOzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0029.namprd12.prod.outlook.com (2603:10b6:5:1c0::42)
 by DM5PR12MB1500.namprd12.prod.outlook.com (2603:10b6:4:11::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 9 Oct 2019 21:06:26 +0000
Received: from DM3NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by DM6PR12CA0029.outlook.office365.com
 (2603:10b6:5:1c0::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Wed, 9 Oct 2019 21:06:26 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT032.mail.protection.outlook.com (10.152.82.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 9 Oct 2019 21:06:26 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 9 Oct 2019
 16:06:25 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 14/26] drm/amd/display: correct dcn21 NUM_VMID to 16
Date: Wed, 9 Oct 2019 17:06:01 -0400
Message-ID: <20191009210613.17929-15-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
References: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(39860400002)(376002)(346002)(136003)(396003)(428003)(189003)(199004)(48376002)(47776003)(4326008)(2351001)(86362001)(50466002)(50226002)(8676002)(81156014)(54906003)(81166006)(8936002)(16586007)(53416004)(316002)(336012)(36756003)(476003)(2616005)(426003)(70206006)(486006)(11346002)(446003)(4744005)(5660300002)(70586007)(478600001)(7696005)(51416003)(14444005)(76176011)(126002)(1076003)(6916009)(2906002)(305945005)(26005)(186003)(356004)(6666004)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1500; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9069e38-3d62-4134-169a-08d74cfc8c7a
X-MS-TrafficTypeDiagnostic: DM5PR12MB1500:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1500E4AFF85B241A3ED51599F9950@DM5PR12MB1500.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UVpmqBJ4xqPBDTOgxS4BNmfp3PhaNIZwpq7xvfTMUlk2V6Y+NHp2hTfqMdfuZyds4aFPDMiw/TKbVFVL0BLl5tTaJr/YtjVou1dWx4SMy7xd5FmdKbQAsWNNjpgqBerCm0Cs2qVk/Sjx9oFhppw7e5VFWLFLwrstojennETWtL1AJHXjv4vQ0/lcz/3hb1T2CxnxTo1jBO+WkmmOglaLKOLjU/R4XAOeix+YzeR5bsU+U54o2OPVDCJvbMjuDsYUVlXheatgWL/D5IgdDGytJViJRuHdMUcWRCIG9RL9fWisUA4eqtMkMV3/crMM2st+iMpbNTCmBsZFo40+kucvVr8Tose8UGLtaBnkJttqeAo3qVQR7fCJBuJINXgkvw6OsVmNl0XHiEETdDZCnxqlHl5WG/LTvM2Cf4qBriF5rZg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 21:06:26.7224 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9069e38-3d62-4134-169a-08d74cfc8c7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1500
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AJsBLAFCiO3DqUx8KIGpbKeyKildrPSEPWqqQYzAwI=;
 b=2TMKMds4O9v92UTxj0Qc0cr08IQbFtzmMP3np7kDqYM9F5NW3kq8SP192Z1IVK4QFhjpZohRFnBnBcGQzmTnvMphbT50T4Vj0f1CM+ICuSXqfEuXr4BTli62rUoELEeFenpcLc6CuhCfspe6YSxxidKxrCcKShx9yVNTANNzrLI=
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
Cc: sunpeng.li@amd.com, Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 harry.wentland@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCjEg
dm1pZCBsaW1pdGF0aW9uIG9ubHkgZXhpc3RzIGZvciBIT1NUVk0gd2hpY2ggaXMgYSBjdXN0b20K
dXNlIGNhc2UgYW55d2F5LgoKU2lnbmVkLW9mZi1ieTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0
cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3
YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMS9kY24yMV9odWJidWIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMS9kY24yMV9odWJidWIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMS9kY24yMV9odWJidWIuYwppbmRleCA0NGY2NGE4ZTMzZjEuLmFlYjVkZTZmNDUz
MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIx
X2h1YmJ1Yi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24y
MV9odWJidWIuYwpAQCAtNTIsNyArNTIsNyBAQAogI2lmZGVmIE5VTV9WTUlECiAjdW5kZWYgTlVN
X1ZNSUQKICNlbmRpZgotI2RlZmluZSBOVU1fVk1JRCAxCisjZGVmaW5lIE5VTV9WTUlEIDE2CiAK
IHN0YXRpYyB1aW50MzJfdCBjb252ZXJ0X2FuZF9jbGFtcCgKIAl1aW50MzJfdCB3bV9ucywKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
